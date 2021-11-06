Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EF7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F61760E97
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F61760E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C699C400CC;
	Sat,  6 Nov 2021 10:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VXovpxqWZK4; Sat,  6 Nov 2021 10:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46FC40189;
	Sat,  6 Nov 2021 10:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9A31BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BFC827C6
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQ8LKPxu3Zg9 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B09B282741
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B70F8B3F2; Sat,  6 Nov 2021 10:48:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:51:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c525794515fdbf6232bb8c8dd918c93cd12d2f0
X-Git-Newrev: 2502a6506cd31b4f48185bc2b4f633a2597a26a4
X-Patchwork-Hint: ignore
Message-Id: <20211106104826.1B70F8B3F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/qemu_arm_versatile_nommu_defconfig: update to Linux 5.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=2502a6506cd31b4f48185bc2b4f633a2597a26a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patch versatile-nommu.patch on top of v5.15.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../patches/linux/versatile-nommu.patch            | 31 ++++++++++++++--------
 configs/qemu_arm_versatile_nommu_defconfig         |  6 ++---
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
index 956ae5f5f5..1a5130deb4 100644
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
@@ -1,10 +1,19 @@
-From 525dd2f3cf4a94837ce6b71d793acb90c25a5654 Mon Sep 17 00:00:00 2001
+From 7c245ffc17a9ab6215830d4ecd8b2f9beddb487c Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Fri, 1 Feb 2019 11:36:20 +0100
 Subject: [PATCH] arm-versatile-nommu: Linux patch
 
 Originally made by Waldemar Brodkorb <wbx@openadk.org> from LKML.
 
+Rename CLKSRC_OF to TIMER_OF (kernel >= 4.13)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bb0eb050a577a866cb47c2dc37596f1207f4c2d9
+
+Remove GENERIC_CLOCKEVENTS since its enabled by default (kernel >= 5.11)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0774a6ed294b963dc76df2d8342ab86d030759ec
+
+Select CONFIG_GENERIC_IRQ_MULTI_HANDLER since irqchip doesn't select it anymore (kernel >= 5.12)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a79f7051cccb6f3bcd3d2a0a058c7d5c79bb0371
+
 Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
 [Gerome: reformated as a Git patch]
 Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
@@ -21,10 +30,10 @@ Signed-off-by: Romain Naour <romain.naour@smile.fr>
  create mode 100644 arch/arm/mach-versatile/Makefile.boot
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 002e0cf025f5..c71299b6f91f 100644
+index dcf2df6da98f..c2155c1a2eba 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -343,6 +343,17 @@ config ARM_SINGLE_ARMV7M
+@@ -337,6 +337,17 @@ config ARM_SINGLE_ARMV7M
  	select SPARSE_IRQ
  	select USE_OF
  
@@ -32,21 +41,21 @@ index 002e0cf025f5..c71299b6f91f 100644
 +	bool "ARM Ltd. Versatile family"
 +	depends on !MMU
 +	select AUTO_ZRELADDR
-+	select CLKSRC_OF
++	select TIMER_OF
 +	select COMMON_CLK
-+	select GENERIC_CLOCKEVENTS
++	select GENERIC_IRQ_MULTI_HANDLER
 +	select GPIOLIB
 +	select SPARSE_IRQ
 +	select USE_OF
 +
- config ARCH_EBSA110
- 	bool "EBSA-110"
- 	select ARCH_USES_GETTIMEOFFSET
+ config ARCH_EP93XX
+ 	bool "EP93xx-based"
+ 	select ARCH_SPARSEMEM_ENABLE
 diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
-index 8986a91a6f31..69cb6404e8ce 100644
+index 98436702e0c7..7e63299ceb40 100644
 --- a/arch/arm/Kconfig.debug
 +++ b/arch/arm/Kconfig.debug
-@@ -1943,7 +1943,8 @@ config DEBUG_UNCOMPRESS
+@@ -1891,7 +1891,8 @@ config DEBUG_UNCOMPRESS
  config UNCOMPRESS_INCLUDE
  	string
  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
@@ -109,5 +118,5 @@ index 02ba68abe533..835b51bc597b 100644
  
  /*
 -- 
-2.17.1
+2.31.1
 
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index fa783f9299..59a6efd04f 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
