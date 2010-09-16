From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] mysql_client: convert old-style
	hook to new-style hook
Message-ID: <20100916113824.9D9198AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d31100d7e80278f673f74ed36c16a65f4fd27e9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql_client/mysql_client.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 377df89..6a89a52 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -32,8 +32,10 @@ MYSQL_CLIENT_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
-$(eval $(call AUTOTARGETS,package,mysql_client))
-
-$(MYSQL_CLIENT_HOOK_POST_INSTALL):
+define MYSQL_CLIENT_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
-	touch $@
+endef
+
+MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
+
+$(eval $(call AUTOTARGETS,package,mysql_client))
-- 
1.7.1
