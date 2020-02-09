From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Feb 2020 23:45:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/php-*: fix autoconf variables
Message-ID: <20200209224516.245288-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of php-* packages are broken since commit
3292f3de499717360cf18d7fecd79ac096216ca8 because
$(HOST_DIR)/bin/auto{conf,header} have been replaced by
$(HOST_DIR)/bin/auto{conf,header} -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

So revert this change (which should have been only refactoring) for
those packages

Fixes:
 - http://autobuild.buildroot.org/results/0d5f4a792652e302b8c00c1e0f99966cc930fbac
 - http://autobuild.buildroot.org/results/91a559183db212803a90cb399a1cb505b14818d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-amqp/php-amqp.mk           | 4 ++--
 package/php-geoip/php-geoip.mk         | 4 ++--
 package/php-gnupg/php-gnupg.mk         | 4 ++--
 package/php-imagick/php-imagick.mk     | 4 ++--
 package/php-memcached/php-memcached.mk | 4 ++--
 package/php-ssh2/php-ssh2.mk           | 4 ++--
 package/php-yaml/php-yaml.mk           | 4 ++--
 package/php-zmq/php-zmq.mk             | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 8f3ba1f9f4..c808ecdbd6 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -16,8 +16,8 @@ PHP_AMQP_LICENSE_FILES = LICENSE
 
 define PHP_AMQP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 8bff564e2d..82ecba5816 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -16,8 +16,8 @@ PHP_GEOIP_LICENSE_FILES = geoip.c
 
 define PHP_GEOIP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 8137da4978..ae0a781154 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -16,8 +16,8 @@ PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index a5541b0035..ca0cbc7492 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -16,8 +16,8 @@ PHP_IMAGICK_LICENSE_FILES = LICENSE
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 67ccc6747a..4607d099f3 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -18,8 +18,8 @@ PHP_MEMCACHED_LICENSE_FILES = LICENSE fastlz/LICENSE g_fmt.h
 
 define PHP_MEMCACHED_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index 98453acbcf..c9c13010dd 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -16,8 +16,8 @@ PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index 40f7385c6a..e23d897978 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -16,8 +16,8 @@ PHP_YAML_LICENSE_FILES = LICENSE
 
 define PHP_YAML_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 892c42130f..fed71955b6 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -15,8 +15,8 @@ PHP_ZMQ_LICENSE_FILES = LICENSE
 
 define PHP_ZMQ_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(AUTOCONF) \
-		PHP_AUTOHEADER=$(AUTOHEADER) \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
-- 
2.24.1
