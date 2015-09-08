From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:42 +0200
Subject: [Buildroot] [PACH v2 08/38] package/efl: move one directory higher
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-9-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We usually do not have a sub-directory for a family of related
packages, so move efl packages one directory higher, so they
all are in package/

Also re-order packages alphabetically

Remove efl package for now without legacy handling, it'll
re-added in a follow up patch during efl version bump.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                     |  11 +-
 package/efl/Config.in                 |  27 ----
 package/efl/efl.mk                    |   2 -
 package/efl/libecore/Config.in        |  46 -------
 package/efl/libecore/libecore.mk      | 114 ----------------
 package/efl/libedbus/Config.in        |  44 ------
 package/efl/libedbus/libedbus.mk      |  37 -----
 package/efl/libedje/Config.in         |  28 ----
 package/efl/libedje/libedje.mk        |  28 ----
 package/efl/libeet/Config.in          |  11 --
 package/efl/libeet/libeet.mk          |  27 ----
 package/efl/libefreet/Config.in       |  10 --
 package/efl/libefreet/libefreet.mk    |  17 ---
 package/efl/libeina/Config.in         |   6 -
 package/efl/libeina/libeina.mk        |  18 ---
 package/efl/libeio/Config.in          |  22 ---
 package/efl/libeio/libeio.mk          |  16 ---
 package/efl/libembryo/Config.in       |   9 --
 package/efl/libembryo/libembryo.mk    |  18 ---
 package/efl/libethumb/Config.in       |  15 ---
 package/efl/libethumb/libethumb.mk    |  27 ----
 package/efl/libevas/0001-giflib.patch |  98 --------------
 package/efl/libevas/Config.in         | 211 -----------------------------
 package/efl/libevas/libevas.mk        | 247 ----------------------------------
 package/enlightenment/Config.in       |   1 -
 package/expedite/Config.in            |   1 -
 package/libecore/Config.in            |  51 +++++++
 package/libecore/libecore.mk          | 114 ++++++++++++++++
 package/libedbus/Config.in            |  44 ++++++
 package/libedbus/libedbus.mk          |  37 +++++
 package/libedje/Config.in             |  30 +++++
 package/libedje/libedje.mk            |  28 ++++
 package/libeet/Config.in              |  16 +++
 package/libeet/libeet.mk              |  27 ++++
 package/libefreet/Config.in           |  15 +++
 package/libefreet/libefreet.mk        |  17 +++
 package/libeina/Config.in             |  12 ++
 package/libeina/libeina.mk            |  18 +++
 package/libeio/Config.in              |  24 ++++
 package/libeio/libeio.mk              |  16 +++
 package/libembryo/Config.in           |  14 ++
 package/libembryo/libembryo.mk        |  18 +++
 package/libethumb/Config.in           |  17 +++
 package/libethumb/libethumb.mk        |  27 ++++
 package/libevas/0001-giflib.patch     |  98 ++++++++++++++
 package/libevas/Config.in             | 213 +++++++++++++++++++++++++++++
 package/libevas/libevas.mk            | 247 ++++++++++++++++++++++++++++++++++
 47 files changed, 1093 insertions(+), 1081 deletions(-)
 delete mode 100644 package/efl/Config.in
 delete mode 100644 package/efl/efl.mk
 delete mode 100644 package/efl/libecore/Config.in
 delete mode 100644 package/efl/libecore/libecore.mk
 delete mode 100644 package/efl/libedbus/Config.in
 delete mode 100644 package/efl/libedbus/libedbus.mk
 delete mode 100644 package/efl/libedje/Config.in
 delete mode 100644 package/efl/libedje/libedje.mk
 delete mode 100644 package/efl/libeet/Config.in
 delete mode 100644 package/efl/libeet/libeet.mk
 delete mode 100644 package/efl/libefreet/Config.in
 delete mode 100644 package/efl/libefreet/libefreet.mk
 delete mode 100644 package/efl/libeina/Config.in
 delete mode 100644 package/efl/libeina/libeina.mk
 delete mode 100644 package/efl/libeio/Config.in
 delete mode 100644 package/efl/libeio/libeio.mk
 delete mode 100644 package/efl/libembryo/Config.in
 delete mode 100644 package/efl/libembryo/libembryo.mk
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 delete mode 100644 package/efl/libevas/Config.in
 delete mode 100644 package/efl/libevas/libevas.mk
 create mode 100644 package/libecore/Config.in
 create mode 100644 package/libecore/libecore.mk
 create mode 100644 package/libedbus/Config.in
 create mode 100644 package/libedbus/libedbus.mk
 create mode 100644 package/libedje/Config.in
 create mode 100644 package/libedje/libedje.mk
 create mode 100644 package/libeet/Config.in
 create mode 100644 package/libeet/libeet.mk
 create mode 100644 package/libefreet/Config.in
 create mode 100644 package/libefreet/libefreet.mk
 create mode 100644 package/libeina/Config.in
 create mode 100644 package/libeina/libeina.mk
 create mode 100644 package/libeio/Config.in
 create mode 100644 package/libeio/libeio.mk
 create mode 100644 package/libembryo/Config.in
 create mode 100644 package/libembryo/libembryo.mk
 create mode 100644 package/libethumb/Config.in
 create mode 100644 package/libethumb/libethumb.mk
 create mode 100644 package/libevas/0001-giflib.patch
 create mode 100644 package/libevas/Config.in
 create mode 100644 package/libevas/libevas.mk

diff --git a/package/Config.in b/package/Config.in
index 6b298aa..0036963 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,7 +240,17 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libecore/Config.in"
+	source "package/libeet/Config.in"
+	source "package/libedje/Config.in"
+	source "package/libefreet/Config.in"
+	source "package/libeina/Config.in"
+	source "package/libeio/Config.in"
+	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
+	source "package/libembryo/Config.in"
+	source "package/libethumb/Config.in"
+	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
@@ -258,7 +268,6 @@ endif
 	source "package/sdl_ttf/Config.in"
 
 comment "Other GUIs"
-	source "package/efl/Config.in"
 	source "package/qt/Config.in"
 	source "package/qt5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
