From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 07:46:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123154619.7E05E30048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 07:46:18 -0800 (Fri, 23 Nov 2007)
New Revision: 20504

Log:
Ups, STRIP is called STRIPCMD nowadays

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-23 15:45:30 UTC (rev 20503)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-23 15:46:18 UTC (rev 20504)
@@ -66,7 +66,7 @@
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
-	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIP)' \
+	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' \
 		initdir=/etc/init.d -C $(DBUS_DIR)/dbus install-strip
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
 		$(TARGET_DIR)/usr/lib/libdbus-1.la \
