From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  5 Jul 2018 16:24:29 -0300
Subject: [Buildroot] [PATCH 1/3] uboot: Introduce
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX
Message-ID: <1530818671-20390-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some i.MX boards which use device tree to describe the hardware
for U-Boot generate a u-boot-dtb.imx binary.

Introduce the BR2_TARGET_UBOOT_FORMAT_DTB_IMX option to
handle such case.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 482711c..7f8291a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -190,6 +190,9 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	bool "u-boot-dtb.img"
 
+config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
+	bool "u-boot-dtb.imx"
+
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6ef275e..bf227f2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -70,6 +70,11 @@ UBOOT_BINS += u-boot-dtb.img
 UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMX),y)
+UBOOT_BINS += u-boot-dtb.imx
+UBOOT_MAKE_TARGET += u-boot-dtb.imx
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_BIN),y)
 UBOOT_BINS += u-boot-dtb.bin
 UBOOT_MAKE_TARGET += u-boot-dtb.bin
-- 
2.7.4
