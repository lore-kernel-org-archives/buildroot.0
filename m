From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 22 Jul 2019 21:34:24 -0400
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add missing
 host-uboot-tools select
Message-ID: <20190723013424.1827-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "Build BL31 U-Boot image" option uses mkimage to make atf-uboot.ub,
and has a make dependency on host-uboot-tools.  Therefore, the Config.in
option should select BR2_PACKAGE_HOST_UBOOT_TOOLS.  (Just like similar
options in linux, package/xvisor, and fs/cpio.)

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 boot/arm-trusted-firmware/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index beb95fb..2e41bd0 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -86,6 +86,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
 	bool "Build BL31 U-Boot image"
 	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 	help
 	  Generates a U-Boot image named atf-uboot.ub containing
 	  bl31.bin.  This is used for example by the Xilinx version of
-- 
2.7.4
