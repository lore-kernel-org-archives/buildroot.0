From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:42:22 +0100
Subject: [Buildroot] [git commit] package/efl: rename libefl to efl
Message-ID: <20151220134303.E7EA581E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f83a7a7261cf100d1d69693d6a202f469684f37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allow to keep backward compatibility with older
defconfig files that used BR2_PACKAGE_EFL.

Don't add Config.in.legacy entry for libefl since it's
not part of any Buildroot release.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  20 +--
 package/Config.in                                  |   2 +-
 package/dbus-cpp/dbus-cpp.mk                       |   2 +-
 ...ecore_fb_private.h-define-EAPI-before-use.patch |   0
 .../0002-ecore_x-Remove-XPrint-usage.patch         |   0
 package/{libefl => efl}/Config.in                  |  60 ++++----
 package/{libefl/libefl.hash => efl/efl.hash}       |   0
 package/{libefl/libefl.mk => efl/efl.mk}           | 170 ++++++++++-----------
 package/elementary/elementary.mk                   |   4 +-
 package/enlightenment/Config.in                    |   6 +-
 package/enlightenment/enlightenment.mk             |   4 +-
 package/expedite/expedite.mk                       |   4 +-
 .../libevas-generic-loaders.mk                     |   2 +-
 13 files changed, 137 insertions(+), 137 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f4c462a..a21ea82 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -174,70 +174,70 @@ config BR2_PACKAGE_LIBEINA
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeina is now provided by the libefl package.
+	  With EFL 1.15, libeina is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEET
 	bool "libeet package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeet is now provided by the libefl package.
+	  With EFL 1.15, libeet is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libevas is now provided by the libefl package.
+	  With EFL 1.15, libevas is now provided by the efl package.
 
 config BR2_PACKAGE_LIBECORE
 	bool "libecore package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libecore is now provided by the libefl package.
+	  With EFL 1.15, libecore is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libedbus is now provided by the libefl package.
+	  With EFL 1.15, libedbus is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libefreet is now provided by the libefl package.
+	  With EFL 1.15, libefreet is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEIO
 	bool "libeio package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeio is now provided by the libefl package.
+	  With EFL 1.15, libeio is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libembryo is now provided by the libefl package.
+	  With EFL 1.15, libembryo is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libedje is now provided by the libefl package.
+	  With EFL 1.15, libedje is now provided by the efl package.
 
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libethumb is now provided by the libefl package.
+	  With EFL 1.15, libethumb is now provided by the efl package.
 
 config BR2_PACKAGE_INFOZIP
 	bool "infozip option has been renamed to zip"
diff --git a/package/Config.in b/package/Config.in
index 53e8988..40969fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ comment "Graphic libraries"
 	source "package/cegui06/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
+	source "package/efl/Config.in"
 	source "package/elementary/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
@@ -253,7 +254,6 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
-	source "package/libefl/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 9236ba7..0b51967 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -28,7 +28,7 @@ DBUS_CPP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_EFL),y)
 DBUS_CPP_CONF_OPTS += --enable-ecore
-DBUS_CPP_DEPENDENCIES += libefl
+DBUS_CPP_DEPENDENCIES += efl
 else
 DBUS_CPP_CONF_OPTS += --disable-ecore
 endif
diff --git a/package/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
similarity index 100%
rename from package/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
rename to package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
diff --git a/package/libefl/0002-ecore_x-Remove-XPrint-usage.patch b/package/efl/0002-ecore_x-Remove-XPrint-usage.patch
similarity index 100%
rename from package/libefl/0002-ecore_x-Remove-XPrint-usage.patch
rename to package/efl/0002-ecore_x-Remove-XPrint-usage.patch
diff --git a/package/libefl/Config.in b/package/efl/Config.in
similarity index 81%
rename from package/libefl/Config.in
rename to package/efl/Config.in
index 08c29fc..fd3498e 100644
--- a/package/libefl/Config.in
+++ b/package/efl/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LIBEFL
-	bool "libefl"
+config BR2_PACKAGE_EFL
+	bool "efl"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	depends on BR2_PACKAGE_LUA # lua 5.1 or better
@@ -20,9 +20,9 @@ config BR2_PACKAGE_LIBEFL
 
 	  https://enlightenment.org
 
-if BR2_PACKAGE_LIBEFL
+if BR2_PACKAGE_EFL
 
-config BR2_PACKAGE_LIBEFL_BULLET
+config BR2_PACKAGE_EFL_BULLET
 	bool "Enable bullet support (recommended)"
 	select BR2_PACKAGE_BULLET
 	default y
