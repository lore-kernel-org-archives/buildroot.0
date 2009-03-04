From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 20:58:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090304205813.395FC7626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 20:58:12 +0000 (Wed, 04 Mar 2009)
New Revision: 25532

Log:
php: only overwrite php.ini if not present in target_skeleton

Allow platforms to provide a custom php.ini in their target_skeleton.

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-03-04 20:58:08 UTC (rev 25531)
+++ trunk/buildroot/package/php/php.mk	2009-03-04 20:58:12 UTC (rev 25532)
@@ -169,7 +169,8 @@
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	rm -f $(TARGET_DIR)/usr/bin/php-config
-	$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini
+	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
+		$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini; fi
 
 $(PHP_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
