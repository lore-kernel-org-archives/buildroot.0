From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 07:19:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080613141913.45D653C838@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 07:19:13 -0700 (Fri, 13 Jun 2008)
New Revision: 22325

Log:
avahi: make sure usr/lib/ exists


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-06-13 13:49:59 UTC (rev 22324)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-06-13 14:19:13 UTC (rev 22325)
@@ -164,7 +164,7 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.installed
-	mkdir -p $(TARGET_DIR)/etc/avahi/services
+	mkdir -p $(TARGET_DIR)/etc/avahi/services $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
