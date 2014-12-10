require 'rails_helper'

feature 'CRUDing events' do
  scenario "User makes an event" do
    visit root_path
    click_on "New Event"
    fill_in "Description", with: "Christmas"
    check "Requires ID"
    click_on "Create Event"

    expect(page).to have_content("Christmas")
  end

  scenario 'User edits an event' do
    Event.create!(
      description: "SantaCon",
    )

    visit root_path
    click_on "edit"
    fill_in "Location", with: "Union Square"
    fill_in "Date", with: "2014-12-13"
    fill_in "Capacity", with: "123"
    click_on "Update Event"

    expect(page).to have_content("SantaCon")
    expect(page).to have_content("Union Square")
    expect(page).to have_content("2014-12-13")
    expect(page).to have_content("123")
  end

  scenario 'User deletes an event' do
    Event.create!(
      description: "Birthday",
    )

    visit root_path
    click_on "delete"
    expect(page).to have_no_content("Birthday")
  end
end