@@ -34,7 +34,7 @@ config BR2_PACKAGE_LIBEFL_BULLET
 	  simply not tested so you are on your own in terms of
 	  ensuring everything works if you do this.
 
-config BR2_PACKAGE_LIBEFL_FONTCONFIG
+config BR2_PACKAGE_EFL_FONTCONFIG
 	bool "Enable fontconfig support (recommended)"
 	select BR2_PACKAGE_FONTCONFIG
 	default y
@@ -47,7 +47,7 @@ config BR2_PACKAGE_LIBEFL_FONTCONFIG
 	  lead to visual problems like missing text in many UI areas
 	  etc...
 
-config BR2_PACKAGE_LIBEFL_GSTREAMER1
+config BR2_PACKAGE_EFL_GSTREAMER1
 	bool "Enable gstreamer1 support (recommended)"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
@@ -57,7 +57,7 @@ config BR2_PACKAGE_LIBEFL_GSTREAMER1
 	  your media support options and render some functionality as
 	  useless, leading to visible application bugs.
 
-config BR2_PACKAGE_LIBEFL_LIBFRIBIDI
+config BR2_PACKAGE_EFL_LIBFRIBIDI
 	bool "Enable libfribidi support (recommended)"
 	select BR2_PACKAGE_LIBFRIBIDI
 	default y
@@ -70,7 +70,7 @@ config BR2_PACKAGE_LIBEFL_LIBFRIBIDI
 	  so you may also trigger code paths with bugs that are never
 	  normally used.
 
-config BR2_PACKAGE_LIBEFL_LIBSNDFILE
+config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	select BR2_PACKAGE_LIBSNDFILE
 	default y
@@ -79,7 +79,7 @@ config BR2_PACKAGE_LIBEFL_LIBSNDFILE
 	  and may create bugs for you due to it creating untested code
 	  paths.  Reconsider disabling audio.
 
-config BR2_PACKAGE_LIBEFL_PULSEAUDIO
+config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
@@ -93,7 +93,7 @@ config BR2_PACKAGE_LIBEFL_PULSEAUDIO
 	  NOTE: multisense support is automatically enabled with
 	  pulseaudio.
 
-config BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
+config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	default y
@@ -102,26 +102,26 @@ config BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
 	  devices etc... and disabling this will hurt support for
 	  Enlightenment and its filemanager.
 
-config BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG
+config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
-	default y if BR2_PACKAGE_LIBEFL_BULLET && \
-		BR2_PACKAGE_LIBEFL_FONTCONFIG && \
-		BR2_PACKAGE_LIBEFL_GSTREAMER1 && \
-		BR2_PACKAGE_LIBEFL_LIBFRIBIDI && \
-		BR2_PACKAGE_LIBEFL_LIBSNDFILE && \
-		BR2_PACKAGE_LIBEFL_PULSEAUDIO && \
-		BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
+	default y if BR2_PACKAGE_EFL_BULLET && \
+		BR2_PACKAGE_EFL_FONTCONFIG && \
+		BR2_PACKAGE_EFL_GSTREAMER1 && \
+		BR2_PACKAGE_EFL_LIBFRIBIDI && \
+		BR2_PACKAGE_EFL_LIBSNDFILE && \
+		BR2_PACKAGE_EFL_PULSEAUDIO && \
+		BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 
 
 comment "Warning: one of the recommended option for EFL is not enabled"
-	depends on !BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG
+	depends on !BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 
 comment "libecore video support"
 
-config BR2_PACKAGE_LIBEFL_FB
+config BR2_PACKAGE_EFL_FB
 	bool "FB support"
 
-config BR2_PACKAGE_LIBEFL_X_XLIB
+config BR2_PACKAGE_EFL_X_XLIB
 	bool "X11 support (xlib)"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -139,52 +139,52 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
 
 comment "libevas loaders"
 
-config BR2_PACKAGE_LIBEFL_PNG
+config BR2_PACKAGE_EFL_PNG
 	bool "libevas png loader"
 	select BR2_PACKAGE_LIBPNG
 	help
 	  This enables the loader code that loads png files using
 	  libpng.
 
-config BR2_PACKAGE_LIBEFL_JP2K
+config BR2_PACKAGE_EFL_JP2K
 	bool "libevas jp2k loader"
 	select BR2_PACKAGE_OPENJPEG
 	help
 	  This enables the loader code that loads jp2k files using
 	  openjpeg.
 
-config BR2_PACKAGE_LIBEFL_JPEG
+config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
 	help
 	  This enables the loader code that loads jpeg files using
 	  libjpeg.
 
