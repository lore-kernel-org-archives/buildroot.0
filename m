From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 25 Oct 2019 18:22:43 +0000
Subject: [Buildroot] [PATCH v4 1/2] package: use variables defined by
 autoconf.mk
Message-ID: <20191025182217.13682-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoconf.mk defines AUTOCONF and AUTOHEADER variables, use them in packages
using autoconf.
This is a refactoring which shouldn't impact the final behavior.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/cups/cups.mk                   | 2 +-
 package/libxmlrpc/libxmlrpc.mk         | 2 +-
 package/ncftp/ncftp.mk                 | 2 +-
 package/php-amqp/php-amqp.mk           | 4 ++--
 package/php-geoip/php-geoip.mk         | 4 ++--
 package/php-gnupg/php-gnupg.mk         | 4 ++--
 package/php-imagick/php-imagick.mk     | 4 ++--
 package/php-memcached/php-memcached.mk | 4 ++--
 package/php-ssh2/php-ssh2.mk           | 4 ++--
 package/php-yaml/php-yaml.mk           | 4 ++--
 package/php-zmq/php-zmq.mk             | 4 ++--
 package/socat/socat.mk                 | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index bc2913b428..b30fd78b9f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -13,7 +13,7 @@ CUPS_INSTALL_STAGING = YES
 
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
-	cd $(@D); $(HOST_DIR)/bin/autoconf -f
+	cd $(@D); $(AUTOCONF) -f
 endef
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 90791bd671..54db9f1f89 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -16,7 +16,7 @@ LIBXMLRPC_MAKE = $(MAKE1)
 
 # Using autoconf, not automake, so we cannot use AUTORECONF = YES.
 define LIBXMLRPC_RUN_AUTOCONF
-	cd $(@D); $(HOST_DIR)/bin/autoconf
+	cd $(@D); $(AUTOCONF)
 endef
 
 LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index c8c8942333..676a9c5895 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -21,7 +21,7 @@ NCFTP_CONF_OPTS = --disable-ccdv
 # We need to pass -I because of the non-standard m4 directory name, and
 # none of the other autotools are used, so the below is the easiest.
 define NCFTP_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/bin/autoconf -I$(@D)/autoconf_local/)
+	(cd $(@D); $(AUTOCONF) -I$(@D)/autoconf_local/)
 endef
 NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
 
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index c808ecdbd6..8f3ba1f9f4 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -16,8 +16,8 @@ PHP_AMQP_LICENSE_FILES = LICENSE
 
 define PHP_AMQP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 82ecba5816..8bff564e2d 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -16,8 +16,8 @@ PHP_GEOIP_LICENSE_FILES = geoip.c
 
 define PHP_GEOIP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index ae0a781154..8137da4978 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -16,8 +16,8 @@ PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index ca0cbc7492..a5541b0035 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -16,8 +16,8 @@ PHP_IMAGICK_LICENSE_FILES = LICENSE
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 4607d099f3..67ccc6747a 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -18,8 +18,8 @@ PHP_MEMCACHED_LICENSE_FILES = LICENSE fastlz/LICENSE g_fmt.h
 
 define PHP_MEMCACHED_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index c9c13010dd..98453acbcf 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -16,8 +16,8 @@ PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index e23d897978..40f7385c6a 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -16,8 +16,8 @@ PHP_YAML_LICENSE_FILES = LICENSE
 
 define PHP_YAML_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index fed71955b6..892c42130f 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -15,8 +15,8 @@ PHP_ZMQ_LICENSE_FILES = LICENSE
 
 define PHP_ZMQ_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index c6f99c2afa..41748d8227 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -41,7 +41,7 @@ SOCAT_CONF_OPTS += --disable-readline
 endif
 
 define SOCAT_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/bin/autoconf)
+	(cd $(@D); $(AUTOCONF))
 endef
 
 SOCAT_PRE_CONFIGURE_HOOKS += SOCAT_RUN_AUTOCONF
-- 
2.20.1
