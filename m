From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 09:55:51 +0200
Subject: [Buildroot] [git commit] qt5: bump LTS version to 5.6.3
Message-ID: <20171021075257.B760381092@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a4975d4bd030ab3cf291d18fa36a39cb58cc89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base:
  - move hash file to 5.6.3
  - move 0001-eglfs-rasp-pi-header-inclusion.patch to 5.6.3
  - remove 0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [1])

qt5declarative:
  - move patches to 5.6.3

qt5quickcontrols2:
  - move hash file to 5.6.3

qt5webkit:
  - move patches to 5.6.3

[1] http://code.qt.io/cgit/qt/qtbase.git/commit/?h=5.6&id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
 .../0001-eglfs-rasp-pi-header-inclusion.patch      |  0
 package/qt5/qt5base/{5.6.2 => 5.6.3}/qt5base.hash  |  0
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 ...xamples-photoviewer-needs-widgets-support.patch |  0
 ...uickviewcomparison-and-quickwidget-needs-.patch |  0
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5enginio/qt5enginio.hash             |  2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 .../{5.6.2 => 5.6.3}/qt5quickcontrols2.hash        |  0
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  0
 .../0002-Remove-TEXTREL-tag-in-x86.patch           |  0
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  0
 package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 34 files changed, 48 insertions(+), 101 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index a0cfef9..0e49c6b 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -10,7 +10,7 @@ QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 else
 QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 endif
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7d0bf48..7a9d0dc 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qt3d-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 c955a92fe2f3f2f03493ae0e9d973ebe1c4b1e037b58f18092fa2040f5b50783 qt3d-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
deleted file mode 100644
index cbafb39..0000000
--- a/package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b6c602e4264021f98ec2c72316e2a2000bf35e82 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 14 Nov 2016 23:42:25 +0100
-Subject: [PATCH] eglfs: fix eglfs_mali compile for odroid-mali
-
-Avoid duplicated struct fbdev_window definition (introduced by [1]) by
-renaming struct fbdev_window to shadow_fbdev_window.
-
-Fixes the following buildroot compile failure ([2]):
-
-qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
- struct fbdev_window {
-        ^
-In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
-                 from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
-                 from ../../../eglfs/qeglfsglobal.h:45,
-                 from ../../../eglfs/qeglfsdeviceintegration.h:48,
-                 from qeglfsmaliintegration.h:37,
-                 from qeglfsmaliintegration.cpp:34:
-
-[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
-[2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp      | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-index 43decdf..aeba83f 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-@@ -42,7 +42,7 @@
- 
- QT_BEGIN_NAMESPACE
- 
--struct fbdev_window {
-+struct shadow_fbdev_window {
-     unsigned short width;
-     unsigned short height;
- };
-@@ -85,7 +85,7 @@ EGLNativeWindowType QEglFSMaliIntegration::createNativeWindow(QPlatformWindow *w
-     Q_UNUSED(window);
-     Q_UNUSED(format);
- 
--    fbdev_window *fbwin = reinterpret_cast<fbdev_window *>(malloc(sizeof(fbdev_window)));
-+    shadow_fbdev_window *fbwin = reinterpret_cast<shadow_fbdev_window *>(malloc(sizeof(shadow_fbdev_window)));
-     if (NULL == fbwin)
-         return 0;
- 
--- 
-2.8.1
-
diff --git a/package/qt5/qt5base/5.6.2/0001-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/5.6.3/0001-eglfs-rasp-pi-header-inclusion.patch
similarity index 100%
rename from package/qt5/qt5base/5.6.2/0001-eglfs-rasp-pi-header-inclusion.patch
rename to package/qt5/qt5base/5.6.3/0001-eglfs-rasp-pi-header-inclusion.patch
diff --git a/package/qt5/qt5base/5.6.2/qt5base.hash b/package/qt5/qt5base/5.6.3/qt5base.hash
similarity index 100%
rename from package/qt5/qt5base/5.6.2/qt5base.hash
rename to package/qt5/qt5base/5.6.3/qt5base.hash
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 4fac29a..2a073d4 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtbase-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 7fe2bb468955f633c71b3ddd3c269e68a2c4137a4e5b8dd12dcdb34cbc6d609b qtbase-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index c9d49ad..eaff6c5 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtcanvas3d-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 84a8d66c2c35b67af84376037cac71fe77a105df09ffef7906a9cb1aeafb3eea qtcanvas3d-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 4d5f3d6..fa403e3 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtconnectivity-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 2c759597ec959d54f29a3f628896d9208cf1f4e2269d8e01a9d3036f6995f3cc qtconnectivity-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5declarative/5.6.2/0001-examples-photoviewer-needs-widgets-support.patch b/package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.6.2/0001-examples-photoviewer-needs-widgets-support.patch
rename to package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch
diff --git a/package/qt5/qt5declarative/5.6.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.6.2/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
rename to package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 59eae6f..e2d63d4 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtdeclarative-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 0d40fd4de9c73b9173d8308c0dc37952bf5c747d87ff221962dd2f848d820b08 qtdeclarative-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 22f6edb..f970703 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
 sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
 
 # Hashes for license files:
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 8f539b6..08267b2 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtgraphicaleffects-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 14594e7eb4b704dd69bf336828306fe8e6537c321d49ee0b701b3b1cdd8bfb76 qtgraphicaleffects-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 34d5c28..1335759 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtimageformats-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 3a626ca0ac7ffc56b59c4b3f66aac6bc76954054cedb6938b961562228eb9df3 qtimageformats-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index c89aed7..6369efb 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtlocation-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 c81a42e44ebd4e9c33f7195e86af3deab9fde72ef0ad8dcb04acee250d356b0c qtlocation-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 25dc8a8..c3377d2 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtmultimedia-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 c9a62700024871f204e5f107894c3a339bd645bf6dbac2bcf1bff8ce46842520 qtmultimedia-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index d99d96b..4ac7932 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtquickcontrols-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 5f09ecf8648acd8abed20d727b8517e0c53cf945e83a992ee58d4baadd84bd1f qtquickcontrols-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
similarity index 100%
rename from package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 5751bec..7dec020 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtquickcontrols2-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 2b55dd3dd53b4a6abb0ceb74b7fb98a5e52e9056c71a6cdbaead5cdf9d1ac8d2 qtquickcontrols2-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index ef9f265..5257f56 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtscript-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 47807db5c2684609a0252601fda0a153530a2c97abb8c96df30f4e7897cd40f1 qtscript-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 92ed156..36162bf 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtsensors-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 79441588c9c8bd1b34b91481441614077ea335a0005e79a1dc68ad964284b5d3 qtsensors-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 8e33039..0a3155a 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtserialbus-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 bbc24bdafd0191fc808e08b19f378e74bedbb79faf4e396b66ba7ca9fed9be08 qtserialbus-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 6f8e0b1..589b859 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtserialport-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 50ed9cc22db1615bc00267d24b0819813b854af3651ab6e5ffaa7f7c7e62cd42 qtserialport-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index d19d471..a3d8e6d 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtsvg-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 ba96ebfbb60d2793547295b7122a127d21ba44cf586bfd3c8212c59d68661108 qtsvg-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index a77f423..f56e764 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qttools-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 2bb996118b68e9939c185a593837e5a41bb3667bf5d4d5134fac02598bd2d81a qttools-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index af0418d..9504c5e 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
-# hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwayland-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 035c3199f4719627b64b7020f0f4574da2b4cb78c6981aba75f27b872d8e6c86	qtwayland-opensource-src-5.6.2.tar.xz
+# hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwayland-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 f6434d03f933867dfb219abec2cf19e2c1d1ef23d46d12cb9333c8066027f6c6 qtwayland-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 92c7704..7eae4a7 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebchannel-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 9c1b4defecadd7f9ee15d5815d464abef0961fc565cc7831720fc7c0c0d13a26 qtwebchannel-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5webkit/5.6.2/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/5.6.3/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.6.2/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
rename to package/qt5/qt5webkit/5.6.3/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
diff --git a/package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch
rename to package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch
diff --git a/package/qt5/qt5webkit/5.6.2/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.6.2/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
rename to package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index eae1030..1a5e726 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.3/latest_src/submodules/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256  qtwebkit-opensource-src-5.6.3.tar.xz
 
 # hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 74303bf..c144fba 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebsockets-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 afddc1bd915ea47ccbec968a7af02e2a5405c717830e4671924fe35b55e81674 qtwebsockets-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 240fd0e..be88dd2 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtx11extras-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 db85450ad4851816a4fade1ffc10d078d28f2cca174cffa6cbd6d1220b395ac5 qtx11extras-opensource-src-5.9.2.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index af2717a..4044965 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtxmlpatterns-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 0aa6aa83087d5754cfefaa3d119454009fc2dd5f266c1eb2ea7a434cef22d34e qtxmlpatterns-opensource-src-5.9.2.tar.xz
