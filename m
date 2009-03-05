From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 13:33:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bind
Message-ID: <20090305133311.988807626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 13:33:11 +0000 (Thu, 05 Mar 2009)
New Revision: 25542

Log:
bind: isc-config.sh gets installed into usr/bin, not /

Modified:
   trunk/buildroot/package/bind/bind.mk


Changeset:
Modified: trunk/buildroot/package/bind/bind.mk
===================================================================
--- trunk/buildroot/package/bind/bind.mk	2009-03-05 13:33:06 UTC (rev 25541)
+++ trunk/buildroot/package/bind/bind.mk	2009-03-05 13:33:11 UTC (rev 25542)
@@ -31,7 +31,7 @@
 $(eval $(call AUTOTARGETS,package,bind))
 
 $(BIND_HOOK_POST_INSTALL):
-	rm -f $(TARGET_DIR)/isc-config.sh
+	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
 ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
 endif
