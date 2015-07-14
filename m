From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:06:04 +0200
Subject: [Buildroot] [git commit] boot/uboot: Add support for dtb.img format
Message-ID: <20150714220926.D917781D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=920b50b7e0d7535899ccba77b85d3df57e2c2a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to generate u-boot-dtb.img. This is the same format
as u-boot.img, however, it contains a built-in device-tree.
This file is being loaded by the U-Boot SPL.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index fa1741c..1cdb2fa 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -106,6 +106,9 @@ config BR2_TARGET_UBOOT_FORMAT_AIS
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
+config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
+	bool "u-boot-dtb.img"
+
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2cfff28..8053678 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -45,6 +45,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
+UBOOT_BIN = u-boot-dtb.img
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN = u-boot.img
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
