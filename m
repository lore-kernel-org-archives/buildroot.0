From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 22 Jan 2007 10:15:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070122181535.BB4C14858F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-22 10:15:35 -0800 (Mon, 22 Jan 2007)
New Revision: 17470

Log:
fix installation location


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-01-22 18:15:15 UTC (rev 17469)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-01-22 18:15:35 UTC (rev 17470)
@@ -129,11 +129,11 @@
 	$(MAKE) -C $(AVAHI_DIR)
 	touch $(AVAHI_DIR)/.compiled
 
-$(STAGING_DIR)/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
+$(STAGING_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-autoipd install
-	touch -c $(STAGING_DIR)/sbin/avahi-autoipd
+	touch -c $(STAGING_DIR)/usr/sbin/avahi-autoipd
 
-$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(STAGING_DIR)/sbin/avahi-autoipd
+$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(STAGING_DIR)/usr/sbin/avahi-autoipd
 	cp $^ $@
 	mkdir -p $(TARGET_DIR)/etc/avahi
 	mkdir -p $(TARGET_DIR)/var/lib
