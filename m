From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 22:08:36 +0200
Subject: [Buildroot] [git commit] gst1-plugins-${base, good, bad,
 ugly}: bump to 1.14.1
Message-ID: <20180626211527.433FB82B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f2aef56127fbe71378e6a2d55192a0835d962ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are grouped together because several plugins have been re-arranged and
there is no way to individually update each plugin package.

Changes:

Add the following to gst1-plugins-base and remove them from plugins-bad:
 - opengl
 - gles2
 - glx
 - egl
 - x11
 - dispmanx
 - audiomixer

Add the following to plugins-good and remove them from plugins-ugly:
 - lame
 - mpg123

moved --disable-qt from plugins-bad to plugins-good

Delete upstream patch from gst1-plugins-ugly ([1])
 - 0001-x264enc-fix-build-with-newer-x264-with-support-for-m.patch

Also add hashes for the license files.

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/commit/?id=83c38dc44622611c1f67dd26e4cb383c5aef90f6

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Upate to 1.14.1]
[Removed legacy lame/mpg123 option, add Config.in.legacy handling]
[remove leftover audiomixer handling from gst1-plugins-bad.mk]
[remove upstream patch from gst1-plugins-ugly]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  80 ++++++++++++
 package/gstreamer1/gst1-plugins-bad/Config.in      | 139 +--------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   5 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  58 +--------
 package/gstreamer1/gst1-plugins-base/Config.in     | 130 +++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.hash       |   5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  63 +++++++++-
 package/gstreamer1/gst1-plugins-good/Config.in     |  12 ++
 .../gst1-plugins-good/gst1-plugins-good.hash       |   5 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  20 ++-
 ...-build-with-newer-x264-with-support-for-m.patch | 106 ----------------
 package/gstreamer1/gst1-plugins-ugly/Config.in     |  12 --
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |   5 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  16 +--
 14 files changed, 319 insertions(+), 337 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bfa96a9380..9743ebd08f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,86 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
+	bool "gst1-plugins-bad opengl option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	help
+	  The opengl option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
+	bool "gst1-plugins-bad gles2 option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2
+	help
+	  The gles2 option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
+	bool "gst1-plugins-bad glx option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
+	help
+	  The glx option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+	bool "gst1-plugins-bad egl option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	help
+	  The egl option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
+	bool "gst1-plugins-bad x11 option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
+	help
+	  The x11 option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
+	bool "gst1-plugins-bad wayland option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND
+	help
+	  The wayland option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
+	bool "gst1-plugins-bad dispmanx option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
+	help
+	  The dispmanx option has been moved from gst1-plugins-mad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
+	bool "gst1-plugins-bad audiomixer option moved to gst1-plugins-base"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER
+	help
+	  The audiomixer option has been moved from gst1-plugins-bad to
+	  gst1-plugins-base.
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
+	bool "gst1-plugins-ugly lame option moved to gst1-plugins-good"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
+	help
+	  The lame option has been moved from gst1-plugins-ugly to
+	  gst1-plugins-good.
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123
+	bool "gst1-plugins-ugly mpg123 option moved to gst1-plugins-good"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123
+	help
+	  The mpg123 option has been moved from gst1-plugins-ugly to
+	  gst1-plugins-good.
+
 config BR2_GDB_VERSION_7_11
 	bool "gdb 7.11 has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index b09e515f5a..3ce6daf544 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -9,134 +9,6 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 
 if BR2_PACKAGE_GST1_PLUGINS_BAD
 
