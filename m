From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:59 +0200
Subject: [Buildroot] [PATCH v2 11/16] package/php: Add support for mbstring
	module
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    1 +
 2 files changed, 6 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4649375..241e4a9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -192,6 +192,11 @@ comment "intl support needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_PHP_EXT_MBSTRING
+	bool "mbstring"
+	help
+	  multibyte string support
+
 comment "Image processing"
 
 config BR2_PACKAGE_PHP_EXT_EXIF
diff --git a/package/php/php.mk b/package/php/php.mk
index 0cf4058..e6c2db7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -76,6 +76,7 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
 		$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
 		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
+		$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
-- 
1.7.10.4
