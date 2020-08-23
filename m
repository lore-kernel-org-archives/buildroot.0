From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 16:55:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: drop --with-libxml-dir
Message-ID: <20200823145543.3967761-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--with-libxml-dir has been dropped since version 7.4.0 and
https://github.com/php/php-src/commit/29d1b7fd521af288e9f04d784f59a2d15b494a30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index daadc10c75..d9516ae127 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -150,7 +150,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 PHP_CONF_ENV += php_cv_libxml_build_works=yes
-PHP_CONF_OPTS += --with-libxml --with-libxml-dir=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-libxml
 PHP_DEPENDENCIES += libxml2
 endif
 
-- 
2.28.0
