From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:20:50 +0200
Subject: [Buildroot] [git commit] package/libegl: rename the _HAS and
	_PROVIDES variables
Message-ID: <20140405172338.A3C259C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bb9df30ad8736567dd4f9244e255ddb37171d1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The basic rule for a package is to have its options named
after the package name. There is no reason this should not
also be the case for virtual packages.

Besides, this will allow us to switch libegl to use the
soon-to-be-introduced virtual-package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |    4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in    |    2 +-
 package/mesa3d/Config.in                         |    4 ++--
 package/opengl/libegl/Config.in                  |    6 +++---
 package/opengl/libegl/libegl.mk                  |    4 ++--
 package/qt/Config.in                             |    2 +-
 package/qt5/qt5base/Config.in                    |    4 ++--
 package/qt5/qt5declarative/Config.in             |    4 ++--
 package/qt5/qt5graphicaleffects/Config.in        |    4 ++--
 package/qt5/qt5multimedia/Config.in              |    4 ++--
 package/qt5/qt5quick1/Config.in                  |    4 ++--
 package/qt5/qt5quickcontrols/Config.in           |    4 ++--
 package/rpi-userland/Config.in                   |    4 ++--
 package/sunxi-mali/Config.in                     |    4 ++--
 package/ti-gfx/Config.in                         |    4 ++--
 package/xbmc/Config.in                           |    4 ++--
 16 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 379402d..864c605 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -4,7 +4,7 @@ comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
@@ -24,7 +24,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0737140..0e4765c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -464,7 +464,7 @@ comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
 	bool "eglgles"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
 	help
 	  EGL/GLES sink
 
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8f2b649..54aca4b 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -92,7 +92,7 @@ depends on BR2_PACKAGE_MESA3D_DRIVER
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "EGL"
 	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_LIBEGL
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
 	  similar to GLX, for X, and WGL, for Windows.
@@ -106,7 +106,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endmenu
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
index 2d81a20..8401bb2 100644
--- a/package/opengl/libegl/Config.in
+++ b/package/opengl/libegl/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_HAS_OPENGL_EGL
+config BR2_PACKAGE_HAS_LIBEGL
 	bool
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	string
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 3311e50..2e399ce 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LIBEGL_SOURCE =
-LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_EGL))
+LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBEGL))
 
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 ifeq ($(LIBEGL_DEPENDENCIES),)
 $(error No libEGL implementation selected. Configuration error.)
 endif
diff --git a/package/qt/Config.in b/package/qt/Config.in
index d3f6a5a..eed25c8 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -295,7 +295,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 config BR2_PACKAGE_QT_OPENGL_ES
 	bool "OpenGL ES v2.x support"
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	help
 	  Enable the OpenGL ES v2.x support.
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 437b1d2..5d5b7f6 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -137,11 +137,11 @@ comment "X.org XCB backend available if X.org is enabled"
 
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 
 comment "eglfs backend available if OpenGLES and EGL are enabled"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
 
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 5e1516d..4a6e805 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_EGLFS
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  http://qt-project.org
 
 comment "qt5declarative requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index a821b40..2747af8 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	  http://qt-project.org
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 765bdc1..c00491c 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	bool "qt5multimedia"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  http://qt-project.org
 
 comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 1ffcc0d..30c2e79 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5DECLARATIVE
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -21,5 +21,5 @@ config BR2_PACKAGE_QT5QUICK1
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES || \
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 355aef0..c350a74 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -15,5 +15,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  http://qt-project.org
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 68b535b..4a82c9d 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_OPENVG
 	select BR2_PACKAGE_HAS_OPENMAX
@@ -19,7 +19,7 @@ config BR2_PACKAGE_RPI_USERLAND
 
 if BR2_PACKAGE_RPI_USERLAND
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "rpi-userland"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index c47b6a3..c95ebbb 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	# The egl/gles mali libraries are provided as a git submodule of the
 	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SUNXI_MALI
 
 if BR2_PACKAGE_SUNXI_MALI
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "sunxi-mali"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 2bdc972..3e8648e 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
@@ -11,7 +11,7 @@ config BR2_PACKAGE_TI_GFX
 
 if BR2_PACKAGE_TI_GFX
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "ti-gfx"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index fcc6abf..70faaab 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -2,7 +2,7 @@ comment "xbmc needs an (e)glibc toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -59,7 +59,7 @@ menuconfig BR2_PACKAGE_XBMC
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
 	help
 	  XBMC is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