-comment "libraries with external dependencies"
-
-menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
-	bool "opengl"
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
-
-if BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-
-comment "The opengl library needs an API, a platform and a window system"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-
-comment "APIs"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
-	bool "opengl"
-	default y
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-
-comment "opengl needs an OpenGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBGL
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
-	bool "gles2"
-	default y
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-
-comment "gles2 needs an OpenGL ES backend"
-	depends on !BR2_PACKAGE_HAS_LIBGLES
-
-comment "Platforms"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
-	bool "glx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	depends on !BR2_PACKAGE_RPI_USERLAND # x11
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	help
-	  OpenGL Extension to the X Window System
-
-comment "glx not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
-comment "glx needs the opengl API and modular X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL || \
-		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
-	bool "egl"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-
-comment "egl needs an API and an EGL backend"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API || \
-		!BR2_PACKAGE_HAS_LIBEGL
-
-comment "Window systems"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
-	bool "x11"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	depends on !BR2_PACKAGE_RPI_USERLAND
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-
-comment "x11 not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
-comment "x11 needs a platform and X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM || \
-		!BR2_PACKAGE_XORG7)
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
-	bool "wayland"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
-	depends on BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-
-comment "wayland needs the egl platform and the wayland package"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_WAYLAND
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
-	bool "dispmanx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-	help
-	  Raspberry Pi's Dispmanx windowing system
-
-comment "dispmanx needs the egl platform and rpi-userland"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_RPI_USERLAND
-
-endif
-
-comment "opengl needs an OpenGL or OpenGL ES backend"
-	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
-
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP
@@ -174,11 +46,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	help
 	  Audio filters plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
-	bool "audiomixer"
-	help
-	  Audio mixer plugin
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
 	bool "audiomixmatrix"
 	help
@@ -513,10 +380,10 @@ comment "fdk-aac needs a toolchain w/ C++"
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
-comment "gl needs the gst1-plugins-bad opengl library"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+comment "gl needs the gst1-plugins-base opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 752d50a56d..927e45b7e9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.4.tar.xz.sha256sum
-sha256 0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08 gst-plugins-bad-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.1.tar.xz.sha256sum
+sha256 2a77c6908032aafdf2cd2e5823fec948f16a25c2d1497a953828d762dc20d61a gst-plugins-bad-1.14.1.tar.xz
+sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b041014f81..53b4038f1f 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.4
+GST1_PLUGINS_BAD_VERSION = 1.14.1
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -58,8 +58,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-schro \
 	--disable-zbar \
 	--disable-spandsp \
-	--disable-gtk3 \
-	--disable-qt
+	--disable-gtk3
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -72,58 +71,13 @@ GST1_PLUGINS_BAD_CONF_ENV += \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-opengl
-GST1_PLUGINS_BAD_DEPENDENCIES += libgl libglu
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-opengl
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gles2
-GST1_PLUGINS_BAD_DEPENDENCIES += libgles
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gles2
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
-GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libXrender
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-glx
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-egl
-GST1_PLUGINS_BAD_DEPENDENCIES += libegl
-GST1_PLUGINS_BAD_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-egl
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-x11
-GST1_PLUGINS_BAD_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-x11
-endif
-
-ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
 GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dispmanx
-GST1_PLUGINS_BAD_DEPENDENCIES += rpi-userland
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dispmanx
-endif
-
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
@@ -178,12 +132,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiofxbad
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixer
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixer
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixmatrix
 else
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 6b08b68cf2..531fac4f47 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -28,6 +28,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	help
 	  Convert audio to different formats
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER
+	bool "audiomixer"
+	help
+	  Audio mixer plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE
 	bool "audiorate"
 	help
@@ -111,6 +116,131 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 
 comment "plugins with external dependencies"
 
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	bool "opengl"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+if BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	def_bool BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "The opengl library needs an API, a platform and a window system"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+
+comment "APIs"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	bool "opengl"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+
+comment "opengl needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2
+	bool "gles2"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+
+comment "gles2 needs an OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+comment "Platforms"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
+	bool "glx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	depends on !BR2_PACKAGE_RPI_USERLAND # x11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	help
+	  OpenGL Extension to the X Window System
+
+comment "glx not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "glx needs the opengl API and modular X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
+		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	bool "egl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+
+comment "egl needs an API and an EGL backend"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API || \
+		!BR2_PACKAGE_HAS_LIBEGL
+
+comment "Window systems"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
+	bool "x11"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	depends on !BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "x11 not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "x11 needs a platform and X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
+		!BR2_PACKAGE_XORG7)
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND
+	bool "wayland"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "wayland needs the egl platform and the wayland package"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
+		!BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
+	bool "dispmanx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+	help
+	  Raspberry Pi's Dispmanx windowing system
+
+comment "dispmanx needs the egl platform and rpi-userland"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
+		!BR2_PACKAGE_RPI_USERLAND
+endif
+
+comment "opengl needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	bool "alsa (mandatory for audio playback)"
 	select BR2_PACKAGE_ALSA_LIB
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index b935f2f6dc..65c9f29c2f 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.4.tar.xz.sha256sum
-sha256 4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282 gst-plugins-base-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.1.tar.xz.sha256sum
+sha256 1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc0b0db5 gst-plugins-base-1.14.1.tar.xz
+sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 10361ee3c6..3ad841bdd3 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.4
+GST1_PLUGINS_BASE_VERSION = 1.14.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -24,13 +24,64 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 
 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
 
