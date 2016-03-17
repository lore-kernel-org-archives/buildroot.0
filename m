From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu, 17 Mar 2016 10:42:24 +0100
Subject: [Buildroot] [PATCH 0/5] Qt5 bump to 5.6.0 version
Message-ID: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt-5.6.0 have been released yesterday and drop the support of Qt5Webkit
and Qt5Quick1.

All packages changed in this series have been compiled with:
  - raspberry_defconfig + rpi_userland (brcm backend)
  - firefly_rk3288_demo_defconfig + sunxi-mali (mali backend)
  - own imx6q defconfig + imx-gpu-viv (vivante backend)

More info on the release:
  - http://blog.qt.io/blog/2016/03/16/qt-5-6-released/
  - http://blog.qt.io/blog/2015/11/17/embedded-linux-news-in-qt-5-6/

Regards

Julien Corjon (5):
  package/qt5quick1: remove obsolete package
  package/qt5webkit: remove obsolete package
  package/qt5webkit-examples: remove obsolete package
  qt5: bump version to 5.6.0
  qt5: add GPLv3 and GFDLv1.3 licensing informations

 package/qt5/Config.in                              |   3 -
 package/qt5/qt5.mk                                 |   4 +-
 package/qt5/qt53d/qt53d.hash                       |   4 +-
 package/qt5/qt53d/qt53d.mk                         |   4 +-
 .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  |  27 -----
 package/qt5/qt5base/0003-xcb-egl-fixes.patch       |  82 ----------------
 .../0005-forkd-disable-eventfd-for-uclibc.patch    |  32 ------
 .../qt5base/0009-fix-eglfs-for-sunxi-mali.patch    | 109 ---------------------
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  40 --------
 package/qt5/qt5base/qt5base.hash                   |   4 +-
 package/qt5/qt5base/qt5base.mk                     |   8 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |   4 +-
 package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |   4 +-
 package/qt5/qt5enginio/qt5enginio.hash             |   4 +-
 package/qt5/qt5enginio/qt5enginio.mk               |   8 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |   4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |   4 +-
 package/qt5/qt5quick1/Config.in                    |  26 -----
 package/qt5/qt5quick1/qt5quick1.hash               |   2 -
 package/qt5/qt5quick1/qt5quick1.mk                 |  41 --------
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |   4 +-
 package/qt5/qt5script/qt5script.hash               |   4 +-
 package/qt5/qt5script/qt5script.mk                 |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
 package/qt5/qt5serialport/qt5serialport.mk         |   4 +-
 package/qt5/qt5svg/qt5svg.hash                     |   4 +-
 package/qt5/qt5svg/qt5svg.mk                       |   4 +-
 package/qt5/qt5tools/qt5tools.hash                 |   4 +-
 package/qt5/qt5tools/qt5tools.mk                   |   4 +-
 .../0001-Fix-builds-without-qml-module.patch       |  61 ------------
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |   4 +-
 package/qt5/qt5webkit-examples/0001-build.patch    |  30 ------
 package/qt5/qt5webkit-examples/Config.in           |  14 ---
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |   2 -
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |  50 ----------
 package/qt5/qt5webkit/Config.in                    |  23 -----
 package/qt5/qt5webkit/qt5webkit.hash               |   2 -
 package/qt5/qt5webkit/qt5webkit.mk                 |  58 -----------
 package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
 package/qt5/qt5websockets/qt5websockets.mk         |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |   4 +-
 54 files changed, 77 insertions(+), 681 deletions(-)
 delete mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
 delete mode 100644 package/qt5/qt5base/0003-xcb-egl-fixes.patch
 delete mode 100644 package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
 delete mode 100644 package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
 delete mode 100644 package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 package/qt5/qt5quick1/Config.in
 delete mode 100644 package/qt5/qt5quick1/qt5quick1.hash
 delete mode 100644 package/qt5/qt5quick1/qt5quick1.mk
 delete mode 100644 package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch
 delete mode 100644 package/qt5/qt5webkit-examples/0001-build.patch
 delete mode 100644 package/qt5/qt5webkit-examples/Config.in
 delete mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.hash
 delete mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk
 delete mode 100644 package/qt5/qt5webkit/Config.in
 delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
 delete mode 100644 package/qt5/qt5webkit/qt5webkit.mk

-- 
2.5.0
