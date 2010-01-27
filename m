From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 27 Jan 2010 14:20:48 +0100
Subject: [Buildroot] [PATCH] Do not install some (unneeded) mysql test tools
	on target.
Message-ID: <1264598448-16599-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

test and bench dirs are already removed from installation.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/database/mysql_client/mysql_client.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/database/mysql_client/mysql_client.mk b/package/database/mysql_client/mysql_client.mk
index 7f3b091..ad01c2b 100644
--- a/package/database/mysql_client/mysql_client.mk
+++ b/package/database/mysql_client/mysql_client.mk
@@ -28,4 +28,5 @@ $(eval $(call AUTOTARGETS,package/database,mysql_client))
 
 $(MYSQL_CLIENT_HOOK_POST_INSTALL):
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
+	rm -f $(TARGET_DIR)/usr/bin/mysql_client_test $(TARGET_DIR)/usr/bin/mysqltest
 	touch $@
-- 
1.6.0.4
