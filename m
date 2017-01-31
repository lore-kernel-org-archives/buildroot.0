From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:02 +0100
Subject: [Buildroot] [PATCH v6 0/9] bump/choice for qt 5.8.0
Message-ID: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v5 -> v6:
This is the updated version of Andreas' patchset, with the following changes:
 * fix conflicts introduced by the Qt example license related commits
 * fix the python-pyqt5 patches to not patching the sip-generated c++
   code but the sip files themselves

The Qt 5.8 config (and pyqt5) was tested on Raspberry Pi.

Julien Corjon (3):
  qt5enginio : move into legacy compatibility
  qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
  Conditional revert "qt5base: install bundled fonts to target"

Naumann Andreas (6):
  qt5: add choice between version 5.6.2 and 5.8.0
  qt5declarative: enable Quick for non-GL platforms for Qt 5.8.0
  qt5quickcontrols: More deterministic target install
  qt5quickcontrols/qt5quickcontrols2: enable for software renderer for
    Qt 5.8.0
  python-pyqt5: Depend directly on Qt5 rather than its toolchain
    requirements
  python-pyqt5: Fix for Qt 5.8.0

 package/python-pyqt5/0002-fix-qt-5.6.2.patch       | 28 ------------
 package/python-pyqt5/0002-fix-qt5.8-build.patch    | 28 ++++++++++++
 package/python-pyqt5/Config.in                     | 13 ++----
 package/qt5/Config.in                              | 27 ++++++++---
 package/qt5/qt5.mk                                 |  8 ++++
 package/qt5/qt53d/qt53d.hash                       |  3 ++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ------------------
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ++++++++++++++++++
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.hash                   |  3 ++
 package/qt5/qt5base/qt5base.mk                     | 15 ++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.hash   |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.mk     |  5 ++
 package/qt5/qt5declarative/Config.in               |  6 +--
 package/qt5/qt5declarative/qt5declarative.hash     |  3 ++
 package/qt5/qt5declarative/qt5declarative.mk       |  5 ++
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  3 ++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 ++
 package/qt5/qt5imageformats/qt5imageformats.hash   |  3 ++
 package/qt5/qt5imageformats/qt5imageformats.mk     |  5 ++
 package/qt5/qt5location/qt5location.hash           |  3 ++
 package/qt5/qt5location/qt5location.mk             |  5 ++
 package/qt5/qt5multimedia/qt5multimedia.hash       |  3 ++
 package/qt5/qt5multimedia/qt5multimedia.mk         |  8 ++++
 package/qt5/qt5quickcontrols/Config.in             |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  3 ++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 +-
 package/qt5/qt5quickcontrols2/Config.in            |  4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  3 ++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 12 +++++
 package/qt5/qt5script/qt5script.hash               |  3 ++
 package/qt5/qt5sensors/qt5sensors.hash             |  3 ++
 package/qt5/qt5sensors/qt5sensors.mk               |  5 ++
 package/qt5/qt5serialbus/qt5serialbus.hash         |  3 ++
 package/qt5/qt5serialport/qt5serialport.hash       |  3 ++
 package/qt5/qt5serialport/qt5serialport.mk         |  5 ++
 package/qt5/qt5svg/qt5svg.hash                     |  3 ++
 package/qt5/qt5svg/qt5svg.mk                       |  5 ++
 package/qt5/qt5tools/qt5tools.hash                 |  3 ++
 package/qt5/qt5tools/qt5tools.mk                   |  5 ++
 package/qt5/qt5webchannel/qt5webchannel.hash       |  3 ++
 package/qt5/qt5webchannel/qt5webchannel.mk         |  5 ++
 package/qt5/qt5webkit/qt5webkit.hash               |  3 ++
 package/qt5/qt5websockets/qt5websockets.hash       |  3 ++
 package/qt5/qt5websockets/qt5websockets.mk         |  5 ++
 package/qt5/qt5x11extras/qt5x11extras.hash         |  3 ++
 package/qt5/qt5x11extras/qt5x11extras.mk           |  5 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  3 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  5 ++
 51 files changed, 334 insertions(+), 151 deletions(-)
 delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
 create mode 100644 package/python-pyqt5/0002-fix-qt5.8-build.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

-- 
2.7.4
