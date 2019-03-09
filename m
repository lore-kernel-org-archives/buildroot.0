From: Andreas Naumann <anaumann@ultratronik.de>
Date: Sat,  9 Mar 2019 15:10:20 +0100
Subject: [Buildroot] [PATCH 0/2] ppsh compatible Qt5 configuration
Message-ID: <20190309141022.13140-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

you were asking for ideas on "Making the Qt5 packaging compatible with
per-package folder". Lately I had some time to look into it and came up
with the following patches. Basically they use a custom qt.conf to manipulate
qmakes builtin pathes. Details are in the commit-messages.

I did a compile test with almost all qt5 modules available, as well as other
buildroot provided qt5 applications. At the moment I dont have equipment for
runtime tests. As far as I could see the install procedure now works as
expected, no more failures.
Unfortunately webengine and webkit-example failed sometime during the build
but it seems that these were unrelated issues.

In pyqt5, where I did not integrate the qt.conf fixup because the path to 
qmake is just a configure option, the install pathes were correct  nonetheless.
Maybe their .pro files detect/set/fix them some other way. However, the pyqt5
configure step did not pickup most of the qt5-modules because they are not set
as a dependency. But this is another story.


regards,
Andreas



Andreas Naumann (2):
  qt5base: Fix inconsistencies when overriding qmake properties
  qt5: Prepare qmake for per-package infrastructure

 package/python-sip/python-sip.mk                |  3 ++-
 package/qt5/qt5.mk                              |  9 ++++++++-
 package/qt5/qt53d/qt53d.mk                      |  3 ++-
 package/qt5/qt5base/qt.conf.in                  | 17 +++--------------
 package/qt5/qt5canvas3d/qt5canvas3d.mk          |  3 ++-
 package/qt5/qt5charts/qt5charts.mk              |  3 ++-
 package/qt5/qt5connectivity/qt5connectivity.mk  |  3 ++-
 package/qt5/qt5declarative/qt5declarative.mk    |  3 ++-
 package/qt5/qt5enginio/qt5enginio.mk            |  3 ++-
 .../qt5graphicaleffects/qt5graphicaleffects.mk  |  3 ++-
 package/qt5/qt5imageformats/qt5imageformats.mk  |  3 ++-
 package/qt5/qt5location/qt5location.mk          |  3 ++-
 package/qt5/qt5multimedia/qt5multimedia.mk      |  3 ++-
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk    |  3 ++-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.mk  |  3 ++-
 package/qt5/qt5script/qt5script.mk              |  3 ++-
 package/qt5/qt5scxml/qt5scxml.mk                |  3 ++-
 package/qt5/qt5sensors/qt5sensors.mk            |  3 ++-
 package/qt5/qt5serialbus/qt5serialbus.mk        |  3 ++-
 package/qt5/qt5serialport/qt5serialport.mk      |  3 ++-
 package/qt5/qt5svg/qt5svg.mk                    |  3 ++-
 package/qt5/qt5tools/qt5tools.mk                |  3 ++-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk    |  3 ++-
 package/qt5/qt5wayland/qt5wayland.mk            |  3 ++-
 package/qt5/qt5webchannel/qt5webchannel.mk      |  3 ++-
 package/qt5/qt5webengine/qt5webengine.mk        |  3 ++-
 .../qt5webkit-examples/qt5webkit-examples.mk    |  3 ++-
 package/qt5/qt5webkit/qt5webkit.mk              |  3 ++-
 package/qt5/qt5websockets/qt5websockets.mk      |  3 ++-
 package/qt5/qt5x11extras/qt5x11extras.mk        |  3 ++-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk    |  3 ++-
 package/qt5cinex/qt5cinex.mk                    |  3 ++-
 package/qwt/qwt.mk                              |  1 +
 33 files changed, 72 insertions(+), 45 deletions(-)

-- 
2.21.0
