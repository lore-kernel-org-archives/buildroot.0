From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 31 Aug 2008 13:23:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080831202338.2B9EB3C671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-31 13:23:37 -0700 (Sun, 31 Aug 2008)
New Revision: 23285

Log:
avahi: don't use BASE_DIR to reference source files

dest != source if we want to support out-of-tree builds

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-08-31 06:26:40 UTC (rev 23284)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-08-31 20:23:37 UTC (rev 23285)
@@ -156,9 +156,9 @@
 	mkdir -p $(TARGET_DIR)/var/lib
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
-	cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
+	cp -af package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
-	cp -af $(BASE_DIR)/package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
+	cp -af package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $(TARGET_DIR)/usr/sbin/avahi-autoipd
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
@@ -168,7 +168,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
-	cp -af $(BASE_DIR)/package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
+	cp -af package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 	cp -dpf $(STAGING_DIR)/usr/bin/avahi-* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/avahi-*
