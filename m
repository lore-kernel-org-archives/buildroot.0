From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:31:20 +0100
Subject: [Buildroot] [git commit] package/php: Add support for mbstring
	module
Message-ID: <20141026213820.C7E8DB0D63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e74d197cbd2a6989aa6d4ce9c87470d9e5585722
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

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
index 30c8d02..9456f1c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -75,6 +75,7 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
 		$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
 		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
+		$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
