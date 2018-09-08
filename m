From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:39:11 +0200
Subject: [Buildroot] [git commit] package/vlc: bump version to 3.0.4
Message-ID: <20180908134431.2DC278366A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd4abc30d2c21617a43d9ff19b7ab182c044f7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0004, applied upstream.
Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...de-the-name-of-the-vorbis-and-ogg-librar.patch} |  0
 .../vlc/0004-qt-fix-build-against-Qt-5.11.patch    | 33 ----------------------
 ...error-using-uClibc-by-adding-sys-types.h.patch} |  0
 ...006-Don-t-assume-strerror_l-is-available.patch} |  0
 ...-ancient-run-time-fallback-to-real-time-.patch} |  0
 ...-148-build-support-and-fix-10bit-support.patch} |  0
 ...2.patch => 0009-Add-support-for-freerdp2.patch} |  0
 ...-also-use-AC_PATH_PROG-to-check-for-wayl.patch} |  0
 package/vlc/vlc.hash                               | 12 ++++----
 package/vlc/vlc.mk                                 |  2 +-
 10 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/package/vlc/0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch b/package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
similarity index 100%
rename from package/vlc/0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
rename to package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
diff --git a/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch b/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
deleted file mode 100644
index fad33b2304..0000000000
--- a/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 30211b7336f2ed6048953390340e86f6cca9eb6f Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Thu, 17 May 2018 17:40:37 +0200
-Subject: [PATCH] qt: fix build against Qt 5.11
-
-Qt 5.11 is in RC phase now, and some headers need to be explicitly
-included in order to build successfully.
-
-Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
-
-Downloaded from
-https://sources.debian.org/src/vlc/3.0.3-1-3/debian/patches/0003-qt-fix-build-against-Qt-5.11.patch/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/gui/qt/components/simple_preferences.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/gui/qt/components/simple_preferences.cpp b/modules/gui/qt/components/simple_preferences.cpp
-index 635cc274c0..7a31a6ea6f 100644
---- a/modules/gui/qt/components/simple_preferences.cpp
-+++ b/modules/gui/qt/components/simple_preferences.cpp
-@@ -36,6 +36,7 @@
- #include <QString>
- #include <QFont>
- #include <QToolButton>
-+#include <QButtonGroup>
- #include <QSignalMapper>
- #include <QVBoxLayout>
- #include <QScrollArea>
--- 
-2.14.4
-
diff --git a/package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
similarity index 100%
rename from package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
rename to package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
diff --git a/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
similarity index 100%
rename from package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
rename to package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
diff --git a/package/vlc/0008-posix-remove-ancient-run-time-fallback-to-real-time-.patch b/package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch
similarity index 100%
rename from package/vlc/0008-posix-remove-ancient-run-time-fallback-to-real-time-.patch
rename to package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch
diff --git a/package/vlc/0009-x264-drop-148-build-support-and-fix-10bit-support.patch b/package/vlc/0008-x264-drop-148-build-support-and-fix-10bit-support.patch
similarity index 100%
rename from package/vlc/0009-x264-drop-148-build-support-and-fix-10bit-support.patch
rename to package/vlc/0008-x264-drop-148-build-support-and-fix-10bit-support.patch
diff --git a/package/vlc/0010-Add-support-for-freerdp2.patch b/package/vlc/0009-Add-support-for-freerdp2.patch
similarity index 100%
rename from package/vlc/0010-Add-support-for-freerdp2.patch
rename to package/vlc/0009-Add-support-for-freerdp2.patch
diff --git a/package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0010-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
similarity index 100%
rename from package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
rename to package/vlc/0010-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index ee1b0862fe..af1d936f13 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.sha256
-sha256 9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51 vlc-3.0.3.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.sha1
-sha1 dd1b7350bb0a7848e172e9dbbe0705ec5bb3d48c vlc-3.0.3.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.md5
-md5 cf01d4755c719fe1c8605ceb40d8f1d2 vlc-3.0.3.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.sha256
+sha256 01f3db3790714038c01f5e23c709e31ecd6f1c046ac93d19e1dde38b3fc05a9e vlc-3.0.4.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.sha1
+sha1 218603f05ab5f30de0cc87b0ccceb57bb1efcfa4 vlc-3.0.4.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.md5
+md5 f5e49a0fb9594ab8debf934a710e92f1 vlc-3.0.4.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b69657d31f..073dbf5b40 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.3
+VLC_VERSION = 3.0.4
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
