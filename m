From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  7 Mar 2009 20:17:23 +0000 (UTC)
Subject: [Buildroot] svn commit: [25568] trunk/buildroot/package/logrotate
Message-ID: <20090307201723.9F6697646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-07 20:17:23 +0000 (Sat, 07 Mar 2009)
New Revision: 25568

Log:
logrotate: fix logrotate.conf check

Thanks to Hiroshi Shinji for noticing.

Modified:
   trunk/buildroot/package/logrotate/logrotate.mk


Changeset:
Modified: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	2009-03-07 13:51:22 UTC (rev 25567)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2009-03-07 20:17:23 UTC (rev 25568)
@@ -18,8 +18,8 @@
 
 $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
 	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
-	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then
-		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf;
+	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then \
+		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf; \
 	fi
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 
