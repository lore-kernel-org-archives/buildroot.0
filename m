From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 13:45:16 +0100
Subject: [Buildroot] [PATCH next 3/8] php-geoip: bump version to 1.1.1
In-Reply-To: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
References: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512124521.4619-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And switch to the official PECL site.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-geoip/php-geoip.hash | 2 +-
 package/php-geoip/php-geoip.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
index 3729880..21e26c8 100644
--- a/package/php-geoip/php-geoip.hash
+++ b/package/php-geoip/php-geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 63167b717f624580b93f3c6c050d8d64ebc6cbe1377069646eb387534c7a2f7e  php-geoip-ebb68228ad94298a305710f701b2ade9acff985d.tar.gz
+sha256 b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06  geoip-1.1.1.tgz
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 8f4e3bf..1853f7d 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_GEOIP_VERSION = ebb68228ad94298a305710f701b2ade9acff985d
-PHP_GEOIP_SITE = $(call github,php7-extensions,ext-php7-geoip,$(PHP_GEOIP_VERSION))
+PHP_GEOIP_VERSION = 1.1.1
+PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
+PHP_GEOIP_SITE = https://pecl.php.net/get
 PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
-- 
2.10.2
