From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 12 Apr 2020 00:34:21 +0200
Subject: [Buildroot] [Patch for 2020.02.x v2] package/qt5: bump latest
 version to 5.12.8
Message-ID: <20200411223421.16269-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - really base on the 2020.02.x branch
---
 package/qt5/qt5.mk                                            | 2 +-
 package/qt5/qt53d/qt53d.hash                                  | 4 ++--
 .../0001-qtbase-Fix-build-error-when-using-EGL.patch          | 0
 .../0002-double-conversion-enable-for-microblaze.patch        | 0
 .../0003-double-conversion-enable-for-nios2.patch             | 0
 package/qt5/qt5base/{5.12.7 => 5.12.8}/qt5base.hash           | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.hash                      | 4 ++--
 package/qt5/qt5charts/qt5charts.hash                          | 4 ++--
 .../qt5connectivity/{5.12.7 => 5.12.8}/qt5connectivity.hash   | 4 ++--
 .../0001-qsgtexture-fix-debug-build-with-uclibc.patch         | 0
 package/qt5/qt5declarative/qt5declarative.hash                | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash      | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash              | 4 ++--
 package/qt5/qt5location/qt5location.hash                      | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash                  | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash            | 4 ++--
 .../{5.12.7 => 5.12.8}/qt5quickcontrols2.hash                 | 4 ++--
 package/qt5/qt5script/qt5script.hash                          | 4 ++--
 package/qt5/qt5scxml/qt5scxml.hash                            | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                        | 4 ++--
 package/qt5/qt5serialbus/{5.12.7 => 5.12.8}/qt5serialbus.hash | 4 ++--
 .../qt5/qt5serialport/{5.12.7 => 5.12.8}/qt5serialport.hash   | 4 ++--
 package/qt5/qt5svg/qt5svg.hash                                | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                            | 4 ++--
 .../{5.12.7 => 5.12.8}/qt5virtualkeyboard.hash                | 4 ++--
 package/qt5/qt5wayland/qt5wayland.hash                        | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash                  | 4 ++--
 .../0001-pkg_config-Fixes-when-use_sysroot-false.patch        | 0
 package/qt5/qt5webengine/{5.12.7 => 5.12.8}/qt5webengine.hash | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash                  | 4 ++--
 package/qt5/qt5webview/qt5webview.hash                        | 4 ++--
 package/qt5/qt5x11extras/{5.12.7 => 5.12.8}/qt5x11extras.hash | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash                | 4 ++--
 33 files changed, 55 insertions(+), 55 deletions(-)
 rename package/qt5/qt5base/{5.12.7 => 5.12.8}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.7 => 5.12.8}/0002-double-conversion-enable-for-microblaze.patch (100%)
 rename package/qt5/qt5base/{5.12.7 => 5.12.8}/0003-double-conversion-enable-for-nios2.patch (100%)
 rename package/qt5/qt5base/{5.12.7 => 5.12.8}/qt5base.hash (80%)
 rename package/qt5/qt5connectivity/{5.12.7 => 5.12.8}/qt5connectivity.hash (74%)
 rename package/qt5/qt5declarative/{5.12.7 => 5.12.8}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 rename package/qt5/qt5quickcontrols2/{5.12.7 => 5.12.8}/qt5quickcontrols2.hash (65%)
 rename package/qt5/qt5serialbus/{5.12.7 => 5.12.8}/qt5serialbus.hash (70%)
 rename package/qt5/qt5serialport/{5.12.7 => 5.12.8}/qt5serialport.hash (74%)
 rename package/qt5/qt5virtualkeyboard/{5.12.7 => 5.12.8}/qt5virtualkeyboard.hash (78%)
 rename package/qt5/qt5webengine/{5.12.7 => 5.12.8}/0001-pkg_config-Fixes-when-use_sysroot-false.patch (100%)
 rename package/qt5/qt5webengine/{5.12.7 => 5.12.8}/qt5webengine.hash (99%)
 rename package/qt5/qt5x11extras/{5.12.7 => 5.12.8}/qt5x11extras.hash (74%)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 7805b575f5..28de0e5b70 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).7
