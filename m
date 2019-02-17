From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 15:12:08 +0100
Subject: [Buildroot] [PATCH v3 4/5] package/qt5: bump latest version to
 5.12.1
In-Reply-To: <20190217141209.22182-1-thomas.petazzoni@bootlin.com>
References: <20190217141209.22182-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190217141209.22182-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

qt5base:
  - removed 0002-double-conversion-enable-for-aarch64_be.patch
    (superseded by upstream commits [1] and [2])
  - removed 0003-double-conversion-enable-for-or1k.patch
    (superseded by upstream commits [1] and [2])
  - rebased 0004-double-conversion-enable-for-microblaze.patch

qt5location:

  - removed 0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
    (superseded by upstream commit [3])

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6a39e49a6cdeb28a04a3657bb6a22f848d5dfa9d
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4d40f09a45202dff901d4f970a6a7e939797138b
[3] https://code.qt.io/cgit/qt/qtlocation.git/commit/?id=7bafbdc91f83165710ed74639b76b48b4494937a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas:
 - update chromium-latest.inc with the list of license files that
   match qt5webengine 5.12.1
 - drop patch in qt5location that has been upstreamed and therefore no
   longer applies to 5.12.1]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/Config.in                         |  4 +-
 package/qt5/qt5.mk                            |  4 +-
 package/qt5/qt53d/qt53d.hash                  |  4 +-
 ...ble-conversion-enable-for-aarch64_be.patch | 26 ------
 ...03-double-conversion-enable-for-or1k.patch | 27 -------
 ...tbase-Fix-build-error-when-using-EGL.patch |  0
 ...ble-conversion-enable-for-microblaze.patch | 20 ++---
 .../qt5base/{5.11.3 => 5.12.1}/qt5base.hash   |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |  4 +-
 package/qt5/qt5charts/qt5charts.hash          |  4 +-
 .../{5.11.3 => 5.12.1}/qt5connectivity.hash   |  4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 .../qt5/qt5declarative/qt5declarative.hash    |  4 +-
 .../qt5graphicaleffects.hash                  |  4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |  4 +-
 ...tivegeomap-fix-building-with-GCC-5.x.patch | 48 -----------
 package/qt5/qt5location/qt5location.hash      |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |  4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |  4 +-
 .../{5.11.3 => 5.12.1}/qt5quickcontrols2.hash |  4 +-
 package/qt5/qt5script/qt5script.hash          |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |  4 +-
 .../{5.11.3 => 5.12.1}/qt5serialbus.hash      |  4 +-
 .../{5.11.3 => 5.12.1}/qt5serialport.hash     |  4 +-
 package/qt5/qt5svg/qt5svg.hash                |  4 +-
 package/qt5/qt5tools/qt5tools.hash            |  4 +-
 .../qt5virtualkeyboard.hash                   |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |  4 +-
 package/qt5/qt5webengine/chromium-latest.inc  | 80 +++++++++++--------
 package/qt5/qt5webengine/qt5webengine.hash    |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash  |  4 +-
 .../{5.11.3 => 5.12.1}/qt5x11extras.hash      |  4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  4 +-
 35 files changed, 113 insertions(+), 200 deletions(-)
 delete mode 100644 package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
 delete mode 100644 package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/0004-double-conversion-enable-for-microblaze.patch (60%)
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.11.3 => 5.12.1}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.11.3 => 5.12.1}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 delete mode 100644 package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
 rename package/qt5/qt5quickcontrols2/{5.11.3 => 5.12.1}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.11.3 => 5.12.1}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.11.3 => 5.12.1}/qt5serialport.hash (65%)
 rename package/qt5/qt5virtualkeyboard/{5.11.3 => 5.12.1}/qt5virtualkeyboard.hash (70%)
 rename package/qt5/qt5x11extras/{5.11.3 => 5.12.1}/qt5x11extras.hash (65%)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index a50b57a821..b9598b2be7 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -33,14 +33,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.11)"
