From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jul 2014 08:39:33 -0300
Subject: [Buildroot] [PATCH] php-memcached: make zlib directory explicit
Message-ID: <1405942773-26816-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it fails to find in some cases. Fixes:
http://autobuild.buildroot.net/results/993/99342e74d0866a7acddbf9da66aafbfa4f3c12f1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-memcached/php-memcached.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 866e18c..b9cc115 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -9,7 +9,8 @@ PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = http://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--disable-memcached-sasl \
-	--with-libmemcached-dir=$(STAGING_DIR)/usr
+	--with-libmemcached-dir=$(STAGING_DIR)/usr \
+	--with-zlib-dir=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_MEMCACHED_DEPENDENCIES = libmemcached php zlib host-autoconf host-pkgconf
 PHP_MEMCACHED_LICENSE = MIT
-- 
1.8.5.5
