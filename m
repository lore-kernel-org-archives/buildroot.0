Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3C0814B8;
	Mon, 25 Apr 2022 20:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXFgli2OxrZe; Mon, 25 Apr 2022 20:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9DED813F8;
	Mon, 25 Apr 2022 20:09:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7D01BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0905960B6B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTwN0ykvmnKf for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9D760AEF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 08E18843C6; Mon, 25 Apr 2022 19:58:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:54:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 244f607f4c4a2e0609d1fb8e8b62c4ae751b8136
X-Git-Newrev: 93a80ea44609cde6dc51ca3ca93d0dd095734d90
X-Patchwork-Hint: ignore
Message-Id: <20220425195847.08E18843C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: add WILC3000_FIRMWARE to
 compatible devices
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93a80ea44609cde6dc51ca3ca93d0dd095734d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update to wilc-firmware added firmware files for WILC3000
devices as a separate config option. All Atmel/Microchip defconfigs
that previously only had WILC1000_FIRMWARE either have WILC3000
Wi-Fi hardware (WILC3000 is the same silicon but with BLE added)
or have the capacity to have either WILC1000 or WILC3000 devices
added to the system. Install all firmware blobs to these devices
by default.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/at91sam9x5ek_dev_defconfig                     | 1 +
 configs/at91sam9x5ek_mmc_dev_defconfig                 | 1 +
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d3_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d4_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 1 +
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 1 +
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 1 +
 12 files changed, 12 insertions(+)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index bfa8e95941..8714463d89 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -47,6 +47,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 2e1a5c7f59..9481594716 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index ba2fa46790..38618a5732 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_RNG_TOOLS=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index a8b68ca0a2..1654408aa5 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index cdfd9de17e..64455cb2e0 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -49,6 +49,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index a2205aeefa..8f5724d631 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -52,6 +52,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index f8783f5652..fab91cf0b3 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index b4e99f658a..f9074e9862 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 06e03967c4..2b4e234297 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -36,6 +36,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index 3bcd5f0200..f9aa6cdc05 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 27d1d3409d..b1b22c1312 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -32,6 +32,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_SETSERIAL=y
 BR2_PACKAGE_SPI_TOOLS=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 6eb6c282e0..d68846e553 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -30,6 +30,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_RNG_TOOLS=y
 # BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