diff --git a/package/efl/Config.in b/package/efl/Config.in
deleted file mode 100644
index 659ee10..0000000
--- a/package/efl/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-menuconfig BR2_PACKAGE_EFL
-	bool "Enlightenment Foundation Libraries"
-	depends on BR2_USE_WCHAR
-	# libeina uses madvise(). To revisit when bumping EFL to 1.8
-	depends on BR2_USE_MMU
-	help
-	  Enlightenment Foundation Libraries
-
-	  http://enlightenment.org
-
-if BR2_PACKAGE_EFL
-
-source "package/efl/libeina/Config.in"
-source "package/efl/libecore/Config.in"
-source "package/efl/libeet/Config.in"
-source "package/efl/libefreet/Config.in"
-source "package/efl/libeio/Config.in"
-source "package/efl/libevas/Config.in"
-source "package/efl/libembryo/Config.in"
-source "package/efl/libedje/Config.in"
-source "package/efl/libethumb/Config.in"
-source "package/efl/libedbus/Config.in"
-
-endif # BR2_PACKAGE_EFL
-
-comment "EFL needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
deleted file mode 100644
index 99e4d14..0000000
--- a/package/efl/efl.mk
+++ /dev/null
@@ -1,2 +0,0 @@
-
-include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
deleted file mode 100644
index a9408dc..0000000
--- a/package/efl/libecore/Config.in
+++ /dev/null
@@ -1,46 +0,0 @@
-config BR2_PACKAGE_LIBECORE
-	bool "libecore"
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Ecore is the event/X abstraction layer that makes doing
-	  selections, Xdnd, general X stuff, event loops, timeouts and
-	  idle handlers fast, optimized, and convenient.
-
-	  http://trac.enlightenment.org/e/wiki/Ecore
-
-if BR2_PACKAGE_LIBECORE
-
-config BR2_PACKAGE_LIBECORE_DIRECTFB
-	bool "libecore DirectFB support"
-	depends on BR2_PACKAGE_DIRECTFB
-	default y
-
-config BR2_PACKAGE_LIBECORE_FB
-	bool "libecore framebuffer support"
-
-config BR2_PACKAGE_LIBECORE_SDL
-	bool "libecore SDL support"
-	select BR2_PACKAGE_SDL
-
-config BR2_PACKAGE_LIBECORE_X
-	bool "libecore X support"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-
-config BR2_PACKAGE_LIBECORE_X_XCB
-	bool "libecore XCB support"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XCB_UTIL
-
-config BR2_PACKAGE_LIBECORE_EVAS
-	bool "libecore Evas support"
-	select BR2_PACKAGE_LIBEVAS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-
-comment "evas support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
deleted file mode 100644
index b5016dc..0000000
--- a/package/efl/libecore/libecore.mk
+++ /dev/null
@@ -1,114 +0,0 @@
-################################################################################
-#
-# libecore
-#
-################################################################################
-
-LIBECORE_VERSION = 1.7.10
-LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
-LIBECORE_SITE = http://download.enlightenment.org/releases
-LIBECORE_LICENSE = BSD-2c
-LIBECORE_LICENSE_FILES = COPYING
-
-LIBECORE_INSTALL_STAGING = YES
-
-LIBECORE_DEPENDENCIES = host-pkgconf libeina
-
-HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
-HOST_LIBECORE_CONF_OPTS += 		\
-	--enable-ecore-evas 		\
-	--disable-simple-x11 		\
-	--disable-ecore-directfb 	\
-	--disable-ecore-x 		\
-	--disable-ecore-x-xcb 		\
-	--disable-ecore-imf-xim
-
-# default options
-LIBECORE_CONF_OPTS = --disable-simple-x11
-
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-LIBECORE_DEPENDENCIES += tslib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBECORE_DEPENDENCIES += libglib2
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBECORE_DEPENDENCIES += openssl
-LIBECORE_CONF_OPTS += --enable-openssl
-else
-LIBECORE_CONF_OPTS += --disable-openssl
-endif
-
-ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBECORE_DEPENDENCIES += gnutls libgcrypt
-LIBECORE_CONF_OPTS += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
-else
-LIBECORE_CONF_OPTS += --disable-gnutls
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LIBECORE_DEPENDENCIES += libcurl
-endif
-
-# libecore
-ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-directfb
-LIBECORE_DEPENDENCIES += directfb
-else
-LIBECORE_CONF_OPTS += --disable-ecore-directfb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-fb
-else
-LIBECORE_CONF_OPTS += --disable-ecore-fb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
-LIBECORE_CONF_OPTS += --enable-ecore-sdl
-LIBECORE_DEPENDENCIES += sdl
-else
-LIBECORE_CONF_OPTS += --disable-ecore-sdl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
-LIBECORE_CONF_OPTS += --enable-ecore-x \
-	--with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
-else
-LIBECORE_CONF_OPTS += --disable-ecore-x --disable-ecore-imf-xim
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-x-xcb
-LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman
-
-# src/util/makekeys is executed at build time to generate
-# ecore_xcb_keysym_table.h, so it should get compiled for the host.
-# The ecore makefile unfortunately doesn't know about cross
-# compilation so this doesn't work.  Long term, we should probably
-# teach it about CC_FOR_BUILD, but for now simply build makekeys by
-# hand in advance
-define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/util makekeys.o makekeys
-endef
-
-LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
-else
-LIBECORE_CONF_OPTS += --disable-ecore-x-xcb
-endif
-
-# libecore-evas
-ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
-LIBECORE_CONF_OPTS += --enable-ecore-evas
-LIBECORE_DEPENDENCIES += libevas
-else
-LIBECORE_CONF_OPTS += --disable-ecore-evas
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
deleted file mode 100644
index 7e862d3..0000000
--- a/package/efl/libedbus/Config.in
+++ /dev/null
@@ -1,44 +0,0 @@
-config BR2_PACKAGE_LIBEDBUS
-	bool "libedbus"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_DBUS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus
-	help
-	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
-	  easily used by EFL applications, automatically providing
-	  Ecore/main loop integration, as well as Eina data types.
-
-	  http://trac.enlightenment.org/e/wiki/E_Dbus
-
-if BR2_PACKAGE_LIBEDBUS
-
-config BR2_PACKAGE_LIBEDBUS_BLUEZ
-	bool "bluez support"
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
-	select BR2_PACKAGE_BLUEZ_UTILS
-	help
-	  Bluetooth support.
-
-comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LIBEDBUS_CONNMAN
-	bool "connman support"
-	depends on BR2_PACKAGE_CONNMAN
-	help
-	  Connection manager support.
-
-config BR2_PACKAGE_LIBEDBUS_NOTIFY
-	bool "notify support"
-	help
-	  Notify support.
-
-endif
-
-comment "libedbus needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
deleted file mode 100644
index 634ceaf..0000000
--- a/package/efl/libedbus/libedbus.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# libedbus
-#
-################################################################################
-
-LIBEDBUS_VERSION = 1.7.10
-LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
-LIBEDBUS_SITE = http://download.enlightenment.org/releases
-LIBEDBUS_LICENSE = BSD-2c
-LIBEDBUS_LICENSE_FILES = COPYING
-
-LIBEDBUS_INSTALL_STAGING = YES
-
-LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
-LIBEDBUS_CONF_OPTS += --enable-ebluez
-LIBEDBUS_DEPENDENCIES += bluez_utils
-else
-LIBEDBUS_CONF_OPTS += --disable-ebluez
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
-LIBEDBUS_CONF_OPTS += --enable-econnman0_7x
-LIBEDBUS_DEPENDENCIES += connman
-else
-LIBEDBUS_CONF_OPTS += --disable-econnman0_7x
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
-LIBEDBUS_CONF_OPTS += --enable-enotify --disable-edbus-notify-test
-else
-LIBEDBUS_CONF_OPTS += --disable-enotify
-endif
-
-$(eval $(autotools-package))
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
deleted file mode 100644
index b163508..0000000
--- a/package/efl/libedje/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-comment "libedje needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_LIBEDJE
-	bool "libedje"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEMBRYO
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LUA
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	help
-	  A graphical layout and animation library for animated
-	  resizable, compressed and scalable themes.
-
-	  http://trac.enlightenment.org/e/wiki/Edje
-
-if BR2_PACKAGE_LIBEDJE
-
-config BR2_PACKAGE_LIBEDJE_CC
-	bool "build edje_cc"
-	help
-	  Build and install the Edje compiler for the target. Normally this
-	  is not required.
-
-endif
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
deleted file mode 100644
index 59189e4..0000000
--- a/package/efl/libedje/libedje.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# libedje
-#
-################################################################################
-
-LIBEDJE_VERSION = 1.7.10
-LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE = http://download.enlightenment.org/releases
-LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
-LIBEDJE_LICENSE_FILES = COPYING
-
-LIBEDJE_INSTALL_STAGING = YES
-
-LIBEDJE_DEPENDENCIES = \
-	host-pkgconf lua libeina libeet libecore libevas \
-	libembryo
-
-ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
-LIBEDJE_CONF_OPTS += --enable-edje-cc
-else
-LIBEDJE_CONF_OPTS += --disable-edje-cc
-endif
-
-HOST_LIBEDJE_CONF_OPTS = --enable-edje-cc
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
deleted file mode 100644
index 48631a0..0000000
--- a/package/efl/libeet/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBEET
-	bool "libeet"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Eet is a tiny library designed to write an arbitary set of
-	  chunks of data to a file and optionally compress each chunk
-	  (very much like a zip file).
-
-	  http://trac.enlightenment.org/e/wiki/Eet
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
deleted file mode 100644
index fc3d7f9..0000000
--- a/package/efl/libeet/libeet.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# libeet
-#
-################################################################################
-
-LIBEET_VERSION = 1.7.10
-LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
-LIBEET_SITE = http://download.enlightenment.org/releases
-LIBEET_LICENSE = BSD-2c
-LIBEET_LICENSE_FILES = COPYING
-
-LIBEET_INSTALL_STAGING = YES
-
-LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
-HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-libjpeg host-libeina
-
-ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBEET_DEPENDENCIES += gnutls libgcrypt
-LIBEET_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-LIBEET_CONF_OPTS += --enable-gnutls
-else
-LIBEET_CONF_OPTS += --disable-gnutls
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
deleted file mode 100644
index 8687db4..0000000
--- a/package/efl/libefreet/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_LIBEFREET
-	bool "libefreet"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBECORE
-	help
-	  Efreet is a library designed to help apps work with several of the
-	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
-
-	  http://trac.enlightenment.org/e/wiki/Efreet
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
deleted file mode 100644
index 65dbd12..0000000
--- a/package/efl/libefreet/libefreet.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# libefreet
-#
-################################################################################
-
-LIBEFREET_VERSION = 1.7.10
-LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
-LIBEFREET_SITE = http://download.enlightenment.org/releases
-LIBEFREET_LICENSE = BSD-2c
-LIBEFREET_LICENSE_FILES = COPYING
-
-LIBEFREET_INSTALL_STAGING = YES
-
-LIBEFREET_DEPENDENCIES = libeina libeet libecore
-
-$(eval $(autotools-package))
diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
deleted file mode 100644
index 80600ad..0000000
--- a/package/efl/libeina/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_LIBEINA
-	bool "libeina"
-	help
-	  Eina is a tiny library to handle data types (list, hash, etc.)
-
-	  http://trac.enlightenment.org/e/wiki/Eina
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
deleted file mode 100644
index ae9f1c6..0000000
--- a/package/efl/libeina/libeina.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libeina
-#
-################################################################################
-
-LIBEINA_VERSION = 1.7.10
-LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
-LIBEINA_SITE = http://download.enlightenment.org/releases
-LIBEINA_LICENSE = LGPLv2.1+
-LIBEINA_LICENSE_FILES = COPYING
-
-LIBEINA_INSTALL_STAGING = YES
-
-LIBEINA_DEPENDENCIES = host-pkgconf
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
deleted file mode 100644
index 5b1e395..0000000
--- a/package/efl/libeio/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_LIBEIO
-	bool "libeio"
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBECORE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Eio integrates with EFL (Ecore, Eina) to provide efficient
-	  filesystem Input/Output (I/O). It use the best techniques to
-	  achieve such purpose, like using at-variants, splice,
-	  properly handling errors and doing it in an asynchronous
-	  fashion by means of worker threads. It is also ported to
-	  Windows, so multi-platform.
-
-	  Whenever you need to list a directory, copy, move or delete
-	  files, Eio will do that task better than you'd achieve with
-	  naive implementations, and it is easy to use.
-
-	  http://trac.enlightenment.org/e/wiki/Eio
-
-comment "libeio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
deleted file mode 100644
index e687c32..0000000
--- a/package/efl/libeio/libeio.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libeio
-#
-################################################################################
-
-LIBEIO_VERSION = 1.7.10
-LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
-LIBEIO_SITE = http://download.enlightenment.org/releases
-LIBEIO_LICENSE = LGPLv2.1
-LIBEIO_LICENSE_FILES = COPYING
-
-LIBEIO_INSTALL_STAGING = YES
-LIBEIO_DEPENDENCIES = libeina libeet libecore
-
-$(eval $(autotools-package))
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
deleted file mode 100644
index 63c7064..0000000
--- a/package/efl/libembryo/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_LIBEMBRYO
-	bool "libembryo"
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Embryo is primarily a shared library that gives you an API
-	  to load and control interpreted programs compiled into an
-	  abstract machine bytecode that it understands.
-
-	  http://trac.enlightenment.org/e/wiki/Embryo
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
deleted file mode 100644
index fc45e42..0000000
--- a/package/efl/libembryo/libembryo.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libembryo
-#
-################################################################################
-
-LIBEMBRYO_VERSION = 1.7.10
-LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
-LIBEMBRYO_SITE = http://download.enlightenment.org/releases
-LIBEMBRYO_LICENSE = BSD-2c, Embryo license
-LIBEMBRYO_LICENSE_FILES = COPYING
-
-LIBEMBRYO_INSTALL_STAGING = YES
-
-LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
deleted file mode 100644
index 3e9cbde..0000000
--- a/package/efl/libethumb/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-comment "libethumb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_LIBETHUMB
-	bool "libethumb"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	help
-	  Ethumb is a library for generating thumbnail images of documents.
-
-	  http://trac.enlightenment.org/e/wiki/Ethumb
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
deleted file mode 100644
index 314ddf9..0000000
--- a/package/efl/libethumb/libethumb.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# libethumb
-#
-################################################################################
-
-LIBETHUMB_VERSION = 1.7.10
-LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/releases
-LIBETHUMB_LICENSE = LGPLv2.1+
-LIBETHUMB_LICENSE_FILES = COPYING
-
-LIBETHUMB_INSTALL_STAGING = YES
-
-LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
-
-LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
-
-ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-LIBETHUMB_DEPENDENCIES += libexif
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
-LIBETHUMB_DEPENDENCIES += libedbus
-endif
-
-$(eval $(autotools-package))
diff --git a/package/efl/libevas/0001-giflib.patch b/package/efl/libevas/0001-giflib.patch
deleted file mode 100644
index 9342687..0000000
--- a/package/efl/libevas/0001-giflib.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Adjust source code to work with giflib 5.1x
-
-From http://giflib.sourceforge.net/gif_lib.html: GIF file openers and
-closers - DGifOpenFileName(), DGifOpenFileHandle(), DGifOpen(),
-DGifClose(), EGifOpenFileName(), EGifOpenFileHandle(), EGifOpen(), and
-EGifClose() - all now take a final integer address argument. If
-non-null, this is used to pass back an error code when the function
-returns NULL.
-
-Downloaded from
-http://commit.cvs.pld.groups.com.ru/332837-packagesevas_fix_building_with_giflib_51_rel_6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c
---- evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c	2013-08-01 17:41:35.000000000 +0200
-+++ evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c	2015-01-26 19:44:20.132955194 +0100
-@@ -338,7 +338,7 @@
- 
-    if (!cmap)
-      {
--        DGifCloseFile(gif);
-+        DGifCloseFile(gif, NULL);
-         for (i = 0; i < scale_h; i++)
-           {
-              free(rows[i]);
-@@ -725,7 +725,7 @@
-    if ((w < 1) || (h < 1) || (w > IMG_MAX_SIZE) || (h > IMG_MAX_SIZE) ||
-        IMG_TOO_BIG(w, h))
-      {
--        DGifCloseFile(gif);
-+        DGifCloseFile(gif, NULL);
-         if (IMG_TOO_BIG(w, h))
-           *error = EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED;
-         else
-@@ -740,7 +740,7 @@
-         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
-           {
-              /* PrintGifError(); */
--             DGifCloseFile(gif);
-+             DGifCloseFile(gif, NULL);
-              *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-              return EINA_FALSE;
-           }
-@@ -754,7 +754,7 @@
-              if (DGifGetImageDesc(gif) == GIF_ERROR)
-                {
-                   /* PrintGifError(); */
--                  DGifCloseFile(gif);
-+                  DGifCloseFile(gif, NULL);
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
-@@ -762,7 +762,7 @@
-              if (DGifGetCode(gif, &img_code, &img) == GIF_ERROR)
-                {
-                   /* PrintGifError(); */
--                  DGifCloseFile(gif);
-+                  DGifCloseFile(gif, NULL);
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
-@@ -818,7 +818,7 @@
-         ie->frames = NULL;
-      }
- 
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    *error = EVAS_LOAD_ERROR_NONE;
-    return EINA_TRUE;
- }
-@@ -885,7 +885,7 @@
-      }
- 
-    ie->frames = eina_list_append(ie->frames, frame);
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    return EINA_TRUE;
- }
- 
-@@ -959,7 +959,7 @@
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
--             DGifCloseFile(gif);
-+             DGifCloseFile(gif, NULL);
-              *error = EVAS_LOAD_ERROR_NONE;
-              return EINA_TRUE;
-           }
-@@ -1080,7 +1080,7 @@
-          }
-      } while (rec != TERMINATE_RECORD_TYPE);
- 
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    return duration;
- }
- 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
deleted file mode 100644
index 6645a14..0000000
--- a/package/efl/libevas/Config.in
+++ /dev/null
@@ -1,211 +0,0 @@
-comment "libevas needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_LIBEVAS
-	bool "libevas"
-	# libevas should normally build without threads, but due to a
-	# build issue when the async preloader is disabled, which is
-	# needed when no threads are available, we don't allow evas to
-	# be built without threads. This should be revisited when efl
-	# is bumped to 1.8.
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBEINA
-	# required to build so far
-	select BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
-	help
-	  Evas is a clean display canvas API for several target
-	  display systems that can draw anti-aliased text, smooth
-	  super and sub-sampled scaled images, alpha-blend objects
-	  much and more.
-
-	  http://trac.enlightenment.org/e/wiki/Evas
-
-if BR2_PACKAGE_LIBEVAS
-
-comment "libevas rendering options"
-
-config BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE
-	bool "libevas sampling scaler"
-	help
-	  This enables the sampling scaler code. This is the fastest
-	  image scaling code, but also the lowest quality.
-
-config BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
-	bool "libevas smooth scaler"
-	help
-	  This is the nicest looking scaler that is not that much
-	  slower than tri-linear, but it looks really good.
-
-config BR2_PACKAGE_LIBEVAS_SMALL_DITHERING
-	bool "libevas small dithering"
-	help
-	  This uses a 4x4 dither mask instead of 128x128. On desktop
-	  boxes these days (Pentium, Pentium2, amd etc.) the speed
-	  difference is not really measurable, but the quality of the
-	  128x128 dither mask is quite a lot better.
-
-config BR2_PACKAGE_LIBEVAS_LINE_DITHERING
-	bool "libevas line dithering"
-
-config BR2_PACKAGE_LIBEVAS_NO_DITHERING
-	bool "libevas no dithering"
-
-
-comment "libevas backends"
-
-config BR2_PACKAGE_LIBEVAS_BUFFER
-	bool "libevas buffer backend"
-	help
-	  This enables the software buffer rendering engine. There is
-	  no hardware assist here.
-
-config BR2_PACKAGE_LIBEVAS_DIRECTFB
-	bool "libevas DirectFB backend"
-	depends on BR2_PACKAGE_DIRECTFB
-	default y
-	help
-	  This is the DirectFB engine that uses the DirectFB library
-	  (http://www.directfb.org) on Linux to access the framebuffer
-	  with (or maybe without) acceleration.
-
-config BR2_PACKAGE_LIBEVAS_FB
-	bool "libevas frame buffer backend"
-	help
-	  This is the software framebuffer driving engine. this uses
-	  the linux framebuffer device (/dev/fb<x>) and will currently
-	  just inherit the current framebuffer settings on the fb
-	  device and use them to run in.
-
-config BR2_PACKAGE_LIBEVAS_SDL
-	bool "libevas SDL backend"
-	select BR2_PACKAGE_SDL
-	help
-	  This is the software SDL engine that uses SDL library
-	  (http://www.libsdl.org). This library should work on many
-	  operating systems.
-
-config BR2_PACKAGE_LIBEVAS_SDL_GL
-	bool "libevas SDL OpenGL backend"
-	depends on BR2_PACKAGE_SDL_X11
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	help
-	  This is the SDL OpenGL engine that uses SDL library
-	  and OpenGL to render. This may be hardware accelerated.
-
-comment "SDL OpenGL backend needs modular X.org and X11 support in SDL"
-	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
-
-config BR2_PACKAGE_LIBEVAS_X11
-	bool "libevas X11 backend"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	help
-	  This enables the software X11 rendering engine that renders
-	  to X drawable targets using highly optimised software
-	  routines. There is no hardware assist here.
-
-config BR2_PACKAGE_LIBEVAS_X11_GLX
-	bool "libevas X11 GLX backend"
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	help
-	  This enables the OpenGL X11 rendering engine that renders
-	  using GLX which may be hardware accelerated.
-
-config BR2_PACKAGE_LIBEVAS_XCB
-	bool "libevas XCB backend"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XCB_UTIL
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_PIXMAN
-	help
-	  This enable the software XCB rendering engine. It allows the
-	  same features than the software X11 engine.
-
-config BR2_PACKAGE_LIBEVAS_XCB_GLX
-	bool "libevas XCB GLX backend"
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XCB_UTIL
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	help
-	  This enables the OpenGL X11 XCB rendering engine that renders
-	  using GLX which may be hardware accelerated.
-
-choice
-	prompt "libevas OpenGL flavor"
-	depends on BR2_PACKAGE_LIBEVAS_SDL_GL || BR2_PACKAGE_LIBEVAS_X11_GLX || BR2_PACKAGE_LIBEVAS_XCB_GLX
-	default BR2_PACKAGE_LIBEVAS_GL
-
-config BR2_PACKAGE_LIBEVAS_GL
-	bool "generic OpenGL"
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBEET
-
-config BR2_PACKAGE_LIBEVAS_GLES_SGX
-	bool "OpenGL-ES SGX"
-
-config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
-	bool "OpenGL-ES S3C6410"
-endchoice
-
-
-comment "libevas loaders"
-
-config BR2_PACKAGE_LIBEVAS_PNG
-	bool "libevas png loader"
-	select BR2_PACKAGE_LIBPNG
-	help
-	  This enables the loader code that loads png files using
-	  libpng.
-
-config BR2_PACKAGE_LIBEVAS_JPEG
-	bool "libevas jpeg loader"
-	select BR2_PACKAGE_JPEG
-	help
-	  This enables the loader code that loads jpeg files using
-	  libjpeg.
-
-config BR2_PACKAGE_LIBEVAS_GIF
-	bool "libevas gif loader"
-	select BR2_PACKAGE_GIFLIB
-	help
-	  This enables the loader code that loads gif files using
-	  libungif.
-
-config BR2_PACKAGE_LIBEVAS_PMAPS
-	bool "libevas pmaps loader"
-	help
-	  This enables the loader code that loads pmaps files.
-
-config BR2_PACKAGE_LIBEVAS_TIFF
-	bool "libevas tiff loader"
-	select BR2_PACKAGE_TIFF
-	help
-	  This enables the loader code that loads tiff files.
-
-config BR2_PACKAGE_LIBEVAS_XPM
-	bool "libevas xpm loader"
-	help
-	  This enables the loader code that loads xpm files.
-
-config BR2_PACKAGE_LIBEVAS_EET
-	bool "libevas eet image loader"
-	select BR2_PACKAGE_LIBEET
-	help
-	  This enables the loader code that loads images using libeet.
-
-config BR2_PACKAGE_LIBEVAS_EET_FONT
-	bool "libevas eet font loader"
-	select BR2_PACKAGE_LIBEET
-	help
-	  This enables the loader code that loads fonts using libeet.
-
-endif # BR2_PACKAGE_LIBEVAS
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
deleted file mode 100644
index 9adb128..0000000
--- a/package/efl/libevas/libevas.mk
+++ /dev/null
@@ -1,247 +0,0 @@
-################################################################################
-#
-# libevas
-#
-################################################################################
-
-LIBEVAS_VERSION = 1.7.10
-LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
-LIBEVAS_SITE = http://download.enlightenment.org/releases
-LIBEVAS_LICENSE = BSD-2c
-LIBEVAS_LICENSE_FILES = COPYING
-
-LIBEVAS_INSTALL_STAGING = YES
-
-LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
-
-HOST_LIBEVAS_DEPENDENCIES = \
-	host-pkgconf host-zlib host-libeina \
-	host-freetype host-libpng host-libjpeg
-HOST_LIBEVAS_CONF_OPTS += \
-	--enable-image-loader-png \
-	--enable-image-loader-jpeg \
-	--disable-image-loader-gif \
-	--disable-image-loader-tiff \
-	--disable-image-loader-eet \
-	--disable-font-loader-eet \
-	--disable-cpu-sse3 \
-	--disable-software-sdl \
-	--disable-gl-sdl \
-	--disable-software-xlib \
-	--disable-gl-xlib \
-	--enable-software-xcb \
-	--disable-gl-xcb
-
-# rendering options
-ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
-LIBEVAS_CONF_OPTS += --enable-scale-sample
-else
-LIBEVAS_CONF_OPTS += --disable-scale-sample
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
-LIBEVAS_CONF_OPTS += --enable-scale-smooth
-else
-LIBEVAS_CONF_OPTS += --disable-scale-smooth
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SMALL_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-small-dither-mask
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_LINE_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-line-dither-mask
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_NO_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-no-dither-mask
-endif
-
-# backends
-ifeq ($(BR2_PACKAGE_LIBEVAS_BUFFER),y)
-LIBEVAS_CONF_OPTS += --enable-buffer
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
-LIBEVAS_CONF_OPTS += --enable-software-xlib \
-	--with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-LIBEVAS_CONF_OPTS += --disable-software-xlib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-xlib
-LIBEVAS_DEPENDENCIES += \
-	xproto_glproto xlib_libX11 xlib_libXrender \
-	xlib_libXext libeet
-else
-LIBEVAS_CONF_OPTS += --disable-gl-xlib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
-LIBEVAS_CONF_OPTS += --enable-software-xcb
-LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util pixman
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XCB_GLX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-xcb
-LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util xproto_glproto
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_FB),y)
-LIBEVAS_CONF_OPTS += --enable-fb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_DIRECTFB),y)
-LIBEVAS_CONF_OPTS += --enable-directfb
-LIBEVAS_DEPENDENCIES += directfb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SDL),y)
-LIBEVAS_CONF_OPTS += --enable-software-sdl
-LIBEVAS_DEPENDENCIES += sdl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
-LIBEVAS_CONF_OPTS += --enable-gl-sdl
-LIBEVAS_DEPENDENCIES += sdl
-# configure script forgets to check for eet / fill this out
-LIBEVAS_CONF_ENV += \
-	GL_EET_CFLAGS='-I$(STAGING_DIR)/usr/include/eet-1' \
-	GL_EET_LIBS='-leet'
-endif
-
-# libevas OpenGL flavor
-ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
-LIBEVAS_DEPENDENCIES += mesa3d libeet
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
-else
-LIBEVAS_CONF_OPTS += --disable-gles-variety-sgx
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
-LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
-else
-LIBEVAS_CONF_OPTS += --disable-gles-variety-s3c6410
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX)$(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),)
-LIBEVAS_CONF_OPTS += --disable-gl-flavor-gles
-endif
-
-# code options
-ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-mmx
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-mmx
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-sse
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-sse
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-sse3
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-sse3
-endif
-
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-altivec
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-altivec
-endif
-
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-neon
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-neon
-endif
-
-# loaders
-ifeq ($(BR2_PACKAGE_LIBEVAS_PNG),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-png
-LIBEVAS_DEPENDENCIES += libpng
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-png
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_JPEG),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-jpeg
-LIBEVAS_DEPENDENCIES += jpeg
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-gif
-LIBEVAS_DEPENDENCIES += giflib
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-gif
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_PMAPS),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-pmaps
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-pmaps
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-tiff
-LIBEVAS_DEPENDENCIES += tiff
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-tiff
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XPM),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-xpm
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-xpm
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_EET),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-eet
-LIBEVAS_DEPENDENCIES += libeet
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-eet
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_EET_FONT),y)
-LIBEVAS_CONF_OPTS += --enable-font-loader-eet
-LIBEVAS_DEPENDENCIES += libeet
-else
-LIBEVAS_CONF_OPTS += --disable-font-loader-eet
-endif
-
-ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-LIBEVAS_CONF_OPTS += --enable-fontconfig
-LIBEVAS_DEPENDENCIES += fontconfig
-else
-LIBEVAS_CONF_OPTS += --disable-fontconfig
-endif
-
-ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-LIBEVAS_CONF_OPTS += --enable-fribidi
-LIBEVAS_DEPENDENCIES += libfribidi
-else
-LIBEVAS_CONF_OPTS += --disable-fribidi
-endif
-
-# libevas installs the source code of examples on the target, which
-# are generally not useful.
-define LIBEVAS_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/share/evas/examples/
-endef
-
-LIBEVAS_POST_INSTALL_TARGET_HOOKS += LIBEVAS_REMOVE_EXAMPLES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 58f8f39..1af42c7 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
-	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_X
 	select BR2_PACKAGE_LIBEINA
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index 82bceb9..5d48af3 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
-	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
diff --git a/package/libecore/Config.in b/package/libecore/Config.in
new file mode 100644
index 0000000..e8f31f0
--- /dev/null
+++ b/package/libecore/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_LIBECORE
+	bool "libecore"
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Ecore is the event/X abstraction layer that makes doing
+	  selections, Xdnd, general X stuff, event loops, timeouts and
+	  idle handlers fast, optimized, and convenient.
+
+	  http://trac.enlightenment.org/e/wiki/Ecore
+
+if BR2_PACKAGE_LIBECORE
+
+config BR2_PACKAGE_LIBECORE_DIRECTFB
+	bool "libecore DirectFB support"
+	depends on BR2_PACKAGE_DIRECTFB
+	default y
+
+config BR2_PACKAGE_LIBECORE_FB
+	bool "libecore framebuffer support"
+
+config BR2_PACKAGE_LIBECORE_SDL
+	bool "libecore SDL support"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LIBECORE_X
+	bool "libecore X support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+config BR2_PACKAGE_LIBECORE_X_XCB
+	bool "libecore XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XCB_UTIL
+
+config BR2_PACKAGE_LIBECORE_EVAS
+	bool "libecore Evas support"
+	select BR2_PACKAGE_LIBEVAS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+comment "evas support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif # BR2_PACKAGE_LIBECORE
+
+comment "libecore needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libecore/libecore.mk b/package/libecore/libecore.mk
new file mode 100644
index 0000000..b5016dc
--- /dev/null
+++ b/package/libecore/libecore.mk
@@ -0,0 +1,114 @@
+################################################################################
+#
+# libecore
+#
+################################################################################
+
+LIBECORE_VERSION = 1.7.10
+LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
+LIBECORE_SITE = http://download.enlightenment.org/releases
+LIBECORE_LICENSE = BSD-2c
+LIBECORE_LICENSE_FILES = COPYING
+
+LIBECORE_INSTALL_STAGING = YES
+
+LIBECORE_DEPENDENCIES = host-pkgconf libeina
+
+HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
+HOST_LIBECORE_CONF_OPTS += 		\
+	--enable-ecore-evas 		\
+	--disable-simple-x11 		\
+	--disable-ecore-directfb 	\
+	--disable-ecore-x 		\
+	--disable-ecore-x-xcb 		\
+	--disable-ecore-imf-xim
+
+# default options
+LIBECORE_CONF_OPTS = --disable-simple-x11
+
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+LIBECORE_DEPENDENCIES += tslib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+LIBECORE_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBECORE_DEPENDENCIES += openssl
+LIBECORE_CONF_OPTS += --enable-openssl
+else
+LIBECORE_CONF_OPTS += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
+LIBECORE_DEPENDENCIES += gnutls libgcrypt
+LIBECORE_CONF_OPTS += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+LIBECORE_CONF_OPTS += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBECORE_DEPENDENCIES += libcurl
+endif
+
+# libecore
+ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
+LIBECORE_CONF_OPTS += --enable-ecore-directfb
+LIBECORE_DEPENDENCIES += directfb
+else
+LIBECORE_CONF_OPTS += --disable-ecore-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
+LIBECORE_CONF_OPTS += --enable-ecore-fb
+else
+LIBECORE_CONF_OPTS += --disable-ecore-fb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
+LIBECORE_CONF_OPTS += --enable-ecore-sdl
+LIBECORE_DEPENDENCIES += sdl
+else
+LIBECORE_CONF_OPTS += --disable-ecore-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
+LIBECORE_CONF_OPTS += --enable-ecore-x \
+	--with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
+else
+LIBECORE_CONF_OPTS += --disable-ecore-x --disable-ecore-imf-xim
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
+LIBECORE_CONF_OPTS += --enable-ecore-x-xcb
+LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman
+
+# src/util/makekeys is executed at build time to generate
+# ecore_xcb_keysym_table.h, so it should get compiled for the host.
+# The ecore makefile unfortunately doesn't know about cross
+# compilation so this doesn't work.  Long term, we should probably
+# teach it about CC_FOR_BUILD, but for now simply build makekeys by
+# hand in advance
+define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/util makekeys.o makekeys
+endef
+
+LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+else
+LIBECORE_CONF_OPTS += --disable-ecore-x-xcb
+endif
+
+# libecore-evas
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
+LIBECORE_CONF_OPTS += --enable-ecore-evas
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPTS += --disable-ecore-evas
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libedbus/Config.in b/package/libedbus/Config.in
new file mode 100644
index 0000000..d3752ee
--- /dev/null
+++ b/package/libedbus/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_LIBEDBUS
+	bool "libedbus"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus, efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
+	  easily used by EFL applications, automatically providing
+	  Ecore/main loop integration, as well as Eina data types.
+
+	  http://trac.enlightenment.org/e/wiki/E_Dbus
+
+if BR2_PACKAGE_LIBEDBUS
+
+config BR2_PACKAGE_LIBEDBUS_BLUEZ
+	bool "bluez support"
+	depends on !BR2_STATIC_LIBS # bluez_utils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Bluetooth support.
+
+comment "bluez support needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIBEDBUS_CONNMAN
+	bool "connman support"
+	depends on BR2_PACKAGE_CONNMAN
+	help
+	  Connection manager support.
+
+config BR2_PACKAGE_LIBEDBUS_NOTIFY
+	bool "notify support"
+	help
+	  Notify support.
+
+endif
+
+comment "libedbus needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libedbus/libedbus.mk b/package/libedbus/libedbus.mk
new file mode 100644
index 0000000..634ceaf
--- /dev/null
+++ b/package/libedbus/libedbus.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# libedbus
+#
+################################################################################
+
+LIBEDBUS_VERSION = 1.7.10
+LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
+LIBEDBUS_SITE = http://download.enlightenment.org/releases
+LIBEDBUS_LICENSE = BSD-2c
+LIBEDBUS_LICENSE_FILES = COPYING
+
+LIBEDBUS_INSTALL_STAGING = YES
+
+LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
+LIBEDBUS_CONF_OPTS += --enable-ebluez
+LIBEDBUS_DEPENDENCIES += bluez_utils
+else
+LIBEDBUS_CONF_OPTS += --disable-ebluez
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
+LIBEDBUS_CONF_OPTS += --enable-econnman0_7x
+LIBEDBUS_DEPENDENCIES += connman
+else
+LIBEDBUS_CONF_OPTS += --disable-econnman0_7x
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
+LIBEDBUS_CONF_OPTS += --enable-enotify --disable-edbus-notify-test
+else
+LIBEDBUS_CONF_OPTS += --disable-enotify
+endif
+
+$(eval $(autotools-package))
diff --git a/package/libedje/Config.in b/package/libedje/Config.in
new file mode 100644
index 0000000..299e86b
--- /dev/null
+++ b/package/libedje/Config.in
@@ -0,0 +1,30 @@
+comment "libedje needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBECORE_EVAS
+	select BR2_PACKAGE_LIBEMBRYO
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LUA
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  A graphical layout and animation library for animated
+	  resizable, compressed and scalable themes.
+
+	  http://trac.enlightenment.org/e/wiki/Edje
+
+if BR2_PACKAGE_LIBEDJE
+
+config BR2_PACKAGE_LIBEDJE_CC
+	bool "build edje_cc"
+	help
+	  Build and install the Edje compiler for the target. Normally this
+	  is not required.
+
+endif
diff --git a/package/libedje/libedje.mk b/package/libedje/libedje.mk
new file mode 100644
index 0000000..59189e4
--- /dev/null
+++ b/package/libedje/libedje.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libedje
+#
+################################################################################
+
+LIBEDJE_VERSION = 1.7.10
+LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
+LIBEDJE_SITE = http://download.enlightenment.org/releases
+LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
+LIBEDJE_LICENSE_FILES = COPYING
+
+LIBEDJE_INSTALL_STAGING = YES
+
+LIBEDJE_DEPENDENCIES = \
+	host-pkgconf lua libeina libeet libecore libevas \
+	libembryo
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
+LIBEDJE_CONF_OPTS += --enable-edje-cc
+else
+LIBEDJE_CONF_OPTS += --disable-edje-cc
+endif
+
+HOST_LIBEDJE_CONF_OPTS = --enable-edje-cc
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libeet/Config.in b/package/libeet/Config.in
new file mode 100644
index 0000000..3f36295
--- /dev/null
+++ b/package/libeet/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBEET
+	bool "libeet"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEINA
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Eet is a tiny library designed to write an arbitary set of
+	  chunks of data to a file and optionally compress each chunk
+	  (very much like a zip file).
+
+	  http://trac.enlightenment.org/e/wiki/Eet
+
+comment "libeet needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libeet/libeet.mk b/package/libeet/libeet.mk
new file mode 100644
index 0000000..fc3d7f9
--- /dev/null
+++ b/package/libeet/libeet.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libeet
+#
+################################################################################
+
+LIBEET_VERSION = 1.7.10
+LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
+LIBEET_SITE = http://download.enlightenment.org/releases
+LIBEET_LICENSE = BSD-2c
+LIBEET_LICENSE_FILES = COPYING
+
+LIBEET_INSTALL_STAGING = YES
+
+LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
+HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-libjpeg host-libeina
+
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
+LIBEET_DEPENDENCIES += gnutls libgcrypt
+LIBEET_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+LIBEET_CONF_OPTS += --enable-gnutls
+else
+LIBEET_CONF_OPTS += --disable-gnutls
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libefreet/Config.in b/package/libefreet/Config.in
new file mode 100644
index 0000000..75e5955
--- /dev/null
+++ b/package/libefreet/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBEFREET
+	bool "libefreet"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Efreet is a library designed to help apps work with several of the
+	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
+
+	  http://trac.enlightenment.org/e/wiki/Efreet
+
+comment "libefreet needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libefreet/libefreet.mk b/package/libefreet/libefreet.mk
new file mode 100644
index 0000000..65dbd12
--- /dev/null
+++ b/package/libefreet/libefreet.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libefreet
+#
+################################################################################
+
+LIBEFREET_VERSION = 1.7.10
+LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
+LIBEFREET_SITE = http://download.enlightenment.org/releases
+LIBEFREET_LICENSE = BSD-2c
+LIBEFREET_LICENSE_FILES = COPYING
+
+LIBEFREET_INSTALL_STAGING = YES
+
+LIBEFREET_DEPENDENCIES = libeina libeet libecore
+
+$(eval $(autotools-package))
diff --git a/package/libeina/Config.in b/package/libeina/Config.in
new file mode 100644
index 0000000..13a74eb
--- /dev/null
+++ b/package/libeina/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBEINA
+	bool "libeina"
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	
+	help
+	  Eina is a tiny library to handle data types (list, hash, etc.)
+
+	  http://trac.enlightenment.org/e/wiki/Eina
+
+comment "libeina needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libeina/libeina.mk b/package/libeina/libeina.mk
new file mode 100644
index 0000000..ae9f1c6
--- /dev/null
+++ b/package/libeina/libeina.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libeina
+#
+################################################################################
+
+LIBEINA_VERSION = 1.7.10
+LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
+LIBEINA_SITE = http://download.enlightenment.org/releases
+LIBEINA_LICENSE = LGPLv2.1+
+LIBEINA_LICENSE_FILES = COPYING
+
+LIBEINA_INSTALL_STAGING = YES
+
+LIBEINA_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libeio/Config.in b/package/libeio/Config.in
new file mode 100644
index 0000000..e2e19a7
--- /dev/null
+++ b/package/libeio/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBEIO
+	bool "libeio"
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBECORE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Eio integrates with EFL (Ecore, Eina) to provide efficient
+	  filesystem Input/Output (I/O). It use the best techniques to
+	  achieve such purpose, like using at-variants, splice,
+	  properly handling errors and doing it in an asynchronous
+	  fashion by means of worker threads. It is also ported to
+	  Windows, so multi-platform.
+
+	  Whenever you need to list a directory, copy, move or delete
+	  files, Eio will do that task better than you'd achieve with
+	  naive implementations, and it is easy to use.
+
+	  http://trac.enlightenment.org/e/wiki/Eio
+
+comment "libeio needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libeio/libeio.mk b/package/libeio/libeio.mk
new file mode 100644
index 0000000..e687c32
--- /dev/null
+++ b/package/libeio/libeio.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libeio
+#
+################################################################################
+
+LIBEIO_VERSION = 1.7.10
+LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
+LIBEIO_SITE = http://download.enlightenment.org/releases
+LIBEIO_LICENSE = LGPLv2.1
+LIBEIO_LICENSE_FILES = COPYING
+
+LIBEIO_INSTALL_STAGING = YES
+LIBEIO_DEPENDENCIES = libeina libeet libecore
+
+$(eval $(autotools-package))
diff --git a/package/libembryo/Config.in b/package/libembryo/Config.in
new file mode 100644
index 0000000..937876f
--- /dev/null
+++ b/package/libembryo/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo"
+	select BR2_PACKAGE_LIBEINA
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Embryo is primarily a shared library that gives you an API
+	  to load and control interpreted programs compiled into an
+	  abstract machine bytecode that it understands.
+
+	  http://trac.enlightenment.org/e/wiki/Embryo
+
+comment "libembryo needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libembryo/libembryo.mk b/package/libembryo/libembryo.mk
new file mode 100644
index 0000000..fc45e42
--- /dev/null
+++ b/package/libembryo/libembryo.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libembryo
+#
+################################################################################
+
+LIBEMBRYO_VERSION = 1.7.10
+LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
+LIBEMBRYO_SITE = http://download.enlightenment.org/releases
+LIBEMBRYO_LICENSE = BSD-2c, Embryo license
+LIBEMBRYO_LICENSE_FILES = COPYING
+
+LIBEMBRYO_INSTALL_STAGING = YES
+
+LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libethumb/Config.in b/package/libethumb/Config.in
new file mode 100644
index 0000000..af641f0
--- /dev/null
+++ b/package/libethumb/Config.in
@@ -0,0 +1,17 @@
+comment "libethumb needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBECORE_EVAS
+	select BR2_PACKAGE_LIBEDJE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Ethumb is a library for generating thumbnail images of documents.
+
+	  http://trac.enlightenment.org/e/wiki/Ethumb
diff --git a/package/libethumb/libethumb.mk b/package/libethumb/libethumb.mk
new file mode 100644
index 0000000..314ddf9
--- /dev/null
+++ b/package/libethumb/libethumb.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libethumb
+#
+################################################################################
+
+LIBETHUMB_VERSION = 1.7.10
+LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
+LIBETHUMB_SITE = http://download.enlightenment.org/releases
+LIBETHUMB_LICENSE = LGPLv2.1+
+LIBETHUMB_LICENSE_FILES = COPYING
+
+LIBETHUMB_INSTALL_STAGING = YES
+
+LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
+
+LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBETHUMB_DEPENDENCIES += libexif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
+LIBETHUMB_DEPENDENCIES += libedbus
+endif
+
+$(eval $(autotools-package))
diff --git a/package/libevas/0001-giflib.patch b/package/libevas/0001-giflib.patch
new file mode 100644
index 0000000..9342687
--- /dev/null
+++ b/package/libevas/0001-giflib.patch
@@ -0,0 +1,98 @@
+Adjust source code to work with giflib 5.1x
+
+From http://giflib.sourceforge.net/gif_lib.html: GIF file openers and
+closers - DGifOpenFileName(), DGifOpenFileHandle(), DGifOpen(),
+DGifClose(), EGifOpenFileName(), EGifOpenFileHandle(), EGifOpen(), and
+EGifClose() - all now take a final integer address argument. If
+non-null, this is used to pass back an error code when the function
+returns NULL.
+
+Downloaded from
+http://commit.cvs.pld.groups.com.ru/332837-packagesevas_fix_building_with_giflib_51_rel_6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c
+--- evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c	2013-08-01 17:41:35.000000000 +0200
++++ evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c	2015-01-26 19:44:20.132955194 +0100
+@@ -338,7 +338,7 @@
+ 
+    if (!cmap)
+      {
+-        DGifCloseFile(gif);
++        DGifCloseFile(gif, NULL);
+         for (i = 0; i < scale_h; i++)
+           {
+              free(rows[i]);
+@@ -725,7 +725,7 @@
+    if ((w < 1) || (h < 1) || (w > IMG_MAX_SIZE) || (h > IMG_MAX_SIZE) ||
+        IMG_TOO_BIG(w, h))
+      {
+-        DGifCloseFile(gif);
++        DGifCloseFile(gif, NULL);
+         if (IMG_TOO_BIG(w, h))
+           *error = EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED;
+         else
+@@ -740,7 +740,7 @@
+         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
+           {
+              /* PrintGifError(); */
+-             DGifCloseFile(gif);
++             DGifCloseFile(gif, NULL);
+              *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+              return EINA_FALSE;
+           }
+@@ -754,7 +754,7 @@
+              if (DGifGetImageDesc(gif) == GIF_ERROR)
+                {
+                   /* PrintGifError(); */
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+@@ -762,7 +762,7 @@
+              if (DGifGetCode(gif, &img_code, &img) == GIF_ERROR)
+                {
+                   /* PrintGifError(); */
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+@@ -818,7 +818,7 @@
+         ie->frames = NULL;
+      }
+ 
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    *error = EVAS_LOAD_ERROR_NONE;
+    return EINA_TRUE;
+ }
+@@ -885,7 +885,7 @@
+      }
+ 
+    ie->frames = eina_list_append(ie->frames, frame);
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    return EINA_TRUE;
+ }
+ 
+@@ -959,7 +959,7 @@
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+-             DGifCloseFile(gif);
++             DGifCloseFile(gif, NULL);
+              *error = EVAS_LOAD_ERROR_NONE;
+              return EINA_TRUE;
+           }
+@@ -1080,7 +1080,7 @@
+          }
+      } while (rec != TERMINATE_RECORD_TYPE);
+ 
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    return duration;
+ }
+ 
diff --git a/package/libevas/Config.in b/package/libevas/Config.in
new file mode 100644
index 0000000..1f17fa3
--- /dev/null
+++ b/package/libevas/Config.in
@@ -0,0 +1,213 @@
+comment "libevas needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBEVAS
+	bool "libevas"
+	# libevas should normally build without threads, but due to a
+	# build issue when the async preloader is disabled, which is
+	# needed when no threads are available, we don't allow evas to
+	# be built without threads. This should be revisited when efl
+	# is bumped to 1.8.
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBEINA
+	# required to build so far
+	select BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
+	help
+	  Evas is a clean display canvas API for several target
+	  display systems that can draw anti-aliased text, smooth
+	  super and sub-sampled scaled images, alpha-blend objects
+	  much and more.
+
+	  http://trac.enlightenment.org/e/wiki/Evas
+
+if BR2_PACKAGE_LIBEVAS
+
+comment "libevas rendering options"
+
+config BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE
+	bool "libevas sampling scaler"
+	help
+	  This enables the sampling scaler code. This is the fastest
+	  image scaling code, but also the lowest quality.
+
+config BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
+	bool "libevas smooth scaler"
+	help
+	  This is the nicest looking scaler that is not that much
+	  slower than tri-linear, but it looks really good.
+
+config BR2_PACKAGE_LIBEVAS_SMALL_DITHERING
+	bool "libevas small dithering"
+	help
+	  This uses a 4x4 dither mask instead of 128x128. On desktop
+	  boxes these days (Pentium, Pentium2, amd etc.) the speed
+	  difference is not really measurable, but the quality of the
+	  128x128 dither mask is quite a lot better.
+
+config BR2_PACKAGE_LIBEVAS_LINE_DITHERING
+	bool "libevas line dithering"
+
+config BR2_PACKAGE_LIBEVAS_NO_DITHERING
+	bool "libevas no dithering"
+
+
+comment "libevas backends"
+
+config BR2_PACKAGE_LIBEVAS_BUFFER
+	bool "libevas buffer backend"
+	help
+	  This enables the software buffer rendering engine. There is
+	  no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_DIRECTFB
+	bool "libevas DirectFB backend"
+	depends on BR2_PACKAGE_DIRECTFB
+	default y
+	help
+	  This is the DirectFB engine that uses the DirectFB library
+	  (http://www.directfb.org) on Linux to access the framebuffer
+	  with (or maybe without) acceleration.
+
+config BR2_PACKAGE_LIBEVAS_FB
+	bool "libevas frame buffer backend"
+	help
+	  This is the software framebuffer driving engine. this uses
+	  the linux framebuffer device (/dev/fb<x>) and will currently
+	  just inherit the current framebuffer settings on the fb
+	  device and use them to run in.
+
+config BR2_PACKAGE_LIBEVAS_SDL
+	bool "libevas SDL backend"
+	select BR2_PACKAGE_SDL
+	help
+	  This is the software SDL engine that uses SDL library
+	  (http://www.libsdl.org). This library should work on many
+	  operating systems.
+
+config BR2_PACKAGE_LIBEVAS_SDL_GL
+	bool "libevas SDL OpenGL backend"
+	depends on BR2_PACKAGE_SDL_X11
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	help
+	  This is the SDL OpenGL engine that uses SDL library
+	  and OpenGL to render. This may be hardware accelerated.
+
+comment "SDL OpenGL backend needs modular X.org and X11 support in SDL"
+	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+
+config BR2_PACKAGE_LIBEVAS_X11
+	bool "libevas X11 backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	help
+	  This enables the software X11 rendering engine that renders
+	  to X drawable targets using highly optimised software
+	  routines. There is no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_X11_GLX
+	bool "libevas X11 GLX backend"
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	help
+	  This enables the OpenGL X11 rendering engine that renders
+	  using GLX which may be hardware accelerated.
+
+config BR2_PACKAGE_LIBEVAS_XCB
+	bool "libevas XCB backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_PIXMAN
+	help
+	  This enable the software XCB rendering engine. It allows the
+	  same features than the software X11 engine.
+
+config BR2_PACKAGE_LIBEVAS_XCB_GLX
+	bool "libevas XCB GLX backend"
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	help
+	  This enables the OpenGL X11 XCB rendering engine that renders
+	  using GLX which may be hardware accelerated.
+
+choice
+	prompt "libevas OpenGL flavor"
+	depends on BR2_PACKAGE_LIBEVAS_SDL_GL || BR2_PACKAGE_LIBEVAS_X11_GLX || BR2_PACKAGE_LIBEVAS_XCB_GLX
+	default BR2_PACKAGE_LIBEVAS_GL
+
+config BR2_PACKAGE_LIBEVAS_GL
+	bool "generic OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBEET
+
+config BR2_PACKAGE_LIBEVAS_GLES_SGX
+	bool "OpenGL-ES SGX"
+
+config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
+	bool "OpenGL-ES S3C6410"
+endchoice
+
+
+comment "libevas loaders"
+
+config BR2_PACKAGE_LIBEVAS_PNG
+	bool "libevas png loader"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This enables the loader code that loads png files using
+	  libpng.
+
+config BR2_PACKAGE_LIBEVAS_JPEG
+	bool "libevas jpeg loader"
+	select BR2_PACKAGE_JPEG
+	help
+	  This enables the loader code that loads jpeg files using
+	  libjpeg.
+
+config BR2_PACKAGE_LIBEVAS_GIF
+	bool "libevas gif loader"
+	select BR2_PACKAGE_GIFLIB
+	help
+	  This enables the loader code that loads gif files using
+	  libungif.
+
+config BR2_PACKAGE_LIBEVAS_PMAPS
+	bool "libevas pmaps loader"
+	help
+	  This enables the loader code that loads pmaps files.
+
+config BR2_PACKAGE_LIBEVAS_TIFF
+	bool "libevas tiff loader"
+	select BR2_PACKAGE_TIFF
+	help
+	  This enables the loader code that loads tiff files.
+
+config BR2_PACKAGE_LIBEVAS_XPM
+	bool "libevas xpm loader"
+	help
+	  This enables the loader code that loads xpm files.
+
+config BR2_PACKAGE_LIBEVAS_EET
+	bool "libevas eet image loader"
+	select BR2_PACKAGE_LIBEET
+	help
+	  This enables the loader code that loads images using libeet.
+
+config BR2_PACKAGE_LIBEVAS_EET_FONT
+	bool "libevas eet font loader"
+	select BR2_PACKAGE_LIBEET
+	help
+	  This enables the loader code that loads fonts using libeet.
+
+endif # BR2_PACKAGE_LIBEVAS
diff --git a/package/libevas/libevas.mk b/package/libevas/libevas.mk
new file mode 100644
index 0000000..9adb128
--- /dev/null
+++ b/package/libevas/libevas.mk
@@ -0,0 +1,247 @@
+################################################################################
+#
+# libevas
+#
+################################################################################
+
+LIBEVAS_VERSION = 1.7.10
+LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
+LIBEVAS_SITE = http://download.enlightenment.org/releases
+LIBEVAS_LICENSE = BSD-2c
+LIBEVAS_LICENSE_FILES = COPYING
+
+LIBEVAS_INSTALL_STAGING = YES
+
+LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
+
+HOST_LIBEVAS_DEPENDENCIES = \
+	host-pkgconf host-zlib host-libeina \
+	host-freetype host-libpng host-libjpeg
+HOST_LIBEVAS_CONF_OPTS += \
+	--enable-image-loader-png \
+	--enable-image-loader-jpeg \
+	--disable-image-loader-gif \
+	--disable-image-loader-tiff \
+	--disable-image-loader-eet \
+	--disable-font-loader-eet \
+	--disable-cpu-sse3 \
+	--disable-software-sdl \
+	--disable-gl-sdl \
+	--disable-software-xlib \
+	--disable-gl-xlib \
+	--enable-software-xcb \
+	--disable-gl-xcb
+
+# rendering options
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
+LIBEVAS_CONF_OPTS += --enable-scale-sample
+else
+LIBEVAS_CONF_OPTS += --disable-scale-sample
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
+LIBEVAS_CONF_OPTS += --enable-scale-smooth
+else
+LIBEVAS_CONF_OPTS += --disable-scale-smooth
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SMALL_DITHERING),y)
+LIBEVAS_CONF_OPTS += --enable-small-dither-mask
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_LINE_DITHERING),y)
+LIBEVAS_CONF_OPTS += --enable-line-dither-mask
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_NO_DITHERING),y)
+LIBEVAS_CONF_OPTS += --enable-no-dither-mask
+endif
+
+# backends
+ifeq ($(BR2_PACKAGE_LIBEVAS_BUFFER),y)
+LIBEVAS_CONF_OPTS += --enable-buffer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
+LIBEVAS_CONF_OPTS += --enable-software-xlib \
+	--with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+LIBEVAS_CONF_OPTS += --disable-software-xlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
+LIBEVAS_CONF_OPTS += --enable-gl-xlib
+LIBEVAS_DEPENDENCIES += \
+	xproto_glproto xlib_libX11 xlib_libXrender \
+	xlib_libXext libeet
+else
+LIBEVAS_CONF_OPTS += --disable-gl-xlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
+LIBEVAS_CONF_OPTS += --enable-software-xcb
+LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util pixman
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XCB_GLX),y)
+LIBEVAS_CONF_OPTS += --enable-gl-xcb
+LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util xproto_glproto
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_FB),y)
+LIBEVAS_CONF_OPTS += --enable-fb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_DIRECTFB),y)
+LIBEVAS_CONF_OPTS += --enable-directfb
+LIBEVAS_DEPENDENCIES += directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SDL),y)
+LIBEVAS_CONF_OPTS += --enable-software-sdl
+LIBEVAS_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
+LIBEVAS_CONF_OPTS += --enable-gl-sdl
+LIBEVAS_DEPENDENCIES += sdl
+# configure script forgets to check for eet / fill this out
+LIBEVAS_CONF_ENV += \
+	GL_EET_CFLAGS='-I$(STAGING_DIR)/usr/include/eet-1' \
+	GL_EET_LIBS='-leet'
+endif
+
+# libevas OpenGL flavor
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
+LIBEVAS_DEPENDENCIES += mesa3d libeet
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
+LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-sgx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
+LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-s3c6410
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX)$(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),)
+LIBEVAS_CONF_OPTS += --disable-gl-flavor-gles
+endif
+
+# code options
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+LIBEVAS_CONF_OPTS += --enable-cpu-mmx
+else
+LIBEVAS_CONF_OPTS += --disable-cpu-mmx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+LIBEVAS_CONF_OPTS += --enable-cpu-sse
+else
+LIBEVAS_CONF_OPTS += --disable-cpu-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
+LIBEVAS_CONF_OPTS += --enable-cpu-sse3
+else
+LIBEVAS_CONF_OPTS += --disable-cpu-sse3
+endif
+
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+LIBEVAS_CONF_OPTS += --enable-cpu-altivec
+else
+LIBEVAS_CONF_OPTS += --disable-cpu-altivec
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+LIBEVAS_CONF_OPTS += --enable-cpu-neon
+else
+LIBEVAS_CONF_OPTS += --disable-cpu-neon
+endif
+
+# loaders
+ifeq ($(BR2_PACKAGE_LIBEVAS_PNG),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-png
+LIBEVAS_DEPENDENCIES += libpng
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_JPEG),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-jpeg
+LIBEVAS_DEPENDENCIES += jpeg
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-gif
+LIBEVAS_DEPENDENCIES += giflib
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-gif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_PMAPS),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-pmaps
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-pmaps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-tiff
+LIBEVAS_DEPENDENCIES += tiff
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XPM),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-xpm
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-xpm
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_EET),y)
+LIBEVAS_CONF_OPTS += --enable-image-loader-eet
+LIBEVAS_DEPENDENCIES += libeet
+else
+LIBEVAS_CONF_OPTS += --disable-image-loader-eet
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_EET_FONT),y)
+LIBEVAS_CONF_OPTS += --enable-font-loader-eet
+LIBEVAS_DEPENDENCIES += libeet
+else
+LIBEVAS_CONF_OPTS += --disable-font-loader-eet
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBEVAS_CONF_OPTS += --enable-fontconfig
+LIBEVAS_DEPENDENCIES += fontconfig
+else
+LIBEVAS_CONF_OPTS += --disable-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+LIBEVAS_CONF_OPTS += --enable-fribidi
+LIBEVAS_DEPENDENCIES += libfribidi
+else
+LIBEVAS_CONF_OPTS += --disable-fribidi
+endif
+
+# libevas installs the source code of examples on the target, which
+# are generally not useful.
+define LIBEVAS_REMOVE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/share/evas/examples/
+endef
+
+LIBEVAS_POST_INSTALL_TARGET_HOOKS += LIBEVAS_REMOVE_EXAMPLES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.3
