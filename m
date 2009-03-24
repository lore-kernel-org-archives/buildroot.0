From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 10:58:05 +0000 (UTC)
Subject: [Buildroot] svn commit: [25810] trunk/buildroot/package: atk
	autoconf automake cairo dbus dbus-gl etc...
Message-ID: <20090324105805.3AD3476BFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-24 10:58:04 +0000 (Tue, 24 Mar 2009)
New Revision: 25810

Log:
package: provide download target for host packages

Modified:
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/pixman/pixman.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -60,6 +60,9 @@
 # atk for the host
 ATK_HOST_DIR:=$(BUILD_DIR)/atk-$(ATK_VERSION)-host
 
+$(DL_DIR)/$(ATK_SOURCE):
+	$(call DOWNLOAD,$(ATK_SITE),$(ATK_SOURCE))
+
 $(STAMP_DIR)/host_atk_unpacked: $(DL_DIR)/$(ATK_SOURCE)
 	mkdir -p $(ATK_HOST_DIR)
 	$(INFLATE$(suffix $(ATK_SOURCE))) $< | \

Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -24,6 +24,9 @@
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
 
+$(DL_DIR)/$(AUTOCONF_SOURCE):
+	$(call DOWNLOAD,$(AUTOCONF_SITE),$(AUTOCONF_SOURCE))
+
 $(STAMP_DIR)/host_autoconf_unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
 	mkdir -p $(AUTOCONF_HOST_DIR)
 	$(INFLATE$(suffix $(AUTOCONF_SOURCE))) $< | \

Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -23,6 +23,9 @@
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
 
+$(DL_DIR)/$(AUTOMAKE_SOURCE):
+	$(call DOWNLOAD,$(AUTOMAKE_SITE),$(AUTOMAKE_SOURCE))
+
 $(STAMP_DIR)/host_automake_unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
 	mkdir -p $(AUTOMAKE_HOST_DIR)
 	$(INFLATE$(suffix $(AUTOMAKE_SOURCE))) $< | \

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -87,6 +87,9 @@
 # cairo for the host
 CAIRO_HOST_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)-host
 
+$(DL_DIR)/$(CAIRO_SOURCE):
+	$(call DOWNLOAD,$(CAIRO_SITE),$(CAIRO_SOURCE))
+
 $(STAMP_DIR)/host_cairo_unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
 	mkdir -p $(CAIRO_HOST_DIR)
 	$(INFLATE$(suffix $(CAIRO_SOURCE))) $< | \

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -61,6 +61,9 @@
 DBUS_HOST_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)-host
 DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
 
+$(DL_DIR)/$(DBUS_SOURCE):
+	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
+
 $(STAMP_DIR)/host_dbus_unpacked: $(DL_DIR)/$(DBUS_SOURCE)
 	mkdir -p $(DBUS_HOST_DIR)
 	$(INFLATE$(suffix $(DBUS_SOURCE))) $< | \

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -31,6 +31,9 @@
 DBUS_GLIB_HOST_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VERSION)-host
 DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
 
+$(DL_DIR)/$(DBUS_GLIB_SOURCE):
+	$(call DOWNLOAD,$(DBUS_GLIB_SITE),$(DBUS_GLIB_SOURCE))
+
 $(STAMP_DIR)/host_dbusglib_unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
 	mkdir -p $(DBUS_GLIB_HOST_DIR)
 	$(INFLATE$(suffix $(DBUS_GLIB_SOURCE))) $< | \

Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/expat/expat.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -27,6 +27,9 @@
 # expat for the host
 EXPAT_HOST_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)-host
 
+$(DL_DIR)/$(EXPAT_SOURCE):
+	$(call DOWNLOAD,$(EXPAT_SITE),$(EXPAT_SOURCE))
+
 $(STAMP_DIR)/host_expat_unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
 	mkdir -p $(EXPAT_HOST_DIR)
 	$(INFLATE$(suffix $(EXPAT_SOURCE))) $< | \

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -28,6 +28,9 @@
 # fontconfig for the host
 FONTCONFIG_HOST_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)-host
 
