From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Jun 2008 14:01:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus-glib
Message-ID: <20080614210108.45CD13C8D0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-14 14:01:07 -0700 (Sat, 14 Jun 2008)
New Revision: 22341

Log:
dbus-glib: don't depend on host pkg-config



Modified:
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2008-06-14 21:01:03 UTC (rev 22340)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2008-06-14 21:01:07 UTC (rev 22341)
@@ -21,7 +21,7 @@
 	toolchain/patch-kernel.sh $(DBUS_GLIB_DIR) package/dbus-glib/ \*.patch
 	touch $(DBUS_GLIB_DIR)/.unpacked
 
-$(DBUS_GLIB_DIR)/.configured: $(DBUS_GLIB_DIR)/.unpacked /usr/bin/pkg-config
+$(DBUS_GLIB_DIR)/.configured: $(DBUS_GLIB_DIR)/.unpacked
 	(cd $(DBUS_GLIB_DIR); rm -rf config.cache; autoconf; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -60,7 +60,7 @@
 	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/dbus-binding-tool $(TARGET_DIR)/usr/bin
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
 
-dbus-glib: uclibc dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
+dbus-glib: uclibc pkgconfig dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
 
 dbus-glib-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2*
