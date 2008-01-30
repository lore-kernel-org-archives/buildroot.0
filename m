From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Wed, 30 Jan 2008 05:57:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080130135733.A24E7120107@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-01-30 05:57:31 -0800 (Wed, 30 Jan 2008)
New Revision: 20924

Log:
create /var/lib/dbus

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-01-29 10:33:34 UTC (rev 20923)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-01-30 13:57:31 UTC (rev 20924)
@@ -65,7 +65,7 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR) install
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
-	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/var/lib/dbus $(TARGET_DIR)/etc/init.d
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' \
 		initdir=/etc/init.d -C $(DBUS_DIR) install-strip
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
