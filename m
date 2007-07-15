From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 15 Jul 2007 16:35:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070715233532.93FAFA4583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-15 16:35:31 -0700 (Sun, 15 Jul 2007)
New Revision: 19104

Log:
Use correct script to init lighttpd

Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-15 22:01:33 UTC (rev 19103)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-15 23:35:31 UTC (rev 19104)
@@ -60,7 +60,7 @@
     
 $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY): $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
-	$(INSTALL) -m 0755 -D $(LIGHTTPD_DIR)/debian/init.d $(TARGET_DIR)/etc/init.d/S99lighttpd
+	$(INSTALL) -m 0755 -D $(LIGHTTPD_DIR)/openwrt/S51lighttpd  $(TARGET_DIR)/etc/init.d/S99lighttpd
 
 lighttpd: uclibc openssl $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
 
