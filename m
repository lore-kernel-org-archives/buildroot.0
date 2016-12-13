From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Dec 2016 15:59:24 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
Message-ID: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a rework of Julien and my previous work with the -rc version, which
now is available as a snapshot.

I have tried to adress the comments given by Julien and Arnout. In addition I
updated the license stuff, hope that this is correct.

As a result of https://bugreports.qt.io/browse/QTBUG-57039, I could make the
patch for directfb slightly smaller. However for non GL platforms there is
still an issue (QTBUG-57176).

A new change is the removal of gstreamer config-options in qt5base since this
is now completely done in qtmultimedia.

Andreas Naumann (4):
  qt5: Remove all hashes
  qt5: bump to 5.8.0-rc
  qt5declarative: enable Quick for non-GL platforms
  qt5quickcontrols1/2: enable for software renderer

Julien Corjon (3):
  qt5enginio : move into legacy compatibility
  qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
  Revert "qt5base: install bundled fonts to target"

 package/qt5/Config.in                              | 14 +++----
 package/qt5/qt5.mk                                 |  6 +--
 package/qt5/qt53d/qt53d.hash                       |  2 -
 .../0001-directfb-Fix-for-non-GL-platform.patch    | 39 +++++++++++++++++++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ----------------------
 package/qt5/qt5base/qt5base.hash                   |  2 -
 package/qt5/qt5base/qt5base.mk                     | 24 ++----------
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  2 -
 package/qt5/qt5connectivity/qt5connectivity.hash   |  2 -
 package/qt5/qt5connectivity/qt5connectivity.mk     |  4 +-
 package/qt5/qt5declarative/Config.in               |  6 +--
 package/qt5/qt5declarative/qt5declarative.hash     |  2 -
 package/qt5/qt5declarative/qt5declarative.mk       |  4 +-
 package/qt5/qt5enginio/qt5enginio.hash             |  2 -
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  2 -
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  2 -
 package/qt5/qt5imageformats/qt5imageformats.mk     |  4 +-
 package/qt5/qt5location/qt5location.hash           |  2 -
 package/qt5/qt5location/qt5location.mk             |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  2 -
 package/qt5/qt5multimedia/qt5multimedia.mk         |  7 +++-
 package/qt5/qt5quickcontrols/Config.in             |  4 --
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  2 -
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 ++-
 package/qt5/qt5quickcontrols2/Config.in            |  4 --
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 -
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  8 ++--
 package/qt5/qt5script/qt5script.hash               |  2 -
 package/qt5/qt5sensors/qt5sensors.hash             |  2 -
 package/qt5/qt5sensors/qt5sensors.mk               |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  2 -
 package/qt5/qt5serialport/qt5serialport.hash       |  2 -
 package/qt5/qt5serialport/qt5serialport.mk         |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  2 -
 package/qt5/qt5svg/qt5svg.mk                       |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  2 -
 package/qt5/qt5tools/qt5tools.mk                   |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  2 -
 package/qt5/qt5webchannel/qt5webchannel.mk         |  4 +-
 ...004-Remove-unused-check-for-private_tests.patch | 40 +++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.hash               |  2 -
 package/qt5/qt5websockets/qt5websockets.hash       |  2 -
 package/qt5/qt5websockets/qt5websockets.mk         |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  2 -
 package/qt5/qt5x11extras/qt5x11extras.mk           |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  2 -
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  4 +-
 48 files changed, 133 insertions(+), 167 deletions(-)
 delete mode 100644 package/qt5/qt53d/qt53d.hash
 create mode 100644 package/qt5/qt5base/0001-directfb-Fix-for-non-GL-platform.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/qt5base.hash
 delete mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.hash
 delete mode 100644 package/qt5/qt5connectivity/qt5connectivity.hash
 delete mode 100644 package/qt5/qt5declarative/qt5declarative.hash
 delete mode 100644 package/qt5/qt5enginio/qt5enginio.hash
 delete mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
 delete mode 100644 package/qt5/qt5imageformats/qt5imageformats.hash
 delete mode 100644 package/qt5/qt5location/qt5location.hash
 delete mode 100644 package/qt5/qt5multimedia/qt5multimedia.hash
 delete mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.hash
 delete mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
 delete mode 100644 package/qt5/qt5script/qt5script.hash
 delete mode 100644 package/qt5/qt5sensors/qt5sensors.hash
 delete mode 100644 package/qt5/qt5serialbus/qt5serialbus.hash
 delete mode 100644 package/qt5/qt5serialport/qt5serialport.hash
 delete mode 100644 package/qt5/qt5svg/qt5svg.hash
 delete mode 100644 package/qt5/qt5tools/qt5tools.hash
 delete mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 create mode 100644 package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch
 delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
 delete mode 100644 package/qt5/qt5websockets/qt5websockets.hash
 delete mode 100644 package/qt5/qt5x11extras/qt5x11extras.hash
 delete mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash

-- 
1.9.1
