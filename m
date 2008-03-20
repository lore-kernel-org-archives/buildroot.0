From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 20 Mar 2008 09:54:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
Message-ID: <20080320165452.71D153C304@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-20 09:54:51 -0700 (Thu, 20 Mar 2008)
New Revision: 21415

Log:
some fixes for fltk

Added:
   trunk/buildroot/package/fltk/fltk-1.1.7-makefiles.patch

Modified:
   trunk/buildroot/package/fltk/fltk.mk


Changeset:
Added: trunk/buildroot/package/fltk/fltk-1.1.7-makefiles.patch
===================================================================
--- trunk/buildroot/package/fltk/fltk-1.1.7-makefiles.patch	                        (rev 0)
+++ trunk/buildroot/package/fltk/fltk-1.1.7-makefiles.patch	2008-03-20 16:54:51 UTC (rev 21415)
@@ -0,0 +1,132 @@
+--- a/jpeg/Makefile	2005-02-27 19:11:07.000000000 -0500
++++ b/jpeg/Makefile	2008-03-19 13:17:46.000000000 -0400
+@@ -65,14 +65,14 @@ clean:
+ #
+ 
+ install:
+-	echo "Installing libfltk_jpeg$(LIBEXT) in $(libdir)..."
+-	-$(MKDIR) $(libdir)
+-	$(RM) $(libdir)/libfltk_jpeg$(LIBEXT)
+-	$(CP) $(LIBJPEG) $(libdir)
+-	$(RANLIB) $(libdir)/libfltk_jpeg$(LIBEXT)
+-	echo "Installing jpeg headers in $(includedir)/FL/images..."
+-	-$(MKDIR) $(includedir)/FL/images
+-	$(CP) jconfig.h jerror.h jmorecfg.h jpeglib.h $(includedir)/FL/images
++	echo "Installing libfltk_jpeg$(LIBEXT) in $(DESTDIR)$(libdir)..."
++	-$(MKDIR) $(DESTDIR)$(libdir)
++	$(RM) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
++	$(CP) $(LIBJPEG) $(DESTDIR)$(libdir)
++	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
++	echo "Installing jpeg headers in $(DESTDIR)$(includedir)/FL/images..."
++	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
++	$(CP) jconfig.h jerror.h jmorecfg.h jpeglib.h $(DESTDIR)$(includedir)/FL/images
+ 
+ 
+ #
+@@ -81,12 +81,12 @@ install:
+ 
+ uninstall:
+ 	echo "Uninstalling libfltk_jpeg$(LIBEXT) in $(libdir)..."
+-	$(RM) $(libdir)/libfltk_jpeg$(LIBEXT)
++	$(RM) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
+ 	echo "Uninstalling jpeg headers in $(includedir)/FL/images..."
+-	$(RM) $(includedir)/FL/images/jconfig.h
+-	$(RM) $(includedir)/FL/images/jerror.h
+-	$(RM) $(includedir)/FL/images/jmorecfg.h
+-	$(RM) $(includedir)/FL/images/jpeglib.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/jconfig.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/jerror.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/jmorecfg.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/jpeglib.h
+ 
+ 
+ #
+
+--- a/png/Makefile	2005-02-24 16:55:12.000000000 -0500
++++ b/png/Makefile	2008-03-19 13:18:38.000000000 -0400
+@@ -57,14 +57,14 @@ clean:
+ #
+ 
+ install: $(LIBPNG)
+-	echo "Installing libfltk_png$(LIBEXT) in $(libdir)..."
+-	-$(MKDIR) $(libdir)
+-	$(RM) $(libdir)/libfltk_png$(LIBEXT)
+-	$(CP) $(LIBPNG) $(libdir)
+-	$(RANLIB) $(libdir)/libfltk_png$(LIBEXT)
+-	echo "Installing png headers in $(includedir)/FL/images..."
+-	-$(MKDIR) $(includedir)/FL/images
+-	$(CP) png.h pngconf.h $(includedir)/FL/images
++	echo "Installing libfltk_png$(LIBEXT) in $(DESTDIR)$(libdir)..."
++	-$(MKDIR) $(DESTDIR)$(libdir)
++	$(RM) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
++	$(CP) $(LIBPNG) $(DESTDIR)$(libdir)
++	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
++	echo "Installing png headers in $(DESTDIR)$(includedir)/FL/images..."
++	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
++	$(CP) png.h pngconf.h $(DESTDIR)$(includedir)/FL/images
+ 
+ 
+ #
+@@ -72,11 +72,11 @@ install: $(LIBPNG)
+ #
+ 
+ uninstall:
+-	echo "Uninstalling libfltk_png$(LIBEXT) in $(libdir)..."
+-	$(RM) $(libdir)/libfltk_png$(LIBEXT)
+-	echo "Uninstalling png headers in $(includedir)/FL/images..."
+-	$(RM) $(includedir)/FL/images/png.h
+-	$(RM) $(includedir)/FL/images/pngconf.h
++	echo "Uninstalling libfltk_png$(LIBEXT) in $(DESTDIR)$(libdir)..."
++	$(RM) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
++	echo "Uninstalling png headers in $(DESTDIR)$(includedir)/FL/images..."
++	$(RM) $(DESTDIR)$(includedir)/FL/images/png.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/pngconf.h
+ 
+ 
+ #
+
+--- a/zlib/Makefile	2005-02-24 16:55:12.000000000 -0500
++++ b/zlib/Makefile	2008-03-19 13:20:34.000000000 -0400
+@@ -57,14 +57,14 @@ clean:
+ #
+ 
+ install: $(LIBZ)
+-	echo "Installing libfltk_z$(LIBEXT) in $(libdir)..."
+-	-$(MKDIR) $(libdir)
+-	$(RM) $(libdir)/libfltk_z$(LIBEXT)
+-	$(CP) $(LIBZ) $(libdir)
+-	$(RANLIB) $(libdir)/libfltk_z$(LIBEXT)
+-	echo "Installing zlib headers in $(includedir)/FL/images..."
+-	-$(MKDIR) $(includedir)/FL/images
+-	$(CP) zconf.h zlib.h zutil.h $(includedir)/FL/images
++	echo "Installing libfltk_z$(LIBEXT) in $(DESTDIR)$(libdir)..."
++	-$(MKDIR) $(DESTDIR)$(libdir)
++	$(RM) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
++	$(CP) $(LIBZ) $(DESTDIR)$(libdir)
++	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
++	echo "Installing zlib headers in $(DESTDIR)$(includedir)/FL/images..."
++	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
++	$(CP) zconf.h zlib.h zutil.h $(DESTDIR)$(includedir)/FL/images
+ 
+ 
+ #
+@@ -72,12 +72,12 @@ install: $(LIBZ)
+ #
+ 
+ uninstall:
+-	echo "Uninstalling libfltk_z$(LIBEXT) in $(libdir)..."
+-	$(RM) $(libdir)/libfltk_z$(LIBEXT)
+-	echo "Uninstalling zlib headers in $(includedir)/FL/images..."
+-	$(RM) $(includedir)/FL/images/zconf.h
+-	$(RM) $(includedir)/FL/images/zlib.h
+-	$(RM) $(includedir)/FL/images/zutil.h
++	echo "Uninstalling libfltk_z$(LIBEXT) in $(DESTDIR)$(libdir)..."
++	$(RM) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
++	echo "Uninstalling zlib headers in $(DESTDIR)$(includedir)/FL/images..."
++	$(RM) $(DESTDIR)$(includedir)/FL/images/zconf.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/zlib.h
++	$(RM) $(DESTDIR)$(includedir)/FL/images/zutil.h
+ 
+ 
+ #
+

Modified: trunk/buildroot/package/fltk/fltk.mk
===================================================================
--- trunk/buildroot/package/fltk/fltk.mk	2008-03-20 16:05:02 UTC (rev 21414)
+++ trunk/buildroot/package/fltk/fltk.mk	2008-03-20 16:54:51 UTC (rev 21415)
@@ -10,11 +10,13 @@
 FLTK_AUTORECONF = NO
 FLTK_INSTALL_STAGING = YES
 FLTK_INSTALL_TARGET = YES
-FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
+FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
+FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
+
 FLTK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--sysconfdir=/etc 
+		--sysconfdir=/etc --enable-shared --enable-threads --with-x
 
 FLTK_DEPENDENCIES = uclibc $(XSERVER) 
 
