//
//  ContentView.swift
//  WeatherUI
//
//  Created by zee-RGB on 7/12/2024.
//
//

import SwiftUI

struct ContentView: View {

    @State private var isDark = false

    var body: some View {
        ZStack {
            //BackgroundColor. The $ makes the @State var binding
            BackgroundView(isDark: isDark)

            VStack {
                //City
                CityNameView(city: "Cupertino, CA")

                //Main Weather
                VStack(spacing: 4) {
                    DayWeatherView(
                        dayWeather: isDark
                            ? "moon.stars.fill" : "cloud.sun.fill",
                        dayTemp: isDark ? 55 : 87)
                }

                Spacer()

                //Days of the Week
                HStack(spacing: 20) {

                    WeatherDayView(
                        dayOfWeek: "Tue",
                        temp: 47,
                        weatherIcon: "sun.max.fill"
                    )

                    WeatherDayView(
                        dayOfWeek: "Wed",
                        temp: 39,
                        weatherIcon: "cloud.heavyrain.fill"
                    )

                    WeatherDayView(
                        dayOfWeek: "Thu",
                        temp: 67,
                        weatherIcon: "cloud.sun.bolt.fill"
                    )

                    WeatherDayView(
                        dayOfWeek: "Fri",
                        temp: 35,
                        weatherIcon: "wind.snow"
                    )

                    WeatherDayView(
                        dayOfWeek: "Sat",
                        temp: 99,
                        weatherIcon: "moon.stars.fill"
                    )

                }

                Spacer()

                //Button
                Button("Change Day Time") {
                    isDark.toggle()
                }
                .padding()
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.blue)
                .frame(width: 250, height: 50)
                .background(Color.white.gradient)
                .cornerRadius(15)
                .padding(30)

            }
        }
    }
}

#Preview {
    ContentView()
}

//Extracted Views
struct WeatherDayView: View {

    var dayOfWeek: String
    var temp: Int
    var weatherIcon: String

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(
                    .system(
                        size: 20, weight: .medium, design: .default)
                )
                .foregroundStyle(.white)
            Image(
                systemName: weatherIcon
            ).symbolRenderingMode(.multicolor)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            Text("\(temp)°")
                .font(
                    .system(
                        size: 23, weight: .medium, design: .default)
                )
                .foregroundStyle(.white)
        }
    }
}

//BackGroundcolour color of the screen
struct BackgroundView: View {

    //isDark needs to keep State -> @Binding binds state to @State and chages variable
    var isDark: Bool

    var body: some View {

        LinearGradient(
            gradient: Gradient(
                colors: [
                    isDark ? .black : .blue, isDark ? .gray : .clear,
                ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

//Main City
struct CityNameView: View {
    var city: String

    var body: some View {
        Text(city)
            .font(.system(size: 38, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

//Main Weather
struct DayWeatherView: View {
    var dayWeather: String
    var dayTemp: Int

    var body: some View {
        Image(systemName: dayWeather).symbolRenderingMode(.multicolor)
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
            .padding()

        Text("\(dayTemp)°")
            .font(
                .system(size: 70, weight: .medium, design: .default)
            )
            .foregroundStyle(.white)
    }
}

//ButtonView
//struct ButtonView: View {
//    var buttonText: String
//
//    var body: some View {
//
//            Button(buttonText) {
//
//            }
//                .padding()
//                .font(.system(size: 20, weight: .bold, design: .default))
//                .foregroundStyle(.blue)
//                .frame(width: 250, height: 50)
//                .background(Color.white)
//                .cornerRadius(15)
//                .padding(30)
//
//
//    }
//}
