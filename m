From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 09:46:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20061220174643.AE174485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 09:46:43 -0800 (Wed, 20 Dec 2006)
New Revision: 17022

Log:
- don't install the docs


Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2006-12-20 17:46:00 UTC (rev 17021)
+++ trunk/buildroot/package/at/at.mk	2006-12-20 17:46:43 UTC (rev 17022)
@@ -46,7 +46,7 @@
 	echo "$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root " \
 		"$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install" \
 		> $(STAGING_DIR)/.fakeroot.at
-	echo "rm -rf $(TARGET_DIR)/usr/man" >> $(STAGING_DIR)/.fakeroot.at
+	echo "rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at" >> $(STAGING_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/etc/init.d/S99at
 	touch -c $(TARGET_DIR)/$(AT_TARGET_BINARY)
 
