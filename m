From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 09:28:08 +0300
Subject: [Buildroot] [PATCH 0/5] Bump Qt5 to version 5.1.1
Message-ID: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches bump qt5 to the latest stable version (5.1.1). They also add
the new module packages provided with 5.1 series.

Fatih A??c? (5):
  qt5: bump to 5.1.1
  qt5quickcontrols: new package
  qt5sensors: new package
  qt5serialport: new package
  qt5x11extras: new package

 package/qt5/Config.in                              |    4 ++
 package/qt5/qt5.mk                                 |    4 +-
 package/qt5/qt5base/Config.in                      |    2 +
 ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 -----------
 package/qt5/qt5base/qt5base-mkspecs-files.patch    |    5 +-
 ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   29 ++++++++++
 package/qt5/qt5base/qt5base.mk                     |   10 +++-
 package/qt5/qt5declarative/qt5declarative.mk       |    1 +
 .../qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch |   33 -----------
 package/qt5/qt5quick1/qt5quick1.mk                 |    4 +-
 package/qt5/qt5quickcontrols/Config.in             |   20 +++++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |   37 +++++++++++++
 package/qt5/qt5sensors/Config.in                   |   10 ++++
 package/qt5/qt5sensors/qt5sensors.mk               |   58 ++++++++++++++++++++
 package/qt5/qt5serialport/Config.in                |   10 ++++
 package/qt5/qt5serialport/qt5serialport.mk         |   42 ++++++++++++++
 package/qt5/qt5x11extras/Config.in                 |   11 ++++
 package/qt5/qt5x11extras/qt5x11extras.mk           |   42 ++++++++++++++
 18 files changed, 279 insertions(+), 75 deletions(-)
 delete mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
 create mode 100644 package/qt5/qt5base/qt5base-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
 delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
 create mode 100644 package/qt5/qt5quickcontrols/Config.in
 create mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.mk
 create mode 100644 package/qt5/qt5sensors/Config.in
 create mode 100644 package/qt5/qt5sensors/qt5sensors.mk
 create mode 100644 package/qt5/qt5serialport/Config.in
 create mode 100644 package/qt5/qt5serialport/qt5serialport.mk
 create mode 100644 package/qt5/qt5x11extras/Config.in
 create mode 100644 package/qt5/qt5x11extras/qt5x11extras.mk

-- 
1.7.10.4