+	bool "Latest (5.12)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.11, which is licensed under
+	  This option builds Qt 5.12, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 88ba1958dd..d8012a913d 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.11
-QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_VERSION_MAJOR = 5.12
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 2da5500505..f135173bb7 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qt3d-everywhere-src-5.11.3.tar.xz.sha256
-sha256 04a55c21f365d897ec75042ee83f9ad59a847992c6f55fae0763ad2701d99eab qt3d-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qt3d-everywhere-src-5.12.1.tar.xz.sha256
+sha256 ce51ed3fe403672db2c874cbaa60f3a139ec817abd1270dc5e4255d35fd64bf1 qt3d-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
deleted file mode 100644
index 838f4dd7ad..0000000000
--- a/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e81ba4e0de16ff741417ae7ed7dfe7b5a83d66e2 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 13 Aug 2018 20:15:05 +0200
-Subject: [PATCH] double-conversion: enable for aarch64_be
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../double-conversion/include/double-conversion/utils.h         | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index 20bfd36c84..77baa2861a 100644
---- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
-+++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -65,7 +65,7 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__)
-+    defined(__AARCH64EL__) || defined(__AARCH64EB__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
--- 
-2.18.0
-
diff --git a/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch b/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
deleted file mode 100644
index 53c5a31832..0000000000
--- a/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f9920819e6600a68829fb4600f11b70ebc2a33e7 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 18 Aug 2018 23:44:20 +0200
-Subject: [PATCH] double-conversion: enable for or1k
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../double-conversion/include/double-conversion/utils.h        | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index 77baa2861a..b0a7d5d4f4 100644
---- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
-+++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -65,7 +65,8 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__) || defined(__AARCH64EB__)
-+    defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
-+    defined(__or1k__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
--- 
-2.18.0
-
diff --git a/package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.1/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.1/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.1/0004-double-conversion-enable-for-microblaze.patch
similarity index 60%
rename from package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.1/0004-double-conversion-enable-for-microblaze.patch
index 2d7164b67c..c91d812695 100644
--- a/package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
+++ b/package/qt5/qt5base/5.12.1/0004-double-conversion-enable-for-microblaze.patch
@@ -1,27 +1,29 @@
-From 372d33fbe549ea73318c187505716ac99fbf3054 Mon Sep 17 00:00:00 2001
+From 014958d2d17045dd63d93cb3061d1e40b15725b7 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 21 Aug 2018 21:11:40 +0200
 Subject: [PATCH] double-conversion: enable for microblaze
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.12.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  .../double-conversion/include/double-conversion/utils.h        | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index b0a7d5d4f4..485f680180 100644
+index 7622fe6162..d29de95094 100644
 --- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
 +++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -66,7 +66,8 @@
-     defined(__SH4__) || defined(__alpha__) || \
+@@ -94,7 +94,8 @@ int main(int argc, char** argv) {
      defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || defined(__EMSCRIPTEN__) || \
 -    defined(__or1k__)
-+    defined(__or1k__) || \
++    defined(__or1k__)  || \
 +    defined(__microblaze__)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
 -- 
-2.18.0
+2.19.2
 
diff --git a/package/qt5/qt5base/5.11.3/qt5base.hash b/package/qt5/qt5base/5.12.1/qt5base.hash
similarity index 73%
rename from package/qt5/qt5base/5.11.3/qt5base.hash
rename to package/qt5/qt5base/5.12.1/qt5base.hash
index 964bcf1ab9..29148fa080 100644
--- a/package/qt5/qt5base/5.11.3/qt5base.hash
+++ b/package/qt5/qt5base/5.12.1/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtbase-everywhere-src-5.11.3.tar.xz.sha256
-sha256 c6bf887732b83ce072eb72eddb7497bedcdf9ca794e7ed91261a93f063623e1c qtbase-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtbase-everywhere-src-5.12.1.tar.xz.sha256
+sha256 533078ce02678988576e224cb3844979907950cf83e0fda3364bc1d5701c9049 qtbase-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 4fc7c613b0..fe31ba3867 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcanvas3d-everywhere-src-5.11.3.tar.xz.sha256
-sha256 d5a004848588c1c53ea7ed9d36bb5bfe3a813ffc45290066d2f6cfcace072138 qtcanvas3d-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtcanvas3d-everywhere-src-5.12.1.tar.xz.sha256
+sha256 c7c940a06062b1e5078fd697e1da0cdaeaa315b6fcea81de15308a9d3f8ac254 qtcanvas3d-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 2519b8f13c..02e01cac2a 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcharts-everywhere-src-5.11.3.tar.xz.sha256
-sha256 4798f3ebc4d937d1c190db7ff718ad5affa907caa56b5557e593f6b5a60d95dc qtcharts-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtcharts-everywhere-src-5.12.1.tar.xz.sha256
+sha256 142eb2b87a0bc2220a9f12e56bf390b846968c201d135b1a2a2338545692fdc0 qtcharts-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash
similarity index 65%
rename from package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash
index 54fda648cd..a46de7f3c6 100644
--- a/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtconnectivity-everywhere-src-5.11.3.tar.xz.sha256
-sha256 148cfcbceb3d0a70059f4d92fa069baf56babb627b16a4203b318ca6f0d0b32a qtconnectivity-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtconnectivity-everywhere-src-5.12.1.tar.xz.sha256
+sha256 0edd0bd784a71809540dc23d24a842bd88dee2cdb5394b69c9e704f7e1ac8d6c qtconnectivity-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.1/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.1/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 3ce4e50250..d583ab15d5 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtdeclarative-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8e263621d706f1c4def5d71212a6ae37b0d3c378da89d9e3e5fc0b5557721ae6 qtdeclarative-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtdeclarative-everywhere-src-5.12.1.tar.xz.sha256
+sha256 a384a734d94f28a98aa74e076d50fa6b9724af83526feb6c371945545d8cb409 qtdeclarative-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 36dd345268..e570531629 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtgraphicaleffects-everywhere-src-5.11.3.tar.xz.sha256
-sha256 14d86983fcdd119daefad235ffee7d8ca691e6074ef360cb6347b8aae66f57e2 qtgraphicaleffects-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtgraphicaleffects-everywhere-src-5.12.1.tar.xz.sha256
+sha256 2e63abf6b02b86461b73b317eba00b6721601a9469c22da28e3f4ea1d5df68d7 qtgraphicaleffects-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 1c1f81bbed..3fd6ba46e5 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtimageformats-everywhere-src-5.11.3.tar.xz.sha256
-sha256 04b261bc3d7a277fbe9ac8619ecd037d7089b356eaee41b2d41d7a2ff58b087f qtimageformats-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtimageformats-everywhere-src-5.12.1.tar.xz.sha256
+sha256 0425f35dbcc83cd5840e2d3a73ed4c57c426af9d6ac7b9fe3a40d23560653421 qtimageformats-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch b/package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
deleted file mode 100644
index f893c33d50..0000000000
--- a/package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ad78b1a671edac369ede86bff376ec8af2cafbf2 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Wed, 5 Sep 2018 12:51:41 +0200
-Subject: [PATCH] qdeclarativegeomap: fix building with GCC < 5.x
-
-With GCC < 5.x implicit casts don't work as expected, in particular
-QPointer<QGeoMap> in m_map QDeclarativeGeoMap class when passed to
-connect(m_map, ...) should directly cast to m_map.data().
-
-Workaround this using connect(m_map.data(), ...).
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- src/location/declarativemaps/qdeclarativegeomap.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/location/declarativemaps/qdeclarativegeomap.cpp b/src/location/declarativemaps/qdeclarativegeomap.cpp
-index 09f9d01c..dc5a32ed 100644
---- a/src/location/declarativemaps/qdeclarativegeomap.cpp
-+++ b/src/location/declarativemaps/qdeclarativegeomap.cpp
-@@ -694,11 +694,11 @@ void QDeclarativeGeoMap::mappingManagerInitialized()
-     QImage copyrightImage;
-     if (!m_initialized && width() > 0 && height() > 0) {
-         QMetaObject::Connection copyrightStringCatcherConnection =
--                connect(m_map,
-+                connect(m_map.data(),
-                         QOverload<const QString &>::of(&QGeoMap::copyrightsChanged),
-                         [&copyrightString](const QString &copy){ copyrightString = copy; });
-         QMetaObject::Connection copyrightImageCatcherConnection =
--                connect(m_map,
-+                connect(m_map.data(),
-                         QOverload<const QImage &>::of(&QGeoMap::copyrightsChanged),
-                         [&copyrightImage](const QImage &copy){ copyrightImage = copy; });
-         m_map->setViewportSize(QSize(width(), height()));
-@@ -719,8 +719,8 @@ void QDeclarativeGeoMap::mappingManagerInitialized()
-         emit m_map->copyrightsChanged(copyrightImage);
- 
- 
--    connect(m_map, &QGeoMap::sgNodeChanged, this, &QQuickItem::update);
--    connect(m_map, &QGeoMap::cameraCapabilitiesChanged, this, &QDeclarativeGeoMap::onCameraCapabilitiesChanged);
-+    connect(m_map.data(), &QGeoMap::sgNodeChanged, this, &QQuickItem::update);
-+    connect(m_map.data(), &QGeoMap::cameraCapabilitiesChanged, this, &QDeclarativeGeoMap::onCameraCapabilitiesChanged);
- 
-     // This prefetches a buffer around the map
-     m_map->prefetchData();
--- 
-2.17.1
-
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index be0ac7c31f..e79eb611b4 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtlocation-everywhere-src-5.11.3.tar.xz.sha256
-sha256 58e498a5b496e3a38925398b244bbd57ba68cbb482f2a0d2ae51572e037100eb qtlocation-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtlocation-everywhere-src-5.12.1.tar.xz.sha256
+sha256 8b922373e6eefd1b0e2a993dbf3d0b3f3df777bc720d40cad3ccb46e1936bc50 qtlocation-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 851cbc3539..5911c24c3d 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtmultimedia-everywhere-src-5.11.3.tar.xz.sha256
-sha256 728078eff7dc21495d704a7cd17c604d74604604b45a3c58271608f90dea3c41 qtmultimedia-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtmultimedia-everywhere-src-5.12.1.tar.xz.sha256
+sha256 9c5ba11225f57d3a8124f109514443e290a9eb94e063a5b1f78e63edfb5f0b18 qtmultimedia-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 25c41c6e34..240f4b4c8c 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols-everywhere-src-5.11.3.tar.xz.sha256
-sha256 4e4e5da02ab0b06d35b09356170013cfe36a773d15f92281f7e6d085c3f07537 qtquickcontrols-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtquickcontrols-everywhere-src-5.12.1.tar.xz.sha256
+sha256 15164b00921352b5145a4fc3be0015b8521138a0cb1ecfb9811f39fd35ecd62c qtquickcontrols-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash
similarity index 54%
rename from package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash
index b1caf464a1..73cb76b53f 100644
--- a/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols2-everywhere-src-5.11.3.tar.xz.sha256
-sha256 f45630b652585b62204405b28432977e67c148ca5f1789a794654fd6c1bad086 qtquickcontrols2-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtquickcontrols2-everywhere-src-5.12.1.tar.xz.sha256
+sha256 caa47b6d771b11c65d595fdd0f0942c3d78cda2884d318e3b1da8ec67155a8e7 qtquickcontrols2-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 245d66be63..c5458b5517 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscript-everywhere-src-5.11.3.tar.xz.sha256
-sha256 bb84f3cc581078df4ff76705c5623cd88287f70f7405cbccf99e6fb6dedbec08 qtscript-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtscript-everywhere-src-5.12.1.tar.xz.sha256
+sha256 e5c158fb85799404d20d1ec5dd33a25d5f5736807e1008ce626f666a52c80624 qtscript-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index d2184c94e6..bd37c9ee8b 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscxml-everywhere-src-5.11.3.tar.xz.sha256
-sha256 13172767eda404f1b71ab35998a95af6633d700d2417fff3648d8c6dc6af68d7 qtscxml-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtscxml-everywhere-src-5.12.1.tar.xz.sha256
+sha256 59a2aa1000fe03b0a3eff6fddd21f782e305408fcdd7af1f564a382331cb20b7 qtscxml-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index a8d325d32a..6f5d02033f 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsensors-everywhere-src-5.11.3.tar.xz.sha256
-sha256 a75753d1d5607d4cb27b1849ea9612a65bb3a5271bb31bf0817edd143b620859 qtsensors-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtsensors-everywhere-src-5.12.1.tar.xz.sha256
+sha256 ebc8b4bcfacf10c3bea3f400da7bf3fc7f44f90fa9eb0320c3b87f17307a63e4 qtsensors-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash
similarity index 60%
rename from package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash
index 7d8d9b3419..429232c45e 100644
--- a/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialbus-everywhere-src-5.11.3.tar.xz.sha256
-sha256 5664def35d4ad4aedef14bc529679851450262ea81477a69031ba81aa614c16d qtserialbus-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtserialbus-everywhere-src-5.12.1.tar.xz.sha256
+sha256 97f0c690c77b0e19a8c90e376ecc94d59b21adb20a90179700d1c514a4c50d74 qtserialbus-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.11.3/qt5serialport.hash b/package/qt5/qt5serialport/5.12.1/qt5serialport.hash
similarity index 65%
rename from package/qt5/qt5serialport/5.11.3/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.1/qt5serialport.hash
index 63e0cb61c1..6adcaaff61 100644
--- a/package/qt5/qt5serialport/5.11.3/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.1/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialport-everywhere-src-5.11.3.tar.xz.mirrorlist
-sha256 96c45e6d0d470626815f82b38ee48bf941e1bbfc10863087b69cc5f7bb766bda qtserialport-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtserialport-everywhere-src-5.12.1.tar.xz.mirrorlist
+sha256 243b2502283c45f5163d68c3f23c787d46eb0e3ba58f3d9a0560dc7968a6ce19 qtserialport-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 3c2f0fe474..ddc059aa99 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsvg-everywhere-src-5.11.3.tar.xz.sha256
-sha256 21ea2c9c4e78101e98163bc19e463b8d8cdffa20e1ccd523ccc925b9f2cd4491 qtsvg-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtsvg-everywhere-src-5.12.1.tar.xz.sha256
+sha256 5bc1f744d32c06f5aa4eff33759568106a995ce21fa1326a247dfa5f783f63c8 qtsvg-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 94f1254b03..06e2127dba 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qttools-everywhere-src-5.11.3.tar.xz.sha256
-sha256 c205e81bba9b87c6186604a05ab48e4e6cac0cd511525749dfd00b107b6f9f8e qttools-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qttools-everywhere-src-5.12.1.tar.xz.sha256
+sha256 ab1da4fbd84a9d3873e4ed212a0ae614c6059b8e7dca2f0a599a6f7e61f6cbf3 qttools-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash
similarity index 70%
rename from package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash
index c7d27870b2..0e6860f3d6 100644
--- a/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8c5c40245a9dd2e9e504ce2d47d45079d8280436146797b24b8115ef163b4b9e qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtvirtualkeyboard-everywhere-src-5.12.1.tar.xz.sha256
+sha256 a9e3ed4786d603314144c7ad29a9fdeb6e5c3f2ea5a27f6545cc9777244cd683 qtvirtualkeyboard-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 40d1bb0b26..5b898bd3da 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwayland-everywhere-src-5.11.3.tar.xz.sha256
-sha256 62c94f29e461c849e479f39d21577b0c72f0f084250e126021edcf0719271fb2 qtwayland-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwayland-everywhere-src-5.12.1.tar.xz.sha256
+sha256 88f0507628b3697b0d59349d27b5e60a313a3138927722d6cf981089fff02553 qtwayland-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7c87683ba8..1bbb8fbf20 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebchannel-everywhere-src-5.11.3.tar.xz.sha256
-sha256 3c254fa41b1af09c1e951131f3a1336dee70a15cbb8a82112488b38d29572df3 qtwebchannel-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebchannel-everywhere-src-5.12.1.tar.xz.sha256
+sha256 40c3e74347c67a9864d0d54f14120555860e4ce529746407325b3cd6e9aeb5bf qtwebchannel-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index 9e4b7d6356..7c5aca81d4 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -15,14 +15,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE \
 	src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE \
 	src/3rdparty/chromium/buildtools/LICENSE \
-	src/3rdparty/chromium/chrome/third_party/chromevox/LICENSE \
-	src/3rdparty/chromium/chrome/third_party/chromevox/third_party/closure-library/LICENSE \
 	src/3rdparty/chromium/LICENSE \
 	src/3rdparty/chromium/LICENSE.chromium_os \
 	src/3rdparty/chromium/mojo/public/LICENSE \
 	src/3rdparty/chromium/net/third_party/mozilla_security_manager/LICENSE \
 	src/3rdparty/chromium/net/third_party/nss/LICENSE \
 	src/3rdparty/chromium/ppapi/LICENSE \
+	src/3rdparty/chromium/third_party/abseil-cpp/LICENSE \
 	src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE \
 	src/3rdparty/chromium/third_party/angle/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE \
@@ -31,13 +30,34 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
 	src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE \
 	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
+	src/3rdparty/chromium/third_party/arcore-android-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/axe-core/LICENSE \
 	src/3rdparty/chromium/third_party/bazel/LICENSE \
 	src/3rdparty/chromium/third_party/blanketjs/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE \
+	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2 \
+	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1 \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2_worker/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE_python \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/formatter_worker/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/scripts/closure/COPYING \
+	src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt \
+	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING \
+	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/html5lib/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/android-cmake/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/LICENSE \
+	src/3rdparty/chromium/third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE \
 	src/3rdparty/chromium/third_party/bouncycastle/LICENSE \
 	src/3rdparty/chromium/third_party/breakpad/breakpad/LICENSE \
 	src/3rdparty/chromium/third_party/breakpad/breakpad/src/third_party/curl/COPYING \
@@ -51,11 +71,14 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/chaijs/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
+	src/3rdparty/chromium/third_party/chromevox/LICENSE \
+	src/3rdparty/chromium/third_party/chromevox/third_party/closure-library/LICENSE \
+	src/3rdparty/chromium/third_party/chromevox/third_party/sre/LICENSE \
 	src/3rdparty/chromium/third_party/cld_3/LICENSE \
 	src/3rdparty/chromium/third_party/cld_3/src/LICENSE \
-	src/3rdparty/chromium/third_party/content_shell_fonts/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/getopt/LICENSE \
 	src/3rdparty/chromium/third_party/crc32c/src/LICENSE \
 	src/3rdparty/chromium/third_party/cros_system_api/LICENSE \
@@ -193,6 +216,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/errorprone/LICENSE \
 	src/3rdparty/chromium/third_party/espresso/LICENSE \
 	src/3rdparty/chromium/third_party/expat/files/COPYING \
+	src/3rdparty/chromium/third_party/feed/LICENSE \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/full_lgpl.txt \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/jpeg.txt \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/mips.txt \
@@ -213,7 +237,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
 	src/3rdparty/chromium/third_party/fontconfig/src/COPYING \
 	src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/gardiner_mod/LICENSE \
 	src/3rdparty/chromium/third_party/gestures/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gif_player/LICENSE \
@@ -222,13 +245,15 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/googletest/src/googlemock/scripts/generator/LICENSE \
 	src/3rdparty/chromium/third_party/googletest/src/googletest/LICENSE \
 	src/3rdparty/chromium/third_party/googletest/src/LICENSE \
+	src/3rdparty/chromium/third_party/google-truth/LICENSE \
 	src/3rdparty/chromium/third_party/gson/LICENSE \
 	src/3rdparty/chromium/third_party/guava/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/haha/LICENSE \
 	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
-	src/3rdparty/chromium/third_party/harfbuzz-ng/COPYING \
+	src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING \
+	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/hb-ucdn/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.LESSER \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.MPL \
@@ -269,6 +294,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libvpx/source/libvpx/LICENSE \
 	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/googletest/src/LICENSE \
 	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/libwebm/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/libyuv/LICENSE \
 	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/x86inc/LICENSE \
 	src/3rdparty/chromium/third_party/libwebm/source/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/libwebp/LICENSE \
@@ -278,7 +304,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libxslt/linux/COPYING \
 	src/3rdparty/chromium/third_party/libxslt/src/Copyright \
 	src/3rdparty/chromium/third_party/libyuv/LICENSE \
-	src/3rdparty/chromium/third_party/libyuv/LICENSE_THIRD_PARTY \
 	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
 	src/3rdparty/chromium/third_party/mach_override/LICENSE \
 	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
@@ -297,7 +322,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/molokocacao/LICENSE \
 	src/3rdparty/chromium/third_party/motemplate/LICENSE \
 	src/3rdparty/chromium/third_party/mozilla/LICENSE \
-	src/3rdparty/chromium/third_party/mt19937ar/LICENSE \
 	src/3rdparty/chromium/third_party/netty4/LICENSE \
 	src/3rdparty/chromium/third_party/netty-tcnative/LICENSE \
 	src/3rdparty/chromium/third_party/node/LICENSE \
@@ -316,6 +340,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pexpect/LICENSE \
 	src/3rdparty/chromium/third_party/ply/LICENSE \
 	src/3rdparty/chromium/third_party/ply/license.patch \
+	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt \
 	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
 	src/3rdparty/chromium/third_party/proguard/LICENSE \
 	src/3rdparty/chromium/third_party/protobuf/LICENSE \
@@ -323,15 +348,19 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE \
 	src/3rdparty/chromium/third_party/pyelftools/LICENSE \
 	src/3rdparty/chromium/third_party/pyftpdlib/src/LICENSE \
+	src/3rdparty/chromium/third_party/pyjson5/src/LICENSE \
 	src/3rdparty/chromium/third_party/pymock/LICENSE.txt \
 	src/3rdparty/chromium/third_party/pystache/LICENSE \
 	src/3rdparty/chromium/third_party/Python-Markdown/LICENSE.md \
 	src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE \
 	src/3rdparty/chromium/third_party/qcms/src/COPYING \
+	src/3rdparty/chromium/third_party/quic_trace/src/LICENSE \
 	src/3rdparty/chromium/third_party/qunit/LICENSE \
+	src/3rdparty/chromium/third_party/r8/LICENSE \
 	src/3rdparty/chromium/third_party/re2/LICENSE \
 	src/3rdparty/chromium/third_party/re2/src/LICENSE \
 	src/3rdparty/chromium/third_party/requests/LICENSE \
+	src/3rdparty/chromium/third_party/rnnoise/COPYING \
 	src/3rdparty/chromium/third_party/robolectric/LICENSE \
 	src/3rdparty/chromium/third_party/robolectric/licenses/extreme.indiana.edu.license.txt \
 	src/3rdparty/chromium/third_party/robolectric/licenses/javolution.license.txt \
@@ -339,22 +368,22 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/s2cellid/LICENSE \
 	src/3rdparty/chromium/third_party/sfntly/COPYING.txt \
 	src/3rdparty/chromium/third_party/sfntly/src/cpp/COPYING.txt \
-	src/3rdparty/chromium/third_party/shaderc/LICENSE \
 	src/3rdparty/chromium/third_party/shaderc/src/LICENSE \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
 	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
 	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
 	src/3rdparty/chromium/third_party/skia/LICENSE \
-	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/skcms/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt \
+	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/LICENSE \
 	src/3rdparty/chromium/third_party/smhasher/LICENSE \
 	src/3rdparty/chromium/third_party/snappy/src/COPYING \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/LICENSE \
-	src/3rdparty/chromium/third_party/sqlite/sqlite-src-3210000/autoconf/tea/license.terms \
 	src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms \
 	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
 	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
@@ -366,20 +395,19 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/subzero/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/tcmalloc/gperftools-2.0/vendor/COPYING \
 	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
 	src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING \
+	src/3rdparty/chromium/third_party/test_fonts/LICENSE \
 	src/3rdparty/chromium/third_party/tlslite/LICENSE \
-	src/3rdparty/chromium/third_party/typ/LICENSE \
 	src/3rdparty/chromium/third_party/ub-uiautomator/LICENSE \
+	src/3rdparty/chromium/third_party/unrar/LICENSE \
+	src/3rdparty/chromium/third_party/unrar/src/license.txt \
 	src/3rdparty/chromium/third_party/usb_ids/LICENSE \
 	src/3rdparty/chromium/third_party/usrsctp/LICENSE \
 	src/3rdparty/chromium/third_party/usrsctp/usrsctplib/LICENSE.md \
 	src/3rdparty/chromium/third_party/v4l-utils/COPYING.libv4l \
 	src/3rdparty/chromium/third_party/visualmetrics/src/LICENSE \
-	src/3rdparty/chromium/third_party/vulkan/LICENSE \
-	src/3rdparty/chromium/third_party/wayland/LICENSE \
-	src/3rdparty/chromium/third_party/wayland-protocols/LICENSE \
-	src/3rdparty/chromium/third_party/wayland-protocols/src/COPYING \
 	src/3rdparty/chromium/third_party/wds/LICENSE \
 	src/3rdparty/chromium/third_party/wds/src/COPYING \
 	src/3rdparty/chromium/third_party/web-animations-js/LICENSE \
@@ -387,25 +415,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/webdriver/COPYING \
 	src/3rdparty/chromium/third_party/webdriver/LICENSE \
 	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
-	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-APPLE \
-	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2 \
-	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2.1 \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/audits2/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/audits2_worker/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE_python \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm_modes/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/formatter_worker/acorn/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/terminal/xterm.js/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Source/devtools/scripts/closure/COPYING \
-	src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/dtoa/COPYING \
-	src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/dtoa/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/mod_pywebsocket/COPYING \
-	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/LICENSE.md \
-	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/html5lib/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/six/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/wptserve/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md \
 	src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE \
@@ -432,6 +441,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/v8/src/third_party/utf8-decoder/LICENSE \
 	src/3rdparty/chromium/v8/src/third_party/valgrind/LICENSE \
 	src/3rdparty/chromium/v8/src/third_party/vtune/LICENSE \
+	src/3rdparty/chromium/v8/third_party/antlr4/LICENSE.txt \
 	src/3rdparty/chromium/v8/third_party/colorama/LICENSE \
 	src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE \
+	src/3rdparty/gn/base/third_party/icu/LICENSE \
+	src/3rdparty/gn/LICENSE \
 	src/3rdparty/ninja/COPYING
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 730352611a..4cbc1ce4fb 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebengine-everywhere-src-5.11.3.tar.xz.sha256
-sha256 5bb49ead71b851db4dc56f8fd97e0db72a268b22104129a06bac201d55d3b8fe qtwebengine-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebengine-everywhere-src-5.12.1.tar.xz.sha256
+sha256 43e91e06bc4a60ef0f91d15ae06425cf9c6b4f7dafe960259a5b013c687c3bd0 qtwebengine-everywhere-src-5.12.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 0df4ac98fa..3b2f4fa3c3 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebsockets-everywhere-src-5.11.3.tar.xz.sha256
-sha256 021090c1a92f11fcf2914168741c1364235896793685b7fae2bc23e3dd55d5b9 qtwebsockets-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebsockets-everywhere-src-5.12.1.tar.xz.sha256
+sha256 2fd0627916d817599c5f855a97156113ed3625b90b350603be6f668762abfc79 qtwebsockets-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash
similarity index 65%
rename from package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash
index 9a0e85d8fd..b065234f4c 100644
--- a/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtx11extras-everywhere-src-5.11.3.tar.xz.mirrorlist
-sha256 f99eebe685f7cdbb71cd62903c2b2511548345535841bcc3f6b662205815cd85 qtx11extras-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtx11extras-everywhere-src-5.12.1.tar.xz.mirrorlist
+sha256 08fb1c40e1562d43087368a5efa39569fa1ad52b72d2360f9fc1fe18b00da366 qtx11extras-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 5c66a54eeb..f22e4e54ff 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtxmlpatterns-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8bd00be30722570d22382b99679d07787a2d62d4891d1c47d738d634e2db0eee qtxmlpatterns-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtxmlpatterns-everywhere-src-5.12.1.tar.xz.sha256
+sha256 76988ca9a7a184b9013b8a5864dad150e4603890c7eb7aecad4baad071802ecb qtxmlpatterns-everywhere-src-5.12.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.20.1
