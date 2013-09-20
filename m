From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 20 Sep 2013 08:43:09 +0300
Subject: [Buildroot] [PATCH v2 0/6] Bump Qt5 to version 5.1.1
Message-ID: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches bump qt5 to the latest stable version (5.1.1). They also add
the new module packages provided with 5.1 series.

Changes v1 -> v2:
  - Mention upstreamed patches and removed configure options in the commit log
    (suggested by Thomas Petazzoni)
  - Give numbers to the patch filenames (suggested by Arnout Vandecappelle and
    Thomas Petazzoni)
  - Remove unused configure options in module packages with a separate patch
    (suggested by Thomas Petazzoni)
  - Write names of license files to .mk files found in new packages (suggested
    by Thomas Petazzoni)

Fatih A??c? (6):
  qt5: bump to 5.1.1
  qt5quickcontrols: new package
  qt5sensors: new package
  qt5serialport: new package
  qt5x11extras: new package
  qt5: remove configure options from module packages

 package/qt5/Config.in                              |    4 ++
 package/qt5/qt5.mk                                 |    4 +-
 package/qt5/qt5base/Config.in                      |    2 +
 ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 -----------
 ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   32 +++++++++++
 .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    5 +-
 package/qt5/qt5base/qt5base.mk                     |   10 ++--
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    1 -
 package/qt5/qt5imageformats/qt5imageformats.mk     |    1 -
 .../qt5jsbackend-0002-fix-uclibc.patch             |   33 ------------
 package/qt5/qt5jsbackend/qt5jsbackend.mk           |    1 -
 package/qt5/qt5multimedia/qt5multimedia.mk         |    1 -
 package/qt5/qt5quick1/qt5quick1.mk                 |    4 +-
 package/qt5/qt5quickcontrols/Config.in             |   20 +++++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |   37 +++++++++++++
 package/qt5/qt5script/qt5script.mk                 |    1 -
 package/qt5/qt5sensors/Config.in                   |   10 ++++
 package/qt5/qt5sensors/qt5sensors.mk               |   56 ++++++++++++++++++++
 package/qt5/qt5serialport/Config.in                |   10 ++++
 package/qt5/qt5serialport/qt5serialport.mk         |   40 ++++++++++++++
 package/qt5/qt5svg/qt5svg.mk                       |    1 -
 package/qt5/qt5webkit/qt5webkit.mk                 |    1 -
 package/qt5/qt5x11extras/Config.in                 |   11 ++++
 package/qt5/qt5x11extras/qt5x11extras.mk           |   40 ++++++++++++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    1 -
 26 files changed, 276 insertions(+), 84 deletions(-)
 delete mode 100644 package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
 create mode 100644 package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
 delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
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
