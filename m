From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu, 17 Mar 2016 10:42:28 +0100
Subject: [Buildroot] [PATCH 4/5] qt5: bump version to 5.6.0
In-Reply-To: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1458207749-19507-5-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream committed patches (qt5base):
  - 0001-Force_egl_visual_ID_33.patch (see [1], [2])
  - 0003-xcb-egl-fixes.patch (see [3])
  - 0005-forkd-disable-eventfd-for-uclibc.patch (see [4], [5])
  - 0009-fix-eglfs-for-sunxi-mali.patch (see [6])
  - 0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch (see [7])

Remove MX6_WORKAROUND from qt5base.mk since we do not need to tweak
EGL visual ID to 33.

Remove upstream committed patch (qt5webchannel):
  - 0001-Fix-builds-without-qml-module.patch (see [8], [9])

Fix Qt5Enginio to 1.6.0 version (see [10])

[1] https://bugreports.qt.io/browse/QTBUG-44290
[2] https://codereview.qt-project.org/#/c/108849/
[3] https://codereview.qt-project.org/#/c/115438/
[4] https://bugreports.qt.io/browse/QTBUG-47337
[5] https://codereview.qt-project.org/#/c/121988/
[6] https://codereview.qt-project.org/#/c/125837/
[7] https://codereview.qt-project.org/#/c/126725/
[8] https://bugreports.qt.io/browse/QTBUG-47360
[9] https://codereview.qt-project.org/#/c/122086/
[10] https://bugreports.qt.io/browse/QTBUG-50111

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5.mk                                 |   4 +-
 package/qt5/qt53d/qt53d.hash                       |   4 +-
 .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  |  27 -----
 package/qt5/qt5base/0003-xcb-egl-fixes.patch       |  82 ----------------
 .../0005-forkd-disable-eventfd-for-uclibc.patch    |  32 ------
 .../qt5base/0009-fix-eglfs-for-sunxi-mali.patch    | 109 ---------------------
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  40 --------
 package/qt5/qt5base/qt5base.hash                   |   4 +-
 package/qt5/qt5base/qt5base.mk                     |   4 -
 package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
 package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
 package/qt5/qt5enginio/qt5enginio.hash             |   4 +-
 package/qt5/qt5enginio/qt5enginio.mk               |   4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
 package/qt5/qt5script/qt5script.hash               |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
 package/qt5/qt5svg/qt5svg.hash                     |   4 +-
 package/qt5/qt5tools/qt5tools.hash                 |   4 +-
 .../0001-Fix-builds-without-qml-module.patch       |  61 ------------
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
 27 files changed, 41 insertions(+), 394 deletions(-)
 delete mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
 delete mode 100644 package/qt5/qt5base/0003-xcb-egl-fixes.patch
 delete mode 100644 package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
 delete mode 100644 package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
 delete mode 100644 package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index bb33903..e43795f 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION_MAJOR = 5.5
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION_MAJOR = 5.6
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 8fbc42f..8d9a3d6 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,2 @@
-# Hash from http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qt3d-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 e380906e2bcbd825dab45043bf063dd88b793c0d5fb050ee915bf4e2b58b1bf7 qt3d-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qt3d-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 b961789daecebed030ad36568301d1fe6c1ad97e9a2726fad5bd96ad603f439d qt3d-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch b/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
deleted file mode 100644
index c21775f..0000000
--- a/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Workaround EGL initialization failure due visual mismatch
-
-Error:
-
-Warning: EGL suggested using X Visual ID 33 (RGB888) for EGL config 28 (RGB444), but this is incompatable
-Unable to find an X11 visual which matches EGL config 28
-Could not initialize EGL
-Aborted
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
-
-diff -Naur qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp
---- qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:08:42.163895341 -0800
-+++ qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:09:37.207893799 -0800
-@@ -180,5 +180,9 @@
-     }
- 
-     qWarning("Unable to find an X11 visual which matches EGL config %d", configId);
-+#ifdef ENABLE_MX6_WORKAROUND
-+    return (VisualID)33;
-+#else
-     return (VisualID)0;
-+#endif
- }
diff --git a/package/qt5/qt5base/0003-xcb-egl-fixes.patch b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
deleted file mode 100644
index 65d6f69..0000000
--- a/package/qt5/qt5base/0003-xcb-egl-fixes.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-Some EGL headers pull in X11 defines which break eglconvenience
-
-* Adds a missing include to qeglplatformcontext.cpp
-* Fix namespace collision on CursorShape, pulled in from X11/X.h
-* Do not pass MESA_EGL_NO_X11_HEADERS when xcb is use
-* Reorder includes to have the X11-header the last include
-
-[based on patch from Yocto project]
-Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
-Updated to fix issue in qeglplatformscreen (reorder includes, see also
-http://lists.qt-project.org/pipermail/development/2013-March/010511.html)
-Signed-off-by: Marc Andre <marc.andre@netline.ch>
-
-diff -Nuar a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
---- a/src/platformsupport/eglconvenience/eglconvenience.pri	2014-08-07 16:53:50.038277168 -0400
-+++ b/src/platformsupport/eglconvenience/eglconvenience.pri	2014-08-07 16:54:52.874278651 -0400
-@@ -30,8 +30,10 @@
-         }
-     }
- 
--    # Avoid X11 header collision
--    DEFINES += MESA_EGL_NO_X11_HEADERS
-+    !contains(QT_CONFIG,xcb) {
-+        # Avoid X11 header collision
-+        DEFINES += MESA_EGL_NO_X11_HEADERS
-+    }
- 
-     contains(QT_CONFIG,xlib) {
-         HEADERS += \
-diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
---- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp	2014-08-07 16:53:50.038277168 -0400
-+++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp	2014-08-07 16:56:00.630280249 -0400
-@@ -39,6 +39,7 @@
- **
- ****************************************************************************/
- 
-+#include <qtextstream.h>
- #include "qeglplatformcontext_p.h"
- #include "qeglconvenience_p.h"
- #include "qeglpbuffer_p.h"
---- a/src/platformsupport/eglconvenience/qeglplatformcursor_p.h	2014-08-07 16:53:50.038277168 -0400
-+++ b/src/platformsupport/eglconvenience/qeglplatformcursor_p.h	2014-08-07 16:58:49.014284222 -0400
-@@ -42,6 +42,11 @@
- #ifndef QEGLPLATFORMCURSOR_H
- #define QEGLPLATFORMCURSOR_H
- 
-+// avoid namespace collision with X11/X.h
-+#ifdef CursorShape
-+#undef CursorShape
-+#endif
-+
- #include <qpa/qplatformcursor.h>
- #include <qpa/qplatformscreen.h>
- 
---- qt5base-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformcursor.cpp
-+++ qt5base-5.5.0/src/platformsupport/eglconvenience/qeglplatformcursor.cpp
-@@ -41,8 +41,8 @@
- 
- #include <QtGui/private/qguiapplication_p.h>
- 
--#include "qeglplatformcursor_p.h"
- #include "qeglplatformintegration_p.h"
-+#include "qeglplatformcursor_p.h"
- #include "qeglplatformscreen_p.h"
- 
- QT_BEGIN_NAMESPACE
---- qtbase-opensource-src-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:46:57.116883353 +0200
-+++ qtbase-opensource-src-5.5.0/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:47:36.560882333 +0200
-@@ -31,11 +31,11 @@
- **
- ****************************************************************************/
-
--#include "qeglplatformscreen_p.h"
--#include "qeglplatformwindow_p.h"
- #include <QtGui/qwindow.h>
- #include <qpa/qwindowsysteminterface.h>
- #include <QtPlatformSupport/private/qopenglcompositor_p.h>
-+#include "qeglplatformscreen_p.h"
-+#include "qeglplatformwindow_p.h"
-
- QT_BEGIN_NAMESPACE
- 
diff --git a/package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch b/package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
deleted file mode 100644
index 04d49dd..0000000
--- a/package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 62ef0d97cfa2ed0142fc69c6e6395a570bea9215 Mon Sep 17 00:00:00 2001
-From: Julien Corjon <corjon.j@ecagroup.com>
-Date: Tue, 21 Jul 2015 11:59:57 +0200
-Subject: [PATCH] forkd - disable eventfd for uClibc <= 0.9.33
-
-eventfd is not implemented in uClibc <= 0.9.33
-
-Upstream-Status : https://bugreports.qt.io/browse/QTBUG-47337
-
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- src/3rdparty/forkfd/forkfd.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/3rdparty/forkfd/forkfd.c b/src/3rdparty/forkfd/forkfd.c
-index 8d08f40..fa47cdf 100644
---- a/src/3rdparty/forkfd/forkfd.c
-+++ b/src/3rdparty/forkfd/forkfd.c
-@@ -48,6 +48,10 @@
- #  if (defined(__GLIBC__) && (__GLIBC__ << 16) + __GLIBC_MINOR__ >= 0x209) || defined(__BIONIC__)
- #    define HAVE_PIPE2    1
- #  endif
-+#  if (defined(__UCLIBC__) && (__UCLIBC_MAJOR__ == 0) && (__UCLIBC_MINOR__ < 9 || (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 33)))
-+#    undef HAVE_EVENTFD
-+#    undef HAVE_PIPE2
-+#  endif
- #endif
- 
- #if _POSIX_VERSION-0 >= 200809L || _XOPEN_VERSION-0 >= 500
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch b/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
deleted file mode 100644
index a578af3..0000000
--- a/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-Fix Qt5 configure script not autodetecting sunxi-mali drivers rendering
-in eglfs_mali not being built. The patch also fix compatibility issues
-regarding header files only included in the proprietary version.
-
-This will be fixed in Qt 5.6.
-
-ref: https://codereview.qt-project.org/#/c/125837/
-
-Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
-
-diff --git a/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp
-new file mode 100644
-index 0000000..1914d64
---- /dev/null
-+++ b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp
-@@ -0,0 +1,44 @@
-+/****************************************************************************
-+**
-+** Copyright (C) 2015 The Qt Company Ltd.
-+** Contact: http://www.qt.io/licensing/
-+**
-+** This file is part of the config.tests of the Qt Toolkit.
-+**
-+** $QT_BEGIN_LICENSE:LGPL21$
-+** Commercial License Usage
-+** Licensees holding valid commercial Qt licenses may use this file in
-+** accordance with the commercial license agreement provided with the
-+** Software or, alternatively, in accordance with the terms contained in
-+** a written agreement between you and The Qt Company. For licensing terms
-+** and conditions see http://www.qt.io/terms-conditions. For further
-+** information use the contact form at http://www.qt.io/contact-us.
-+**
-+** GNU Lesser General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU Lesser
-+** General Public License version 2.1 or version 3 as published by the Free
-+** Software Foundation and appearing in the file LICENSE.LGPLv21 and
-+** LICENSE.LGPLv3 included in the packaging of this file. Please review the
-+** following information to ensure the GNU Lesser General Public License
-+** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
-+** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
-+**
-+** As a special exception, The Qt Company gives you certain additional
-+** rights. These rights are described in The Qt Company LGPL Exception
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
-+**
-+** $QT_END_LICENSE$
-+**
-+****************************************************************************/
-+
-+#include <EGL/egl.h>
-+#include <GLES2/gl2.h>
-+
-+int main(int, char **)
-+{
-+    EGLDisplay dpy = 0;
-+    EGLContext ctx = 0;
-+    mali_native_window *w = 0;
-+    eglDestroyContext(dpy, ctx);
-+    return 0;
-+}
-diff --git a/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro
-new file mode 100644
-index 0000000..85bcf64
---- /dev/null
-+++ b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro
-@@ -0,0 +1,5 @@
-+SOURCES = eglfs-mali-2.cpp
-+
-+CONFIG -= qt
-+
-+LIBS += -lEGL -lGLESv2
-diff --git a/configure b/configure
-index cea62fb..09781bc 100755
---- a/configure
-+++ b/configure
-@@ -5624,7 +5624,8 @@ if [ "$CFG_EGLFS" != "no" ]; then
-         else
-             CFG_EGLFS_BRCM=no
-         fi
--        if compileTest qpa/eglfs-mali "eglfs-mali"; then
-+        if compileTest qpa/eglfs-mali "eglfs-mali" \
-+            || compileTest qpa/eglfs-mali-2 "eglfs-mali-2"; then
-             CFG_EGLFS_MALI=yes
-         else
-             CFG_EGLFS_MALI=no
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-index 455d780..43decdf 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-@@ -32,7 +32,6 @@
- ****************************************************************************/
-
- #include "qeglfsmaliintegration.h"
--#include <EGL/fbdev_window.h>
-
- #include <unistd.h>
- #include <fcntl.h>
-@@ -43,6 +42,11 @@
-
- QT_BEGIN_NAMESPACE
-
-+struct fbdev_window {
-+    unsigned short width;
-+    unsigned short height;
-+};
-+
- void QEglFSMaliIntegration::platformInit()
- {
-     // Keep the non-overridden base class functions based on fb0 working.
diff --git a/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
deleted file mode 100644
index 97be739..0000000
--- a/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8f09897de948cea8861ca95e182f442cf15a339e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
-
-This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
-only when its glibc < 2 and not also for the libraries which may define
-it as per standards but are not glibc, e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Bernd: Downloaded from
-https://github.com/meta-qt5/meta-qt5/blob/d9d1d04760430cd0e5edd1764d832860715e7b83/recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
-and adjusted path.]
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-index dd12003..8623651 100644
---- a/mkspecs/linux-g++/qplatformdefs.h
-+++ b/mkspecs/linux-g++/qplatformdefs.h
-@@ -86,10 +86,10 @@
- 
- #undef QT_SOCKLEN_T
- 
--#if defined(__GLIBC__) && (__GLIBC__ >= 2)
--#define QT_SOCKLEN_T            socklen_t
--#else
-+#if defined(__GLIBC__) && (__GLIBC__ < 2)
- #define QT_SOCKLEN_T            int
-+#else
-+#define QT_SOCKLEN_T            socklen_t
- #endif
- 
- #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
--- 
-2.1.4
-
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index ea831e9..934fb5d 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtbase-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 dfa4e8a4d7e4c6b69285e7e8833eeecd819987e1bdbe5baa6b6facd4420de916 qtbase-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtbase-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 6efa8a5c559e92b2e526d48034e858023d5fd3c39115ac1bfd3bb65834dbd67a qtbase-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 6eeb619..b81383b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -111,10 +111,6 @@ endif
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
-QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
-endif
-
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 058ba31..a8676a9 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,2 @@
-# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtconnectivity-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 3637e6def8582fc0fb3684179b93650720ba2da1311a560d358296153f245023 qtconnectivity-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtconnectivity-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 0c5cb0c100006759b6954a36e7dc66f8f1ac2b61b3f639152cf6ecb8d48a40eb qtconnectivity-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index f32b037..830e18f 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,2 +1,2 @@
-# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtdeclarative-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 5fd14eefb83fff36fb17681693a70868f6aaf6138603d799c16466a094b26791 qtdeclarative-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtdeclarative-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 8c55f053f0e348577b56da541af74d02d0f2b61c9a6c15152b03dad03dfde04c qtdeclarative-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 6f5f626..3f66ee0 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,2 +1,2 @@
-# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtenginio-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 a79936bd5b6a35aba28dd282291b28c8fa869b8d86652c62efe5e268d94defe2 qtenginio-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtenginio-opensource-src-1.6.0.tar.xz.mirrorlist
+sha256 627ddcfbbfc3ec1a83c9dbb5f24287b5cd6cb5d3b9d09af4d1c444c6ac147f0c qtenginio-opensource-src-1.6.0.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 2a6aa3c..b6a534c 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-QT5ENGINIO_VERSION = $(QT5_VERSION)
+# Qt5Enginio does not follow Qt versionning
+# see https://bugreports.qt.io/browse/QTBUG-50111
+QT5ENGINIO_VERSION = 1.6.0
 QT5ENGINIO_SITE = $(QT5_SITE)
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl qt5base
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 959230f..847458e 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtgraphicaleffects-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 9bca0f8db3a4289eceebfa9504915440fe3fa6301d90b65705e4ece528c12d47 qtgraphicaleffects-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtgraphicaleffects-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 01e911fdcf85a13b927cba341d15a0baeead3eba85c4532b1b45bb5c334416e8 qtgraphicaleffects-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index c392abf..05b8cbc 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtimageformats-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 c97fee00c602f9f089fea480546d6e9d61a2b2297c2f163bfd9f8aba92b754a5 qtimageformats-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtimageformats-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 2c854275a689a513ba24f4266cc6017d76875336671c2c8801b4b7289081bada qtimageformats-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index b4e1b68..f988666 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtmultimedia-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 7cc7ca99f41587c188303670499e5c75101f9a8cb6178e8f29cc941e637d957f qtmultimedia-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtmultimedia-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 103f99d6cd266f5c4485546a75ef0c6ee7e88dc901a0be21447cf89159370686 qtmultimedia-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 99dacb8..409efde 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtquickcontrols-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 1b7a8389d656066c629bd2cb520b39a7eb041d184b567dd1b9639b88d841fcf0 qtquickcontrols-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtquickcontrols-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 ec0896792f2a08d109ab3791aa4e47747aab22ebfad281005c4bf8f26f9f788b qtquickcontrols-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index f2b1df8..cc32efc 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtscript-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 cd46dddd998f22bcb06447e0407fef81f7052f25bc770b1c27625654cee828fd qtscript-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtscript-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 ac7475197d9a0f3c7284f002390e2427fef84ec90dc590630431a848099c5042 qtscript-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 23559f6..4f23af0 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtsensors-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 5d264fc0729a5d7679bd4eb8d7a0a9b142ed38d09fa68fc7dfe57f64afc8eeea qtsensors-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtsensors-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 518f392fec5e01aaa7f95e9141678cc99b02ed067ebbd24c38c1420067c59c2e qtsensors-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index db50145..f2f0fe9 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtserialport-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 a034dbfb023db1b9b9de54390f7e76a48c1d1eb12533b0ffd574505c99968f7a qtserialport-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtserialport-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 16ee7fb66bb997df674a12a7a5a1450e2a2b860c8d34d237f3631d9f60853c1f qtserialport-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index afe98cf..56043cf 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtsvg-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 f7f588be48befd9ccab5a6086832551b8899e8bed9e603ddea979581e05a91c7 qtsvg-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtsvg-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 798799319138bb40b6187f4ecc1099956a0d62148f78512e9cb085d1fa5f641f qtsvg-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index f54c94a..84be92d 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qttools-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 4361f6ce49717058160908297841a18b94645cec593d1b48fb126c9d06c87bfd qttools-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qttools-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 0d244c61bbe5505cb94310e980b06ef13dd573511e80ccbdc060f71d5462219d qttools-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch b/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch
deleted file mode 100644
index 0eb007e..0000000
--- a/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 4dee412aa655e1dc7f9e01869abcab47e0179422 Mon Sep 17 00:00:00 2001
-From: Julien Corjon <corjon.j@ecagroup.com>
-Date: Wed, 22 Jul 2015 09:24:04 +0200
-Subject: [PATCH] Fix builds without qml module
-
-When we build without qml module we cannot use QJSValue in qmetaobjectpublisher
-To prevent QJSValue inclusiion I use a preprocessor directive QT_HAVE_QML. This
-is probably not the best solution but I do not know any other QML directive.
-
-Upstream--Status: https://bugreports.qt.io/browse/QTBUG-47360
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- src/webchannel/qmetaobjectpublisher.cpp | 4 ++++
- src/webchannel/webchannel.pro           | 2 ++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/webchannel/qmetaobjectpublisher.cpp b/src/webchannel/qmetaobjectpublisher.cpp
-index 0cad569..b0e9652 100644
---- a/src/webchannel/qmetaobjectpublisher.cpp
-+++ b/src/webchannel/qmetaobjectpublisher.cpp
-@@ -41,7 +41,9 @@
- #include <QDebug>
- #include <QJsonObject>
- #include <QJsonArray>
-+#ifdef QT_HAVE_QML
- #include <QJSValue>
-+#endif
- #include <QUuid>
- 
- QT_BEGIN_NAMESPACE
-@@ -486,12 +488,14 @@ QJsonValue QMetaObjectPublisher::wrapResult(const QVariant &result, QWebChannelA
-         if (!classInfo.isEmpty())
-             objectInfo[KEY_DATA] = classInfo;
-         return objectInfo;
-+#ifdef QT_HAVE_QML
-     } else if (result.canConvert<QJSValue>()) {
-         // Workaround for keeping QJSValues from QVariant.
-         // Calling QJSValue::toVariant() converts JS-objects/arrays to QVariantMap/List
-         // instead of stashing a QJSValue itself into a variant.
-         // TODO: Improve QJSValue-QJsonValue conversion in Qt.
-         return wrapResult(result.value<QJSValue>().toVariant(), transport, parentObjectId);
-+#endif
-     } else if (result.canConvert<QVariantList>()) {
-         // recurse and potentially wrap contents of the array
-         return wrapList(result.toList(), transport);
-diff --git a/src/webchannel/webchannel.pro b/src/webchannel/webchannel.pro
-index eba8123..f476d6f 100644
---- a/src/webchannel/webchannel.pro
-+++ b/src/webchannel/webchannel.pro
-@@ -30,6 +30,8 @@ SOURCES += \
- qtHaveModule(qml) {
-     QT += qml
- 
-+    QMAKE_CXXFLAGS += "-DQT_HAVE_QML"
-+
-     SOURCES += \
-         qqmlwebchannel.cpp \
-         qqmlwebchannelattached.cpp
--- 
-2.1.0
-
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index c0ae89e..4f93cdb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebchannel-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 7f4295ee57cd4ecba3cb263452d2a08d501b45c9a2b8b7794b6a97d7652f15d0 qtwebchannel-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwebchannel-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 c25424935e866e77f31e5ebc50fc97eaedd4d77f6e967bfc59ce7fa6a7b4c14f qtwebchannel-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 0bd4a5a..d803285 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebsockets-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 cf4e834a867b90337188be504ef20184c52666370f721e704952988f8cb12deb qtwebsockets-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwebsockets-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 268ab869fe3d0d22abd9668851155db79aff2f386bc448051b6ef477841d719f qtwebsockets-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index d7c0ad0..5f5481e 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtx11extras-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 6387a01d972b62e1ad39e5a25e07d0492200f62fc87cf4366122085aeeebeb65 qtx11extras-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtx11extras-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 47ed768d02bc09edfa20332bc58c4188b9529235cdb616802ef775d6e7613425 qtx11extras-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index e04a1a1..ffe2a40 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtxmlpatterns-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 b537eb0252988e3805a32a16c65038973371d647baf246fdf703bde725d0e8ec qtxmlpatterns-opensource-src-5.5.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtxmlpatterns-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 baed1b3bd3f010b8c4a96b4ca7a595b665d43d2e5758b55a364dbc9f2ac819d4 qtxmlpatterns-opensource-src-5.6.0.tar.xz
-- 
2.5.0
