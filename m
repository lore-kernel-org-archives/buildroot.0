From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Mon, 12 Mar 2012 23:41:11 +0100
Subject: [Buildroot] [PATCH 2/3 v3] uboot: add a new binary format for
	u-boot.img
In-Reply-To: <1331592072-32327-1-git-send-email-n-dechesne@ti.com>
References: <1331592072-32327-1-git-send-email-n-dechesne@ti.com>
Message-ID: <1331592072-32327-3-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some platforms like OMAP, a new binary format is now being used
for u-boot: u-boot.img. It is basically u-boot.bin which has been
processed with mkimage.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 95187f9..5032b19 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -79,6 +79,9 @@ choice
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
+config BR2_TARGET_UBOOT_FORMAT_IMG
+	bool "u-boot.img"
+
 config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 41745c9..590eb6f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -29,6 +29,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
+UBOOT_BIN          = u-boot.img
 else
 UBOOT_BIN          = u-boot.bin
 endif
-- 
1.7.9.1
