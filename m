From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:57:37 +0100
Subject: [Buildroot] [git commit] qt5: bump latest version to 5.11.3
Message-ID: <20181208200042.99DDF84339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85ecae213ae5d37c9ddb7390706c18b93035f63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base: remove 0005-Export-qt_open64-from-QtCore.patch (taken from upstream [1])

[1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +--
 .../5.11.2/0005-Export-qt_open64-from-QtCore.patch | 35 ----------------------
 ...001-qtbase-Fix-build-error-when-using-EGL.patch |  0
 ...2-double-conversion-enable-for-aarch64_be.patch |  0
 .../0003-double-conversion-enable-for-or1k.patch   |  0
 ...4-double-conversion-enable-for-microblaze.patch |  0
 .../qt5/qt5base/{5.11.2 => 5.11.3}/qt5base.hash    |  4 +--
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +--
 package/qt5/qt5charts/qt5charts.hash               |  4 +--
 .../{5.11.2 => 5.11.3}/qt5connectivity.hash        |  4 +--
 ...01-qsgtexture-fix-debug-build-with-uclibc.patch |  0
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +--
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +--
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +--
 ...clarativegeomap-fix-building-with-GCC-5.x.patch |  0
 package/qt5/qt5location/qt5location.hash           |  4 +--
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  6 ++--
 .../{5.11.2 => 5.11.3}/qt5quickcontrols2.hash      |  4 +--
 package/qt5/qt5script/qt5script.hash               |  4 +--
 package/qt5/qt5scxml/qt5scxml.hash                 |  4 +--
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +--
 .../{5.11.2 => 5.11.3}/qt5serialbus.hash           |  4 +--
 .../{5.11.2 => 5.11.3}/qt5serialport.hash          |  4 +--
 package/qt5/qt5svg/qt5svg.hash                     |  4 +--
 package/qt5/qt5tools/qt5tools.hash                 |  4 +--
 .../{5.11.2 => 5.11.3}/qt5virtualkeyboard.hash     |  4 +--
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +--
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +--
 package/qt5/qt5webengine/qt5webengine.hash         |  4 +--
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +--
 .../{5.11.2 => 5.11.3}/qt5x11extras.hash           |  4 +--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +--
 34 files changed, 54 insertions(+), 89 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 5b7a6d6973..88ba1958dd 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.11
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 789ea29d9d..2da5500505 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qt3d-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 7f72c823ec10a2effba95d08d9439215472d2cb1e3229de50a6b3d2523c8f962 qt3d-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qt3d-everywhere-src-5.11.3.tar.xz.sha256
+sha256 04a55c21f365d897ec75042ee83f9ad59a847992c6f55fae0763ad2701d99eab qt3d-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch b/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch
deleted file mode 100644
index 2fd14a282f..0000000000
--- a/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432 Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Fri, 21 Sep 2018 09:04:24 -0700
-Subject: [PATCH] Export qt_open64 from QtCore
-
-Other libs use qcore_unix_p.h.
-
-qopenglprogrambinarycache.cpp:function QOpenGLProgramBinaryCache::load(QByteArray const&, unsigned int): error: undefined reference to 'qt_open64(char const*, int, unsigned int)'
-
-Change-Id: I44e7d800c68141bdaae0fffd155675d15eded2e4
-Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
-Reviewed-by: Eric Lemanissier <eric.lemanissier@gmail.com>
-
-Upstream: http://code.qt.io/cgit/qt/qtbase.git/commit/?id=4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/corelib/kernel/qcore_unix_p.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/corelib/kernel/qcore_unix_p.h b/src/corelib/kernel/qcore_unix_p.h
-index cb98bef347..5a2a29a327 100644
---- a/src/corelib/kernel/qcore_unix_p.h
-+++ b/src/corelib/kernel/qcore_unix_p.h
-@@ -178,7 +178,7 @@ inline void qt_ignore_sigpipe()
- 
- #if defined(Q_PROCESSOR_X86_32) && defined(__GLIBC__)
- #  if !__GLIBC_PREREQ(2, 22)
--int qt_open64(const char *pathname, int flags, mode_t);
-+Q_CORE_EXPORT int qt_open64(const char *pathname, int flags, mode_t);
- #    undef QT_OPEN
- #    define QT_OPEN qt_open64
- #  endif
--- 
-2.19.0
-
diff --git a/package/qt5/qt5base/5.11.2/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.11.2/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.2/0002-double-conversion-enable-for-aarch64_be.patch
rename to package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
diff --git a/package/qt5/qt5base/5.11.2/0003-double-conversion-enable-for-or1k.patch b/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.2/0003-double-conversion-enable-for-or1k.patch
rename to package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
diff --git a/package/qt5/qt5base/5.11.2/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.2/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.11.2/qt5base.hash b/package/qt5/qt5base/5.11.3/qt5base.hash
similarity index 80%
rename from package/qt5/qt5base/5.11.2/qt5base.hash
rename to package/qt5/qt5base/5.11.3/qt5base.hash
index 1c11adba2d..964bcf1ab9 100644
--- a/package/qt5/qt5base/5.11.2/qt5base.hash
+++ b/package/qt5/qt5base/5.11.3/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtbase-everywhere-src-5.11.3.tar.xz.sha256
+sha256 c6bf887732b83ce072eb72eddb7497bedcdf9ca794e7ed91261a93f063623e1c qtbase-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 1fe8ecab17..4fc7c613b0 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtcanvas3d-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 fd9ca31268e81d4864da961de7635ef7316a815b8fc77910e512647eb4ceea40 qtcanvas3d-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcanvas3d-everywhere-src-5.11.3.tar.xz.sha256
+sha256 d5a004848588c1c53ea7ed9d36bb5bfe3a813ffc45290066d2f6cfcace072138 qtcanvas3d-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index fa4e615cfd..2519b8f13c 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtcharts-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 f6a312c596bfffa5074a3a5606dff1ef197dac075b3c1bd6443e3a6db1c3a114 qtcharts-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcharts-everywhere-src-5.11.3.tar.xz.sha256
+sha256 4798f3ebc4d937d1c190db7ff718ad5affa907caa56b5557e593f6b5a60d95dc qtcharts-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash b/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
similarity index 73%
rename from package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
index 921f2e80a8..54fda648cd 100644
--- a/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtconnectivity-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 58901bbd14d3bc472f27fe305fd8dc33cffbd10da83616e9691c04c3290d42c5 qtconnectivity-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtconnectivity-everywhere-src-5.11.3.tar.xz.sha256
+sha256 148cfcbceb3d0a70059f4d92fa069baf56babb627b16a4203b318ca6f0d0b32a qtconnectivity-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e1af61fbe7..3ce4e50250 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtdeclarative-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 220d86f8031e9d45f3c369c3fd517aaa4c5783ad62c843a21fa7cc3c0a36f2cd qtdeclarative-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtdeclarative-everywhere-src-5.11.3.tar.xz.sha256
+sha256 8e263621d706f1c4def5d71212a6ae37b0d3c378da89d9e3e5fc0b5557721ae6 qtdeclarative-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index f871e0b779..36dd345268 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtgraphicaleffects-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 a9dcaaa3932f7b71717a393700e1387bcd6f9c03538d0ffca2a64128a0e4a9fd qtgraphicaleffects-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtgraphicaleffects-everywhere-src-5.11.3.tar.xz.sha256
+sha256 14d86983fcdd119daefad235ffee7d8ca691e6074ef360cb6347b8aae66f57e2 qtgraphicaleffects-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index b4684bb764..1c1f81bbed 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtimageformats-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 27e5d10551d0b5bf4799d09e5412ea2e6898b09aa1521ea24bce660ee6183a68 qtimageformats-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtimageformats-everywhere-src-5.11.3.tar.xz.sha256
+sha256 04b261bc3d7a277fbe9ac8619ecd037d7089b356eaee41b2d41d7a2ff58b087f qtimageformats-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/5.11.2/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch b/package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
similarity index 100%
rename from package/qt5/qt5location/5.11.2/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
rename to package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 7c7f007bc3..be0ac7c31f 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtlocation-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 d698911edfb2d45b7adca6557b3de880e966cb8823a8adf1beb3a3079560024e qtlocation-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtlocation-everywhere-src-5.11.3.tar.xz.sha256
+sha256 58e498a5b496e3a38925398b244bbd57ba68cbb482f2a0d2ae51572e037100eb qtlocation-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index fb82851162..851cbc3539 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtmultimedia-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 25608f3d08636026387394956fe72cedcb78eb786fb32fd87deb41d574cf726d qtmultimedia-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtmultimedia-everywhere-src-5.11.3.tar.xz.sha256
+sha256 728078eff7dc21495d704a7cd17c604d74604604b45a3c58271608f90dea3c41 qtmultimedia-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index a4fc20ebcf..c4f8fa81dd 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
+ed:   package/qt5/qt5script/qt5script.hash# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 9c772e30fb1ba107168498328585063f4303c6562baf4a5cfedd0c5250b621e0 qtquickcontrols-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols-everywhere-src-5.11.3.tar.xz.sha256
+sha256 4e4e5da02ab0b06d35b09356170013cfe36a773d15f92281f7e6d085c3f07537 qtquickcontrols-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
similarity index 64%
rename from package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
index bdf844eb91..b1caf464a1 100644
--- a/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols2-everywhere-src-5.11.3.tar.xz.sha256
+sha256 f45630b652585b62204405b28432977e67c148ca5f1789a794654fd6c1bad086 qtquickcontrols2-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 0efc40bb42..245d66be63 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtscript-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 b2c2466a83653a9473ea4810462d8a88e0fb1fb691f85d1c6e60d8bc4283f976 qtscript-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscript-everywhere-src-5.11.3.tar.xz.sha256
+sha256 bb84f3cc581078df4ff76705c5623cd88287f70f7405cbccf99e6fb6dedbec08 qtscript-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index ecaf50745b..d2184c94e6 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtscxml-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 d625cb2149f5bfef5747b1d40b22327fd36132307c8b76d358f235d5422ff7a4 qtscxml-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscxml-everywhere-src-5.11.3.tar.xz.sha256
+sha256 13172767eda404f1b71ab35998a95af6633d700d2417fff3648d8c6dc6af68d7 qtscxml-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 4795356e68..a8d325d32a 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtsensors-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 0e27c38824f7a1deb506f6195156eed79b80aa7034356272c3be0611667d63c7 qtsensors-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsensors-everywhere-src-5.11.3.tar.xz.sha256
+sha256 a75753d1d5607d4cb27b1849ea9612a65bb3a5271bb31bf0817edd143b620859 qtsensors-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
similarity index 70%
rename from package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
index 9c4aa16fd2..7d8d9b3419 100644
--- a/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialbus-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 1774c2c162f85f7cbcb2bdd2ef47507b110a01bc261627b46aa718e87079641e qtserialbus-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialbus-everywhere-src-5.11.3.tar.xz.sha256
+sha256 5664def35d4ad4aedef14bc529679851450262ea81477a69031ba81aa614c16d qtserialbus-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.11.2/qt5serialport.hash b/package/qt5/qt5serialport/5.11.3/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.11.2/qt5serialport.hash
rename to package/qt5/qt5serialport/5.11.3/qt5serialport.hash
index 4dda77e44a..63e0cb61c1 100644
--- a/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.11.3/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialport-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 b01b69ce421d449402363c0cf617fcc8856e39d6d2c28aa3d06d1f5359dc6f6e qtserialport-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialport-everywhere-src-5.11.3.tar.xz.mirrorlist
+sha256 96c45e6d0d470626815f82b38ee48bf941e1bbfc10863087b69cc5f7bb766bda qtserialport-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index fa4d6f4454..3c2f0fe474 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtsvg-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 bc16bbf855b466e77dda996d8c91fa73db7fe14d3aa98ce6d92145ca1a1bd166 qtsvg-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsvg-everywhere-src-5.11.3.tar.xz.sha256
+sha256 21ea2c9c4e78101e98163bc19e463b8d8cdffa20e1ccd523ccc925b9f2cd4491 qtsvg-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 7c78866c8e..94f1254b03 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qttools-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 f0e8332c771958b4aa373ac643d35e2fabb1a2dcdbaca756ebf3d1ace7c631b8 qttools-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qttools-everywhere-src-5.11.3.tar.xz.sha256
+sha256 c205e81bba9b87c6186604a05ab48e4e6cac0cd511525749dfd00b107b6f9f8e qttools-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
similarity index 77%
rename from package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
index c065a9e807..c7d27870b2 100644
--- a/package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz.sha256
+sha256 8c5c40245a9dd2e9e504ce2d47d45079d8280436146797b24b8115ef163b4b9e qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 01305c950e..40d1bb0b26 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwayland-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 4e35e15da360480a5aef414246f70d29b0252b6a9c7e129e63afba3fb2ecb771 qtwayland-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwayland-everywhere-src-5.11.3.tar.xz.sha256
+sha256 62c94f29e461c849e479f39d21577b0c72f0f084250e126021edcf0719271fb2 qtwayland-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 1ed2bddb6f..7c87683ba8 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebchannel-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 945fdae8f1ea8dfc8e47a6d8421cef00690d6d4bfe26ce61bb59c0d0326c02fc qtwebchannel-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebchannel-everywhere-src-5.11.3.tar.xz.sha256
+sha256 3c254fa41b1af09c1e951131f3a1336dee70a15cbb8a82112488b38d29572df3 qtwebchannel-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index e8e57d5d91..730352611a 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebengine-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 3ff9bba5f631cfdd454ce298489360b3e2d9a2de4eb82bb121d838ef65f9b772 qtwebengine-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebengine-everywhere-src-5.11.3.tar.xz.sha256
+sha256 5bb49ead71b851db4dc56f8fd97e0db72a268b22104129a06bac201d55d3b8fe qtwebengine-everywhere-src-5.11.3.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 1b340b989e..0df4ac98fa 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtwebsockets-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 ae6197619ce0c4104bdc43e097d79082f90ba6567fa286eae6306ce7aec88b8d qtwebsockets-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebsockets-everywhere-src-5.11.3.tar.xz.sha256
+sha256 021090c1a92f11fcf2914168741c1364235896793685b7fae2bc23e3dd55d5b9 qtwebsockets-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash b/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
index 21702b91fb..9a0e85d8fd 100644
--- a/package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtx11extras-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 f407ca61052d44bfb06e831fc6db7595bb2b64882b1f0af23f5db2d1ee519089 qtx11extras-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtx11extras-everywhere-src-5.11.3.tar.xz.mirrorlist
+sha256 f99eebe685f7cdbb71cd62903c2b2511548345535841bcc3f6b662205815cd85 qtx11extras-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 61788dd3be..5c66a54eeb 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtxmlpatterns-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 5fd5f680ba40dadf81665417501e1f3778982aea0e268bf4f75a420d54a86746 qtxmlpatterns-everywhere-src-5.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtxmlpatterns-everywhere-src-5.11.3.tar.xz.sha256
+sha256 8bd00be30722570d22382b99679d07787a2d62d4891d1c47d738d634e2db0eee qtxmlpatterns-everywhere-src-5.11.3.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
