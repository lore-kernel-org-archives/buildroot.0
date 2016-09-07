From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed,  7 Sep 2016 08:48:57 -0700
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
	options when using mysql extensions
Message-ID: <20160907154857.3147-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this configure option, mysqli was failing to build with my
config after commit ea1e9e03442a5b375aa2214ba92e48ebba89070a.  The build
did not fail, however, I was unable to use mysqli in my application.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/php/php.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index deaf56e..766f3df 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -181,7 +181,7 @@ endif
 
 ### Native SQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
-PHP_CONF_OPTS += --with-mysqli
+PHP_CONF_OPTS += --enable-mysqlnd --with-mysqli=mysqlnd
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
@@ -198,7 +198,7 @@ PHP_DEPENDENCIES += sqlite
 PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-PHP_CONF_OPTS += --with-pdo-mysql
+PHP_CONF_OPTS += --enable-mysqlnd --with-pdo-mysql=mysqlnd
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
 PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
-- 
2.9.3
