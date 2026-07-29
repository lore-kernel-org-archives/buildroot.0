Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C98CC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CA8405FF;
	Wed, 29 Jul 2026 18:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMKzD0jKm7N7; Wed, 29 Jul 2026 18:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2681640612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785351392;
	bh=SOI2AwK2gk0+oCqY0N0l2mPLkMzweAcsLADSuD63+7s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lp5wta7WqGW7DtqhR7Asf819zkXHIUwrUsPjd+1sdSAMOH6Qz6a1WVQ7+tI+qumYb
	 g8WlbuiSFvZtBViAGP8QAjOwkFM4BITZzTipbVIgmO+M4f5de/2cHo5PV1u087M9r7
	 SKg5OkV+SKtoKETa+xWSkYX+P91+85Nq2Kzi6CrP+9MxEie/BjWENFNBlpPaV5wIC0
	 2lmaRvH8qVsW3Ear4bjaxAS+lwGQqqpf7ljZ/pME9F5mMvHOzr9RPX+Q2TLx7I9ZMU
	 vPKlyxgUPAnFY7UHbT6Lt66HxQRJTWO7CrttZWlvEKSB8OuazQ873EJPX1EukKz7xu
	 d4H3vSEMdSZRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2681640612;
	Wed, 29 Jul 2026 18:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1AE2E1
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3510640612
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKKLJfjiXvaB for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE27405FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE27405FF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:56:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14FDD8B52F; Wed, 29 Jul 2026 18:55:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:55:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcc6df2e1020cd14975b5cb3c8f98c851f2259bc
X-Git-Newrev: 25c65e0428174caa37d8b8e73bec38b7052ad731
X-Patchwork-Hint: ignore
Message-Id: <20260729185546.14FDD8B52F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx91frdm: bump U-Boot,
 TF-A and Linux
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25c65e0428174caa37d8b8e73bec38b7052ad731
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
default", compiling freescale_imx91frdm_defconfig fails in TF-A with
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

Note that, as described in the commit log of [3] which was used as a
base for this defconfig, U-Boot and Linux were forks. Now the
necessary patches are included in the vendor BSP, this commit
switches those repos to use the vendor ones.

This commit also removes the linux-headers.hash custom hash file
which was never needed, because the defconfig used an external
toolchain.

Also, due to the upstream uboot commit [4], this commit adds a uboot
config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
remove the dependency on the command "cert-to-efi-sig-list", provided
the host efitools package, which is not yet in Buildroot.

This commit was run tested on board 700-94610 Rev A1.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
[2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
[4] https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash         | 2 +-
 board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash | 1 -
 board/freescale/imx91frdm/patches/linux/linux.hash                 | 2 +-
 board/freescale/imx91frdm/patches/uboot/uboot.hash                 | 2 +-
 board/freescale/imx91frdm/uboot.fragment                           | 1 +
 configs/freescale_imx91frdm_defconfig                              | 7 ++++---
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7561385cb8..bf39f1e9c7 100644
--- a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8cfe0afc903ebbc03f27e4874aa9ce82be78843a8b42ed4c906871e7f311b510  imx-atf-lf-6.6.36-2.1.0.tar.gz
+sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx91frdm/patches/linux/linux.hash b/board/freescale/imx91frdm/patches/linux/linux.hash
index f03ffd5b55..222ec55328 100644
--- a/board/freescale/imx91frdm/patches/linux/linux.hash
+++ b/board/freescale/imx91frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3f5017e85ba6c490be597670033a7eaba14e3c34af4e53d24dc3762c3deece83  linux-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz
+sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/uboot/uboot.hash b/board/freescale/imx91frdm/patches/uboot/uboot.hash
index f285dff490..01e860b59e 100644
--- a/board/freescale/imx91frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx91frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f7d9a6e99825926d0bc597e0fdfeafffcc76ad6267f1d4e9aae1fe9a8d400c22  uboot-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz
+sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx91frdm/uboot.fragment b/board/freescale/imx91frdm/uboot.fragment
new file mode 100644
index 0000000000..201ab28290
--- /dev/null
+++ b/board/freescale/imx91frdm/uboot.fragment
@@ -0,0 +1 @@
+# CONFIG_EFI_CAPSULE_AUTHENTICATE is not set
diff --git a/configs/freescale_imx91frdm_defconfig b/configs/freescale_imx91frdm_defconfig
index 8a233afb50..7fc2fd5959 100644
--- a/configs/freescale_imx91frdm_defconfig
+++ b/configs/freescale_imx91frdm_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,linux-imx,lf-6.6.36-2.1.0-imx91frdm)/linux-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-frdm"
@@ -24,14 +24,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.36-2.1.0)/imx-atf-lf-6.6.36-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,uboot-imx,lf-6.6.36-2.1.0-imx91frdm)/uboot-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_frdm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx91frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