-config BR2_PACKAGE_LIBEFL_GIF
+config BR2_PACKAGE_EFL_GIF
 	bool "libevas gif loader"
 	select BR2_PACKAGE_GIFLIB
 	help
 	  This enables the loader code that loads gif files using
 	  libungif.
 
-config BR2_PACKAGE_LIBEFL_TIFF
+config BR2_PACKAGE_EFL_TIFF
 	bool "libevas tiff loader"
 	select BR2_PACKAGE_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
-config BR2_PACKAGE_LIBEFL_WEBP
+config BR2_PACKAGE_EFL_WEBP
 	bool "libevas webp image loader"
 	select BR2_PACKAGE_WEBP
 	help
 	  This enables the loader code that loads images using WebP.
 
-endif # BR2_PACKAGE_LIBEFL
+endif # BR2_PACKAGE_EFL
 
-comment "LIBEFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
+comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
-comment "LIBEFL needs lua"
+comment "efl needs lua"
 	depends on !BR2_PACKAGE_LUA
 	depends on BR2_USE_MMU
diff --git a/package/libefl/libefl.hash b/package/efl/efl.hash
similarity index 100%
rename from package/libefl/libefl.hash
rename to package/efl/efl.hash
diff --git a/package/libefl/libefl.mk b/package/efl/efl.mk
similarity index 57%
rename from package/libefl/libefl.mk
rename to package/efl/efl.mk
index f08a4fb..014e010 100644
--- a/package/libefl/libefl.mk
+++ b/package/efl/efl.mk
@@ -1,14 +1,14 @@
 ################################################################################
 #
-# libefl
+# efl
 #
 ################################################################################
 
-LIBEFL_VERSION = 1.15.2
-LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
-LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
-LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
-LIBEFL_LICENSE_FILES = \
+EFL_VERSION = 1.15.2
+EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
+EFL_SITE = http://download.enlightenment.org/rel/libs/efl
+EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
+EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
 	licenses/COPYING.BSD \
@@ -17,16 +17,16 @@ LIBEFL_LICENSE_FILES = \
 	licenses/COPYING.LGPL \
 	licenses/COPYING.SMALL
 
-LIBEFL_INSTALL_STAGING = YES
+EFL_INSTALL_STAGING = YES
 
-LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev \
+EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev \
 	util-linux zlib
 
 # Regenerate the autotools:
 #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
 #  - to remove dependency on libXp: https://phab.enlightenment.org/D3150
-LIBEFL_AUTORECONF = YES
-LIBEFL_GETTEXTIZE = YES
+EFL_AUTORECONF = YES
+EFL_GETTEXTIZE = YES
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
@@ -35,7 +35,7 @@ LIBEFL_GETTEXTIZE = YES
 # --disable-xinput22: disable X11 XInput v2.2+ support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-opengl=none: disable opengl support.
-LIBEFL_CONF_OPTS = \
+EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
@@ -46,113 +46,113 @@ LIBEFL_CONF_OPTS = \
 	--with-opengl=none
 
 # Disable untested configuration warning.
-ifeq ($(BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG),)
-LIBEFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
-LIBEFL_DEPENDENCIES += util-linux
-LIBEFL_CONF_OPTS += --enable-libmount
+EFL_DEPENDENCIES += util-linux
+EFL_CONF_OPTS += --enable-libmount
 else
-LIBEFL_CONF_OPTS += --disable-libmount
+EFL_CONF_OPTS += --disable-libmount
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-LIBEFL_CONF_OPTS += --enable-fontconfig
-LIBEFL_DEPENDENCIES += fontconfig
+EFL_CONF_OPTS += --enable-fontconfig
+EFL_DEPENDENCIES += fontconfig
 else
-LIBEFL_CONF_OPTS += --disable-fontconfig
+EFL_CONF_OPTS += --disable-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-LIBEFL_CONF_OPTS += --enable-fribidi
-LIBEFL_DEPENDENCIES += libfribidi
+EFL_CONF_OPTS += --enable-fribidi
+EFL_DEPENDENCIES += libfribidi
 else
-LIBEFL_CONF_OPTS += --disable-fribidi
+EFL_CONF_OPTS += --disable-fribidi
 endif
 
 ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
-LIBEFL_CONF_OPTS += --enable-gstreamer1
-LIBEFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
+EFL_CONF_OPTS += --enable-gstreamer1
+EFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-LIBEFL_CONF_OPTS += --disable-gstreamer1
+EFL_CONF_OPTS += --disable-gstreamer1
 endif
 
 ifeq ($(BR2_PACKAGE_BULLET),y)
