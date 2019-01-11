From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jan 2019 15:35:26 +0100
Subject: [Buildroot] [PATCH 1/1] php-memcached: bump to version 3.1.3
Message-ID: <20190111143526.2207-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump fix build with php 7.3.0
Also add hash for license files

Fixes:
 - http://autobuild.buildroot.org/results/57ce77fc1b99a72019dcfe8fe5d55aba315b9e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-memcached/php-memcached.hash | 5 ++++-
 package/php-memcached/php-memcached.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index 7a8ec28340..dd294f466a 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 5d1c29a1d5e391d6bb7b736a07e063d2f0834800673dd246d64ce1b73e47645d  memcached-3.0.3.tgz
+sha256 20786213ff92cd7ebdb0d0ac10dde1e9580a2f84296618b666654fd76ea307d4  memcached-3.1.3.tgz
+sha256 24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
+sha256 a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
+sha256 bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 224a34453d..4607d099f3 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 3.0.3
+PHP_MEMCACHED_VERSION = 3.1.3
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.14.1
