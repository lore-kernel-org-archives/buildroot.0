From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:50:52 +0200
Subject: [Buildroot] [git commit] qt5: bump version to 5.6.2
Message-ID: <20161015205123.20A50807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac0d9534604213893fb43dba19f20bb957bff1bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- qt5base: remove obsolete '-no-nis' configure parameter ([1])
- qt5base: remove  upstream committed patch 0007-Remove-libudev-dependency-from-kms.pro.patch ([2])
- qt5imageformats: remove upstream committed  patch 0001-tvOS-support.patch ([3])

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=644d0e75240811212ed9fd0c21e3bd05db3ba5db
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
[3] https://git.buildroot.net/buildroot/commit/package/qt5?id=9a55b996651fdfbc40e202cb4dd725dce624ca91

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +--
 ...07-Remove-libudev-dependency-from-kms.pro.patch | 33 --------------------
 package/qt5/qt5base/qt5base.hash                   |  4 +--
 package/qt5/qt5base/qt5base.mk                     |  1 -
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +--
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +--
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +--
 package/qt5/qt5enginio/qt5enginio.hash             |  4 +--
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +--
 .../qt5/qt5imageformats/0001-tvOS-support.patch    | 35 ----------------------
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
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +--
 package/qt5/qt5webkit/qt5webkit.hash               |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +--
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +--
 29 files changed, 48 insertions(+), 117 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 04bad81..d25f663 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).1-1
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index fbe782d..7179380 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qt3d-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 6e71b6925a39056c18920350ea94e5a6b45a54f27ea2e04905e4b2acb464b7db qt3d-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch b/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch
deleted file mode 100644
index 7ecbcd0..0000000
--- a/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0f1b4bb65abe0e36e9e4b9813e45192223509de8 Mon Sep 17 00:00:00 2001
-From: Ralf Nolden <nolden@kde.org>
-Date: Tue, 17 May 2016 12:57:17 +0200
-Subject: [PATCH] Remove libudev dependency from kms.pro
-
-To compile the kms qpa plugin, only libdrm is needed.
-Remove the libudev dependency for the compile check to enable
-building of the qpa plugin on platforms where libudev is not present
-such as BSD systems (but where KMS works)
-
-Change-Id: Icd0be70a8949578a6158d523428706890a9674eb
-Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/patch/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- config.tests/qpa/kms/kms.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.tests/qpa/kms/kms.pro b/config.tests/qpa/kms/kms.pro
-index 1fb7367..5147bc8 100644
---- a/config.tests/qpa/kms/kms.pro
-+++ b/config.tests/qpa/kms/kms.pro
-@@ -1,4 +1,4 @@
- SOURCES = kms.cpp
- CONFIG += link_pkgconfig
--PKGCONFIG += libdrm libudev
-+PKGCONFIG += libdrm
- CONFIG -= qt
--- 
-2.8.1
-
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 2df165b..9808e9b 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtbase-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 329678347ec5ebb404225345300a8deb1e7c991322a4c50584be550c69be7c39 qtbase-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bf541b0..23dba2a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -21,7 +21,6 @@ QT5BASE_INSTALL_STAGING = YES
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
 	-no-cups \
-	-no-nis \
 	-no-iconv \
 	-system-zlib \
 	-system-pcre \
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 99d4ff6..01819e4 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtcanvas3d-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 84d02cc051eeda6edb8a4da00d9a35869a447f7beb04d3c39cd375a3793f228c qtcanvas3d-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 3dab371..4574f3d 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtconnectivity-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 f1d714b8f359df069b9e94e72719bcb9f5340212d9ce223453b7100c6ed7266b qtconnectivity-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 15c0c46..d8d3a68 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtdeclarative-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 1cdf60b52509972ac001f5402a42d9b144b344010ec6e34f528f7dfc6be98f24 qtdeclarative-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 2105aba..9951834 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtenginio-opensource-src-1.6.1.tar.xz.mirrorlist
-sha256 0e14d5dfcae3f0b44c52751b20a8fc5f9e2c0d53aa1025ffbabbfde43fcc1a9e qtenginio-opensource-src-1.6.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
+sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 51cc5b4..ada5fa7 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -6,7 +6,7 @@
 
 # Qt5Enginio does not follow Qt versionning
 # see https://bugreports.qt.io/browse/QTBUG-50111
