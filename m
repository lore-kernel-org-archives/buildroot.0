From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Nov 2008 11:21:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo
	java/classpath libgtk2
Message-ID: <20081102192118.209FE3C923@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-02 11:21:17 -0800 (Sun, 02 Nov 2008)
New Revision: 23904

Log:
libpng: fix Makefile.autotools.in fallout

libpng used to have the 'png' Makefile alias, which some packages used
in their dependencies list.

With the move to Makefile.autotools.in this is now gone, so update the
packages to match.

Modified:
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2008-11-02 19:21:12 UTC (rev 23903)
+++ trunk/buildroot/package/cairo/cairo.mk	2008-11-02 19:21:17 UTC (rev 23904)
@@ -46,6 +46,6 @@
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 
 $(eval $(call AUTOTARGETS,package,cairo))

Modified: trunk/buildroot/package/java/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/java/classpath/classpath.mk	2008-11-02 19:21:12 UTC (rev 23903)
+++ trunk/buildroot/package/java/classpath/classpath.mk	2008-11-02 19:21:17 UTC (rev 23904)
@@ -53,7 +53,7 @@
 		--disable-debug \
 		--disable-gconf-peer --disable-examples --disable-plugin
 
-CLASSPATH_DEPENDENCIES = uclibc pkgconfig png jpeg tiff
+CLASSPATH_DEPENDENCIES = uclibc pkgconfig libpng jpeg tiff
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 	CLASSPATH_DEPENDENCIES+= alsa-lib

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-11-02 19:21:12 UTC (rev 23903)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-11-02 19:21:17 UTC (rev 23904)
@@ -111,6 +111,6 @@
 	LIBGTK2_CONF_OPT += --without-x
 endif
 
-LIBGTK2_DEPENDENCIES = uclibc pkgconfig png jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cairo pango atk
+LIBGTK2_DEPENDENCIES = uclibc pkgconfig libpng jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cairo pango atk
 
 $(eval $(call AUTOTARGETS,package,libgtk2))
