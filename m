From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 21 Jul 2015 13:30:13 +0200
Subject: [Buildroot] [PATCH v5 0/4] qt5 bump to 5.5.0
In-Reply-To: <1437468691-364-1-git-send-email-corjon.j@ecagroup.com>
References: <1437468691-364-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1437478217-19091-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series aim to bump Qt to the 5.5.0 version.

QtWebkit, QtScript & QtQuick modules as been tagged as deprecated by Qt [1]
but these modules are still released in Qt-5.5.0 so they are tagged as 'legacy
compatibility' in menuconfig.

Qt5WebChannel is a rebase of my previous patch[2] on top of Qt-5.5.0

[1] https://wiki.qt.io/New_Features_in_Qt_5.5#Deprecated_Functionality
[2] http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/118411

Julien Corjon (4):
  qt5: bump version to 5.5.0
  qt/qt5base: reorder patches
  qt/qt5quick1, qt/qt5script, qt/qt5webkit: tag as legacy compatibility
  qt/qt5webchannel: new package

 package/qt5/Config.in                              |  10 +-
 package/qt5/qt5.mk                                 |   4 +-
 ...ing-Check-if-uClibc-has-backtrace-support.patch |  48 ----
 ...kspecs-files.patch => 0002-mkspecs-files.patch} |   0
 ...cb-egl-fixes.patch => 0003-xcb-egl-fixes.patch} |   9 +-
 .../0004-no-gold-linker-for-host-build.patch       |  41 ++++
 .../0005-forkd-disable-eventfd-for-uclibc.patch    |  32 +++
 .../0005-no-gold-linker-for-host-build.patch       |  27 ---
 ...nfigure-fix-gold-linker-support-detection.patch |  36 ---
 .../0006-eglfs-rasp-pi-header-inclusion.patch      |  45 ++++
 .../0007-configure-add-psql_config-option.patch    |  61 -----
 package/qt5/qt5base/qt5base.hash                   |   8 +-
 package/qt5/qt5base/qt5base.mk                     |   8 +-
 .../0001-Fix-build-with-no-c-11.patch              | 267 ---------------------
 ...z_data_p.h-Add-missing-include-byteswap.h.patch |  46 ----
 package/qt5/qt5connectivity/qt5connectivity.hash   |   8 +-
 package/qt5/qt5declarative/qt5declarative.hash     |   8 +-
 package/qt5/qt5enginio/qt5enginio.hash             |   8 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   8 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   8 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   8 +-
 package/qt5/qt5quick1/Config.in                    |   4 +
 package/qt5/qt5quick1/qt5quick1.hash               |   8 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   8 +-
 package/qt5/qt5script/Config.in                    |   4 +
 package/qt5/qt5script/qt5script.hash               |   8 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   8 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   8 +-
 package/qt5/qt5svg/qt5svg.hash                     |   8 +-
 package/qt5/qt5webchannel/Config.in                |  11 +
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +
 package/qt5/qt5webchannel/qt5webchannel.mk         |  61 +++++
 package/qt5/qt5webkit-examples/Config.in           |   4 +
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |   8 +-
 package/qt5/qt5webkit/Config.in                    |   4 +
 package/qt5/qt5webkit/qt5webkit.hash               |   8 +-
 package/qt5/qt5websockets/qt5websockets.hash       |   8 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   8 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   8 +-
 39 files changed, 296 insertions(+), 574 deletions(-)
 delete mode 100644 package/qt5/qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch
 rename package/qt5/qt5base/{0003-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{0004-xcb-egl-fixes.patch => 0003-xcb-egl-fixes.patch} (88%)
 create mode 100644 package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
 create mode 100644 package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
 delete mode 100644 package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
 delete mode 100644 package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
 create mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/0007-configure-add-psql_config-option.patch
 delete mode 100644 package/qt5/qt5connectivity/0001-Fix-build-with-no-c-11.patch
 delete mode 100644 package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
 create mode 100644 package/qt5/qt5webchannel/Config.in
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.mk

-- 
2.1.0
