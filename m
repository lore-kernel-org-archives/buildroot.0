Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F9606A320
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pDf12/Xw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31976062A;
	Sun, 25 Oct 2026 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soORv2x7P0qb; Sun, 25 Oct 2026 17:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 00C8A60608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792948446;
	b=bI1FzpClf3wE5NMd/ev1uZluEWO1b3Lwif4cAXXh1Y5DRfmRdPBqN7h7AasHj+3HJrBq
	 prZ41Oyb2PeoOouHPFVssvk18nEOPAPZiN9Gd0/uG30uGPP1VoV+im8+scJuVeoM5SD6e
	 YnKWKoGhRsB27kVH78Q806ySN2860NkG68Nvd9lQzwPZf69l7PlCgSjCqDmbqUaYjq4ME
	 z0QXwnvYrz+gZsHphOEydrtyG6wvAZbwd943SbbrZnMb8u/USN544OR9Dg8pBxdwzcEl4
	 TVt41iXwrW7+ZyL5khagAeaQ7NPHTpCkgpaGujqA91TM8UWVHzXFjPppHWZ1fjeut7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792948446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lq8zhNknsygC0xTP97UoTzYUhReJpbdrey8fEYcrJp4=;
	b=qSEO7SGmViJ7sFUDmVHGsDPkHRgH0kMHyD8g7G7v396aBirbpcQoFN4m0wS15D2ma/Lp
	 XpHZlLdFy/fvBJK29YYuCjtHLaJDNGrBQ82xOTA/Q93+cNb9PczR2CeAHTj0AOdyCf9xI
	 5xMnCunmpN32Uox+W9zzv22F3jTVIJduS4+ghOyDnD9ZBre3y+Gbh4eyaatFyM9MmruoU
	 1gc5OYjisk3G+9g37rXD5ArvehnW9501twxwjFCWcKRsx4y2H9C1le+HO4tJazFSxeKA/
	 zny2CHYRBud2Z+2LCCxF952yv+HgBalHQAeM+p4vtFd5dH+Ivdne8R2n1GRsBixSHyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792948446;
	bh=lq8zhNknsygC0xTP97UoTzYUhReJpbdrey8fEYcrJp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pDf12/XwLgBtReX9HN4pvxTTycAKzkDVK/kYu0FkbLG4jIJ9LF9SUEtTyeumBNPNp
	 OfWMWyoBfr1RCShUzJ9ZAQQ9dZizbnMR6EsdtgqmILH5ioovPypbNJlHkfpdS6jb4c
	 yluUeVSFRh6ofNvxsOA/4CppzKo2tpT6hDjrsugpt2nHKjlev2NCp7ZgQGoF+yXrtm
	 Ec7UspiSehf6alhsn2Rlwj70C8XNK61TC1GK/Q5jq61n4ofpq8ajoz6THrGsDc0zn3
	 kWVMk1bk+VWuTifSAlg4gTojA8MzTY5D1Gsw9TIeH18k4qQg+yGFEmCohn4pJYFxDQ
	 5F/TsJQXquMoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C8A60608;
	Sun, 25 Oct 2026 17:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7DD4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F7CF80A9F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mJh6GEWjMYd for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:14:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F45380A96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792948441;
 b=SRgmTgABcHaRE84ZTCuapku5okORUTbZ1hnlvTbOBXbJssbyJkV3qZf0pgdEJDeASSXx
 oj9uZa6UR79mf7OlAzjuX25qT30MrKl4BDDZPORNRII35XQ2uNtcIPCrPxrjMxFuRDCgr
 B+fBQ7LErvOSamLvRl9BpFfaaAxGrC9ReTh/EK/FPdV1ArLBE/VStT+Tenp+WY6L/xoD1
 WxKQauh9uXEyrNo2wAhhbtcoXVnxhQsLcbvm+cEyYZ1Jl/pnGdMnWk/2qiwrPKnOF4mj8
 0ov/lQx79xApLY4s0WIHEJktd/FuShUDuZwyv4cxY2osK2UCnPt5WnXaJfvXtCz9J9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792948441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ve+PN5iEaYBdOfDYZMC+6BfpeTdCq64UV/sxjrmJ45k=;
 b=KmF1iCKGzBEf/LdPqMiU0RXeMNoxA8IQQFYxZPumkzJqWqvtfyzo2UdK76qv9X7tqFN1
 oxJBQHdnaUv5ImEnpgMal8fF1oGE5/VcF/MEOiziqKmOaL3RJBHKwy/X3thpDLiJ1fGfb
 O5+H2yAMKRCWRGbV563Zznh3snjAHLi9PlmiE0WYZOBOKLzPpcx8nhI4vsTddyTA+iFW0
 wOyRBXlcZ4cr7SuNlh2dXnNavuXuTW4AaUBaKHoRns5pPfUkLSGHfbrYvP1XGvv97enYE
 rFbEk1UQTVPV0qXMXcmvToFRwBERYPEgv0cJ3vqRdBP0nnz3yMqdenAdLVwNP++wxkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F45380A96
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2DC4984B3; Sun, 25 Oct 2026 17:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bb9b448bc97da9040d23a3abeb45cf6eb0fb948
X-Git-Newrev: a8a9e3872196fb5b1d8866271651002cfa16c2a5
X-Patchwork-Hint: ignore
Message-Id: <20261025171235.B2DC4984B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx91frdm: bump U-Boot,
 TF-A and Linux to LF6.18.37-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8a9e3872196fb5b1d8866271651002cfa16c2a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 board/freescale/imx91frdm/patches/linux/linux.hash                  | 2 +-
 board/freescale/imx91frdm/patches/uboot/uboot.hash                  | 2 +-
 configs/freescale_imx91frdm_defconfig                               | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index bf39f1e9c7..54ee264ade 100644
--- a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
+sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/linux/linux.hash b/board/freescale/imx91frdm/patches/linux/linux.hash
index 222ec55328..df7905fa4e 100644
--- a/board/freescale/imx91frdm/patches/linux/linux.hash
+++ b/board/freescale/imx91frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/uboot/uboot.hash b/board/freescale/imx91frdm/patches/uboot/uboot.hash
index 01e860b59e..1baa3185cf 100644
--- a/board/freescale/imx91frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx91frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/configs/freescale_imx91frdm_defconfig b/configs/freescale_imx91frdm_defconfig
index 7fc2fd5959..4e94b29075 100644
--- a/configs/freescale_imx91frdm_defconfig
+++ b/configs/freescale_imx91frdm_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.37-2.1.0)/linux-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-frdm"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.37-2.1.0)/imx-atf-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.37-2.1.0)/uboot-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_frdm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx91frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
