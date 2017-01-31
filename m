From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:03 +0100
Subject: [Buildroot] [PATCH v6 1/9] qt5: add choice between version 5.6.2
	and 5.8.0
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Naumann Andreas <ANaumann@ultratronik.de>

For 5.8.0
- add hashes
- qt5 need C++11 compliant compiler since 5.7 ([1])
- use different licenses: since version 5.7 Qt removed the LGPL v2.1 option in favor
  of v3 with a different exception
- qt5base: renamed library to EglFSDeviceIntegration ([2])
- qt5base: remove ras-pi patch, commit c0cc5052097c723d0331a7619d686af9eb93d33c fix it ([3])
- qt5base: remove 0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [3b])
- qt5base: remove obsolete config-option -large ([4])
- qt5base: remove gstreamer related config-option ([5])

For 5.6.2
- moved patches to subdir

[1]  http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
[2]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
[3]  https://codereview.qt-project.org/#/c/167172/
[3b] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda
[4]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
[5]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/qt5/Config.in                              | 18 +++++++-
 package/qt5/qt5.mk                                 |  8 ++++
 package/qt5/qt53d/qt53d.hash                       |  3 ++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ------------------
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ++++++++++++++++++
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.hash                   |  3 ++
 package/qt5/qt5base/qt5base.mk                     | 13 ++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.hash   |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.mk     |  5 ++
 package/qt5/qt5declarative/qt5declarative.hash     |  3 ++
 package/qt5/qt5declarative/qt5declarative.mk       |  5 ++
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  3 ++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 ++
 package/qt5/qt5imageformats/qt5imageformats.hash   |  3 ++
 package/qt5/qt5imageformats/qt5imageformats.mk     |  5 ++
 package/qt5/qt5location/qt5location.hash           |  3 ++
 package/qt5/qt5location/qt5location.mk             |  5 ++
 package/qt5/qt5multimedia/qt5multimedia.hash       |  3 ++
 package/qt5/qt5multimedia/qt5multimedia.mk         |  5 ++
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  3 ++
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  3 ++
 package/qt5/qt5script/qt5script.hash               |  3 ++
 package/qt5/qt5sensors/qt5sensors.hash             |  3 ++
 package/qt5/qt5sensors/qt5sensors.mk               |  5 ++
 package/qt5/qt5serialbus/qt5serialbus.hash         |  3 ++
 package/qt5/qt5serialport/qt5serialport.hash       |  3 ++
 package/qt5/qt5serialport/qt5serialport.mk         |  5 ++
 package/qt5/qt5svg/qt5svg.hash                     |  3 ++
 package/qt5/qt5svg/qt5svg.mk                       |  5 ++
 package/qt5/qt5tools/qt5tools.hash                 |  3 ++
 package/qt5/qt5tools/qt5tools.mk                   |  5 ++
 package/qt5/qt5webchannel/qt5webchannel.hash       |  3 ++
 package/qt5/qt5webchannel/qt5webchannel.mk         |  5 ++
 package/qt5/qt5webkit/qt5webkit.hash               |  3 ++
 package/qt5/qt5websockets/qt5websockets.hash       |  3 ++
 package/qt5/qt5websockets/qt5websockets.mk         |  5 ++
 package/qt5/qt5x11extras/qt5x11extras.hash         |  3 ++
 package/qt5/qt5x11extras/qt5x11extras.mk           |  5 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  3 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  5 ++
 43 files changed, 271 insertions(+), 100 deletions(-)
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 234dfdd..eb97fba 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,15 +11,16 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "Qt5 needs a toolchain w/ wchar, NPTL, C++11, dynamic library"
 	depends on !BR2_PACKAGE_QT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE
@@ -30,6 +31,19 @@ menuconfig BR2_PACKAGE_QT5
 	  http://qt.io
 
 if BR2_PACKAGE_QT5
