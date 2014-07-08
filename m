From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 13:56:52 +0200
Subject: [Buildroot] [git commit] php: add option for phar builtin extension
Message-ID: <20140708115758.65C999D1CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d3696bd174b534ea07b633e7d74713779f057c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    3 ++-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index abf4993..ff9a6ad 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -31,6 +31,11 @@ config BR2_PACKAGE_PHP_EXT_BZIP2
 	help
 	  bzip2 read/write support
 
+config BR2_PACKAGE_PHP_EXT_PHAR
+	bool "phar"
+	help
+	  PHP Archive support
+
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/php/php.mk b/package/php/php.mk
index 8ac5d86..4d3aa7d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -73,7 +73,8 @@ PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
 		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
 		$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
-		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath)
+		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
+		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 	PHP_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
