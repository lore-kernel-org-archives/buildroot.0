From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Apr 2016 12:53:04 +0100
Subject: [Buildroot] [PATCH v2 1/8] php-geoip: bump version to HEAD of
	master on GitHub
In-Reply-To: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1460980391-65336-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Related: https://bugs.php.net/bug.php?id=71083

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-geoip/php-geoip.hash | 2 +-
 package/php-geoip/php-geoip.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
index 275a098..61945cf 100644
--- a/package/php-geoip/php-geoip.hash
+++ b/package/php-geoip/php-geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	82c6deb7264d2ff7c4d6c45a7d27cff7ab097be965795e317e04a9c5b7be98b9	geoip-1.1.0.tgz
+sha256 8b5e8dec6353c437809e58d798627927ae659682b5bbdad023e9e569c278bfed  php-geoip-1fd53288458100e9e30acf5a62bc9ef8426513d3.tar.gz
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 0826c19..93dcf01 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-PHP_GEOIP_VERSION = 1.1.0
-PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_GEOIP_SITE = http://sources.buildroot.net
+PHP_GEOIP_VERSION = 1fd53288458100e9e30acf5a62bc9ef8426513d3
+PHP_GEOIP_SITE = $(call github,php7-extensions,ext-php7-geoip,$(PHP_GEOIP_VERSION))
 PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
-- 
2.7.3
