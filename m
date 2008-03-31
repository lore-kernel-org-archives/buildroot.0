From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 12:43:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080331194350.A1B7D3C47B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 12:43:50 -0700 (Mon, 31 Mar 2008)
New Revision: 21599

Log:
avahi: make sure /etc/dbus-1/system.d exists in target dir


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-03-31 19:36:08 UTC (rev 21598)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-03-31 19:43:50 UTC (rev 21599)
@@ -171,6 +171,7 @@
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 	cp -dpf $(STAGING_DIR)/usr/bin/avahi-* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/avahi-*
+	mkdir -p $(TARGET_DIR)/etc/dbus-1/system.d/
 	cp -r $(STAGING_DIR)/etc/dbus-1/system.d/avahi-* \
 		$(TARGET_DIR)/etc/dbus-1/system.d/
 endif
