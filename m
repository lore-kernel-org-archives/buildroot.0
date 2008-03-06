From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:54:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080306175447.024A2120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:54:47 -0800 (Thu, 06 Mar 2008)
New Revision: 21180

Log:
makefile cleanup for avahi

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-03-06 17:54:27 UTC (rev 21179)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-03-06 17:54:47 UTC (rev 21180)
@@ -145,11 +145,13 @@
 	touch $@
 
 $(AVAHI_DIR)/.installed: $(AVAHI_DIR)/.compiled
+	mkdir -p $(STAGING_DIR)/etc/avahi
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR) install
 	touch $@
 
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
 	mkdir -p $(TARGET_DIR)/etc/avahi
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	mkdir -p $(TARGET_DIR)/var/lib
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
