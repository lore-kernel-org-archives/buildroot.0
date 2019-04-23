From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Apr 2019 21:56:55 +0200
Subject: [Buildroot] [RFC v1] qt5: bump latest version to 5.12.3
Message-ID: <20190423195655.11991-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - not (yet) complete compile-/runtime tested
---
 package/qt5/qt5.mk                                            | 2 +-
 package/qt5/qt53d/qt53d.hash                                  | 4 ++--
 .../0001-qtbase-Fix-build-error-when-using-EGL.patch          | 0
 .../0004-double-conversion-enable-for-microblaze.patch        | 0
 package/qt5/qt5base/{5.12.2 => 5.12.3}/qt5base.hash           | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.hash                      | 4 ++--
 package/qt5/qt5charts/qt5charts.hash                          | 4 ++--
 .../qt5connectivity/{5.12.2 => 5.12.3}/qt5connectivity.hash   | 4 ++--
 .../0001-qsgtexture-fix-debug-build-with-uclibc.patch         | 0
 package/qt5/qt5declarative/qt5declarative.hash                | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash      | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash              | 4 ++--
 package/qt5/qt5location/qt5location.hash                      | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash                  | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash            | 4 ++--
 .../{5.12.2 => 5.12.3}/qt5quickcontrols2.hash                 | 4 ++--
 package/qt5/qt5script/qt5script.hash                          | 4 ++--
 package/qt5/qt5scxml/qt5scxml.hash                            | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                        | 4 ++--
 package/qt5/qt5serialbus/{5.12.2 => 5.12.3}/qt5serialbus.hash | 4 ++--
 .../qt5/qt5serialport/{5.12.2 => 5.12.3}/qt5serialport.hash   | 4 ++--
 package/qt5/qt5svg/qt5svg.hash                                | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                            | 4 ++--
 .../{5.12.2 => 5.12.3}/qt5virtualkeyboard.hash                | 4 ++--
 package/qt5/qt5wayland/qt5wayland.hash                        | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash                  | 4 ++--
 package/qt5/qt5webengine/{5.12.2 => 5.12.3}/qt5webengine.hash | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash                  | 4 ++--
 package/qt5/qt5x11extras/{5.12.2 => 5.12.3}/qt5x11extras.hash | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash                | 4 ++--
 30 files changed, 53 insertions(+), 53 deletions(-)
 rename package/qt5/qt5base/{5.12.2 => 5.12.3}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.2 => 5.12.3}/0004-double-conversion-enable-for-microblaze.patch (100%)
 rename package/qt5/qt5base/{5.12.2 => 5.12.3}/qt5base.hash (81%)
 rename package/qt5/qt5connectivity/{5.12.2 => 5.12.3}/qt5connectivity.hash (74%)
 rename package/qt5/qt5declarative/{5.12.2 => 5.12.3}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 rename package/qt5/qt5quickcontrols2/{5.12.2 => 5.12.3}/qt5quickcontrols2.hash (66%)
 rename package/qt5/qt5serialbus/{5.12.2 => 5.12.3}/qt5serialbus.hash (71%)
 rename package/qt5/qt5serialport/{5.12.2 => 5.12.3}/qt5serialport.hash (74%)
 rename package/qt5/qt5virtualkeyboard/{5.12.2 => 5.12.3}/qt5virtualkeyboard.hash (78%)
 rename package/qt5/qt5webengine/{5.12.2 => 5.12.3}/qt5webengine.hash (99%)
 rename package/qt5/qt5x11extras/{5.12.2 => 5.12.3}/qt5x11extras.hash (74%)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 4e738c75db..43846d706f 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@

 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 5c0eac7c34..3687a83188 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qt3d-everywhere-src-5.12.2.tar.xz.sha256
