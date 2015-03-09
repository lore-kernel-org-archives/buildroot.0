From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:08:29 +0100
Subject: [Buildroot] [git commit] Added support for PHP/SQLite3 (non PDO).
Message-ID: <20150309130839.03CE880DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d92f9c6832fd733919ad7ade91d8fc0bd0f18e1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    6 ++++++
 package/php/php.mk     |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index daf16c7..57685b2 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -120,6 +120,12 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	help
 	  MySQL Improved extension support
 
+config BR2_PACKAGE_PHP_EXT_SQLITE
+	bool "SQLite3"
+	select BR2_PACKAGE_SQLITE
+	help
+	  SQLite3 support
+
 config BR2_PACKAGE_PHP_EXT_PDO
 	bool "PDO"
 	help
diff --git a/package/php/php.mk b/package/php/php.mk
index dd52508..b5daeb6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -154,6 +154,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
 	PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
 	PHP_DEPENDENCIES += mysql
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
+	PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += sqlite
+endif
 
 ### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
