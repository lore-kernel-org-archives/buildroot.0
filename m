From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 May 2016 10:15:31 -0300
Subject: [Buildroot] [PATCH] php-geoip: fix legal info
Message-ID: <1462886131-9724-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LICENSE file is gone, so use the lone .c source fle. Fixes:
http://autobuild.buildroot.net/results/acd/acd763e7eefb8be2bbd0bf973bb7855fceee7377/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-geoip/php-geoip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 93dcf01..cda8d4e 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -11,7 +11,7 @@ PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 # phpize does the autoconf magic
 PHP_GEOIP_DEPENDENCIES = geoip php host-autoconf
 PHP_GEOIP_LICENSE = PHP
-PHP_GEOIP_LICENSE_FILES = LICENSE
+PHP_GEOIP_LICENSE_FILES = geoip.c
 
 define PHP_GEOIP_PHPIZE
 	(cd $(@D); \
-- 
2.7.3