-LIBEFL_CONF_OPTS += --enable-physics
-LIBEFL_DEPENDENCIES += bullet
+EFL_CONF_OPTS += --enable-physics
+EFL_DEPENDENCIES += bullet
 else
-LIBEFL_CONF_OPTS += --disable-physics
+EFL_CONF_OPTS += --disable-physics
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-LIBEFL_CONF_OPTS += --enable-audio
-LIBEFL_DEPENDENCIES += libsndfile
+EFL_CONF_OPTS += --enable-audio
+EFL_DEPENDENCIES += libsndfile
 else
-LIBEFL_CONF_OPTS += --disable-audio
+EFL_CONF_OPTS += --disable-audio
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-LIBEFL_CONF_OPTS += --enable-pulseaudio
-LIBEFL_DEPENDENCIES += pulseaudio
+EFL_CONF_OPTS += --enable-pulseaudio
+EFL_DEPENDENCIES += pulseaudio
 else
-LIBEFL_CONF_OPTS += --disable-pulseaudio
+EFL_CONF_OPTS += --disable-pulseaudio
 endif
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
-LIBEFL_DEPENDENCIES += harfbuzz
-LIBEFL_CONF_OPTS += --enable-harfbuzz
+EFL_DEPENDENCIES += harfbuzz
+EFL_CONF_OPTS += --enable-harfbuzz
 else
-LIBEFL_CONF_OPTS += --disable-harfbuzz
+EFL_CONF_OPTS += --disable-harfbuzz
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
-LIBEFL_DEPENDENCIES += tslib
-LIBEFL_CONF_OPTS += --enable-tslib
+EFL_DEPENDENCIES += tslib
+EFL_CONF_OPTS += --enable-tslib
 else
-LIBEFL_CONF_OPTS += --disable-tslib
+EFL_CONF_OPTS += --disable-tslib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBEFL_DEPENDENCIES += libglib2
-LIBEFL_CONF_OPTS += --with-glib=yes
+EFL_DEPENDENCIES += libglib2
+EFL_CONF_OPTS += --with-glib=yes
 else
-LIBEFL_CONF_OPTS += --with-glib=no
+EFL_CONF_OPTS += --with-glib=no
 endif
 
 # Prefer openssl (the default) over gnutls.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEFL_DEPENDENCIES += openssl
-LIBEFL_CONF_OPTS += --with-crypto=openssl
+EFL_DEPENDENCIES += openssl
+EFL_CONF_OPTS += --with-crypto=openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBEFL_DEPENDENCIES += gnutls libgcrypt
-LIBEFL_CONF_OPTS += --with-crypto=gnutls \
+EFL_DEPENDENCIES += gnutls libgcrypt
+EFL_CONF_OPTS += --with-crypto=gnutls \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-LIBEFL_CONF_OPTS += --with-crypto=none
+EFL_CONF_OPTS += --with-crypto=none
 endif # BR2_PACKAGE_OPENSSL
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBEFL_DEPENDENCIES += wayland libxkbcommon
-LIBEFL_CONF_OPTS += --enable-wayland
+EFL_DEPENDENCIES += wayland libxkbcommon
+EFL_CONF_OPTS += --enable-wayland
 else
-LIBEFL_CONF_OPTS += --disable-wayland
+EFL_CONF_OPTS += --disable-wayland
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_FB),y)
-LIBEFL_CONF_OPTS += --enable-fb
+ifeq ($(BR2_PACKAGE_EFL_FB),y)
+EFL_CONF_OPTS += --enable-fb
 else
-LIBEFL_CONF_OPTS += --disable-fb
+EFL_CONF_OPTS += --disable-fb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
-LIBEFL_CONF_OPTS += \
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
+EFL_CONF_OPTS += \
 	--with-x11=xlib \
 	--with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
 
-LIBEFL_DEPENDENCIES += \
+EFL_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXcomposite \
 	xlib_libXcursor \
@@ -164,59 +164,59 @@ LIBEFL_DEPENDENCIES += \
 	xlib_libXScrnSaver \
 	xlib_libXtst
 else
