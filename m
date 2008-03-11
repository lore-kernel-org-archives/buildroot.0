From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:14:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080311181442.D96F5120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:14:42 -0700 (Tue, 11 Mar 2008)
New Revision: 21300

Log:
fixes for php makefile

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2008-03-11 18:12:15 UTC (rev 21299)
+++ trunk/buildroot/package/php/php.mk	2008-03-11 18:14:42 UTC (rev 21300)
@@ -111,13 +111,14 @@
 endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
-	PHP_CONFIGURE+=--with-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
 	PHP_CONFIGURE+=--with-pdo-sqlite
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-	PHP_CONFIGURE+=--with-pod-mysql
+	PHP_CONFIGURE+=--with-pdo-mysql
 endif
+else
+	PHP_CONFIGURE+=--without-pdo-sqlite
 endif
 
 $(DL_DIR)/$(PHP_SOURCE):
