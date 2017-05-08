From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  8 May 2017 17:36:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: wordexp is enabled in
	uClibc now
Message-ID: <20170508153646.10541-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package can now be used for uClibc toolchains.

Tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_BLUEZ5_UTILS=y
BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED=y
BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL=y
BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH=y
BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI=y
BR2_PACKAGE_BLUEZ5_PLUGINS_NFC=y
BR2_PACKAGE_BLUEZ5_PLUGINS_SAP=y
BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS=y
BR2_PACKAGE_BLUEZ5_UTILS_TEST=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index bdb6682c1..c09e197d3 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -39,15 +39,10 @@ comment "OBEX support needs a toolchain w/ C++"
 
 config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	bool "build CLI client"
-	# wordexp support not in our uClibc configuration
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_READLINE
 	help
 	  Enable the Bluez 5.x command line client.
 
-comment "bluez5-utils client needs a glibc or musl toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
-
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	bool "install deprecated tool"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
-- 
2.11.0
