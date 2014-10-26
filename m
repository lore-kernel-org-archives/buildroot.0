From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:31:08 +0100
Subject: [Buildroot] [git commit] package/php: Add support for mcrypt module
Message-ID: <20141026213820.BC708B0D63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ca97b357f336db85c9f76d6443515165e4f1077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index f745cc9..4649375 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -56,6 +56,11 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+config BR2_PACKAGE_PHP_EXT_MCRYPT
+	bool "mcrypt"
+	help
+	  mcrypt support
+
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/php/php.mk b/package/php/php.mk
index c2840f3..30c8d02 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -77,6 +77,11 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
 		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
+	PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libmcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 	PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += openssl
