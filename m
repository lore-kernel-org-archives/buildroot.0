From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 23:18:04 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/libodb-mysql: fix static build
Message-ID: <20200714211804.2434281-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use mysql_config to help libodb-mysql to retrieve mysql dependencies
such as -lz

Fixes:
 - http://autobuild.buildroot.org/results/a5447c5105f15606ed562b39ca84c06e7e6b78c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Use mysql_config to avoid hardcoding -lz

 package/libodb-mysql/libodb-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 97cbcddf93..835e5bc6bf 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,5 +12,6 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
+LIBODB_MYSQL_CONF_ENV = LIBS="$(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)"
 
 $(eval $(autotools-package))
-- 
2.27.0
