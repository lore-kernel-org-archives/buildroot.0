From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Wed, 14 Jan 2009 13:36:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20090114133637.93DCB769A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-14 13:36:36 +0000 (Wed, 14 Jan 2009)
New Revision: 24829

Log:
Better to use the correct --without 


Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-14 12:49:24 UTC (rev 24828)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-14 13:36:36 UTC (rev 24829)
@@ -46,7 +46,7 @@
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
-CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=""
+CAIRO_CONF_OPT += --disable-gtk-doc --without-html-dir
 
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 
