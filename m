From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 21:38:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [25562] trunk/buildroot/package/php
Message-ID: <20090305213837.81D1A775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 21:38:36 +0000 (Thu, 05 Mar 2009)
New Revision: 25562

Log:
php: touch post-install stamp file

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-03-05 21:38:30 UTC (rev 25561)
+++ trunk/buildroot/package/php/php.mk	2009-03-05 21:38:36 UTC (rev 25562)
@@ -171,6 +171,7 @@
 	rm -f $(TARGET_DIR)/usr/bin/php-config
 	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
 		$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini; fi
+	touch $@
 
 $(PHP_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