-# These plugins are liste in the order from ./configure --help
-
+# These plugins are listed in the order from ./configure --help
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-opengl
+GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-opengl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-gles2
+GST1_PLUGINS_BASE_DEPENDENCIES += libgles
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-glx
+GST1_PLUGINS_BASE_DEPENDENCIES += xproto_glproto xlib_libXrender
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-egl
+GST1_PLUGINS_BASE_DEPENDENCIES += libegl
+GST1_PLUGINS_BASE_CONF_ENV += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-x11
+GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-dispmanx
+GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-dispmanx
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-adder
 else
@@ -49,6 +100,12 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiomixer
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiomixer
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
 else
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index eea3a3eda8..3bb98a4308 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -261,6 +261,18 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 
 comment "plugins with external dependencies"
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+	help
+	  Encode MP3s with LAME
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123
+	bool "mpg123 (*.mp3 audio)"
+	select BR2_PACKAGE_MPG123
+	help
+	  mp3 decoding based on the mpg123 library
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 	help
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index c6f6138154..1254c4cde0 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.4.tar.xz.sha256sum
-sha256 649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957 gst-plugins-good-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.1.tar.xz.sha256sum
+sha256 34ec062ddb766a32377532e039781f4a16fbc3e8b449e642605bacab26a99172 gst-plugins-good-1.14.1.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 53e2341586..26ea8a961a 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.12.4
+GST1_PLUGINS_GOOD_VERSION = 1.14.1
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -20,7 +20,8 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-osx_video \
 	--disable-aalib \
 	--disable-aalibtest \
-	--disable-libcaca
+	--disable-libcaca \
+	--disable-qt
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
@@ -175,6 +176,21 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-lame
+GST1_PLUGINS_GOOD_DEPENDENCIES += lame
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-lame
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-mpg123
+GST1_PLUGINS_GOOD_DEPENDENCIES += mpg123
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-mpg123
+endif
+
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-law
 else