-QT5ENGINIO_VERSION = 1.6.1
+QT5ENGINIO_VERSION = 1.6.2
 QT5ENGINIO_SITE = $(QT5_SITE)
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl qt5base
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 7e952b4..ae29e3b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtgraphicaleffects-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 2b9cecf8eb3e12587788fa320119cf8d7b84775211cc1d78334d27e50040c014 qtgraphicaleffects-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5imageformats/0001-tvOS-support.patch b/package/qt5/qt5imageformats/0001-tvOS-support.patch
deleted file mode 100644
index 3759c10..0000000
--- a/package/qt5/qt5imageformats/0001-tvOS-support.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a9e4b41a04b8d1a6d3d687964c146b87f60f9683 Mon Sep 17 00:00:00 2001
-From: Mike Krus <mike.krus@kdab.com>
-Date: Mon, 28 Dec 2015 21:02:35 +0000
-Subject: [PATCH] tvOS support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-QT_ARCH for tvOS is arm64 (not arm, since it???s 64bits only)
-
-Change-Id: Ia03d3ee07d2543a0e70ee7d77448aff9382d8fc8
-Reviewed-by: Jake Petroules <jake.petroules@theqtcompany.com>
-
-Upstream: https://code.qt.io/cgit/qt/qtimageformats.git/patch/?id=e4c1d9ece74de212ebe5c55b134de7cb23469e2d
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/3rdparty/libwebp.pri | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/libwebp.pri b/src/3rdparty/libwebp.pri
-index b7c1bb6..2197953 100644
---- a/src/3rdparty/libwebp.pri
-+++ b/src/3rdparty/libwebp.pri
-@@ -82,7 +82,7 @@ android {
-     INCLUDEPATH += $$NDK_ROOT/sources/android/cpufeatures
- }
- 
--equals(QT_ARCH, arm) {
-+equals(QT_ARCH, arm)|equals(QT_ARCH, arm64) {
-     SOURCES_FOR_NEON += \
-         $$PWD/libwebp/src/dsp/dec_neon.c \
-         $$PWD/libwebp/src/dsp/enc_neon.c \
--- 
-2.8.1
-
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index e21fb17..54b58e4 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtimageformats-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 cc45e481394dcc4eb4e565969c9bb50b87b1da23f006bf849a5f8daa375328dd qtimageformats-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 099519f..374952f 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtlocation-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 c9cc21ba3dd3f13376a175b092256403589a52c7851603dbfe1e15d5d9bac457 qtlocation-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index e2e5a2d..56a11fb 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtmultimedia-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 4e28dcc696a9996b03a124b0f56fc86646bc2e9d29d383dc923b926040774e5d qtmultimedia-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index f996263..6db589d 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtquickcontrols-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 011047af8bc2242fa9f7e7860818ca16a62a54e06b27a6b518919f4c08725f32 qtquickcontrols-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 798a8ab..0d85d48 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtquickcontrols2-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 4c915939f659bb5f7dc381eb011809b6030c717269d9d260fca36f8d5917ca71 qtquickcontrols2-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 4b61d1b..c8ecb75 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtscript-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 9d169f447395cef5209e1e33bf1020babc035740741145705298ba81488a36be qtscript-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 344cc38..65cd127 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtsensors-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 99003fbe9304f1a135c454f28cc875f553a5f2c8c98153c516cfd8bf8ddb994d qtsensors-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index ff87c58..308c365 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtserialbus-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 05cb306d450a697cb8311db1e0edde76eaea0b20a681a74e28cbeda2c1792452 qtserialbus-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 7903d42..2458e5d 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtserialport-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 a2b488fcdf076f539b601ec2c49446352d67bfe1d9fb4a57330ccc0edf5bac8c qtserialport-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a9df035..0c9e9eb 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtsvg-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 5c870352ecd9d0c11bfca1725999a5073c3a03e5685ba12b73aab5a81edc12f0 qtsvg-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 2b43fbd..cc11b28 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qttools-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 375a528bf7141eff38cdc00c322c6d4491c8f67203fd8ee6b9a7097504605141 qttools-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index bb9f0ac..0f9eaae 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtwebchannel-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 878ab614b30bbf04ef3775af68acd47de9765973650c1db403464e79efd07e82 qtwebchannel-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 8122cab..96b8bdd 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 e4339ee069e2817fc5bf7c2c2d9fa680874da4ba56f34afdad2b4795803cbdf1 qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b.tar.gz
+sha256 bdd659573e7e75cd4ad57b7160a7353d98d21a6fef06e4fb9e114a5b1f1e9dab qt5webkit-b35917bcb44d7f200af0f4ac68a126fa0aa8d93d.tar.gz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a47a235..f300c11 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBKIT_VERSION = b889f460280ad98c89ede179bd3b9ce9cb02002b
+QT5WEBKIT_VERSION = b35917bcb44d7f200af0f4ac68a126fa0aa8d93d
 # Using GitHub since it supports downloading tarballs from random commits.
 # The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
 QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 05abfef..3443476 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtwebsockets-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 34620ca34ca580802509b2fb3e9eb843d5ad11416d6a211400ac7f700aeae0bb qtwebsockets-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index bfec513..297c578 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtx11extras-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 be6cc815e9b33a20f5cd374fe77443b13ea5f1cd625616d75b3c4fdcc4f3457a qtx11extras-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 68c859a..fa4e97f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtxmlpatterns-opensource-src-5.6.1-1.tar.xz.mirrorlist
-sha256 e1dac17a8e6cb2b03da2d666ae2a99f31c2d9b73790c79ca2c85197766cec6a4 qtxmlpatterns-opensource-src-5.6.1-1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
