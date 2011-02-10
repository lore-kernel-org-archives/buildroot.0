From: Fabien Marteau <fabien.marteau@armadeus.com>
Date: Thu, 10 Feb 2011 11:12:49 +0100
Subject: [Buildroot] [BUILDROOT][PATCH 1/1] mysql_client : Add
 /usr/lib/mysql directory in ld.so.conf file
Message-ID: <4D53BA21.1010905@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add /usr/lib/mysql directory in ld.so.conf file

Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
---
 package/mysql_client/mysql_client.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index ccf7a2c..9cd088c 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -36,6 +36,11 @@ define MYSQL_CLIENT_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef

+define MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
+	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
+endef
+
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
+MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH

 $(eval $(call AUTOTARGETS,package,mysql_client))
-- 
1.7.0.4
