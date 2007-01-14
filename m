From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:10:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20070114031046.762FE485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:10:46 -0800 (Sat, 13 Jan 2007)
New Revision: 17280

Log:
Get rid of broken locale configuration option. I need to do a little more work on this.


Modified:
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2007-01-14 03:09:47 UTC (rev 17279)
+++ trunk/buildroot/package/libglib2/Config.in	2007-01-14 03:10:46 UTC (rev 17280)
@@ -1,16 +1,11 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
 	default n
-	help
-	  Low-level core library that forms the basis of GTK+ and GNOME.
-
-	  http://www.gtk.org/
-
-config BR2_PACKAGE_LIBGLIB2_LOCALE
-	bool "libglib2-locale"
-	default n
 	select BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT
 	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_PKGCONFIG
 	help
-	  Enable locale support for Glib library.
+	  Low-level core library that forms the basis of GTK+ and GNOME.
+
+	  http://www.gtk.org/

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-01-14 03:09:47 UTC (rev 17279)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-01-14 03:10:46 UTC (rev 17280)
@@ -146,11 +146,7 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgthread-2.0.so.0.*
 	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
-ifeq ($(strip $(BR2_PACKAGE_LIBGLIB2_LOCAL)),y)
 libglib2: uclibc gettext libintl pkgconfig $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
-else
-libglib2: uclibc $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
-endif
 
 libglib2-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libglib-2.0*
