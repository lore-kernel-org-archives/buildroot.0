From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Fri, 25 Jan 2008 23:56:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080126075600.E70C212C58E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-01-25 23:55:58 -0800 (Fri, 25 Jan 2008)
New Revision: 20904

Log:
Mail from Claus Klein:
make sure than target dir exist bevor instll to it:


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-01-25 22:46:34 UTC (rev 20903)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-01-26 07:55:58 UTC (rev 20904)
@@ -151,6 +151,7 @@
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
 	mkdir -p $(TARGET_DIR)/etc/avahi
 	mkdir -p $(TARGET_DIR)/var/lib
+	mkdir -p $(TARGET_DIR)/usr/share/udhcpc
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
 	cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