+$(DL_DIR)/$(FONTCONFIG_SOURCE):
+	$(call DOWNLOAD,$(FONTCONFIG_SITE),$(FONTCONFIG_SOURCE))
+
 $(STAMP_DIR)/host_fontconfig_unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
 	mkdir -p $(FONTCONFIG_HOST_DIR)
 	$(INFLATE$(suffix $(FONTCONFIG_SOURCE))) $< | \

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -26,6 +26,9 @@
 # freetype for the host
 FREETYPE_HOST_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
 
+$(DL_DIR)/$(FREETYPE_SOURCE):
+	$(call DOWNLOAD,$(FREETYPE_SITE),$(FREETYPE_SOURCE))
+
 $(STAMP_DIR)/host_freetype_unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
 	mkdir -p $(FREETYPE_HOST_DIR)
 	$(INFLATE$(suffix $(FREETYPE_SOURCE))) $< | \

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -68,6 +68,9 @@
 LIBGLIB2_HOST_DIR:=$(BUILD_DIR)/libglib2-$(LIBGLIB2_VERSION)-host
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
 
+$(DL_DIR)/$(LIBGLIB2_SOURCE):
+	$(call DOWNLOAD,$(LIBGLIB2_SITE),$(LIBGLIB2_SOURCE))
+
 $(STAMP_DIR)/host_libglib2_unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
 	mkdir -p $(LIBGLIB2_HOST_DIR)
 	$(INFLATE$(suffix $(LIBGLIB2_SOURCE))) $< | \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -135,6 +135,9 @@
 # libgtk2 for the host
 LIBGTK2_HOST_DIR:=$(BUILD_DIR)/libgtk2-$(LIBGTK2_VERSION)-host
 
+$(DL_DIR)/$(LIBGTK2_SOURCE):
+	$(call DOWNLOAD,$(LIBGTK2_SITE),$(LIBGTK2_SOURCE))
+
 $(STAMP_DIR)/host_libgtk2_unpacked: $(DL_DIR)/$(LIBGTK2_SOURCE)
 	mkdir -p $(LIBGTK2_HOST_DIR)
 	$(INFLATE$(suffix $(LIBGTK2_SOURCE))) $< | \

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/libtool/libtool.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -21,6 +21,9 @@
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
 
+$(DL_DIR)/$(LIBTOOL_SOURCE):
+	$(call DOWNLOAD,$(LIBTOOL_SITE),$(LIBTOOL_SOURCE))
+
 $(STAMP_DIR)/host_libtool_unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
 	mkdir -p $(LIBTOOL_HOST_DIR)
 	$(INFLATE$(suffix $(LIBTOOL_SOURCE))) $< | \

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -66,6 +66,9 @@
 PANGO_HOST_DIR:=$(BUILD_DIR)/pango-$(PANGO_VERSION)-host
 PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
 
+$(DL_DIR)/$(PANGO_SOURCE):
+	$(call DOWNLOAD,$(PANGO_SITE),$(PANGO_SOURCE))
+
 $(STAMP_DIR)/host_pango_unpacked: $(DL_DIR)/$(PANGO_SOURCE)
 	mkdir -p $(PANGO_HOST_DIR)
 	$(INFLATE$(suffix $(PANGO_SOURCE))) $< | \

Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/pixman/pixman.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/pixman/pixman.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -14,6 +14,9 @@
 # pixman for the host
 PIXMAN_HOST_DIR:=$(BUILD_DIR)/pixman-$(PIXMAN_VERSION)-host
 
+$(DL_DIR)/$(PIXMAN_SOURCE):
+	$(call DOWNLOAD,$(PIXMAN_SITE),$(PIXMAN_SOURCE))
+
 $(STAMP_DIR)/host_pixman_unpacked: $(DL_DIR)/$(PIXMAN_SOURCE)
 	mkdir -p $(PIXMAN_HOST_DIR)
 	$(INFLATE$(suffix $(PIXMAN_SOURCE))) $< | \

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-24 09:18:09 UTC (rev 25809)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-24 10:58:04 UTC (rev 25810)
@@ -21,6 +21,9 @@
 PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
 
+$(DL_DIR)/$(PKG_CONFIG_SOURCE):
+	$(call DOWNLOAD,$(PKG_CONFIG_SITE),$(PKG_CONFIG_SOURCE))
+
 $(STAMP_DIR)/host_pkgconfig_unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
 	mkdir -p $(PKG_CONFIG_HOST_DIR)
 	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