+
+choice
+	prompt "Qt5 version"
+	default BR2_QT5_VERSION_5_8
+
+config BR2_QT5_VERSION_5_8
+	bool "5.8"
+
+config BR2_QT5_VERSION_5_6
+	bool "5.6"
+
+endchoice
+
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e937e23..37d31c6 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,7 +1,15 @@
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5_VERSION_MAJOR = 5.8
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
+else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
+endif
+
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7179380..7eaf2cd 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
+sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5  qt3d-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
deleted file mode 100644
index f1f6d9b..0000000
--- a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 91c3b111e45dd476aba057836b1b618eacf90f3f Mon Sep 17 00:00:00 2001
-From: Julien Corjon <corjon.j@ecagroup.com>
-Date: Tue, 21 Jul 2015 09:58:14 +0200
-Subject: [PATCH] eglfs - fix rasp-pi header inclusion
-
-eglplateform.h include headers for low level instruction and fail on brcm
-headers inclusion
-  For the brcm presence test we use egl pkg-config file
-  For the eglfs-plugin compilation we use the egl configuration
-
-Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47339
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- config.tests/qpa/eglfs-brcm/eglfs-brcm.pro   | 2 ++
- src/plugins/platforms/eglfs/eglfs-plugin.pro | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-index ce16a3a..192a8ad 100644
---- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-+++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-@@ -1,6 +1,8 @@
- SOURCES = eglfs-brcm.cpp
- 
- CONFIG -= qt
-+CONFIG += link_pkgconfig
-+PKGCONFIG += egl
- 
- INCLUDEPATH += $$QMAKE_INCDIR_EGL
- 
-diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-index 0f493fd..8479496 100644
---- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
-+++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-@@ -6,6 +6,7 @@ PLUGIN_CLASS_NAME = QEglFSIntegrationPlugin
- load(qt_plugin)
- 
- QT += platformsupport-private eglfs_device_lib-private
-+CONFIG += egl
- 
- SOURCES += $$PWD/qeglfsmain.cpp
- 
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
deleted file mode 100644
index cbafb39..0000000
--- a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
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
diff --git a/package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
new file mode 100644
index 0000000..f1f6d9b
--- /dev/null
+++ b/package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
@@ -0,0 +1,45 @@
+From 91c3b111e45dd476aba057836b1b618eacf90f3f Mon Sep 17 00:00:00 2001
+From: Julien Corjon <corjon.j@ecagroup.com>
+Date: Tue, 21 Jul 2015 09:58:14 +0200
+Subject: [PATCH] eglfs - fix rasp-pi header inclusion
+
+eglplateform.h include headers for low level instruction and fail on brcm
+headers inclusion
+  For the brcm presence test we use egl pkg-config file
+  For the eglfs-plugin compilation we use the egl configuration
+
+Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47339
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+---
+ config.tests/qpa/eglfs-brcm/eglfs-brcm.pro   | 2 ++
+ src/plugins/platforms/eglfs/eglfs-plugin.pro | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
+index ce16a3a..192a8ad 100644
+--- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
++++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
+@@ -1,6 +1,8 @@
+ SOURCES = eglfs-brcm.cpp
+ 
+ CONFIG -= qt
++CONFIG += link_pkgconfig
++PKGCONFIG += egl
+ 
+ INCLUDEPATH += $$QMAKE_INCDIR_EGL
+ 
+diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
+index 0f493fd..8479496 100644
+--- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
++++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
+@@ -6,6 +6,7 @@ PLUGIN_CLASS_NAME = QEglFSIntegrationPlugin
+ load(qt_plugin)
+ 
+ QT += platformsupport-private eglfs_device_lib-private
++CONFIG += egl
+ 
+ SOURCES += $$PWD/qeglfsmain.cpp
+ 
+-- 
+2.1.0
+
diff --git a/package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
new file mode 100644
index 0000000..cbafb39
--- /dev/null
+++ b/package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
@@ -0,0 +1,53 @@
+From b6c602e4264021f98ec2c72316e2a2000bf35e82 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 14 Nov 2016 23:42:25 +0100
+Subject: [PATCH] eglfs: fix eglfs_mali compile for odroid-mali
+
+Avoid duplicated struct fbdev_window definition (introduced by [1]) by
+renaming struct fbdev_window to shadow_fbdev_window.
+
+Fixes the following buildroot compile failure ([2]):
+
+qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
+ struct fbdev_window {
+        ^
+In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
+                 from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
+                 from ../../../eglfs/qeglfsglobal.h:45,
+                 from ../../../eglfs/qeglfsdeviceintegration.h:48,
+                 from qeglfsmaliintegration.h:37,
+                 from qeglfsmaliintegration.cpp:34:
+
+[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
+[2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+index 43decdf..aeba83f 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+@@ -42,7 +42,7 @@
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-struct fbdev_window {
++struct shadow_fbdev_window {
+     unsigned short width;
+     unsigned short height;
+ };
+@@ -85,7 +85,7 @@ EGLNativeWindowType QEglFSMaliIntegration::createNativeWindow(QPlatformWindow *w
+     Q_UNUSED(window);
+     Q_UNUSED(format);
+ 
+-    fbdev_window *fbwin = reinterpret_cast<fbdev_window *>(malloc(sizeof(fbdev_window)));
++    shadow_fbdev_window *fbwin = reinterpret_cast<shadow_fbdev_window *>(malloc(sizeof(shadow_fbdev_window)));
+     if (NULL == fbwin)
+         return 0;
+ 
+-- 
+2.8.1
+
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 9808e9b..3f6af8a 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtbase-opensource-src-5.8.0.tar.xz
+sha256 c17111ae02a44dc7be1ec2cf979a47ee9e58edf4904041a525c21f4fa53fc005  qtbase-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbbaf0f..c09bf58 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -41,12 +41,19 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
+ifeq ($(BR2_QT5_VERSION_5_6),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
+endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5BASE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
 QT5BASE_LICENSE_FILES += header.BSD
@@ -158,12 +165,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
 # gstreamer 0.10 support is broken in qt5multimedia
+ifeq ($(BR2_QT5_VERSION_5_6),y)
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
 QT5BASE_DEPENDENCIES   += gst1-plugins-base
 else
 QT5BASE_CONFIGURE_OPTS += -no-gstreamer
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 QT5BASE_CONFIGURE_OPTS += -libinput
@@ -181,7 +190,11 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
+else
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
+endif
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 01819e4..2d84fe4 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtcanvas3d-opensource-src-5.8.0.tar.xz
+sha256 5446f790f526f582df7790e1e1442357f61aac9c23ea9b00d4a791c9d78ccaa3  qtcanvas3d-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 4574f3d..d6b841a 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtconnectivity-opensource-src-5.8.0.tar.xz
+sha256 7b2d01e9d67f6390a9e64bdae62e81a965b0f0b21137cf1a021e08a28bb227f1  qtconnectivity-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index c0a4d40..b005a6f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -11,8 +11,13 @@ QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5CONNECTIVITY_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5CONNECTIVITY_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index d8d3a68..98a46f1 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtdeclarative-opensource-src-5.8.0.tar.xz
+sha256 32941eb9ad12d8735dfc64de8b50b5ab830a6d8705a421c57369de7cb5708a46  qtdeclarative-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index be3a7b7..7cb3fcc 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,8 +11,13 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5DECLARATIVE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5DECLARATIVE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index ae29e3b..ac4167b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtgraphicaleffects-opensource-src-5.8.0.tar.xz
+sha256 5f2a9b50530ac83d7c2b2ce73fbdf03ac61f83a9521e9d4b796fa17a969dd919  qtgraphicaleffects-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 223374a..36cc686 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -11,8 +11,13 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5GRAPHICALEFFECTS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5GRAPHICALEFFECTS_LICENSE = Commercial license
 QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 54b58e4..0a63523 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtimageformats-opensource-src-5.8.0.tar.xz
+sha256 75045eeac11c96194260badbdb4d3e9eb7b7f9972d18d3491230ea820be4606f  qtimageformats-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 921656d..4aad31e 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -11,8 +11,13 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5IMAGEFORMATS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5IMAGEFORMATS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5IMAGEFORMATS_LICENSE = Commercial license
 QT5IMAGEFORMATS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 374952f..6afc918 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtlocation-opensource-src-5.8.0.tar.xz
+sha256 48a1e39ed989f0133aeacaa379e9c3958ec9b08c043626bba503619891d21abb  qtlocation-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 358b162..2d9738e 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -11,8 +11,13 @@ QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5LOCATION_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5LOCATION_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5LOCATION_LICENSE = Commercial license
 QT5LOCATION_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 56a11fb..ffd8a77 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtmultimedia-opensource-src-5.8.0.tar.xz
+sha256 a8bc044834f95208261915feefe5e2fdb6761b76f0f99e21062963bd9f9d4a07  qtmultimedia-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 3075ffc..7ce947a 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,13 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5MULTIMEDIA_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5MULTIMEDIA_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 6db589d..95657d2 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols-opensource-src-5.8.0.tar.xz
+sha256 04e70d0ccfd9ba882691a5e8f81e3428ae1b72a76bb9f43ba242f1c33bd7b326  qtquickcontrols-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 0d85d48..80a3103 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols2-opensource-src-5.8.0.tar.xz
+sha256 b099866ec74f13cf0047274c61f0486d1eba27716fa07b69f682c54d3a4ade1b  qtquickcontrols2-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index c8ecb75..6e369d8 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtscript-opensource-src-5.8.0.tar.xz
+sha256 293ab91d2d189d889dc80609aa259190fb7de636d360e904784a5ce1a45e5ad3  qtscript-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 65cd127..307ad6f 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsensors-opensource-src-5.8.0.tar.xz
+sha256 3a5d0639ecf8cd30c8ca349c353a8f3c424889b53831e70b6d8c481fc45de796  qtsensors-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 0dd952a..88378ab 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -11,8 +11,13 @@ QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5SENSORS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SENSORS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SENSORS_LICENSE = Commercial license
 QT5SENSORS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 308c365..f15945c 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialbus-opensource-src-5.8.0.tar.xz
+sha256 58343dd9f2e339d4900a2d4b54ee25ed959cf62bacb012fe61e6b99d7958c10a  qtserialbus-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 2458e5d..18c590b 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialport-opensource-src-5.8.0.tar.xz
+sha256 52317fded73ad0beb0a2ecf93124a8e2dfdcf14270a762c1f4fd06fb075506ad  qtserialport-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 04df021..c6b7d03 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -11,8 +11,13 @@ QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5SERIALPORT_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SERIALPORT_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SERIALPORT_LICENSE = Commercial license
 QT5SERIALPORT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 0c9e9eb..6855e85 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsvg-opensource-src-5.8.0.tar.xz
+sha256 9873191c211ab4da9c0bc47b1e3549f475db4d448bba3175e0f86b24eefadc89  qtsvg-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index ebd5cba..3f6965a 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,8 +11,13 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5SVG_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SVG_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index cc11b28..541d95b 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qttools-opensource-src-5.8.0.tar.xz
+sha256 95ec8e76d393b6ba26ffff5041fce41946d2bf3aec1402c6533e24d9fc269d83  qttools-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 6befb8b..8e75ad1 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -20,8 +20,13 @@ QT5TOOLS_DEPENDENCIES += qt5declarative
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5TOOLS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5TOOLS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5TOOLS_LICENSE = Commercial license
 QT5TOOLS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 0f9eaae..7fd01efb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebchannel-opensource-src-5.8.0.tar.xz
+sha256 5bf5b15413baa235ee2cbfd136ea3b9303b32879b54f9f25bfb4dc96d37d0b4a  qtwebchannel-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index c48757b..f1d1e74 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -11,8 +11,13 @@ QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5WEBCHANNEL_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5WEBCHANNEL_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 309f776..4431e2d 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebkit-opensource-src-5.8.0.tar.xz
+sha256 79ae8660086bf92ffb0008b17566270e6477c8fa0daf9bb3ac29404fb5911bec  qtwebkit-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3443476..a91e084 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebsockets-opensource-src-5.8.0.tar.xz
+sha256 aa110af297d0d3239f346c3ee0cd43621adf463eb62a04941bbfe3fcccb845f5  qtwebsockets-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 9771556..51d4a53 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,8 +11,13 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5WEBSOCKETS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools)
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
+else
 QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 297c578..eb0dc6c 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtx11extras-opensource-src-5.8.0.tar.xz
+sha256 bed7f2b5123a9849ec94afa67db5f296e6f527c6330f47a680c83586d3a4280e  qtx11extras-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index a0e1209..2573745 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -11,8 +11,13 @@ QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5X11EXTRAS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5X11EXTRAS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5X11EXTRAS_LICENSE = Commercial license
 QT5X11EXTRAS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index fa4e97f..c1bb663 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtxmlpatterns-opensource-src-5.8.0.tar.xz
+sha256 7bffa65ea52e54fb1314b45222888612d55eaf51a936a6119b8756266439da04  qtxmlpatterns-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 9fc44df..6aa85a0 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,13 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_5_8),y)
+QT5XMLPATTERNS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3c (examples)
 endif
-- 
2.7.4