diff --git a/package/gstreamer1/gst1-plugins-ugly/0001-x264enc-fix-build-with-newer-x264-with-support-for-m.patch b/package/gstreamer1/gst1-plugins-ugly/0001-x264enc-fix-build-with-newer-x264-with-support-for-m.patch
deleted file mode 100644
index c7460470ae..0000000000
--- a/package/gstreamer1/gst1-plugins-ugly/0001-x264enc-fix-build-with-newer-x264-with-support-for-m.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From ffa7ce1e19ec3930de667f213dcaedb7eb10508e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Wed, 28 Feb 2018 10:07:13 +0000
-Subject: [PATCH] x264enc: fix build with newer x264 with support for multiple
- bit depths
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libx264 used to be built for one specific bit depth, and if we
-wanted to support multiple bit depths we would have to dynamically
-load the right .so from different paths. That has changed now, and
-libx264 can include support for multiple depths in the same lib,
-so we don't need to do the dlopen() dance any more. We'll keep
-the vtable stuff around until we can drop support for older x264.
-
-gstx264enc.c:2927:36: error: ???x264_bit_depth??? undeclared
-
-https://bugzilla.gnome.org/show_bug.cgi?id=792111
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/patch/ext/x264?id=83c38dc44622611c1f67dd26e4cb383c5aef90f6
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- ext/x264/gstx264enc.c | 35 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/ext/x264/gstx264enc.c b/ext/x264/gstx264enc.c
-index 4287cf9..d1e4f2b 100644
---- a/ext/x264/gstx264enc.c
-+++ b/ext/x264/gstx264enc.c
-@@ -117,7 +117,9 @@ struct _GstX264EncVTable
- {
-   GModule *module;
- 
-+#if X264_BUILD < 153
-   const int *x264_bit_depth;
-+#endif
-   const int *x264_chroma_format;
-   void (*x264_encoder_close) (x264_t *);
-   int (*x264_encoder_delayed_frames) (x264_t *);
-@@ -170,8 +172,9 @@ load_x264 (const gchar * filename)
-         "' from '%s'. Incompatible version?", filename);
-     goto error;
-   }
--
-+#if X264_BUILD < 153
-   LOAD_SYMBOL (x264_bit_depth);
-+#endif
-   LOAD_SYMBOL (x264_chroma_format);
-   LOAD_SYMBOL (x264_encoder_close);
-   LOAD_SYMBOL (x264_encoder_delayed_frames);
-@@ -288,6 +291,7 @@ gst_x264_enc_add_x264_chroma_format (GstStructure * s,
-   return ret;
- }
- 
-+#if X264_BUILD < 153
- static gboolean
- load_x264_libraries (void)
- {
-@@ -326,6 +330,33 @@ load_x264_libraries (void)
-   return TRUE;
- }
- 
-+#else /* X264_BUILD >= 153 */
-+
-+static gboolean
-+load_x264_libraries (void)
-+{
-+#if X264_BIT_DEPTH == 0         /* all */
-+  vtable_8bit = &default_vtable;
-+  vtable_10bit = &default_vtable;
-+#elif X264_BIT_DEPTH == 8
-+  vtable_8bit = &default_vtable;
-+#elif X264_BIT_DEPTH == 10
-+  vtable_10bit = &default_vtable;
-+#else
-+#error "unexpected X264_BIT_DEPTH value"
-+#endif
-+
-+#ifdef HAVE_X264_ADDITIONAL_LIBRARIES
-+  GST_WARNING ("Ignoring configured additional libraries %s, using libx264 "
-+      "version enabled for multiple bit depths",
-+      HAVE_X264_ADDITIONAL_LIBRARIES);
-+#endif
-+
-+  return TRUE;
-+}
-+
-+#endif
-+
- enum
- {
-   ARG_0,
-@@ -2897,7 +2928,9 @@ plugin_init (GstPlugin * plugin)
-    * if needed. We can't initialize statically because these values are not
-    * constant on Windows. */
-   default_vtable.module = NULL;
-+#if X264_BUILD < 153
-   default_vtable.x264_bit_depth = &x264_bit_depth;
-+#endif
-   default_vtable.x264_chroma_format = &x264_chroma_format;
-   default_vtable.x264_encoder_close = x264_encoder_close;
-   default_vtable.x264_encoder_delayed_frames = x264_encoder_delayed_frames;
--- 
-2.16.3
-
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index c997411021..c24ec7ae7b 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -44,18 +44,6 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	help
 	  Access a DVD with dvdread
 
-config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
-	bool "lame (*.mp3 audio encoder)"
-	select BR2_PACKAGE_LAME
-	help
-	  Encode MP3s with LAME
-
-config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123
-	bool "mpg123 (*.mp3 audio)"
-	select BR2_PACKAGE_MPG123
-	help
-	  mp3 decoding based on the mpg123 library
-
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	bool "mpeg2dec"
 	select BR2_PACKAGE_LIBMPEG2
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index d0581531d4..4fe4d091a8 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.4.tar.xz.sha256sum
-sha256 1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522 gst-plugins-ugly-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.1.tar.xz.sha256sum
+sha256 cff2430bb13f54ef81409a0b3d65ce409a376d4a7bab57a14a97d602539fe1d3 gst-plugins-ugly-1.14.1.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index af02a560a8..1b4842fb92 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.12.4
+GST1_PLUGINS_UGLY_VERSION = 1.14.1
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -70,20 +70,6 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-lame
-GST1_PLUGINS_UGLY_DEPENDENCIES += lame
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-lame
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpg123
-GST1_PLUGINS_UGLY_DEPENDENCIES += mpg123
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpg123
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
