From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Apr 2017 14:13:42 +0200
Subject: [Buildroot] [PATCH 2/5] package/efl: fix coding style problems
	preported by check-package script
In-Reply-To: <20170414121345.10026-1-romain.naour@gmail.com>
References: <20170414121345.10026-1-romain.naour@gmail.com>
Message-ID: <20170414121345.10026-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index b9c4334..0785ab8 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -26,8 +26,8 @@ if BR2_PACKAGE_EFL
 
 config BR2_PACKAGE_EFL_BULLET
 	bool "Enable bullet support (recommended)"
-	select BR2_PACKAGE_BULLET
 	default y
+	select BR2_PACKAGE_BULLET
 	help
 	  If you have chosen to disable physics support, this disables
 	  lots of core functionality and is effectively never
@@ -38,8 +38,8 @@ config BR2_PACKAGE_EFL_BULLET
 
 config BR2_PACKAGE_EFL_EEZE
 	bool "Enable eeze (udev) support (recommended)"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	default y
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	help
 	  Eeze is EFL's hardware abstraction layer on top of udev.
 	  Having it off will disable some hardware detection, such as
@@ -51,8 +51,8 @@ comment "eeze needs udev /dev management"
 
 config BR2_PACKAGE_EFL_FONTCONFIG
 	bool "Enable fontconfig support (recommended)"
-	select BR2_PACKAGE_FONTCONFIG
 	default y
+	select BR2_PACKAGE_FONTCONFIG
 	help
 	  If fontconfig is disabled, this is going to make general
 	  font searching not work, and only some very direct 'load
@@ -64,9 +64,9 @@ config BR2_PACKAGE_EFL_FONTCONFIG
 
 config BR2_PACKAGE_EFL_GSTREAMER1
 	bool "Enable gstreamer1 support (recommended)"
+	default y
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	default y
 	help
 	  If Gstreamer 1.x support is disabled, it will heavily limit
 	  your media support options and render some functionality as
@@ -74,8 +74,8 @@ config BR2_PACKAGE_EFL_GSTREAMER1
 
 config BR2_PACKAGE_EFL_LIBFRIBIDI
 	bool "Enable libfribidi support (recommended)"
-	select BR2_PACKAGE_LIBFRIBIDI
 	default y
+	select BR2_PACKAGE_LIBFRIBIDI
 	help
 	  Fribidi is used for handling right-to-left text (like
 	  Arabic, Hebrew, Farsi, Persian etc.) and is very likely not
@@ -87,8 +87,8 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
 
 config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
-	select BR2_PACKAGE_LIBSNDFILE
 	default y
+	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  If you disabled audio support in Ecore, this is not tested
 	  and may create bugs for you due to it creating untested code
@@ -96,9 +96,9 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
+	default y
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
-	default y
 	help
 	  The only audio output method supported by Ecore right now is
 	  via Pulseaudio. You have disabled that and likely have
@@ -110,12 +110,12 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
+	default y
 	depends on BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	default y
 	help
 	  Libmount is used heavily inside Eeze for support of removable
 	  devices etc... and disabling this will hurt support for
@@ -144,8 +144,8 @@ config BR2_PACKAGE_EFL_EOLIAN_CPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # Eolian needs C++11
 	help
 	  Eolian is an EO object parser and code generator.
-	  With this option enabled Eolian will handle automatic generation
-	  of EFL bindings for the C++11 language.
+	  With this option enabled Eolian will handle automatic
+	  generation of EFL bindings for the C++11 language.
 
 comment "Eolian needs host and target gcc >= 4.8"
 	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -188,8 +188,8 @@ comment "Wayland support needs udev /dev management (eeze) and OpenGL ES w/ EGL,
 choice
 	bool "OpenGL support"
 	help
-	  libevas can be configured to use HW acceleration with OpenGL or
-	  OpenGL ES.
+	  libevas can be configured to use HW acceleration with OpenGL
+	  or OpenGL ES.
 
 config BR2_PACKAGE_EFL_OPENGL
 	bool "OpenGL"
@@ -219,10 +219,11 @@ config BR2_PACKAGE_EFL_ELPUT
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
-	  The elput library is an efl abstraction for the libinput library
-	  which can be used by various other subsystems (ecore_fb,
-	  ecore_drm, etc) to handle interfacing with libinput without
-	  having to duplicate the code in each subsystem.
+	  The elput library is an efl abstraction for the libinput
+	  library which can be used by various other subsystems
+	  (ecore_fb, ecore_drm, etc) to handle interfacing with
+	  libinput without having to duplicate the code in each
+	  subsystem.
 
 comment "Elput support needs udev /dev management (eeze)"
 	depends on !BR2_PACKAGE_EFL_EEZE
-- 
2.9.3
