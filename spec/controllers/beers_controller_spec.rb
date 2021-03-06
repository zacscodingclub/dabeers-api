require 'rails_helper'


RSpec.describe Api::V1::BeersController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all beers as @beers" do
      beer = Beer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:beers)).to eq([beer])
    end
  end

  describe "GET #show" do
    it "assigns the requested beer as @beer" do
      beer = Beer.create! valid_attributes
      get :show, params: {id: beer.to_param}, session: valid_session
      expect(assigns(:beer)).to eq(beer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested beer as @beer" do
      beer = Beer.create! valid_attributes
      get :edit, params: {id: beer.to_param}, session: valid_session
      expect(assigns(:beer)).to eq(beer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Beer" do
        expect {
          post :create, params: {beer: valid_attributes}, session: valid_session
        }.to change(Beer, :count).by(1)
      end

      it "assigns a newly created beer as @beer" do
        post :create, params: {beer: valid_attributes}, session: valid_session
        expect(assigns(:beer)).to be_a(Beer)
        expect(assigns(:beer)).to be_persisted
      end

      it "redirects to the created beer" do
        post :create, params: {beer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Beer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved beer as @beer" do
        post :create, params: {beer: invalid_attributes}, session: valid_session
        expect(assigns(:beer)).to be_a_new(Beer)
      end

      it "re-renders the 'new' template" do
        post :create, params: {beer: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested beer" do
        beer = Beer.create! valid_attributes
        put :update, params: {id: beer.to_param, beer: new_attributes}, session: valid_session
        beer.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested beer as @beer" do
        beer = Beer.create! valid_attributes
        put :update, params: {id: beer.to_param, beer: valid_attributes}, session: valid_session
        expect(assigns(:beer)).to eq(beer)
      end

      it "redirects to the beer" do
        beer = Beer.create! valid_attributes
        put :update, params: {id: beer.to_param, beer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(beer)
      end
    end

    context "with invalid params" do
      it "assigns the beer as @beer" do
        beer = Beer.create! valid_attributes
        put :update, params: {id: beer.to_param, beer: invalid_attributes}, session: valid_session
        expect(assigns(:beer)).to eq(beer)
      end

      it "re-renders the 'edit' template" do
        beer = Beer.create! valid_attributes
        put :update, params: {id: beer.to_param, beer: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested beer" do
      beer = Beer.create! valid_attributes
      expect {
        delete :destroy, params: {id: beer.to_param}, session: valid_session
      }.to change(Beer, :count).by(-1)
    end

    it "redirects to the beers list" do
      beer = Beer.create! valid_attributes
      delete :destroy, params: {id: beer.to_param}, session: valid_session
      expect(response).to redirect_to(beers_url)
    end
  end

end
