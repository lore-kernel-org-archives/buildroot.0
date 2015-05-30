From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 May 2015 22:51:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Add -lpthread to detect
	unixodbc for static build
Message-ID: <1433019093-16740-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/157/157749f8b44bc02fbed0232a2b33137aba495134/
http://autobuild.buildroot.net/results/df4/df4e2ea098b0126867455af1891837c6d7d99a92/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 9be07d5..8e79c49 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -225,6 +225,9 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
 PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += unixodbc
+ifeq ($(BR2_STATIC_LIBS),y)
+PHP_CONF_ENV += LIBS='-lpthread'
+endif
 endif
 endif
 
-- 
1.7.10.4
