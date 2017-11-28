From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Nov 2017 23:37:44 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.9.3
Message-ID: <20171128223744.28422-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5connectivity:
 - moved 0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
   to 5.9.3

qt5declarative:
 - removed 0001-Fix-no-opengl-builds.patch to 5.9.3 (upstream committed,
   see [1])

qt5webengine:
 - keep 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
   (upstream committed, see [2], but reverted afterwards, see [3])

[1] https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
[2] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
[3] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +--
 package/qt5/qt5base/qt5base.hash                   |  4 +--
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +--
 ...rtrate-server-needs-only-core-and-bluetoo.patch |  0
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +--
 .../5.9.2/0001-Fix-no-opengl-builds.patch          | 32 ----------------------
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +--
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +--
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +--
 package/qt5/qt5location/qt5location.hash           |  4 +--
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +--
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +--
 package/qt5/qt5script/qt5script.hash               |  4 +--
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +--
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +--
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +--
 package/qt5/qt5svg/qt5svg.hash                     |  4 +--
 package/qt5/qt5tools/qt5tools.hash                 |  4 +--
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +--
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +--
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +--
 ...ad-libEGL-and-libGLES2-symbols-implicitly.patch |  0
 package/qt5/qt5webengine/qt5webengine.hash         |  4 +--
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +--
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +--
 28 files changed, 49 insertions(+), 81 deletions(-)
 rename package/qt5/qt5connectivity/{5.9.2 => 5.9.3}/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch (100%)
 delete mode 100644 package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
 rename package/qt5/qt5webengine/{5.9.2 => 5.9.3}/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch (100%)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 0e49c6b58b..f64f219964 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.9
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7a9d0dc7be..18441ead0d 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qt3d-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 c955a92fe2f3f2f03493ae0e9d973ebe1c4b1e037b58f18092fa2040f5b50783 qt3d-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qt3d-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 97925132f0583ccd76f5e104c849341df3abba73dd4d9b647622a23bdae6273f qt3d-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 4883484d5b..c6e694ab39 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtbase-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 7fe2bb468955f633c71b3ddd3c269e68a2c4137a4e5b8dd12dcdb34cbc6d609b qtbase-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtbase-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 9e7c44005e7691dc7c85165bd4510282c47f0163521f4973eab71dbdb39a9982 qtbase-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index eaff6c5766..1664f626cd 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtcanvas3d-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 84a8d66c2c35b67af84376037cac71fe77a105df09ffef7906a9cb1aeafb3eea qtcanvas3d-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcanvas3d-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 5e38b17844af801be57844da0379cc6882750b9019034f4fe884aae70c300abc qtcanvas3d-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5connectivity/5.9.2/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch b/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
similarity index 100%
rename from package/qt5/qt5connectivity/5.9.2/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
rename to package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index fa403e38ab..aaa3ef275b 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtconnectivity-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 2c759597ec959d54f29a3f628896d9208cf1f4e2269d8e01a9d3036f6995f3cc qtconnectivity-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtconnectivity-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 e2891e6e8d91e82e3c4d5667f3146062458067c0b706d65ac0fc7562afce0649 qtconnectivity-opensource-src-5.9.3.tar.xz
diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
deleted file mode 100644
index 8406ace9a3..0000000000
--- a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 66429b5f6986bde1f491699216f095c5e25023cf Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@qt.io>
-Date: Mon, 25 Sep 2017 16:53:24 +0200
-Subject: [PATCH] Fix no-opengl builds
-
-The qquickwidgets examples uses OpenGL directly
-
-Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
-Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
-
-Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/patch/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/quick/quick.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
-index 445dfb0f..7da255e9 100644
---- a/examples/quick/quick.pro
-+++ b/examples/quick/quick.pro
-@@ -36,7 +36,7 @@ qtConfig(opengl(es1|es2)?) {
- # Widget dependent examples
- qtHaveModule(widgets) {
-     SUBDIRS += embeddedinwidgets
--    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
-+    qtHaveModule(quickwidgets):qtConfig(opengl(es1|es2)?): SUBDIRS += quickwidgets
- }
- 
- EXAMPLE_FILES = \
--- 
-2.15.0
-
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e2d63d49ff..6f171ffa40 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtdeclarative-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 0d40fd4de9c73b9173d8308c0dc37952bf5c747d87ff221962dd2f848d820b08 qtdeclarative-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtdeclarative-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 505f66d2062c1d84ce743a0b4969531e1cf94e30970dc64efffe10f74f989407 qtdeclarative-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 08267b2d13..8770d72a19 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtgraphicaleffects-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 14594e7eb4b704dd69bf336828306fe8e6537c321d49ee0b701b3b1cdd8bfb76 qtgraphicaleffects-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtgraphicaleffects-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 790b029bc8bdbb5c9548ecad2ff6e73b7da3deabbdba6bacac4a6aacd3a0f0d9 qtgraphicaleffects-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 13357598a6..c56ed7d587 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtimageformats-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 3a626ca0ac7ffc56b59c4b3f66aac6bc76954054cedb6938b961562228eb9df3 qtimageformats-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtimageformats-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 d4b309ddbac2275cafadffc62047a26ed8f169bde015925761894843eae725dd qtimageformats-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 6369efbd76..5bb2021e09 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtlocation-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 c81a42e44ebd4e9c33f7195e86af3deab9fde72ef0ad8dcb04acee250d356b0c qtlocation-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtlocation-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 80fd425cde8747c1fc79aa90994a9caf921d7c79ff41babec692fe43cdc74ce1 qtlocation-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index c3377d2b2e..750c3379ca 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtmultimedia-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 c9a62700024871f204e5f107894c3a339bd645bf6dbac2bcf1bff8ce46842520 qtmultimedia-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtmultimedia-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 e79558d24ace9b4444d91d807b85778b6a0a592e7d1500ffadf45f7d3b8238a6 qtmultimedia-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 4ac79328d9..84890c5612 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtquickcontrols-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 5f09ecf8648acd8abed20d727b8517e0c53cf945e83a992ee58d4baadd84bd1f qtquickcontrols-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 300eeebd7d2c243c0123bc2324b5643b3f967c0816aead0ba7b993aeeac0e226 qtquickcontrols-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 7dec020363..7a6040f34c 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtquickcontrols2-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 2b55dd3dd53b4a6abb0ceb74b7fb98a5e52e9056c71a6cdbaead5cdf9d1ac8d2 qtquickcontrols2-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols2-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 21aaa26956ad0ccc3ce86ced7925ceae4b4cef25c6c5ef2f7ded608431420843 qtquickcontrols2-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 5257f563e4..66582ad448 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtscript-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 47807db5c2684609a0252601fda0a153530a2c97abb8c96df30f4e7897cd40f1 qtscript-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscript-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 b80bfaaf58f154b68101e438a1881f669cb9974026926be7755adb00af355566 qtscript-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 36162bf647..26e13d60b1 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtsensors-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 79441588c9c8bd1b34b91481441614077ea335a0005e79a1dc68ad964284b5d3 qtsensors-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsensors-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 b95ea20b3d616655435357671558631da6fe6970500b7e6d35d1111f0b8cdac1 qtsensors-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 0a3155a7f4..9191fd2198 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtserialbus-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 bbc24bdafd0191fc808e08b19f378e74bedbb79faf4e396b66ba7ca9fed9be08 qtserialbus-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialbus-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 ef62745e1793515e03fa586171de13eb17ee7699c9eb626f76a4dc5a00c46938 qtserialbus-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 589b859f1b..15abf7ac09 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtserialport-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 50ed9cc22db1615bc00267d24b0819813b854af3651ab6e5ffaa7f7c7e62cd42 qtserialport-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialport-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 4cdd3e9157ec3e91078f993cd28651989fa2429a409e19d398fb9cced231abdf qtserialport-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a3d8e6d6f8..03659702d6 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtsvg-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 ba96ebfbb60d2793547295b7122a127d21ba44cf586bfd3c8212c59d68661108 qtsvg-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsvg-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 df6628a60c8fbbcff99e6a24955c29494268d741509a3367a2294031ab4f5df2 qtsvg-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index f56e76447c..44856400e7 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qttools-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 2bb996118b68e9939c185a593837e5a41bb3667bf5d4d5134fac02598bd2d81a qttools-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qttools-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 442c38de3e35f9dcc355dadff35436e23a5a7abd7dd1167a3bf6325e3d9284ff qttools-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 528c938e47..54ded48dea 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtvirtualkeyboard-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 e836ca0348b21df28635e541713726444abed7b53a0acf3358cc90532e64c6fc qtvirtualkeyboard-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtvirtualkeyboard-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 b9313f744026f0dcf6e1008212880cd34851499d8b6bc9fc9fbaa1e4e52532ff qtvirtualkeyboard-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 9504c5e817..f03a15ceb9 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwayland-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 f6434d03f933867dfb219abec2cf19e2c1d1ef23d46d12cb9333c8066027f6c6 qtwayland-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwayland-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 308e8c44b0ad13520868365d72786d3e3f0b384da99ee72ba543cd866f655f6d qtwayland-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7eae4a73ba..188e5ea1f3 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebchannel-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 9c1b4defecadd7f9ee15d5815d464abef0961fc565cc7831720fc7c0c0d13a26 qtwebchannel-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebchannel-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 632795b293f1318e9aaa1e124b6a39b1625c8c1e35b0a9f05a02ea0066458358 qtwebchannel-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.9.2/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch b/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
similarity index 100%
rename from package/qt5/qt5webengine/5.9.2/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
rename to package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 918f7edb3a..9e8af68d69 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,2 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 cab069e4589f806640bebe4077c70e5cd5ffeb146c6e8caca6c4454fc0c4a108 qtwebengine-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
+sha256 45ae1142fd87271c100f4d7889427738e774e86db5d8f6bcf9ceb99d18571d37 qtwebengine-opensource-src-5.9.3.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index c144fba52f..e76482bcfe 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebsockets-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 afddc1bd915ea47ccbec968a7af02e2a5405c717830e4671924fe35b55e81674 qtwebsockets-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebsockets-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 ce069dff5b552bc6039bcf17e211d2c8837757e2194773bb54054105866111de qtwebsockets-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index be88dd21b5..e835648c52 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtx11extras-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 db85450ad4851816a4fade1ffc10d078d28f2cca174cffa6cbd6d1220b395ac5 qtx11extras-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtx11extras-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 e4e0bf8cbb629758ab85b72d240d7424642482f602ce414e06deef4e147bf2be qtx11extras-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 404496582a..e7f9d60fdd 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtxmlpatterns-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 0aa6aa83087d5754cfefaa3d119454009fc2dd5f266c1eb2ea7a434cef22d34e qtxmlpatterns-opensource-src-5.9.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtxmlpatterns-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 cf9c66a612a963382f7b4b51ac8ee5e920bd035b26ecb5c5957f8f3d3286f0ba qtxmlpatterns-opensource-src-5.9.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.15.0
