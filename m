From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 May 2015 23:03:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Add -lpthread to detect sqlite
	for static build
Message-ID: <1433019787-12686-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e69/e6993d66aeebbe994063a60871412b2235ce5455/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 8e79c49..191c48c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -204,6 +204,9 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
+ifeq ($(BR2_STATIC_LIBS),y)
+PHP_CONF_ENV += LIBS='-lpthread'
+endif
 endif
 
 ### PDO
-- 
1.7.10.4
