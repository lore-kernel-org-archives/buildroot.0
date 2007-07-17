From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:24:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/thttpd
Message-ID: <20070717002455.7D8F430095@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:24:54 -0700 (Mon, 16 Jul 2007)
New Revision: 19123

Log:
The clean target should really work.


Modified:
   trunk/buildroot/package/thttpd/thttpd.mk


Changeset:
Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2007-07-17 00:24:13 UTC (rev 19122)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2007-07-17 00:24:54 UTC (rev 19123)
@@ -61,6 +61,13 @@
 
 thttpd-clean:
 	rm -f $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/sbin/httpd_wrapper
+	rm -f $(TARGET_DIR)/sbin/thttpd_wrapper
+	rm -rf $(TARGET_DIR)/var/www
+	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
+	rm -f $(TARGET_DIR)/bin/htpasswd
+	rm -f $(TARGET_DIR)/bin/makeweb
+	rm -f $(TARGET_DIR)/bin/syslogtocern
 	-$(MAKE) -C $(THTTPD_DIR) clean
 
 thttpd-dirclean:
