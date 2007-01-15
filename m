From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 15 Jan 2007 08:02:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20070115160246.D961148566@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-15 08:02:45 -0800 (Mon, 15 Jan 2007)
New Revision: 17313

Log:
- ignore error if var/run/dbus already exists. Thanks whirm for noticing


Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-01-15 16:01:34 UTC (rev 17312)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-01-15 16:02:45 UTC (rev 17313)
@@ -58,7 +58,7 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
-	mkdir $(TARGET_DIR)/var/run/dbus
+	-mkdir $(TARGET_DIR)/var/run/dbus
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/dbus-1.0
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la
