From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Mon, 12 Jan 2009 10:29:46 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo libglib2
Message-ID: <20090112102946.8FFE4766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-12 10:29:46 +0000 (Mon, 12 Jan 2009)
New Revision: 24791

Log:
May not be the right way to do it but I just don't want those docs.


Modified:
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-12 10:25:31 UTC (rev 24790)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-12 10:29:46 UTC (rev 24791)
@@ -41,11 +41,15 @@
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
 
+CAIRO_CONF_OPT = --disable-gtk-doc --with-html-dir=/dev/null
+
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
+	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb \
+		--disable-gtk-doc --with-html-dir=/dev/null
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
 
+
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 
 $(eval $(call AUTOTARGETS,package,cairo))

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-12 10:25:31 UTC (rev 24790)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-12 10:29:46 UTC (rev 24791)
@@ -45,7 +45,8 @@
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
-		--disable-gtk-doc \
+	 	--disable-gtk-doc \
+		--with-html-dir=/dev/null \
 		--enable-static
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
