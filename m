From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 03:44:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123114401.65EB03004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 03:44:00 -0800 (Fri, 23 Nov 2007)
New Revision: 20495

Log:
Do a full install to staging_dir so pkgconfig files also gets installed

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-23 11:42:59 UTC (rev 20494)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-23 11:44:00 UTC (rev 20495)
@@ -62,7 +62,7 @@
 	$(MAKE) -C $(DBUS_DIR) all
 
 $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR) install
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
