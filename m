Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF46C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0885860EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0885860EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D313F82AF8;
	Tue,  3 Aug 2021 22:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIsYe5KQ0Dkj; Tue,  3 Aug 2021 22:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E79C83B1B;
	Tue,  3 Aug 2021 22:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA3361BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13154608CE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpicjpBCDtGP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552C0608D8
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ACF1088523; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 17:10:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0d48a91f9ed9f348a4eece191dc3bd16c6c57c0c
X-Git-Newrev: f579afc3930506311068a6f2575a487a5bc8c8e1
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.ACF1088523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi-zero-plus2:
 bump BSP versions
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f579afc3930506311068a6f2575a487a5bc8c8e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump U-Boot and Linux kernel versions. Updating U-Boot to 2021.04
requires the following two changes.

First, after switching to binman, u-boot.itb is no more generated for
64-bit sunxi boards. Combined u-boot-sunxi-with-spl.bin image should
be used instead. This image contains SPL, U-Boot, and FIT image,
where FIT image contains other binaries such as BL31 and SCP.

Second, new U-Boot enables support for System Control Processor (SCP)
firmware. SCP firmware is included by default into FIT image in the
combined u-boot-sunxi-with-spl.bin binary. When SCP is not available
or not needed, it should be explicitly disabled by pointing to an
empty file. Support for Allwinner SCP firmware is not yet available
neither in Buildroot nor in mainline kernel. So disable it for now
using custom U-Boot build options.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 10 ++--------
 configs/orangepi_zero_plus2_defconfig           | 11 +++++------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index 98ebf5b475..255acdbecb 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -19,15 +19,9 @@ image sdcard.img {
 
 	partition spl {
 		in-partition-table = "no"
-		image = "sunxi-spl.bin"
+		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1024000 # 1MB - 40K + 16K(GPT)
+		size = 1056768 # 1MB - 8K + 16K(GPT)
 	}
 
 	partition boot {
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 3085dfe08c..da2d3b4178 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
@@ -17,16 +17,15 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
@@ -34,7 +33,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-pl
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
