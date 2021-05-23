From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 23:13:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/php-imagick: add CPE variables
Message-ID: <20210523211348.1532716-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:php:imagick is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aphp%3Aimagick

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-imagick/php-imagick.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index ca0cbc7492..6fb43de0ca 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -13,6 +13,8 @@ PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
 PHP_IMAGICK_LICENSE = PHP-3.01
 PHP_IMAGICK_LICENSE_FILES = LICENSE
+PHP_IMAGICK_CPE_ID_VENDOR = php
+PHP_IMAGICK_CPE_ID_PRODUCT = imagick
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
-- 
2.30.2
