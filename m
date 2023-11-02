Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E7DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A080A41FE0;
	Thu,  2 Nov 2023 17:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A080A41FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEzHTVNp4x5i; Thu,  2 Nov 2023 17:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDB57421A0;
	Thu,  2 Nov 2023 17:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB57421A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F96B1BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56F4F4030F
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F4F4030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dm2xnFnPgpdD for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F98340204
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F98340204
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3665B86545; Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 18:48:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70550024f01e2f5a685d1d765dec111a34d84c3d
X-Git-Newrev: bf8062497504869d7ba8f4666179f4adde1cae0a
X-Patchwork-Hint: ignore
Message-Id: <20231102174953.3665B86545@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rockpro64: bump ATF to 2.9,
 U-Boot to 2023.07 and Linux to 6.5.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf8062497504869d7ba8f4666179f4adde1cae0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, since with Linux commit [1] it's been defined the mmc* order
making sd-card number to be 1 instead of 0. This prevent to boot from
mmc0 with Linux version 5.10+ so let's change mmcblk0p4 to mmcblk1p4 in
extlinux.conf in order to boot since we bump to Linux 6.5.7

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0011c6d182774fc781fb9e115ebe8baa356029ae

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pine64/rockpro64/extlinux.conf |  2 +-
 configs/rockpro64_defconfig          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/pine64/rockpro64/extlinux.conf b/board/pine64/rockpro64/extlinux.conf
index ea081a1f0b..83467ef43c 100644
--- a/board/pine64/rockpro64/extlinux.conf
+++ b/board/pine64/rockpro64/extlinux.conf
@@ -1,4 +1,4 @@
 label RK3399_ROCKPRO64 linux
   kernel /Image
   devicetree /rk3399-rockpro64.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p4 rw rootwait
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index d39640f855..4704ac7206 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -2,13 +2,13 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
 
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 6.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
@@ -18,7 +18,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