-LIBEFL_CONF_OPTS += --with-x11=none
+EFL_CONF_OPTS += --with-x11=none
 endif
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-png=yes
-LIBEFL_DEPENDENCIES += libpng
+ifeq ($(BR2_PACKAGE_EFL_PNG),y)
+EFL_CONF_OPTS += --enable-image-loader-png=yes
+EFL_DEPENDENCIES += libpng
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-png
+EFL_CONF_OPTS += --disable-image-loader-png
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_JPEG),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-jpeg=yes
-# libefl already depends on jpeg.
+ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
+EFL_CONF_OPTS += --enable-image-loader-jpeg=yes
+# efl already depends on jpeg.
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-jpeg
+EFL_CONF_OPTS += --disable-image-loader-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_GIF),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-gif=yes
-LIBEFL_DEPENDENCIES += giflib
+ifeq ($(BR2_PACKAGE_EFL_GIF),y)
+EFL_CONF_OPTS += --enable-image-loader-gif=yes
+EFL_DEPENDENCIES += giflib
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-gif
+EFL_CONF_OPTS += --disable-image-loader-gif
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_TIFF),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-tiff=yes
-LIBEFL_DEPENDENCIES += tiff
+ifeq ($(BR2_PACKAGE_EFL_TIFF),y)
+EFL_CONF_OPTS += --enable-image-loader-tiff=yes
+EFL_DEPENDENCIES += tiff
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-tiff
+EFL_CONF_OPTS += --disable-image-loader-tiff
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_JP2K),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=yes
-LIBEFL_DEPENDENCIES += openjpeg
+ifeq ($(BR2_PACKAGE_EFL_JP2K),y)
+EFL_CONF_OPTS += --enable-image-loader-jp2k=yes
+EFL_DEPENDENCIES += openjpeg
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-jp2k
+EFL_CONF_OPTS += --disable-image-loader-jp2k
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
-LIBEFL_DEPENDENCIES += webp
+ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
+EFL_CONF_OPTS += --enable-image-loader-webp=yes
+EFL_DEPENDENCIES += webp
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-webp
+EFL_CONF_OPTS += --disable-image-loader-webp
 endif
 
 $(eval $(autotools-package))
 
 ################################################################################
 #
-# host-libefl
+# host-efl
 #
 ################################################################################
 
@@ -229,7 +229,7 @@ $(eval $(autotools-package))
 # * host-libglib2: for libecore
 # * host-libjpeg, host-libpng: for libevas image loader
 # * host-lua: disable luajit dependency
-HOST_LIBEFL_DEPENDENCIES = \
+HOST_EFL_DEPENDENCIES = \
 	host-pkgconf \
 	host-dbus \
 	host-freetype \
@@ -254,7 +254,7 @@ HOST_LIBEFL_DEPENDENCIES = \
 # --with-crypto=none: remove dependencies on openssl or gnutls.
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
-HOST_LIBEFL_CONF_OPTS += \
+HOST_EFL_CONF_OPTS += \
 	--disable-audio \
 	--disable-cxx-bindings \
 	--disable-fontconfig \
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 4320064..57da1e0 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -12,7 +12,7 @@ ELEMENTARY_LICENSE_FILES = COPYING
 
 ELEMENTARY_INSTALL_STAGING = YES
 
-ELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-elementary libefl
+ELEMENTARY_DEPENDENCIES = host-pkgconf host-efl host-elementary efl
 
 ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
@@ -25,7 +25,7 @@ ELEMENTARY_CONF_OPTS = \
 
 # We need a host package in order to provide elm_prefs_cc and
 # elementary_codegen.
-HOST_ELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
+HOST_ELEMENTARY_DEPENDENCIES = host-pkgconf host-efl
 HOST_ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 451fa0b..fc1f469 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -12,9 +12,9 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
 	depends on BR2_ARCH_HAS_ATOMICS
-	select BR2_PACKAGE_LIBEFL_X_XLIB
-	select BR2_PACKAGE_LIBEFL_JPEG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_LIBEFL_PNG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_EFL_X_XLIB
+	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_ELEMENTARY
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 546b5aa..5cf4811 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -12,8 +12,8 @@ ENLIGHTENMENT_LICENSE_FILES = COPYING
 
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
-	host-libefl \
-	libefl \
+	host-efl \
+	efl \
 	elementary \
 	libevas-generic-loaders \
 	xcb-util-keysyms
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 4a4e2ee..8754dc0 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -11,12 +11,12 @@ EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
-EXPEDITE_DEPENDENCIES = host-libefl host-pkgconf libefl
+EXPEDITE_DEPENDENCIES = host-efl host-pkgconf efl
 
 # There is no configure script in the git tree.
 EXPEDITE_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index 2c1c1cd..ff8ea37 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -12,7 +12,7 @@ LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
 LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf libefl zlib
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf efl zlib
 
 # poppler >= 0.32 is not supported by the current version of
 # libevas-generic-loaders.
