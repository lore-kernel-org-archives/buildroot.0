From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Wed, 14 Jan 2009 12:26:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20090114122631.62E04769A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-14 12:26:30 +0000 (Wed, 14 Jan 2009)
New Revision: 24827

Log:
Woops, we do need /dev/null, not a directory with html in it.


Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-14 11:19:09 UTC (rev 24826)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-14 12:26:30 UTC (rev 24827)
@@ -46,7 +46,7 @@
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
-CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=/dev/null
+CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=""
 
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 
