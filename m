From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 21:33:33 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/database/mysql_client
Message-ID: <20090129213333.DACC476D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 21:33:32 +0000 (Thu, 29 Jan 2009)
New Revision: 25143

Log:
mysql-client: remove test / benchmark stuff from target (saves ~70MB)

Modified:
   trunk/buildroot/package/database/mysql_client/mysql_client.mk


Changeset:
Modified: trunk/buildroot/package/database/mysql_client/mysql_client.mk
===================================================================
--- trunk/buildroot/package/database/mysql_client/mysql_client.mk	2009-01-29 21:29:19 UTC (rev 25142)
+++ trunk/buildroot/package/database/mysql_client/mysql_client.mk	2009-01-29 21:33:32 UTC (rev 25143)
@@ -25,3 +25,7 @@
 	$(ENABLE_DEBUG)
 
 $(eval $(call AUTOTARGETS,package/database,mysql_client))
+
+$(MYSQL_CLIENT_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
+	touch $@