+QT5_VERSION = $(QT5_VERSION_MAJOR).8
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 1ccc9f00e9..5e7db55a56 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qt3d-everywhere-src-5.12.7.tar.xz.sha256
-sha256 2030de3dc93fd4062f677f61938229af9cd7aa4c3d2932cdda2ccb663d681126 qt3d-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qt3d-everywhere-src-5.12.8.tar.xz.sha256
+sha256  066d360df173c024264c957546b8265ac14e44ef8007a181e1d723399f7c1257  qt3d-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.8/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.8/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.8/0002-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.8/0002-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.7/0003-double-conversion-enable-for-nios2.patch b/package/qt5/qt5base/5.12.8/0003-double-conversion-enable-for-nios2.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.7/0003-double-conversion-enable-for-nios2.patch
rename to package/qt5/qt5base/5.12.8/0003-double-conversion-enable-for-nios2.patch
diff --git a/package/qt5/qt5base/5.12.7/qt5base.hash b/package/qt5/qt5base/5.12.8/qt5base.hash
similarity index 80%
rename from package/qt5/qt5base/5.12.7/qt5base.hash
rename to package/qt5/qt5base/5.12.8/qt5base.hash
index 0697464cb9..70b90f09f4 100644
--- a/package/qt5/qt5base/5.12.7/qt5base.hash
+++ b/package/qt5/qt5base/5.12.8/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtbase-everywhere-src-5.12.7.tar.xz.sha256
-sha256 b18939cb25d90aef8721fb12ec34c3632d3490ced958e41f6c7a52064643665d qtbase-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtbase-everywhere-src-5.12.8.tar.xz.sha256
+sha256  19592fbd0a524a17c35e413988fe494251103619ef7dd49aecdf3170973aabd8  qtbase-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 2c7046a87e..19f9b8450c 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcanvas3d-everywhere-src-5.12.7.tar.xz.sha256
-sha256 b63a513a2ee11548b122e0fd640b1fa22d3eb83cdc51ddfdf3b97c2ecd0d0c50 qtcanvas3d-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtcanvas3d-everywhere-src-5.12.8.tar.xz.sha256
+sha256  a30deda1021266b3be4d016474fbf4df6b40356ff870c026320204f2364d12cc  qtcanvas3d-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index fb077b95af..0010d1b9f7 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcharts-everywhere-src-5.12.7.tar.xz.sha256
-sha256 434065526d0b1d8921e96cc1827b1a3579e073b930fe536455c4c1da2f15cf5f qtcharts-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtcharts-everywhere-src-5.12.8.tar.xz.sha256
+sha256  ded463b3f99bf5cc5fe39ed2d70183948c6e955430ce0b21eb235b5c13bc9d16  qtcharts-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.8/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.8/qt5connectivity.hash
index 9af3a57c12..9a00e5605b 100644
--- a/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.8/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtconnectivity-everywhere-src-5.12.7.tar.xz.sha256
-sha256 647148b9b1a0d3e54f788b66797b81bb87434faf6fb12ac481f9165eda0d071a qtconnectivity-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtconnectivity-everywhere-src-5.12.8.tar.xz.sha256
+sha256  dd4d7b291e5ad88d9e9c34e9c5419923498f5264bd3deb9a5da556943f2931e3  qtconnectivity-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.8/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.8/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 71e9cb2118..2d4f8ebc28 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtdeclarative-everywhere-src-5.12.7.tar.xz.sha256
-sha256 5cdc05a035f240ab73b6b37dd3831c1350cd80e5799da47929974085f6eae9bd qtdeclarative-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtdeclarative-everywhere-src-5.12.8.tar.xz.sha256
+sha256  7e1059be9f3faab6fd3d40b58666798963bb9d9c5442d5d16e6870c51327160b  qtdeclarative-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 8e327de296..23a28c434f 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtgraphicaleffects-everywhere-src-5.12.7.tar.xz.sha256
-sha256 02f0328420c623da8f9ae949fec01e99ba84213dd2ad559cb00c204502bbcace qtgraphicaleffects-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtgraphicaleffects-everywhere-src-5.12.8.tar.xz.sha256
+sha256  660acc87a084d2e404c2c5ddc0317f0d8a7b5292c889c9f37134e32ed7a33954  qtgraphicaleffects-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index de977f15ba..238afd4672 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtimageformats-everywhere-src-5.12.7.tar.xz.sha256
-sha256 9bd19ee24fb85f249d01c78e637c95377dd738feb61da0deeee6b770fa62f70b qtimageformats-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtimageformats-everywhere-src-5.12.8.tar.xz.sha256
+sha256  e176463c49762152131c93d6b02f1b1ff72fcd0aae3092c9fa05e57464d043b0  qtimageformats-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 80bcfaf0ab..727570a29b 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtlocation-everywhere-src-5.12.7.tar.xz.sha256
-sha256 d1e905b80befda3c9aaad92ea984e6dbf722568b5c91e8d15b027bc5bc22781f qtlocation-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtlocation-everywhere-src-5.12.8.tar.xz.sha256
+sha256  ffe3c5183744743b476230b644c71a931e5822c5107b02607000e0e1f1a34b0a  qtlocation-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 016ec44cee..aab49b6f04 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtmultimedia-everywhere-src-5.12.7.tar.xz.sha256
-sha256 28bdaa81371f922223775ae5171c4d589a2c07f255abbe5ccf130ecbbdb4db1d qtmultimedia-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtmultimedia-everywhere-src-5.12.8.tar.xz.sha256
+sha256  26fc117f6ad012ac140353ade4371c234d6d73492f834f93b0b200b8b5552fe2  qtmultimedia-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 9ae6ac76d7..e8ef55145d 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols-everywhere-src-5.12.7.tar.xz.sha256
-sha256 1038bbc76bba53f9634f40cd9c8ebf0ed8ae82e791f727b228bd81bdcf1859e5 qtquickcontrols-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtquickcontrols-everywhere-src-5.12.8.tar.xz.sha256
+sha256  5d93b4107d4b14115a4d1692b533790b43d15cdf81325036ca15044592c81d38  qtquickcontrols-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.8/qt5quickcontrols2.hash
similarity index 65%
rename from package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.8/qt5quickcontrols2.hash
index 689a7e5284..9241a366f7 100644
--- a/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.8/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols2-everywhere-src-5.12.7.tar.xz.sha256
-sha256 3a9526e5ad01edbfb796a6631983c391ea1b7e22ae6e07840048156a9e92a237 qtquickcontrols2-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtquickcontrols2-everywhere-src-5.12.8.tar.xz.sha256
+sha256  a0c5646b27290cfdea6f26c58b9ddd6f177b39ac2e6d27cd7e19d8b560dc4920  qtquickcontrols2-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index bddcceb813..88656c26d2 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscript-everywhere-src-5.12.7.tar.xz.sha256
-sha256 ca1dbc66d4125a678638dd0c9c030b72fdfc4ec2c229b9316a8bc80a86104019 qtscript-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtscript-everywhere-src-5.12.8.tar.xz.sha256
+sha256  c8c13582bab8562792fab29f574768ef9fb2cdd232c102228cc511dbfc4b1097  qtscript-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 83ba0da838..eb177f7cd2 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscxml-everywhere-src-5.12.7.tar.xz.sha256
-sha256 afa950bc95f881c90eea564511f3e9918d53fddf0823afb641d20dc6f794fbb6 qtscxml-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtscxml-everywhere-src-5.12.8.tar.xz.sha256
+sha256  c07020b510b20c0424a5bc58bd83337bd1c44d5fd996aa8179ad1113eb015ad2  qtscxml-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 1e298d1674..a2fe83cb74 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsensors-everywhere-src-5.12.7.tar.xz.sha256
-sha256 2b9aea9f4e2f681b4067f2b9d97c5073c135e41d26601c71f18f199bc980e740 qtsensors-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsensors-everywhere-src-5.12.8.tar.xz.sha256
+sha256  48f3c25e32a6b19a203188d7e52ad257b3ac23781ee80bea933d721e270d297a  qtsensors-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.8/qt5serialbus.hash
similarity index 70%
rename from package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.8/qt5serialbus.hash
index fa3ccc1475..2f6b5c45cf 100644
--- a/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.8/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialbus-everywhere-src-5.12.7.tar.xz.sha256
-sha256 82201edf971e957d849b041ab2914f7497226939c62884ec2906b37576987eae qtserialbus-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtserialbus-everywhere-src-5.12.8.tar.xz.sha256
+sha256  77d09c99c6a15f3de442fc734d5af7452af273f5c002fc79fdaf527071abcc9c  qtserialbus-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash b/package/qt5/qt5serialport/5.12.8/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.7/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.8/qt5serialport.hash
index 43136542d8..00d599d46c 100644
--- a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.8/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.sha256
-sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtserialport-everywhere-src-5.12.8.tar.xz.sha256
+sha256  66d989498a84313ce843095082396f279ee43e7828aef967b1b447fce68056ea  qtserialport-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 5a34479534..a3af0a4646 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsvg-everywhere-src-5.12.7.tar.xz.sha256
-sha256 4bf60916d4e398d9609f1b3a17fc7345a0e13c7c1cc407298df20da4c7c67bb8 qtsvg-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsvg-everywhere-src-5.12.8.tar.xz.sha256
+sha256  af2aad75a48c2e4ad70aa298decceb5afc41d499aec119ad72635363a2dfbb5d  qtsvg-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 5fb75d9fa9..12531a6372 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qttools-everywhere-src-5.12.7.tar.xz.sha256
-sha256 860a97114d518f83c0a9ab3742071da16bb018e6eb387179d5764a8dcca03948 qttools-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qttools-everywhere-src-5.12.8.tar.xz.sha256
+sha256  21347e8e2422689d63a08195e27c637983c0d4261d5205ce6b493a2adfe826b4  qttools-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.8/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.8/qt5virtualkeyboard.hash
index 668f971bea..2a502b499b 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.8/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz.sha256
-sha256 aaa52aaff923df22de8472d71843dadb80f3f6fe0312122e64ffe5436db40daa qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtvirtualkeyboard-everywhere-src-5.12.8.tar.xz.sha256
+sha256  06c08200007f58cdcc0ceddd161e5d92a6f3e326d5e7c122dcc9ef9fed853c88  qtvirtualkeyboard-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 43ca77a393..0eadb6d309 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwayland-everywhere-src-5.12.7.tar.xz.sha256
-sha256 fc1ab8e25461580e37090e4f82422411dee71a3de48a54be1f4b6569e00f66c5 qtwayland-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwayland-everywhere-src-5.12.8.tar.xz.sha256
+sha256  16dddccf0618be00f8396e6b5257e62a57022819d2db581b975258c716b9824a  qtwayland-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index c863a6ea60..1ea8d273e9 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebchannel-everywhere-src-5.12.7.tar.xz.sha256
-sha256 b0ae72e5957aa4b281a37d2e169fcf91f92382bc36bd0cf09c80b2bb961bce75 qtwebchannel-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebchannel-everywhere-src-5.12.8.tar.xz.sha256
+sha256  8c45904dd03842c509f689d4227b025b7598b6dedd6905c01f7e562f2b18fbe9  qtwebchannel-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.7/0001-pkg_config-Fixes-when-use_sysroot-false.patch b/package/qt5/qt5webengine/5.12.8/0001-pkg_config-Fixes-when-use_sysroot-false.patch
similarity index 100%
rename from package/qt5/qt5webengine/5.12.7/0001-pkg_config-Fixes-when-use_sysroot-false.patch
rename to package/qt5/qt5webengine/5.12.8/0001-pkg_config-Fixes-when-use_sysroot-false.patch
diff --git a/package/qt5/qt5webengine/5.12.7/qt5webengine.hash b/package/qt5/qt5webengine/5.12.8/qt5webengine.hash
similarity index 99%
rename from package/qt5/qt5webengine/5.12.7/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.8/qt5webengine.hash
index 8308ef4920..03d70d207f 100644
--- a/package/qt5/qt5webengine/5.12.7/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.8/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebengine-everywhere-src-5.12.7.tar.xz.sha256
-sha256 83b754dca3dafeb21be6c7cb5ea99f11f5dbe9055bc1680f5bd7159224bb46fa qtwebengine-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebengine-everywhere-src-5.12.8.tar.xz.sha256
+sha256  cc7d1467055ca0c6b39a7d3d8f18d7f963070b456ff644bbf2ded555b8e45e94  qtwebengine-everywhere-src-5.12.8.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3bb6297f3e..5373c2af7b 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebsockets-everywhere-src-5.12.7.tar.xz.sha256
-sha256 6fd13c2558f532a32f20d977b44c0146107a0e93861df84978e4fd72af283b17 qtwebsockets-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebsockets-everywhere-src-5.12.8.tar.xz.sha256
+sha256  aa4fe8ac7cffb86745aa4441c4dcaa8965b77a629755b430dac5a98d04be8465  qtwebsockets-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index d9d340479b..1a8adfb4b4 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
 sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebview-everywhere-src-5.12.7.tar.xz.sha256
