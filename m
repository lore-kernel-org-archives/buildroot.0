From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 14 Jan 2009 14:24:48 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
In-Reply-To: <20090114133637.93DCB769A1@busybox.osuosl.org>
References: <20090114133637.93DCB769A1@busybox.osuosl.org>
Message-ID: <COL102-DS153B476E9992200EBB96B2DCD60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think the same can be done for libglib2 and libgtk2 to stop them
installing as well which would be nice.

Cheers
Dan laird

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of thomasez at uclibc.org
Sent: 2009 Jan 14 13:37
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo

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
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-14 12:49:24 UTC (rev
24828)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-14 13:36:36 UTC (rev
24829)
@@ -46,7 +46,7 @@
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
-CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=""
+CAIRO_CONF_OPT += --disable-gtk-doc --without-html-dir
 
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng
fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
