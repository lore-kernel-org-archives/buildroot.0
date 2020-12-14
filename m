From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Dec 2020 22:43:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix static build
Message-ID: <20201214214313.447831-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ba2c5ef1bb54c2751569f79beef21ff486348469

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-mysql/libodb-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 835e5bc6bf..a9040c65f8 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,6 +12,6 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
-LIBODB_MYSQL_CONF_ENV = LIBS="$(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)"
+LIBODB_MYSQL_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
 
 $(eval $(autotools-package))
-- 
2.29.2
