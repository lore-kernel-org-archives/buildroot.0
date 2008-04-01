From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 05:26:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/thttpd
Message-ID: <20080401122651.0F9353C55E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 05:26:49 -0700 (Tue, 01 Apr 2008)
New Revision: 21609

Log:
thttpd: fix thttpd_wrapper name

Patch by Simon Pasch.


Modified:
   trunk/buildroot/package/thttpd/thttpd.mk


Changeset:
Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2008-04-01 10:30:32 UTC (rev 21608)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2008-04-01 12:26:49 UTC (rev 21609)
@@ -46,7 +46,7 @@
 	install -D $(THTTPD_DIR)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
 	cp $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/init.d/S90thttpd.in
 	cp $(TARGET_DIR)/sbin/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:$(THTTPD_WEB_DIR):g" < $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/httpd_wrapper
+	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:$(THTTPD_WEB_DIR):g" < $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/thttpd_wrapper
 	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in > $(TARGET_DIR)/etc/init.d/S90thttpd
 	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd.in $(TARGET_DIR)/sbin/thttpd_wrapper.in
 	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/data
