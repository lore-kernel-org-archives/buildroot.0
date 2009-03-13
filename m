From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Mar 2009 15:37:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25644] trunk/buildroot/package/dbus-glib
Message-ID: <20090313153755.DA4377643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-13 15:37:54 +0000 (Fri, 13 Mar 2009)
New Revision: 25644

Log:
dbus-glib: install pkgconfig file to STAGING_DIR

This should probably be converted to Makefile.autotools.in instead.

Modified:
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-13 14:26:44 UTC (rev 25643)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-13 15:37:54 UTC (rev 25644)
@@ -50,6 +50,7 @@
 	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_GLIB_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0: $(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY)
+	cp -a $(DBUS_GLIB_DIR)/dbus-glib-1.pc $(STAGING_DIR)/usr/lib/pkgconfig
 	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so* $(STAGING_DIR)/usr/lib
 	-touch -c $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
 
