From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:46:25 +0200
Subject: [Buildroot] [git commit] php-geoip: fix legal info
Message-ID: <20160510135146.2288E81880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc45fb08f3b34aba9b30a6d6f2fd4a6a9c4fe9f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LICENSE file is gone, so use the lone .c source fle. Fixes:
http://autobuild.buildroot.net/results/acd/acd763e7eefb8be2bbd0bf973bb7855fceee7377/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
