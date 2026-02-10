Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A09E94625
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 663EC40D1E;
	Tue, 10 Feb 2026 00:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TZ_divDOWzf; Tue, 10 Feb 2026 00:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D70940D46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682115;
	bh=dcWCTW066i6771Ufwr9LlMhwAUkaDC5vGadl8PlcisQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D/J3a4FJ7oGyXGOBjksiF8T949Sdz7q8u7ty8j78vcQzIBGBspVB5nqNZPkSmXvGi
	 m6zr0nR86K0U5JXd6KrpbZiFAjnNYWGMmdGveo6krPlQ0feoM6+meqkm3a8POwxKPX
	 NK7HO4iHXvL+g0+Q33dUbM9Xwx9ROvQjfmzLV173ixRQCw6x90OpJ234DIWZfgLmEN
	 cInXMvU6IWKmql+bT64Tg3UBU/k9D4Xf5Xv6nuV784QZlAISz+KFjNmsgVUn0z4t9M
	 F8ubZz7bpqB+xpc9jZx+FQhrR5BxJ5aL9fnIX9qH5OggD3GzDkC5DaR/oka4Vyszl9
	 w9q/NJE30q5PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D70940D46;
	Tue, 10 Feb 2026 00:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5778C219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 489E283C71
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXizf6S8yoPu for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:08:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C6FE83C6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6FE83C6B
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C6FE83C6B
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbIqvaeTtdarQpbIrvRnZO; Tue, 10 Feb 2026 01:08:29 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:08:27 +0100
Message-ID: <20260210000827.3811338-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
References: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF3C5JpQZyAqvswXMvh46dh7zpRGbD4wMEa7+sFWyjTjsPYJPTBJW5nuCfmg/BrAVZV76h49ioWXQ+/hHYbWGOGvzPJHqlicIUETjQK/fRCXFe6Z+KLD
 3ano9ZrbwszroOG2rneR7MYN40Y6OPPgwXociez+LN9hxoAiuuIWV+2VoFDOqEpxZiZnz4VpXGaDvW1Ojn9r6FBAKl/7qsuQWRis7nR/Z++wPyW6qbYNK+L2
 2FlRJN1n6rOFdAVeSPH6tCCQ/QuSWGUarcwEEtLACO803UCV7dGXJ2jMJNAP2/sqOuKBKnC/VGQpGVIXxU3jQi5S3gsJ35RO2hDLOazFGHTSBglohsoWwnS3
 brlJYaXF1VjQt08xbr61WKdW4oXjG5DBJeRHubURypP0+zHFum1212MEo1/DwPvldcWROz+rZefGmc+5+9fvdjl/INZRc/BVhGWNMSk76zVnrDeUpy5t9nLZ
 kiD6ndrMG6QWc6J/pbQbgwr2SFTlHsXiBA6h3wHKbTLPQQ0sEsUEjY5Hz5HtKVVEBUE7nHXNIvIgsp4jPrHkiXzk1VKULM9Atty5BNrA/rgNTx585dFcvqpN
 u1c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682109; bh=2i6wUGLVo17RNCiHEfUw66iLbb1cmQ86zQezHsbZGcM=;
 h=From:To:Subject:Date:MIME-Version;
 b=gAGfQzIYvGK5s16pVEctfd5IFrTG+cbKFDgtJWHel2AlGcGEm1mIrU5qNgjLKDZ31
 DPXwv+l2ofW3WNlil7b/eSq4uztYgcR7yL61XUVMkGL8UJSKZVkOsij4rbRttKcJ26
 krXP1ov9taXHvftKcwPkE/m8YqTw1L9yx6whDEBPq02OZK2tlfFYr1qx0UmBesoJDH
 oGB0cAXHgRp53TRaMhFGeBJGd9RxHdnt0GZfAGAbflhXiTWRprxS3u/DoqIQoH8zrx
 hmYW+dqLeZgdxxDJLyih5Wc89aWUFfZ9mN3LfOwvkarN8yFInsPTe4ZaP33tSBqtA/
 BVvtIFA7xq02g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gAGfQzIY
Subject: [Buildroot] [PATCH v2 13/13] configs/olimex_a64_olinuxino: bump
 Linux to 6.18.8 and U-Boot to 2026.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* bumps ATF to version 2.14.0
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                            |  1 -
 board/olimex/a64-olinuxino/boot.cmd            |  6 ------
 board/olimex/a64-olinuxino/genimage.cfg        | 18 ------------------
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a64-olinuxino/patches/linux/linux.hash     |  2 ++
 .../a64-olinuxino/patches/uboot/uboot.hash     |  2 ++
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 configs/olimex_a64_olinuxino_defconfig         | 15 ++++++++-------
 8 files changed, 17 insertions(+), 32 deletions(-)
 delete mode 100644 board/olimex/a64-olinuxino/boot.cmd
 create mode 120000 board/olimex/a64-olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a64-olinuxino/patches/uboot/uboot.hash
 create mode 100644 board/olimex/a64-olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index 74fdd450c6..8bee044234 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -130,7 +130,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a64-olinuxino/boot.cmd b/board/olimex/a64-olinuxino/boot.cmd
deleted file mode 100644
index 28ed6d9dc9..0000000000
--- a/board/olimex/a64-olinuxino/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-a64-olinuxino.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
index ac59e915d9..f6adbb1881 100644
--- a/board/olimex/a64-olinuxino/genimage.cfg
+++ b/board/olimex/a64-olinuxino/genimage.cfg
@@ -1,15 +1,3 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-olinuxino.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -21,12 +9,6 @@ image sdcard.img {
 		size = 1032K # 1MB - 8KB + 16KB(GPT)
 	}
 
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
diff --git a/board/olimex/a64-olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a64-olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a64-olinuxino/patches/linux/linux.hash b/board/olimex/a64-olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a64-olinuxino/patches/uboot/uboot.hash b/board/olimex/a64-olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a64-olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a64-olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..6a5a088666
--- /dev/null
+++ b/board/olimex/a64-olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A64-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index ad446ea18c..6173fc8c20 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -1,12 +1,15 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a64-olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Olimex A64-OLinuXino"
+BR2_ROOTFS_OVERLAY="board/olimex/a64-olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a64-olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
@@ -16,16 +19,17 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.14.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
@@ -33,6 +37,3 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
