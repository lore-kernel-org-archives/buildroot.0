From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:46 +0200
Subject: [Buildroot] [PATCH 05/19] packages: remove useless
	HOST_*_LIBTOOL_PATCH
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <69b91bdd947ec3261387b73461495646db492cfb.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk                             |    1 -
 package/directfb/directfb.mk                     |    1 -
 package/expat/expat.mk                           |    1 -
 package/fakeroot/fakeroot.mk                     |    1 -
 package/freetype/freetype.mk                     |    1 -
 package/libglib2/libglib2.mk                     |    1 -
 package/libpng/libpng.mk                         |    1 -
 package/libxml2/libxml2.mk                       |    2 --
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    1 -
 9 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a97fc02..e93738e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -7,7 +7,6 @@ DBUS_VERSION = 1.2.16
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
-HOST_DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
 ifeq ($(BR2_ENABLE_DEBUG),y)
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a4ee3bc..57b2e17 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -9,7 +9,6 @@ DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSIO
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
 DIRECTFB_LIBTOOL_PATCH = NO
-HOST_DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_INSTALL_TARGET = YES
 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 368a297..5b4eb97 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -8,7 +8,6 @@ EXPAT_VERSION = 2.0.1
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_LIBTOOL_PATCH = NO
-HOST_EXPAT_LIBTOOL_PATCH = NO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_TARGET = YES
 # no install-strip / install-exec
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index a8eff52..fd60dbe 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,7 +7,6 @@ FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
 FAKEROOT_LIBTOOL_PATCH=NO
-HOST_FAKEROOT_LIBTOOL_PATCH=NO
 
 define FAKEROOT_PATCH_FAKEROOT_IN
 	# If using busybox getopt, make it be quiet.
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index cffe811..f19b854 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -7,7 +7,6 @@ FREETYPE_VERSION = 2.3.12
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
-HOST_FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f122491..72a1396 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -11,7 +11,6 @@ LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_M
 
 LIBGLIB2_AUTORECONF = NO
 LIBGLIB2_LIBTOOL_PATCH = NO
-HOST_LIBGLIB2_LIBTOOL_PATCH = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7547884..f458871 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,7 +11,6 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-HOST_LIBPNG_LIBTOOL_PATCH = NO
 HOST_LIBPNG_CONF_OPT = --without-libpng-compat
 HOST_LIBPNG_DEPENDENCIES = host-pkg-config host-zlib
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0cffa06..7680aa6 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -28,8 +28,6 @@ HOST_LIBXML2_CONF_OPT = \
 		--enable-shared --without-debugging --without-python \
 		--without-threads
 
-HOST_LIBXML2_LIBTOOL_PATCH = NO
-
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))
 
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 6bda081..cc5cdf4 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -13,7 +13,6 @@ XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 XLIB_LIBFONTENC_CONF_OPT = --enable-shared --disable-static
 
-HOST_XLIB_LIBFONTENC_LIBTOOL_PATCH = NO
 HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc))
-- 
1.6.3.3
