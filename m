From: kuyurix at gmail.com <kuyurix@gmail.com>
Date: Mon,  3 Feb 2014 17:51:19 +0000
Subject: [Buildroot] [PATCH 2/2] mysql: disable debugging option
Message-ID: <52efff31.0902ec0a.7f04.45f7@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcelo Guti?rrez <kuyurix@gmail.com>

it is not necessary to use $(ENABLE_DEBUG) with "--without-server" option.

BTW, the value of "ENABLE_DEBUG" is empty.

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/mysql.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 9b22c2d..53daa3f 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -31,8 +31,7 @@ MYSQL_CONF_OPT = \
 	--without-libedit \
 	--without-readline \
 	--with-low-memory \
-	--enable-thread-safe-client \
-	$(ENABLE_DEBUG)
+	--enable-thread-safe-client
 
 define MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
-- 
1.7.10.4
