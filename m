Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55AAC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF43608E4;
	Fri,  7 Aug 2026 09:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4D1yMyNJIA3; Fri,  7 Aug 2026 09:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B89608EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095341;
	bh=EG5dqvRZZ57Solz2pH98VkWylcU+AqLCUYwLH9DIw0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ud+fRLIfyHO/xadhHEn7Z7w42BTcNK0k0CVIXCUBWX/OVUJ4MCP3j2WzvBhQ8icBy
	 bzkPOD8wiHcc+yXm5u3ogyY5VCS1b9pxJ1lvMxgZZGW9YKtdgBvSLdMCgiaA/dq1Vd
	 9HTNKRzVkin30woKzgjWGS3w87s/lfQjYP4Ro9+VKoL1nWdmrlBAVqMjbyfSWsOuoW
	 7wNnKsSRY9SbhZddVJJSYY9qxPn2qiQ4Jj9lL148tLgGzWSwesYlLOkY7w45HUrJI1
	 f09R8MZRBTo6cE36sijaGy2FT1QkOpjk0BFTvKGsI6LjB5TY70tEpg5TQR8/kedtq1
	 JltT2/s10UKLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B89608EC;
	Fri,  7 Aug 2026 09:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE379282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4E264019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj4VkFOc1oIE for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9615403D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9615403D4
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3019C8CA42; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: bee32c9979320ae33c0882880bdfcd1290daff04
X-Git-Newrev: 9c42365266bcddd1eca21afaf69e669b86ecb18f
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.3019C8CA42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 configs/freescale_imx93frdm: bump U-Boot, TF-A and Linux
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c42365266bcddd1eca21afaf69e669b86ecb18f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
default", compiling freescale_imx93frdm_defconfig fails in TF-A with
error:

    include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 'IMX_TRDC_H' followed by '#define' of a different macro [-Werror=header-guard]
        7 | #ifndef IMX_TRDC_H
    include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is defined here; did you mean 'IMX_TRDC_H'?
        8 | #define IMX_XRDC_H

The issue happen because this defconfig is using a Buildroot
(internal) toolchain which uses gcc version 15 by default.

This issue was fixed upstream in [2], first included in TF-A v2.13.

This commit updates U-Boot, TF-A and Linux to use the NXP
tag lf-6.18.20-2.0.0, which include this fixes.

Note that, as described in the commit log of [3] which introduced
this defconfig, U-Boot and Linux were forks. Now the necessary
patches are included in the vendor BSP, this commit switches those
repos to use the vendor ones.

While at it, this commit also switches the defconfig to use an
external glibc stable Bootlin toolchain, to follow recommendations
from [4]. Since an external toolchain is used, the linux-headers.hash
custom hash file is no longer needed and is also removed. At the
time of this commit, the Bootlin stable toolchain is a gcc 14.

Also, due to the upstream uboot commit [5], this commit adds a uboot
config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
remove the dependency on the command "cert-to-efi-sig-list", provided
the host efitools package, which is not yet in Buildroot.

This commit was run tested on board 700-94611 Rev B1.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
[2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
[4] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
[5] https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fcc6df2e1020cd14975b5cb3c8f98c851f2259bc)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../imx93frdm/patches/linux-headers/linux-headers.hash        |  1 -
 board/freescale/imx93frdm/patches/linux/linux.hash            |  2 +-
 board/freescale/imx93frdm/patches/uboot/uboot.hash            |  2 +-
 board/freescale/imx93frdm/uboot.fragment                      |  1 +
 configs/freescale_imx93frdm_defconfig                         | 11 +++++++----
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7561385cb8..bf39f1e9c7 100644
--- a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8cfe0afc903ebbc03f27e4874aa9ce82be78843a8b42ed4c906871e7f311b510  imx-atf-lf-6.6.36-2.1.0.tar.gz
+sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
index 0da8c03384..222ec55328 100644
--- a/board/freescale/imx93frdm/patches/linux/linux.hash
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3244dc3c62c990d9de90e1c7193aa3099e0e74e720de5c9c13edfbfdd802f596  linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
+sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
index e512c27f7d..01e860b59e 100644
--- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  bced4334363199d5465532d221d06dc3a5b49271067d74408019c825ed2ca715  uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
+sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx93frdm/uboot.fragment b/board/freescale/imx93frdm/uboot.fragment
new file mode 100644
index 0000000000..201ab28290
--- /dev/null
+++ b/board/freescale/imx93frdm/uboot.fragment
@@ -0,0 +1 @@
+# CONFIG_EFI_CAPSULE_AUTHENTICATE is not set
diff --git a/configs/freescale_imx93frdm_defconfig b/configs/freescale_imx93frdm_defconfig
index 8e16762d8f..53875cc020 100644
--- a/configs/freescale_imx93frdm_defconfig
+++ b/configs/freescale_imx93frdm_defconfig
@@ -1,14 +1,16 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93frdm/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,linux-imx,lf-6.6.36-2.1.0-imx93frdm)/linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
@@ -22,14 +24,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.36-2.1.0)/imx-atf-lf-6.6.36-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,uboot-imx,lf-6.6.36-2.1.0-imx93frdm)/uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_frdm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx93frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
