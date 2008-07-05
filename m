From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 02:30:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: atk cairo
	gtk2-engines libglib2 libgtk2 etc...
Message-ID: <20080705093019.B2EFBF800D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 02:30:17 -0700 (Sat, 05 Jul 2008)
New Revision: 22653

Log:
Use HOST_GLIB for packages

Modified:
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/webkit/webkit.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/atk/atk.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -39,7 +39,7 @@
 		am_cv_func_working_getline=yes gl_cv_func_mkdir_trailing_slash_bug=no \
 		gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
-		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no 
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/cairo/cairo.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -39,7 +39,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal 
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal 
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb

Modified: trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
===================================================================
--- trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -69,7 +69,7 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
 		ac_cv_path_CUPS_CONFIG=no
 
 

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -40,7 +40,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no 
 
 LIBGLIB2_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -40,9 +40,9 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
-		ac_cv_path_GTK_UPDATE_ICON_CACHE=/usr/bin/gtk-update-icon-cache \
-		ac_cv_path_GDK_PIXBUF_CSOURCE=/usr/bin/gdk-pixbuf-csource \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
+		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_GLIB)/bin/gtk-update-icon-cache \
+		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_GLIB)/bin/gdk-pixbuf-csource \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no 
 
 LIBGTK2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
@@ -55,7 +55,7 @@
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-debug \
 		$(LIBGTK2_CONF_OPT_X)  $(LIBGTK2_CONF_OPT_DFB)
 
 

Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/metacity/metacity.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -96,7 +96,7 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/pango/pango.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -40,7 +40,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config 
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config 
 		
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
         PANGO_CONF_OPT_X = --with-x \

Modified: trunk/buildroot/package/webkit/webkit.mk
===================================================================
--- trunk/buildroot/package/webkit/webkit.mk	2008-07-05 09:22:38 UTC (rev 22652)
+++ trunk/buildroot/package/webkit/webkit.mk	2008-07-05 09:30:17 UTC (rev 22653)
@@ -13,7 +13,7 @@
 
 WEBKIT_AUTORECONF = YES
 WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt xserver_xorg-server libgtk2 sqlite
-WEBKIT_MAKE_OPT = GLIB_GENMARSHAL=/usr/bin/glib-genmarshal GLIB_MKENUMS=/usr/bin/glib-mkenums
+WEBKIT_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,webkit))
 
