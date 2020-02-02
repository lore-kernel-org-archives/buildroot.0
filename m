From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 21:03:58 +0100
Subject: [Buildroot] [git commit] package/qt5: bump latest version to 5.12.7
Message-ID: <20200202195303.0150588477@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9830ff31f61a06b0c4d5c3994fd65b56de81fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base:
 - remove 0003-Do-not-load-plugin-from-the-PWD.patch
   (taken from upstream [1])
 - remove 0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
   (taken from upstream [2])

qt5webengine:
 - update 3rdparty license hash script to not include '*.pyc' files
 - update 3rdparty license hash list and chromium-latest.inc file

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=bf131e8d2181b3404f5293546ed390999f760404
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e6f1fde24f77f63fb16b2df239f82a89d2bf05dd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 .../0003-Do-not-load-plugin-from-the-PWD.patch     | 32 ------------
 ...ix-do-not-attempt-to-load-a-library-relat.patch | 59 ----------------------
 ...001-qtbase-Fix-build-error-when-using-EGL.patch |  0
 ...2-double-conversion-enable-for-microblaze.patch |  0
 .../qt5/qt5base/{5.12.5 => 5.12.7}/qt5base.hash    |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5charts/qt5charts.hash               |  4 +-
 .../{5.12.5 => 5.12.7}/qt5connectivity.hash        |  4 +-
 ...01-qsgtexture-fix-debug-build-with-uclibc.patch |  0
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 .../{5.12.5 => 5.12.7}/qt5quickcontrols2.hash      |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 .../{5.12.5 => 5.12.7}/qt5serialbus.hash           |  4 +-
 .../{5.12.5 => 5.12.7}/qt5serialport.hash          |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 .../{5.12.5 => 5.12.7}/qt5virtualkeyboard.hash     |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 ...1-pkg_config-Fixes-when-use_sysroot-false.patch |  0
 .../{5.12.5 => 5.12.7}/qt5webengine.hash           |  9 ++--
 package/qt5/qt5webengine/chromium-latest.inc       |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5webview/qt5webview.hash             |  4 +-
 .../{5.12.5 => 5.12.7}/qt5x11extras.hash           |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 35 files changed, 61 insertions(+), 149 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 8169faf7c7..d94d9cc99f 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).5
