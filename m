From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 03:23:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070625102327.1A5A5A45B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 03:23:24 -0700 (Mon, 25 Jun 2007)
New Revision: 18917

Log:
- preserve quotes


Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-06-25 09:44:12 UTC (rev 18916)
+++ trunk/buildroot/package/at/at.mk	2007-06-25 10:23:24 UTC (rev 18917)
@@ -48,10 +48,10 @@
 
 $(TARGET_DIR)/$(AT_TARGET_BINARY): $(AT_DIR)/$(AT_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
-	echo "$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root " \
-		"$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install" \
+	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
+		'$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
 		> $(STAGING_DIR)/.fakeroot.at
-	echo "rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at" >> $(STAGING_DIR)/.fakeroot.at
+	echo 'rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at' >> $(STAGING_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/etc/init.d/S99at
 	touch -c $(TARGET_DIR)/$(AT_TARGET_BINARY)
 
