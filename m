From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:00:00 +0200
Subject: [Buildroot] [git commit] qt5: bump latest version to 5.11.2
Message-ID: <20180930181808.9B5FA8A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63aadf100932408bce070bec3124ad5bffd0f3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- qt5canvas3d: update license info
- qt5serialbus: update license hash (LICENSE.FDL editorial change, see [1])
- qt5serialport: update license hash (LICENSE.FDL editorial change, see [2])

[1] https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=226bd2f84c807b5401a82832dafa48d34966052a
[2] https://code.qt.io/cgit/qt/qtserialport.git/commit/?id=e0bd3949c30ce9c1988a6d6a3c0850d16a1fb33a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                                | 2 +-
 package/qt5/qt53d/qt53d.hash                                      | 4 ++--
 .../0001-qtbase-Fix-build-error-when-using-EGL.patch              | 0
 .../0002-double-conversion-enable-for-aarch64_be.patch            | 0
 .../0003-double-conversion-enable-for-or1k.patch                  | 0
 .../0004-double-conversion-enable-for-microblaze.patch            | 0
 package/qt5/qt5base/qt5base.hash                                  | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.hash                          | 8 ++++++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                            | 5 +++++
 package/qt5/qt5charts/qt5charts.hash                              | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.hash                  | 4 ++--
 package/qt5/qt5declarative/qt5declarative.hash                    | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash          | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash                  | 4 ++--
 .../0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch       | 0
 package/qt5/qt5location/qt5location.hash                          | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash                      | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash                | 4 ++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash              | 4 ++--
 package/qt5/qt5script/qt5script.hash                              | 4 ++--
 package/qt5/qt5scxml/qt5scxml.hash                                | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                            | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.hash                        | 6 +++---
 package/qt5/qt5serialport/qt5serialport.hash                      | 6 +++---
 package/qt5/qt5svg/qt5svg.hash                                    | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                                | 4 ++--
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash            | 4 ++--
 package/qt5/qt5wayland/qt5wayland.hash                            | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash                      | 4 ++--
 package/qt5/qt5webengine/qt5webengine.hash                        | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash                      | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.hash                        | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash                    | 4 ++--
 33 files changed, 64 insertions(+), 55 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e323a27f09..5b7a6d6973 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.11
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 86cc84f4ce..789ea29d9d 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qt3d-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 cb8659e1e5541bea4c3684ac76a496f8e0cd6e3aa9e4e22eba1910095f5ed30d  qt3d-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qt3d-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 7f72c823ec10a2effba95d08d9439215472d2cb1e3229de50a6b3d2523c8f962 qt3d-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.11.1/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.11.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.1/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.11.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.2/0002-double-conversion-enable-for-aarch64_be.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch
rename to package/qt5/qt5base/5.11.2/0002-double-conversion-enable-for-aarch64_be.patch
diff --git a/package/qt5/qt5base/5.11.1/0003-double-conversion-enable-for-or1k.patch b/package/qt5/qt5base/5.11.2/0003-double-conversion-enable-for-or1k.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.1/0003-double-conversion-enable-for-or1k.patch
rename to package/qt5/qt5base/5.11.2/0003-double-conversion-enable-for-or1k.patch
diff --git a/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.11.2/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.11.2/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 80397e23cc..daac4e06a3 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtbase-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 a0d047b2da5782c8332c59ae203984b64e4d5dc5f4ba9c0884fdbe753d0afb46  qtbase-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 2f40e81a5c..1fe8ecab17 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,10 +1,14 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtcanvas3d-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 0fb51102bdd595673e2cc4f4878b8fb8b7da4c8b1f026885a75912e2421d2ede  qtcanvas3d-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtcanvas3d-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 fd9ca31268e81d4864da961de7635ef7316a815b8fc77910e512647eb4ceea40 qtcanvas3d-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 3cdf59a157..ef5b373d02 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -10,8 +10,13 @@ QT5CANVAS3D_SOURCE = qtcanvas3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CANVAS3D_VERSI
 QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5CANVAS3D_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