-sha256 d3f82d2ceab59dc4dee3b6f54f4b70869c199d63f4534b299d900cdacc9b7be7 qtwebview-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebview-everywhere-src-5.12.8.tar.xz.sha256
+sha256  f6492f01c3c0b2b44ffdd9e7d55d11d39e960ea0080cd29555d0a1be43366de4  qtwebview-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.8/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.8/qt5x11extras.hash
index 06cdb9c87b..bdfec234b9 100644
--- a/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.8/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtx11extras-everywhere-src-5.12.7.tar.xz.sha256
-sha256 23895f4b1e84f3783526b9e17680df38c587601d4dfa6ff1b81ace432c480b96 qtx11extras-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtx11extras-everywhere-src-5.12.8.tar.xz.sha256
+sha256  e17f41267aaea2bb182f4d7cb4f6a1a3c4865107b0c5dd715b504f4d648a0ab9  qtx11extras-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 0366baa0b9..0a5d4b7998 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtxmlpatterns-everywhere-src-5.12.7.tar.xz.sha256
-sha256 9002014129a1f2a44700df333a7776e23bdfd689e7a619c3540fd9f6819b417b qtxmlpatterns-everywhere-src-5.12.7.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtxmlpatterns-everywhere-src-5.12.8.tar.xz.sha256
+sha256  10bee783e4a9fcee312cd03c7d288e5811dd9d0fe9aec828baabcd05dd47144e  qtxmlpatterns-everywhere-src-5.12.8.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.26.0
