From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue,  4 Feb 2014 12:28:29 +0000
Subject: [Buildroot] [PATCH 1/1] mysql: disable debugging option
Message-ID: <1391516909-2700-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we use --without-server option, there is no debugging log, 
because will work only when MySQL server is enabled.

MySQL 5.1 Reference Manual:
http://dev.mysql.com/doc/refman/5.1/en/debugging-server.html

ENABLE_DEBUG is a global variable that contains --enable-debug and
to configure MySQL with debugging code, we need to use 
the --with-debug option. But right now we only compile MySQL client, 
so that option it's not necessary.


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