+QT5CANVAS3D_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
+else
 QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
+endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 705384d6c3..fa4e615cfd 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtcharts-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 62f65f08b08c1fdce4f358103be1f7d7aba54d21774e1a9bfff91314ad667a2b  qtcharts-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtcharts-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 f6a312c596bfffa5074a3a5606dff1ef197dac075b3c1bd6443e3a6db1c3a114 qtcharts-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index be9d3ab1b6..96f22db60a 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtconnectivity-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 738ed4eb058334fe7cfd6d68f2e2e7c9b2a97f3477b36ae26ed82703dcaae657  qtconnectivity-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtconnectivity-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 58901bbd14d3bc472f27fe305fd8dc33cffbd10da83616e9691c04c3290d42c5 qtconnectivity-everywhere-src-5.11.2.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 830f95478f..e1af61fbe7 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtdeclarative-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 9ecf5ef6bf618fcb6719a4b22e3d9f9ce7623c2344667038171d5662624c4f3a  qtdeclarative-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtdeclarative-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 220d86f8031e9d45f3c369c3fd517aaa4c5783ad62c843a21fa7cc3c0a36f2cd qtdeclarative-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index e153a1dccc..f871e0b779 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtgraphicaleffects-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 d9d27236696221098e832d6fee8c0fbb2834b1670d9ca1e5bf3d0fbc8e5448f3  qtgraphicaleffects-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtgraphicaleffects-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 a9dcaaa3932f7b71717a393700e1387bcd6f9c03538d0ffca2a64128a0e4a9fd qtgraphicaleffects-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 49c1590823..b4684bb764 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtimageformats-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 eb50deeccce12ede0a5faeb3e411f34920ba43092c65f063ab23d37970f65616  qtimageformats-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtimageformats-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 27e5d10551d0b5bf4799d09e5412ea2e6898b09aa1521ea24bce660ee6183a68 qtimageformats-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/5.11.1/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch b/package/qt5/qt5location/5.11.2/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
similarity index 100%
rename from package/qt5/qt5location/5.11.1/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
rename to package/qt5/qt5location/5.11.2/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 14e548ed35..7c7f007bc3 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtlocation-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 172c9a39e8267739e20d60bda45de3db02b13163245776bdc696d8c5ab5f790f  qtlocation-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtlocation-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 d698911edfb2d45b7adca6557b3de880e966cb8823a8adf1beb3a3079560024e qtlocation-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index cbdd5096da..dfc4d60701 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtmultimedia-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 f28bb57890b4666a9aafaa116a30c51dedb0f23b60a510280a27eb032b58c90c  qtmultimedia-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtmultimedia-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 25608f3d08636026387394956fe72cedcb78eb786fb32fd87deb41d574cf726d qtmultimedia-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 8fb7609769..a4fc20ebcf 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtquickcontrols-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 baea7f59513ffade3f8041c1756722334b7d04245667fa8faaeace07a430c656  qtquickcontrols-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 9c772e30fb1ba107168498328585063f4303c6562baf4a5cfedd0c5250b621e0 qtquickcontrols-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index bdd3088561..1ebed34166 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtquickcontrols2-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 bdb066fa0d51ad36a2c756d4cba63892587638e5df9b9b6ee63b963ff39ec442  qtquickcontrols2-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 27d205c82e..0efc40bb42 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtscript-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 1c430fd06e8eb25dbca43422453a16588d1aade936770df2e4b4e8961659da7c  qtscript-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtscript-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 b2c2466a83653a9473ea4810462d8a88e0fb1fb691f85d1c6e60d8bc4283f976 qtscript-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 7c153f0507..ecaf50745b 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtscxml-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 f0463f02c0bb81d214b04ec82ff0d22744cdae1966cd8dfb53cd2b31ad233338  qtscxml-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtscxml-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 d625cb2149f5bfef5747b1d40b22327fd36132307c8b76d358f235d5422ff7a4 qtscxml-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 6917b8f593..4795356e68 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtsensors-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 cbe90f58b73c344d67098eaa333f2d2562fa7a9f1794448e7543ff696831c0fa  qtsensors-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtsensors-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 0e27c38824f7a1deb506f6195156eed79b80aa7034356272c3be0611667d63c7 qtsensors-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 202e045123..03feb29993 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,11 +1,11 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtserialbus-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 d3bbee3c579a6d7a06956d653bcdfc2e2cd054d639dcaff08f45efb94d6b554a  qtserialbus-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialbus-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 1774c2c162f85f7cbcb2bdd2ef47507b110a01bc261627b46aa718e87079641e qtserialbus-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 965124f949..fd5c6642c2 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtserialport-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 56a7993821d556d84494c6dfc22759eb6f2a979e21685403a2b9da75f0ba64a3  qtserialport-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialport-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 b01b69ce421d449402363c0cf617fcc8856e39d6d2c28aa3d06d1f5359dc6f6e qtserialport-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
@@ -12,6 +12,6 @@ sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08 LICENSE.FDL
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
 sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
 sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2 LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 9c9f53fcba..fa4d6f4454 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtsvg-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 1d6aff3e3304ceec670c0f19029771ff21279553d561158063436b26c18b3037  qtsvg-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtsvg-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 bc16bbf855b466e77dda996d8c91fa73db7fe14d3aa98ce6d92145ca1a1bd166 qtsvg-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 015735215f..7c78866c8e 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qttools-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 b7fb186f92aedb922c4e7f57ff276bbf90caf0087a2a980f704bad9ac44514fe  qttools-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qttools-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 f0e8332c771958b4aa373ac643d35e2fabb1a2dcdbaca756ebf3d1ace7c631b8 qttools-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 9270366b93..d4b7e58e38 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
 sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtvirtualkeyboard-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 5b330dcc770976a2cfb8d85711d72a57c9764c1a9efb889c91e81f6071bbbf9b  qtvirtualkeyboard-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 947778345e..01305c950e 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtwayland-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 e09abc202082f719b868f595a46e0df5c903fac53cc40a7188b223a2bea644ea  qtwayland-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwayland-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 4e35e15da360480a5aef414246f70d29b0252b6a9c7e129e63afba3fb2ecb771 qtwayland-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 31afb7790b..1ed2bddb6f 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtwebchannel-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 b9a476af15ae0c68a930f0b0aa8d988b8dc3e63c3d2134abebbf2148d6942e87  qtwebchannel-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebchannel-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 945fdae8f1ea8dfc8e47a6d8421cef00690d6d4bfe26ce61bb59c0d0326c02fc qtwebchannel-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index ad34e0d8b4..e8e57d5d91 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtwebengine-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 389d9f42ca393ac11ec8932ce9771766dec91a4c761ffb685cc429c2a760d48c  qtwebengine-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebengine-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 3ff9bba5f631cfdd454ce298489360b3e2d9a2de4eb82bb121d838ef65f9b772 qtwebengine-everywhere-src-5.11.2.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 2c977b003d..1b340b989e 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtwebsockets-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 7aaa12f719e853a195a670ff51697b73914e37c94ed2216d53a2d9e0861748ae  qtwebsockets-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebsockets-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 ae6197619ce0c4104bdc43e097d79082f90ba6567fa286eae6306ce7aec88b8d qtwebsockets-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 8beabd2934..da7057c5af 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtx11extras-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 bcf219c8befb9777f891ed7844799f26aecb6d4d92064274277822f261bd8c65  qtx11extras-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtx11extras-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 f407ca61052d44bfb06e831fc6db7595bb2b64882b1f0af23f5db2d1ee519089 qtx11extras-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 67e90059d9..61788dd3be 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtxmlpatterns-everywhere-src-5.11.1.tar.xz.mirrorlist
-sha256 6117e120c87b32dd07877dd0a6bf862b6285cb0d8b547190882980682f53af58  qtxmlpatterns-everywhere-src-5.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtxmlpatterns-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 5fd5f680ba40dadf81665417501e1f3778982aea0e268bf4f75a420d54a86746 qtxmlpatterns-everywhere-src-5.11.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