+QT5_VERSION = $(QT5_VERSION_MAJOR).7
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index a731bf764f..1ccc9f00e9 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qt3d-everywhere-src-5.12.5.tar.xz.sha256
-sha256 2a35b144768c7ad8a9265d16a04f038d9bc51016bd2c4b2b516e374f81ff29c4  qt3d-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qt3d-everywhere-src-5.12.7.tar.xz.sha256
+sha256 2030de3dc93fd4062f677f61938229af9cd7aa4c3d2932cdda2ccb663d681126 qt3d-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch b/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch
deleted file mode 100644
index 4acd42f005..0000000000
--- a/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bf131e8d2181b3404f5293546ed390999f760404 Mon Sep 17 00:00:00 2001
-From: Olivier Goffart <ogoffart@woboq.com>
-Date: Fri, 8 Nov 2019 11:30:40 +0100
-Subject: [PATCH] Do not load plugin from the $PWD
-
-I see no reason why this would make sense to look for plugins in the current
-directory. And when there are plugins there, it may actually be wrong
-
-Change-Id: I5f5aa168021fedddafce90effde0d5762cd0c4c5
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=bf131e8d2181b3404f5293546ed390999f760404
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/corelib/plugin/qpluginloader.cpp | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/corelib/plugin/qpluginloader.cpp b/src/corelib/plugin/qpluginloader.cpp
-index cadff4f32b..c2443dbdda 100644
---- a/src/corelib/plugin/qpluginloader.cpp
-+++ b/src/corelib/plugin/qpluginloader.cpp
-@@ -305,7 +305,6 @@ static QString locatePlugin(const QString& fileName)
-         paths.append(fileName.left(slash)); // don't include the '/'
-     } else {
-         paths = QCoreApplication::libraryPaths();
--        paths.prepend(QStringLiteral(".")); // search in current dir first
-     }
- 
-     for (const QString &path : qAsConst(paths)) {
--- 
-2.25.0
-
diff --git a/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch b/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
deleted file mode 100644
index 5004851a71..0000000000
--- a/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From e6f1fde24f77f63fb16b2df239f82a89d2bf05dd Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Fri, 10 Jan 2020 09:26:27 -0800
-Subject: [PATCH] QLibrary/Unix: do not attempt to load a library relative to
- $PWD
-
-I added the code in commit 5219c37f7c98f37f078fee00fe8ca35d83ff4f5d to
-find libraries in a haswell/ subdir of the main path, but we only need
-to do that transformation if the library is contains at least one
-directory seprator. That is, if the user asks to load "lib/foo", then we
-should try "lib/haswell/foo" (often, the path prefix will be absolute).
-
-When the library name the user requested has no directory separators, we
-let dlopen() do the transformation for us. Testing on Linux confirms
-glibc does so:
-
-$ LD_DEBUG=libs /lib64/ld-linux-x86-64.so.2 --inhibit-cache ./qml -help |& grep Xcursor
-   1972475:     find library=libXcursor.so.1 [0]; searching
-   1972475:       trying file=/usr/lib64/haswell/avx512_1/libXcursor.so.1
-   1972475:       trying file=/usr/lib64/haswell/libXcursor.so.1
-   1972475:       trying file=/usr/lib64/libXcursor.so.1
-   1972475:     calling init: /usr/lib64/libXcursor.so.1
-   1972475:     calling fini: /usr/lib64/libXcursor.so.1 [0]
-
-Fixes: QTBUG-81272
-Change-Id: I596aec77785a4e4e84d5fffd15e89689bb91ffbb
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e6f1fde24f77f63fb16b2df239f82a89d2bf05dd
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/corelib/plugin/qlibrary_unix.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/plugin/qlibrary_unix.cpp b/src/corelib/plugin/qlibrary_unix.cpp
-index f0de1010d7..135b82cd37 100644
---- a/src/corelib/plugin/qlibrary_unix.cpp
-+++ b/src/corelib/plugin/qlibrary_unix.cpp
-@@ -1,7 +1,7 @@
- /****************************************************************************
- **
- ** Copyright (C) 2016 The Qt Company Ltd.
--** Copyright (C) 2018 Intel Corporation
-+** Copyright (C) 2020 Intel Corporation
- ** Contact: https://www.qt.io/licensing/
- **
- ** This file is part of the QtCore module of the Qt Toolkit.
-@@ -218,6 +218,8 @@ bool QLibraryPrivate::load_sys()
-         for(int suffix = 0; retry && !pHnd && suffix < suffixes.size(); suffix++) {
-             if (!prefixes.at(prefix).isEmpty() && name.startsWith(prefixes.at(prefix)))
-                 continue;
-+            if (path.isEmpty() && prefixes.at(prefix).contains(QLatin1Char('/')))
-+                continue;
-             if (!suffixes.at(suffix).isEmpty() && name.endsWith(suffixes.at(suffix)))
-                 continue;
-             if (loadHints & QLibrary::LoadArchiveMemberHint) {
--- 
-2.25.0
-
diff --git a/package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.5/qt5base.hash b/package/qt5/qt5base/5.12.7/qt5base.hash
similarity index 81%
rename from package/qt5/qt5base/5.12.5/qt5base.hash
rename to package/qt5/qt5base/5.12.7/qt5base.hash
index 6689d09efc..0697464cb9 100644
--- a/package/qt5/qt5base/5.12.5/qt5base.hash
+++ b/package/qt5/qt5base/5.12.7/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtbase-everywhere-src-5.12.5.tar.xz.sha256
-sha256 fc8abffbbda9da3e593d8d62b56bc17dbaab13ff71b72915ddda11dabde4d625 qtbase-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtbase-everywhere-src-5.12.7.tar.xz.sha256
+sha256 b18939cb25d90aef8721fb12ec34c3632d3490ced958e41f6c7a52064643665d qtbase-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index a098ad7de0..2c7046a87e 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcanvas3d-everywhere-src-5.12.5.tar.xz.sha256
-sha256 1553e06ce3cc5afb36aed3698b85c00e734eac07f7f41895426bebd84216d80c  qtcanvas3d-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcanvas3d-everywhere-src-5.12.7.tar.xz.sha256
+sha256 b63a513a2ee11548b122e0fd640b1fa22d3eb83cdc51ddfdf3b97c2ecd0d0c50 qtcanvas3d-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index adc860f41a..fb077b95af 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcharts-everywhere-src-5.12.5.tar.xz.sha256
-sha256 4c7c30a916ba0100a1635b89f48bc5a8af4cdedac79c3fc18456af54dc0a6608  qtcharts-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcharts-everywhere-src-5.12.7.tar.xz.sha256
+sha256 434065526d0b1d8921e96cc1827b1a3579e073b930fe536455c4c1da2f15cf5f qtcharts-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
index da757aef77..9af3a57c12 100644
--- a/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtconnectivity-everywhere-src-5.12.5.tar.xz.sha256
-sha256 bdf62c72d689f47c4d17ecdde934d9f85a1164091e58fce02873de259e8de88b  qtconnectivity-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtconnectivity-everywhere-src-5.12.7.tar.xz.sha256
+sha256 647148b9b1a0d3e54f788b66797b81bb87434faf6fb12ac481f9165eda0d071a qtconnectivity-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 6bac255578..71e9cb2118 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtdeclarative-everywhere-src-5.12.5.tar.xz.sha256
-sha256 22c5323d4b01259e6e352eef1b54129d6dfee00a406f0312905fa7db322b9190  qtdeclarative-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtdeclarative-everywhere-src-5.12.7.tar.xz.sha256
+sha256 5cdc05a035f240ab73b6b37dd3831c1350cd80e5799da47929974085f6eae9bd qtdeclarative-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index b9cfe357f8..8e327de296 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtgraphicaleffects-everywhere-src-5.12.5.tar.xz.sha256
-sha256 bdbddba7e0e0d041809a98d97c07da8be8936ec48537335cbaea9b0049c646ad  qtgraphicaleffects-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtgraphicaleffects-everywhere-src-5.12.7.tar.xz.sha256
+sha256 02f0328420c623da8f9ae949fec01e99ba84213dd2ad559cb00c204502bbcace qtgraphicaleffects-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 6215852a95..de977f15ba 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtimageformats-everywhere-src-5.12.5.tar.xz.sha256
-sha256 9f19394830542fb9e6bde6806b6216b7207f96bff674b91e8e8a8f89699e1f0a  qtimageformats-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtimageformats-everywhere-src-5.12.7.tar.xz.sha256
+sha256 9bd19ee24fb85f249d01c78e637c95377dd738feb61da0deeee6b770fa62f70b qtimageformats-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 27ad8efd9e..80bcfaf0ab 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtlocation-everywhere-src-5.12.5.tar.xz.sha256
-sha256 12c8b59755abc4ca56e135e8ae3db7c6ba1bd95c779060f10a01393ae1040122  qtlocation-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtlocation-everywhere-src-5.12.7.tar.xz.sha256
+sha256 d1e905b80befda3c9aaad92ea984e6dbf722568b5c91e8d15b027bc5bc22781f qtlocation-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 93bb6f1ccc..016ec44cee 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtmultimedia-everywhere-src-5.12.5.tar.xz.sha256
-sha256 d5a0a4fddc5ef14d641160a1fc0011b190ff8d9f19009498d586516b8ee3479c  qtmultimedia-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtmultimedia-everywhere-src-5.12.7.tar.xz.sha256
+sha256 28bdaa81371f922223775ae5171c4d589a2c07f255abbe5ccf130ecbbdb4db1d qtmultimedia-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 71727972b4..9ae6ac76d7 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols-everywhere-src-5.12.5.tar.xz.sha256
-sha256 46deaefbdac3daa576c748e807956f5f82b2318923b1a36e434a3ff32d1d2559  qtquickcontrols-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols-everywhere-src-5.12.7.tar.xz.sha256
+sha256 1038bbc76bba53f9634f40cd9c8ebf0ed8ae82e791f727b228bd81bdcf1859e5 qtquickcontrols-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
similarity index 65%
rename from package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
index e886661527..689a7e5284 100644
--- a/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols2-everywhere-src-5.12.5.tar.xz.sha256
-sha256 d744bdc492486db6cb521b1d4891e2358719399825ca1cf2a50968a80f6acb8f  qtquickcontrols2-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols2-everywhere-src-5.12.7.tar.xz.sha256
+sha256 3a9526e5ad01edbfb796a6631983c391ea1b7e22ae6e07840048156a9e92a237 qtquickcontrols2-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 86381865e7..bddcceb813 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscript-everywhere-src-5.12.5.tar.xz.sha256
-sha256 0083734ae827840334b774decb15de37f1b4ea5c88e442e2f485c530f24f1df4  qtscript-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscript-everywhere-src-5.12.7.tar.xz.sha256
+sha256 ca1dbc66d4125a678638dd0c9c030b72fdfc4ec2c229b9316a8bc80a86104019 qtscript-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index e24cdfd445..83ba0da838 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscxml-everywhere-src-5.12.5.tar.xz.sha256
-sha256 6f1ec74100cdb2e7dfc3535e09d356fc53ba42e61b32fc3b93d5a7efed49960c  qtscxml-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscxml-everywhere-src-5.12.7.tar.xz.sha256
+sha256 afa950bc95f881c90eea564511f3e9918d53fddf0823afb641d20dc6f794fbb6 qtscxml-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 3dc2d7ddb5..1e298d1674 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsensors-everywhere-src-5.12.5.tar.xz.sha256
-sha256 e3a86a706f475bb23fc874de56026482de223ebd24f8cb4e94a28d1985ca0b85  qtsensors-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsensors-everywhere-src-5.12.7.tar.xz.sha256
+sha256 2b9aea9f4e2f681b4067f2b9d97c5073c135e41d26601c71f18f199bc980e740 qtsensors-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
similarity index 71%
rename from package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
index 7ce82a33ef..fa3ccc1475 100644
--- a/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialbus-everywhere-src-5.12.5.tar.xz.sha256
-sha256 8474ae61a703c56e327ae0755c27643f2eafe0d915e8c6afb21728548dc02c22  qtserialbus-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialbus-everywhere-src-5.12.7.tar.xz.sha256
+sha256 82201edf971e957d849b041ab2914f7497226939c62884ec2906b37576987eae qtserialbus-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.5/qt5serialport.hash b/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.5/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.7/qt5serialport.hash
index 3edb832537..d042154ebe 100644
--- a/package/qt5/qt5serialport/5.12.5/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialport-everywhere-src-5.12.5.tar.xz.mirrorlist
-sha256 f8ef0321a59ecfe2c72adc2ee220e0047403439a3c7b9efb719b1476af1fb862 qtserialport-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.mirrorlist
+sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 5c5300ae68..5a34479534 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsvg-everywhere-src-5.12.5.tar.xz.sha256
-sha256 75a791cf749f671d7ea9090b403ca513f745795018db512e7eecbf418b679840  qtsvg-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsvg-everywhere-src-5.12.7.tar.xz.sha256
+sha256 4bf60916d4e398d9609f1b3a17fc7345a0e13c7c1cc407298df20da4c7c67bb8 qtsvg-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 344cc0a9d2..5fb75d9fa9 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qttools-everywhere-src-5.12.5.tar.xz.sha256
-sha256 28e095047b4985437dd66120cbcb49ac091bf4f12576ecad7ebc781b7dd44025  qttools-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qttools-everywhere-src-5.12.7.tar.xz.sha256
+sha256 860a97114d518f83c0a9ab3742071da16bb018e6eb387179d5764a8dcca03948 qttools-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
index 4b086f81aa..668f971bea 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz.sha256
-sha256 786d745b34b1f145073488d492325e98bcde81b07ab984032ea5eb2fb52e6e5e  qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz.sha256
+sha256 aaa52aaff923df22de8472d71843dadb80f3f6fe0312122e64ffe5436db40daa qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 523ef9e9f2..43ca77a393 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwayland-everywhere-src-5.12.5.tar.xz.sha256
-sha256 29fd31267149451f93faa15f031e0a14506e704086033f70d51479522c6f3846  qtwayland-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwayland-everywhere-src-5.12.7.tar.xz.sha256
+sha256 fc1ab8e25461580e37090e4f82422411dee71a3de48a54be1f4b6569e00f66c5 qtwayland-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 42b2d9a6fe..c863a6ea60 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebchannel-everywhere-src-5.12.5.tar.xz.sha256
-sha256 9f1d1ac20722ee053ecf071d4ec0070a45a765cb67b6e31add61004fb4b3c5e8  qtwebchannel-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebchannel-everywhere-src-5.12.7.tar.xz.sha256
+sha256 b0ae72e5957aa4b281a37d2e169fcf91f92382bc36bd0cf09c80b2bb961bce75 qtwebchannel-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch b/package/qt5/qt5webengine/5.12.7/0001-pkg_config-Fixes-when-use_sysroot-false.patch
similarity index 100%
rename from package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch
rename to package/qt5/qt5webengine/5.12.7/0001-pkg_config-Fixes-when-use_sysroot-false.patch
diff --git a/package/qt5/qt5webengine/5.12.5/qt5webengine.hash b/package/qt5/qt5webengine/5.12.7/qt5webengine.hash
similarity index 98%
rename from package/qt5/qt5webengine/5.12.5/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.7/qt5webengine.hash
index 0956f504ed..8308ef4920 100644
--- a/package/qt5/qt5webengine/5.12.5/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.7/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebengine-everywhere-src-5.12.5.tar.xz.sha256
-sha256 31881130e69eb8336e9480f9f33cd5a93e86de8d7323c0ae1893e1a72ce70743  qtwebengine-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebengine-everywhere-src-5.12.7.tar.xz.sha256
+sha256 83b754dca3dafeb21be6c7cb5ea99f11f5dbe9055bc1680f5bd7159224bb46fa qtwebengine-everywhere-src-5.12.7.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -10,7 +10,7 @@ sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE
 sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE.LGPL3
 
 # Locally calculated with:
-# for i in $(find src/3rdparty/ -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before') ; do echo -n "sha256 " ; sha256sum $i ; done | sort --key=3
+# for i in $(find src/3rdparty/ -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before') ; do echo -n "sha256 " ; sha256sum $i ; done | sort --key=3
 sha256 d04360743ae3338bb08ab2106b51e24309e3ca4b1c6b1186139531ade351b7e3  src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE
 sha256 96e7ccbf8d17e319dd77c4ebd4965b64a820bbcc3142a2478fbf95af77417b6a  src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE
 sha256 5d85142a5609ad177a2d7a2e7cae060b886b8b42f25c5b9803cf0cb5ee04ad2f  src/3rdparty/chromium/base/third_party/icu/LICENSE
@@ -41,7 +41,6 @@ sha256 584e795ba5833279c327245594d6dc216fc664144fa3626a0bdf136bc00af76c  src/3rd
 sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/axe-core/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/bazel/LICENSE
 sha256 0518cf49c09398259d54fcfff0b5fd36456162c6439886660e53627b3073ef22  src/3rdparty/chromium/third_party/blanketjs/LICENSE
-sha256 228eadfc94c664f3e31833d7eb2d682127038cb44a0d482b6d6c1026f3fce306  src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE
 sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2
 sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1
@@ -392,6 +391,8 @@ sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rd
 sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/sqlite4java/LICENSE
 sha256 06545a6ec25fbbff6c62f205f94a35be49e38f33bea827a8cfb07d7b82e4b083  src/3rdparty/chromium/third_party/sqlite/LICENSE
+sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms
+sha256 9c6479123f32a1ed50d9a0af203dfe8972e65035b0cdeef436b5f8d0924517fe  src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms
 sha256 28113a6e9e2fd7584187c738a7c5484452a1c383307a1741bec50a73262fac08  src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index 7c5aca81d4..b7a195569b 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -1,7 +1,7 @@
 # (echo "QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \\" ; \
 # 	find src/3rdparty/ -type f \
 #	\( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) \
-#	-a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' | \
+#	-a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' | \
 #	sort | sed 's%^\(.*\)$%\t\1 \\%') > package/qt5/qt5webengine/chromium-latest.inc
 QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
@@ -384,6 +384,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md \
 	src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms \
 	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
 	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index ae3b7c83e7..3bb6297f3e 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebsockets-everywhere-src-5.12.5.tar.xz.sha256
-sha256 5d58e697c49c0ea19a8299deba84b5360dca8c336a1636d38de0351757293262  qtwebsockets-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebsockets-everywhere-src-5.12.7.tar.xz.sha256
+sha256 6fd13c2558f532a32f20d977b44c0146107a0e93861df84978e4fd72af283b17 qtwebsockets-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 2de27a0add..d9d340479b 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
 sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebview-everywhere-src-5.12.5.tar.xz.sha256
-sha256 a6d4d8c335cd6838f4638874fcd67655e80db569ed567a774a84f6bf7d332f26  qtwebview-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebview-everywhere-src-5.12.7.tar.xz.sha256
+sha256 d3f82d2ceab59dc4dee3b6f54f4b70869c199d63f4534b299d900cdacc9b7be7 qtwebview-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
index b8f425109c..b8174a86dc 100644
--- a/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtx11extras-everywhere-src-5.12.5.tar.xz.mirrorlist
-sha256 89425af3e48b040878c6a64ace58c17a83b87c9330e6366b09a41d6797062a68 qtx11extras-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtx11extras-everywhere-src-5.12.7.tar.xz.mirrorlist
+sha256 23895f4b1e84f3783526b9e17680df38c587601d4dfa6ff1b81ace432c480b96 qtx11extras-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index a5ec76dbb2..0366baa0b9 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtxmlpatterns-everywhere-src-5.12.5.tar.xz.sha256
-sha256 b905d9107f87798ef0f142942fc45c0f63fc113522ab041e791d3cb744a8babd  qtxmlpatterns-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtxmlpatterns-everywhere-src-5.12.7.tar.xz.sha256
+sha256 9002014129a1f2a44700df333a7776e23bdfd689e7a619c3540fd9f6819b417b qtxmlpatterns-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
