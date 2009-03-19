From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 11:41:06 +0000 (UTC)
Subject: [Buildroot] svn commit: [25757] trunk/buildroot/package: avahi
	libgtk2
Message-ID: <20090319114106.7D0AF7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 11:41:05 +0000 (Thu, 19 Mar 2009)
New Revision: 25757

Log:
avahi: gtk support needs libglade as well

Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-19 11:07:10 UTC (rev 25756)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-19 11:41:05 UTC (rev 25757)
@@ -115,8 +115,8 @@
 AVAHI_CONF_OPT += --disable-glib --disable-gobject
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-AVAHI_DEPENDENCIES += libgtk2
+ifeq ($(BR2_PACKAGE_LIBGLADE),y)
+AVAHI_DEPENDENCIES += libglade
 else
 AVAHI_CONF_OPT += --disable-gtk
 endif

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 11:07:10 UTC (rev 25756)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 11:41:05 UTC (rev 25757)
@@ -152,7 +152,6 @@
 		--disable-static \
 		--disable-glibtest \
 		--without-libtiff \
-		--without-libpng \
 		--without-libjpeg \
 		--with-x \
 		--with-gdktarget=x11 \
