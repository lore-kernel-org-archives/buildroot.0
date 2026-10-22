Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD097606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cgv6z79k
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB18081270;
	Thu, 22 Oct 2026 11:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ElRn695sXTS; Thu, 22 Oct 2026 11:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B108681271
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792667391;
	b=ZLZgeEq2EKjfkaQxo706IhjGveLmZ35KHzOq2FwK1bZnQWnxCEirta3lvfiLPeOKo0Q6
	 m0tZZAr3y2xb8r/j3rSkPR9/FGiwWU3YXbuVN1/0b7Axl/47UwH7/FtD8IM8I0nQCSpFq
	 HTZHq4UCj+NwgEjHCMehywLri506efESaNu9HQ50M6wRKTEOpa/7bslIURo7ZkyQcnqwi
	 rGKyvvouKVyaFr18rmSyKQGB/skwtdTGx9irpoOq4ItmrQFL9u7a8RZWXAoE4TJ9d0Hlg
	 2O64YfVXAtVBvKC2pkamw6+kh7AOJs4onacO+XqZLdCQTQDew8aT+Z7IR4OZ5/yO26g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792667391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fIFibRATy04rAQWuMa0KDJ38YOIaEtRn83u+RMfCdyM=;
	b=Bq7nqG6jZkAJIMDs1h6z8XoAmP7PjBzekzU4pARHBYLtM54nqPzZ2bWVzC7ZCZtu9uNS
	 nTGUIc8+vaZrd2xdIgyd2N/FR31AF5R/UXGTtVmhWPMhPq3KQbBx78/Fl+oGM8TUNeUOA
	 sDkTAPuG6akDrP1+wAYhB9F3Em5AQHgwKRD98yG4/d0HdA4wK6kIHNNEIr/syDIRZeUZo
	 8Xqd55w+4DK26+QRqyLe/u4Ivlzuoyu7lFmWhc6Xl7meR1X13Nw10FEcIP8u7ZMOwFnnB
	 BsHCnvsf2sHmuiwO9lzttwQ3mJ8mafIAQbc9QVG1uXCm2rcTqAKhk5vJrsv6M76rsiQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792667391;
	bh=fIFibRATy04rAQWuMa0KDJ38YOIaEtRn83u+RMfCdyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cgv6z79kc0iU4Vpk01822KxsJbwha6emIwiAkOaicYeL6kFiA86Tb+KMlETwQ84b3
	 580rcPv45ui0pNrPzQ6aU9vKy7Od0S8dFM7HYY7obd5cJ/LBFPxroK14UxgSToON9N
	 SuFLRUVmsxsVEN3W3/qqxgvyqvR8LpSjhUNmedBMon9kVZhVs63L929VFqZ1NyR0l+
	 jBzMAMpmF5wZ4/9s4sFKKhz74cqJCcjJiGlCC0PMyQutv+CQCaaL1uMauce8MtUFHW
	 6S17/WLp6519nhvXzn45VE0vkzrjSKNK6Y+hbIyWC5q1XDxc0TvoIq1o3yr+bB8SGZ
	 i4cFwFJxcyw1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B108681271;
	Thu, 22 Oct 2026 11:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ECF4356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8489940411
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAZn0oqX5sna for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:09:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C083D400B8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792667388;
 b=OIUvtzdriXiKWzcJvq/dNcaHi7oe7FPOIBTiS2Do618Nm8h+2SJtr/ABX1i1/46owvmH
 5NoFo3/pv6Y/rIQekaMT9RGLjfPY305qxqyG9h+N0lbLl8vrfCgHpLmY3+hs4zzIGlf/a
 RhZUIPF7szZYl9gsTj8yuUsicmSaXYqEhj8SxOyfBHuwfgKqKt1H9LRwZUw+MplwU0UFQ
 KhV72A8SJYu13JqcQEIWtPfaYMXznPjBEmr3dGj/UXERvQ/aiO4ijl3FVeDV4nGBTOvP7
 rB8Yqnrttf+XoHIaG0knnwbsrHaBNYAykY33NgIAaZzyuicCs7nFm7PkicBK69uwBRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792667388;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OfsgcyLpnPoKXIo/qHNMTVq3TCSIBnLQ5gdPo74vNJw=;
 b=OvsioVfJdkaOppKldmqkXD459ZFG8v5M1UoPk2SprLrERoeIZFxOXXnqTUxbT0pnMUiQ
 yuRFDjp4aKHjRLp/kndwiTHHHtd+JCpeySV8kTrdiv3/obr5u4EBm8sbqHxPD3JRZFg85
 axFzWw0meU4nusft9r508vMCsquMm4RzVbLQmvW/yEyDXPX8fWBc0DlwIMdUg94j3AUXE
 gJ4UOYccNAvg3XUQGZglEqhvi/vubvEKmTLPldq3B4+eMNR0kr1fIsOj1wg9mnphJBFQp
 HBZr+AHdLHTuzSdAbx56FKYfOJIHLWTv9ST+5h/tYmEuLxL+ZqYcFyd722o8hdYaOUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C083D400B8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBEB39B9BB; Thu, 22 Oct 2026 11:08:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 13:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2efd7262dff4bc43d70d785d44eab12ca1603aed
X-Git-Newrev: 638c9592cff955c3aadcf509186b86330c36f176
X-Patchwork-Hint: ignore
Message-Id: <20261022110824.BBEB39B9BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx93frdm_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/638c9592cff955c3aadcf509186b86330c36f176
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The i.MX93 FRDM board is quite nicely supported in mainline, so add a
defconfig using the latest mainline U-Boot/TF-A/Linux releases as an
alternative to the vendor BSP used by freescale_imx93frdm_defconfig.

Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
not need the imx9-bootloader-prepare.sh post-image script.

The existing imx93frdm readme.txt applies to this as well, so add a note
about the choice of defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  1 +
 board/freescale/imx93frdm/patches/linux/linux.hash |  2 +
 board/freescale/imx93frdm/patches/uboot/uboot.hash |  1 +
 board/freescale/imx93frdm/readme.txt               |  4 +-
 configs/imx93frdm_defconfig                        | 46 ++++++++++++++++++++++
 6 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19575d5207..4339b37f11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2701,6 +2701,7 @@ F:	board/visionfive/
 F:	boot/shim/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
+F:	configs/imx93frdm_defconfig
 F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 54ee264ade..92b3645fb7 100644
--- a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
index df7905fa4e..b6cbf6be1f 100644
--- a/board/freescale/imx93frdm/patches/linux/linux.hash
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
index 1baa3185cf..b6058cb3c0 100644
--- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/board/freescale/imx93frdm/readme.txt b/board/freescale/imx93frdm/readme.txt
index 3e5f404029..81e46658ba 100644
--- a/board/freescale/imx93frdm/readme.txt
+++ b/board/freescale/imx93frdm/readme.txt
@@ -11,7 +11,9 @@ Build
 
 First, configure Buildroot for the i.MX 93 FRDM board:
 
-    make freescale_imx93frdm_defconfig
+    make imx93frdm_defconfig (mainline)
+Or:
+    make freescale_imx93frdm_defconfig (vendor BSP)
 
 Build all components:
 
diff --git a/configs/imx93frdm_defconfig b/configs/imx93frdm_defconfig
new file mode 100644
index 0000000000..f5a5f973a0
--- /dev/null
+++ b/configs/imx93frdm_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx93frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.3"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_frdm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
