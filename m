From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue,  4 Mar 2014 14:50:03 +0000
Subject: [Buildroot] [PATCH 4/4] mysql: host-mysql depends on host-zlib
In-Reply-To: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
Message-ID: <1393944603-3104-4-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/mysql.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index c35fef5..9a8612b 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -34,7 +34,7 @@ MYSQL_CONF_OPT = \
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES =
+HOST_MYSQL_DEPENDENCIES = host-zlib
 
 HOST_MYSQL_CONF_OPT = \
 	--with-embedded-server
-- 
1.7.10.4