-sha256 d4036e7ac146ba78784dde0dd99e8182372b7c38e832e33b61fed4187de0ad06 qt3d-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qt3d-everywhere-src-5.12.3.tar.xz.sha256
+sha256 8997f07c816bbc6dd43fc2171801178bc65e704d35039998530cfa49837eaa7d qt3d-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.3/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.3/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.2/qt5base.hash b/package/qt5/qt5base/5.12.3/qt5base.hash
similarity index 81%
rename from package/qt5/qt5base/5.12.2/qt5base.hash
rename to package/qt5/qt5base/5.12.3/qt5base.hash
index c6758471f6..9d805c84e6 100644
--- a/package/qt5/qt5base/5.12.2/qt5base.hash
+++ b/package/qt5/qt5base/5.12.3/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtbase-everywhere-src-5.12.2.tar.xz.sha256
-sha256 562c095a59c95f393762ec53bc05c0d80fad1758fd5ff7a5231967d1a98d56c1 qtbase-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtbase-everywhere-src-5.12.3.tar.xz.sha256
+sha256 fddfd8852ef7503febeed67b876d1425160869ae2b1ae8e10b3fb0fedc5fe701 qtbase-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index fc36119164..dbd9461889 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcanvas3d-everywhere-src-5.12.2.tar.xz.sha256
-sha256 5e74b083294956505945621f6f56a3d7a314502277a109d6fb6b25c74dea2dca qtcanvas3d-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtcanvas3d-everywhere-src-5.12.3.tar.xz.sha256
+sha256 c0821f1232c6bcd00648af9a5d1eade8e0397c6bfff60621e0fcdfc75561baea qtcanvas3d-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 5ec0c07790..af127b5c6d 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcharts-everywhere-src-5.12.2.tar.xz.sha256
-sha256 11d88d3e0ec86730219f7c2efa17f696ec8766415c488b208bfcb8f3c3a68a31 qtcharts-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtcharts-everywhere-src-5.12.3.tar.xz.sha256
+sha256 820c94b2bf5d73e921fe99be1e3a03a6f012d96574a08e504d68db237522b3a9 qtcharts-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.3/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.3/qt5connectivity.hash
index 180d18f016..5ed548cada 100644
--- a/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.3/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtconnectivity-everywhere-src-5.12.2.tar.xz.sha256
-sha256 15eb21a1c102408e43c7204a82ad144e97ebe05dc4a15edb0900cd49762a226e qtconnectivity-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtconnectivity-everywhere-src-5.12.3.tar.xz.sha256
+sha256 01518cee71a8d53b9c2387f8c7facbcc2c4d63ab3b79462edfa06ba3bfeae661 qtconnectivity-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 422b45249f..6dc84fb07c 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtdeclarative-everywhere-src-5.12.2.tar.xz.sha256
-sha256 470568745602e7fa21cdca42b1641162e4257cfeb7a2dcf8af24538c9516cc5b qtdeclarative-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtdeclarative-everywhere-src-5.12.3.tar.xz.sha256
+sha256 839881cd6996e35c351bc7d560372ebb91e61f3688957c33248c4f31ea007fa7 qtdeclarative-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index b46c68542c..8893b15830 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtgraphicaleffects-everywhere-src-5.12.2.tar.xz.sha256
-sha256 429398b6c661897b3c7cd62fb3657a2de60ad9152578edeeca0abde6e7ae5a86 qtgraphicaleffects-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtgraphicaleffects-everywhere-src-5.12.3.tar.xz.sha256
+sha256 772c98a009cc82ac290f868906c5aa719e4608ef3c5905d69ef7402b15924a73 qtgraphicaleffects-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index da656554cb..02bbecf398 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtimageformats-everywhere-src-5.12.2.tar.xz.sha256
-sha256 1ea757728f205deb6b3f5873f5c7c3129cded5993077500a9fb249559bee7a9c qtimageformats-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtimageformats-everywhere-src-5.12.3.tar.xz.sha256
+sha256 db5a9e784f9c327c1e6830b1550311024cc91202d3b8dde82cd0944164298be2 qtimageformats-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 2a52e1f116..7346b22f66 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtlocation-everywhere-src-5.12.2.tar.xz.sha256
-sha256 a31f27f457ac57e7203ae808b95ba0053d182e22425de03840af761e343d8bef qtlocation-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtlocation-everywhere-src-5.12.3.tar.xz.sha256
+sha256 52d589be2852ada0c000b06cc411b61e521cd0797470be567fd1625bcc9d75c6 qtlocation-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 8c150cce40..7601d8e704 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtmultimedia-everywhere-src-5.12.2.tar.xz.sha256
-sha256 5d3c90c546e64abf523432a3df5e7a3f1b5ad72e7d0b5ea6260729fbefeb30f5 qtmultimedia-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtmultimedia-everywhere-src-5.12.3.tar.xz.sha256
+sha256 a30beeb37fb284d93522e29c01fb8d12726f40e9248e80b70b1f8ab60197a301 qtmultimedia-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index c7944c89ba..c5f71574f3 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols-everywhere-src-5.12.2.tar.xz.sha256
-sha256 9b5c87605d08849927dd09bf9b03a939511461372b7e20004abe1116cf9fc73e qtquickcontrols-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtquickcontrols-everywhere-src-5.12.3.tar.xz.sha256
+sha256 68ae03b35eaa44a24c3f663b842252053c9f2b00b18841fd39ff7d2150986f46 qtquickcontrols-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.3/qt5quickcontrols2.hash
similarity index 66%
rename from package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.3/qt5quickcontrols2.hash
index 25ae01a67d..5d67bfad4d 100644
--- a/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.3/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols2-everywhere-src-5.12.2.tar.xz.sha256
-sha256 1fbd703612a2c0257861e07a2b709f6fbad00cb6df70a1c2c1fafa9de522e549 qtquickcontrols2-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtquickcontrols2-everywhere-src-5.12.3.tar.xz.sha256
+sha256 e855e8369c3cb5a2ebcd2028a2a195ba73945fd9d5bc26134706c2fa14e99b3a qtquickcontrols2-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 4683dce90b..d8db46b7a0 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscript-everywhere-src-5.12.2.tar.xz.sha256
-sha256 f8717d51072b4d4455755ae081e45f23f3d0ce25602f96231dd7703bd818a2e6 qtscript-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtscript-everywhere-src-5.12.3.tar.xz.sha256
+sha256 0f37bf032a2370bd08667aad053f5a57717ea49596c16bf6cfb32b0d6e5c1f9e qtscript-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 437d18891b..23add0b7da 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscxml-everywhere-src-5.12.2.tar.xz.sha256
-sha256 69592542fdf4b2efe6a6378ecb1bfdda9e7f48007e191d7f77a0009e213a8623 qtscxml-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtscxml-everywhere-src-5.12.3.tar.xz.sha256
+sha256 70c4b1f8e23560cf54e69aeb3ded4078434e6f78e1b9573fbad1ddace5fc4b19 qtscxml-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:

diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index f297d2aa2a..4bcf5d7c85 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsensors-everywhere-src-5.12.2.tar.xz.sha256
-sha256 758a131ad86c4b8b8364e48d659a680ed12d03c091c5ab2958d06b7b0aa2e50c qtsensors-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtsensors-everywhere-src-5.12.3.tar.xz.sha256
+sha256 7f63fedf60fdf110a3fc529568c7226d7acd59cc5eaee908f4d5a969e34005fc qtsensors-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.3/qt5serialbus.hash
similarity index 71%
rename from package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.3/qt5serialbus.hash
index 098f05f2bb..0f3960f546 100644
--- a/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.3/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialbus-everywhere-src-5.12.2.tar.xz.sha256
-sha256 16bfee0be81805d82d4f9c04425b5bc2678ca01fa1617fc72613a893438aaa48 qtserialbus-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtserialbus-everywhere-src-5.12.3.tar.xz.sha256
+sha256 792cd2d411d2ebd737f5d09580f8db479cd35f2f7e7cedb4412075ef20fcfe4d qtserialbus-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.2/qt5serialport.hash b/package/qt5/qt5serialport/5.12.3/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.2/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.3/qt5serialport.hash
index 66ddf16f35..f6f78339bd 100644
--- a/package/qt5/qt5serialport/5.12.2/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.3/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialport-everywhere-src-5.12.2.tar.xz.mirrorlist
-sha256 72163cedda4c6fa787db8666bec6b5057272dc87bf8de6addba3440dd472bd7f qtserialport-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtserialport-everywhere-src-5.12.3.tar.xz.mirrorlist
+sha256 1faf7df4a1f9028bef1ce79330badb4e5cbbba9f717c53cafc5aea41eed1de51 qtserialport-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 4f06a21d86..6ae8aa9812 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsvg-everywhere-src-5.12.2.tar.xz.sha256
-sha256 ed9f2118a6d33f53e5d9ed18dcd36f252a4fbaf68382a1c4a663ba75b25ae7bd qtsvg-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtsvg-everywhere-src-5.12.3.tar.xz.sha256
+sha256 f666438dbf6816b7534e539b95e3fa4405f11d7e2e2bbcde34f2db5ae0f27dc2 qtsvg-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 41c98e733a..a04474807f 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qttools-everywhere-src-5.12.2.tar.xz.sha256
-sha256 4aa3a089794ab1c629b666fffb5da4371351a9e85ea691d5d988c2ff63586005 qttools-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qttools-everywhere-src-5.12.3.tar.xz.sha256
+sha256 c9e92d2f0d369e44bb1a60e9fa6d970f8d9893d653212305e04be5e6daec2cd8 qttools-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.3/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.3/qt5virtualkeyboard.hash
index 245f2b4a70..4aaa2c99e0 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.3/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz.sha256
-sha256 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtvirtualkeyboard-everywhere-src-5.12.3.tar.xz.sha256
+sha256 7b83af4527310de4ab81146622f3a46677daabf05556d0e33a2e25ca2aa13b22 qtvirtualkeyboard-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 2fdcc34382..3e0259e58b 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwayland-everywhere-src-5.12.2.tar.xz.sha256
-sha256 b7840692420d106871433eb1b678277f09927d48ec6eb31a1851ee9c60d9df84 qtwayland-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtwayland-everywhere-src-5.12.3.tar.xz.sha256
+sha256 f0b45ad84180730e2d5a1249eb20c6357869b4b78f45eb266c2f2b17f77d86ff qtwayland-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index e56c7907eb..fb814d5f76 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebchannel-everywhere-src-5.12.2.tar.xz.sha256
-sha256 8eb9cff9492937daa1bf5d001e39afec68c310ce5596807345e2a555dcc80b8e qtwebchannel-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtwebchannel-everywhere-src-5.12.3.tar.xz.sha256
+sha256 72d1620bcc94e14caa91ddf344c84cd1288aa9479e00b1bb3b5e51f92efe088a qtwebchannel-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.2/qt5webengine.hash b/package/qt5/qt5webengine/5.12.3/qt5webengine.hash
similarity index 99%
rename from package/qt5/qt5webengine/5.12.2/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.3/qt5webengine.hash
index 72e3cdbfd2..18fb4323b6 100644
--- a/package/qt5/qt5webengine/5.12.2/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.3/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebengine-everywhere-src-5.12.2.tar.xz.sha256
-sha256 082b1d6e60c1be61881bc8533acc67d9688620d6b3a538417f62b27b34ead493 qtwebengine-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtwebengine-everywhere-src-5.12.3.tar.xz.sha256
+sha256 3ff3bac12d75aa0f3fd993bb7077fe411f7b0e6a3993af6f8b039d48e3dc4317 qtwebengine-everywhere-src-5.12.3.tar.xz

 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3f4f438a4d..2ae9f96a7a 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebsockets-everywhere-src-5.12.2.tar.xz.sha256
