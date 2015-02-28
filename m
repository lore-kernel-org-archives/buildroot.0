From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Feb 2015 11:58:12 +0100
Subject: [Buildroot] [PATCH next 3/3] package/php: add unixodbc support
In-Reply-To: <1425121092-10878-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425121092-10878-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1425121092-10878-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.ext |    6 ++++++
 package/php/php.mk     |    4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 2b1e615..466f3f1 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -160,6 +160,12 @@ config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
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
index dd52508..054fdc7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -174,6 +174,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
 	PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += postgresql
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
+	PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += unixodbc
+endif
 endif
 
 ### Use external PCRE if it's available
-- 
1.7.10.4
