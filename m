From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:38:15 +0200
Subject: [Buildroot] [PATCH 03/15 v5] package/eudev: is a provider for
	libudev
In-Reply-To: <cover.1409578332.git.yann.morin.1998@free.fr>
References: <cover.1409578332.git.yann.morin.1998@free.fr>
Message-ID: <b87b73135c153b7e9320f419dae4ae515725a245.1409578332.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ Compiled for x86 target with glibc 2.18 and Kernel headers 3.15.x ]
Tested-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
---
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6101d6d..fa28a9f 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_PREFER_STATIC_LIB # kmod
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -21,6 +22,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index c6d020f..1cb6b26 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -25,7 +25,7 @@ EUDEV_CONF_OPT =		\
 	--enable-libkmod
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES = libudev udev
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPT += --enable-rule_generator
-- 
1.9.1