-sha256 ab9ce815b1466abe52910c9b50c0f61df8af74f9521574bb534f7f562d0e8c04 qtwebsockets-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtwebsockets-everywhere-src-5.12.3.tar.xz.sha256
+sha256 258883225c5e089015c4036f31019aa8f5bb013ecd8eecd193342e606319a577 qtwebsockets-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.3/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.3/qt5x11extras.hash
index 1ab741d9e8..870e180fd0 100644
--- a/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.3/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtx11extras-everywhere-src-5.12.2.tar.xz.mirrorlist
-sha256 711f39ddc6237787a5522278be235fe3af547a4674bb265e6dff5c2892fe6084 qtx11extras-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtx11extras-everywhere-src-5.12.3.tar.xz.mirrorlist
+sha256 85e3ae5177970c2d8656226d7535d0dff5764c100e55a79a59161d80754ba613 qtx11extras-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 1113860644..e14355e7b0 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtxmlpatterns-everywhere-src-5.12.2.tar.xz.sha256
-sha256 2e535ec17b542f2a0b87a9db93284666015cc07b6188894ace7e75104c6d860d qtxmlpatterns-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtxmlpatterns-everywhere-src-5.12.3.tar.xz.sha256
+sha256 e0b98e7c92cd791a9b354d090788347db78f14c47579384fe22d0b650c1d8a61 qtxmlpatterns-everywhere-src-5.12.3.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
--
2.21.0
