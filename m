From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Jul 2018 02:17:00 -0300
Subject: [Buildroot] [PATCH 4/5] php: use $() to reference make variables
 instead of ${}
In-Reply-To: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
Message-ID: <20180708051701.3153-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 4c3a87118e..028fa6fc55 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -137,7 +137,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 PHP_CONF_ENV += php_cv_libxml_build_works=yes
-PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
+PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libxml2
 endif
 
-- 
2.17.1
