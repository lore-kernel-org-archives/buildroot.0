From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 23 Nov 2017 22:28:31 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: depends also on
 qt5quickcontrols
In-Reply-To: <20171123214546.7e982b20@windsurf.lan>
References: <1510677027-24076-1-git-send-email-giulio.benetti@micronovasrl.com>
 <e8c172b8-f2ec-ced1-dda8-236d0d945b12@micronovasrl.com>
 <20171114165808.akqens5j5obw2n5c@tarshish>
 <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
 <20171123214546.7e982b20@windsurf.lan>
Message-ID: <20171123222831.7849a0eb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Thu, 23 Nov 2017 21:45:46 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 14 Nov 2017 18:03:53 +0100, Giulio Benetti wrote:
> > Sorry, my mistake.
> > It installed correctly on STAGING_DIR, but not in TARGET_DIR.
> > This why it compiled fine, but on target it didn't find that 
> > libQtQuick.so library.
> > This is a problem on building Qt5 I've noticed.
> > 
> > If I build first time Qt5 with few features,
> > than select other more features,
> > those can be built partially and installed partially too.
> > 
> > To reproduce you can build qt5base.
> > After that, select qt5cinex,
> > then you should find that libraries are in STAGING_DIR but not in 
> > TARGET_DIR.
> > 
> > So to have it working properly you have to rm and rebuild qt5base and 
> > qt5declarative from beginning.
> > 
> > Did someone else noticed this?  
> 
> So in the end, is your patch needed ?
> 
> Peter (Seiderer), could you review this Qt5 related patch ? Thanks!

No qml expert, but a quick search for 'import QtQuick.Controls' (needed for usage of qt5quickcontrols) did
not yield any results:

	$ wget http://quitcoding.com/download/Qt5_CinematicExperience_rpi_1.0.tgz
	$ wget http://quitcoding.com/download/Qt5_CinematicExperience_1.0.tgz
	$ tar -xvzf Qt5_CinematicExperience_1.0.tgz 
	$ tar -xvzf Qt5_CinematicExperience_rpi_1.0.tgz 
	$ find . -name "*.qml" | xargs grep import

./Qt5_CinematicExperience_1.0/content/CurtainEffect.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/InfoView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/Switch.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/Switch.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_1.0/content/DetailsView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/InfoViewItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/Background.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/Background.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_1.0/content/RatingsItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/DelegateItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/MoviesModel.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/SettingsView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/MainView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/MainView.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_1.0/content/MainView.qml:import QtGraphicalEffects 1.0
./Qt5_CinematicExperience_1.0/content/Button.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/content/Button.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_1.0/Qt5_CinematicExperience.qml:import QtQuick 2.0
./Qt5_CinematicExperience_1.0/Qt5_CinematicExperience.qml:import "content"
./Qt5_CinematicExperience_rpi_1.0/content/CurtainEffect.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/InfoView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/Switch.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/Switch.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_rpi_1.0/content/DetailsView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/InfoViewItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/Background.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/Background.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_rpi_1.0/content/RatingsItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/FpsItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/DelegateItem.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/MoviesModel.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/SettingsView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/MainView.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/MainView.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_rpi_1.0/content/MainView.qml:import QtGraphicalEffects 1.0
./Qt5_CinematicExperience_rpi_1.0/content/Button.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/content/Button.qml:import QtQuick.Particles 2.0
./Qt5_CinematicExperience_rpi_1.0/Qt5_CinematicExperience.qml:import QtQuick 2.0
./Qt5_CinematicExperience_rpi_1.0/Qt5_CinematicExperience.qml:import "content"

>>> qt5cinex fail to execute on runtime if qt5quickcontrols is not selected

Did not do a runtime test, but what is the error message (if any)?

Regards,
Peter

> 
> Best regards,
> 
> Thomas
