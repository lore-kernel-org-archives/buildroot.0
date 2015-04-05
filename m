From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 16:05:46 +0200
Subject: [Buildroot] [git commit] package/php: add unixodbc support
Message-ID: <20150405141149.CC4F881938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ae88084cf5c694fd8e294b8b52351faeb2de7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix indentation.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    6 ++++++
 package/php/php.mk     |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 1d9c2fe..fafae26 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -159,6 +159,12 @@ config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	help
 	  SQLite3 driver for PDO
 
+config BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC
+	bool "unixODBC"
+	select BR2_PACKAGE_UNIXODBC
+	help
+	  unixODBC driver for PDO
+
 endif
 
 comment "Human language and character encoding support"
diff --git a/package/php/php.mk b/package/php/php.mk
index 74bb00a..73ed494 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -176,6 +176,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
 PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += postgresql
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
+PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += unixodbc
+endif
 endif
 
 ### Use external PCRE if it's available
