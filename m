From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 12:32:43 +0200
Subject: [Buildroot] [PATCH 1/2] mysql: Add optional zlib dependency
Message-ID: <1400322764-24571-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure zlib is build before mysql.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mysql/mysql.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 5b30d84..d338c31 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -33,6 +33,10 @@ MYSQL_CONF_OPT = \
 	--enable-thread-safe-client \
 	--disable-mysql-maintainer-mode
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MYSQL_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
 HOST_MYSQL_DEPENDENCIES =
-- 
1.7.10.4
