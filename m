From: Claus Klein <claus.klein@arcormail.de>
Date: Mon, 31 Dec 2007 22:55:44 +0100
Subject: [Buildroot] [patch] prevent make  install error for avahi pkg
Message-ID: <47796560.7000603@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make sure than target dir exist bevor instll to it:
ck

root at slax:/buildroot/package/avahi# svn diff
Index: avahi.mk
===================================================================
--- avahi.mk    (revision 20696)
+++ avahi.mk    (working copy)
@@ -151,6 +151,7 @@
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
        mkdir -p $(TARGET_DIR)/etc/avahi
        mkdir -p $(TARGET_DIR)/var/lib
+       mkdir -p $(TARGET_DIR)/usr/share/udhcpc/
        cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action 
$(TARGET_DIR)/etc/avahi/
        cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script 
$(TARGET_DIR)/usr/share/udhcpc/default.script
        chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
root at slax:/buildroot/package/avahi#                           
