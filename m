From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Nov 2007 07:47:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071126154741.4FEB8300D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-26 07:47:41 -0800 (Mon, 26 Nov 2007)
New Revision: 20546

Log:
Really fix target install (typo in r20494)

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-26 15:39:02 UTC (rev 20545)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-26 15:47:41 UTC (rev 20546)
@@ -67,7 +67,7 @@
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
 	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' \
-		initdir=/etc/init.d -C $(DBUS_DIR)/dbus install-strip
+		initdir=/etc/init.d -C $(DBUS_DIR) install-strip
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
 		$(TARGET_DIR)/usr/lib/libdbus-1.la \
 		$(TARGET_DIR)/usr/include/dbus-1.0 \
