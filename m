Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5925D103E168
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DC481222;
	Wed, 18 Mar 2026 12:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VFAW2WQSwZ0; Wed, 18 Mar 2026 12:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016C5813F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773835777;
	bh=IlTRcpRFTb6WomMkSw4Ulm/aFl4eAZZ5KnNPuCVCjVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ifkp8cvgZXv9A6Dhydj9tzuQymK+kOvHJnM6VlM2xWrA/p6ETDEEJt3eGArI2g1et
	 OCO8ZmKTbV2xG9ylDj4OcYt5d06CemktoRX6HkS4k2FI8gpWFikr9HSQXZOBCEbgQX
	 nkBerpb+IZPAqllHJlv3uBhYQLES/lxoUK4Z7nCMB1vpiVl2LskXR3IRtb5QJr4Jd9
	 4W6Nl+xr6Z1RQ6ne6Q9cmZn9AnHk9NYcMQ+fXcAd8E2k5IpumAjzO3CkM5Fa6Lp5fH
	 vJZIdGbH4yRKoW7v4NivpLPFHHmFTkFP+70tUbg0kv3BWZJctiEsjxvenqBgLSXg6I
	 eKAoRPjna5Pgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 016C5813F9;
	Wed, 18 Mar 2026 12:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1258F1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03CD4608E3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm22e4rUsEX1 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110F8608D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 110F8608D5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35E9C84338; Wed, 18 Mar 2026 12:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 13:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec58c67e5f112c89616c3d1cfdecce29b06ac908
X-Git-Newrev: cd2ba3ab0fb57af0f2aa94d7f3d0828efdbe4f58
X-Patchwork-Hint: ignore
Message-Id: <20260318120933.35E9C84338@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: Bump Linux, TF-A,
 U-Boot
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd2ba3ab0fb57af0f2aa94d7f3d0828efdbe4f58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Bump Linux: 6.18.18
- Bump TF-A: v2.14
- Bump U-Boot: 2026.01
- Update hashes for relevant components

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash             | 2 +-
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash             | 2 +-
 configs/roc_pc_rk3399_defconfig                                  | 9 +++++----
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..0bf70b5542 100644
--- a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  6fd749e53c455aec3418288630544e7552bbffab4442ddc48b20ebef9aee87ff  arm-trusted-firmware-v2.14-git4.tar.gz
diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
index 98edd13a58..be62c29501 100644
--- a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
+++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
index fe9b4f53dc..b6a925ea4e 100644
--- a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
+++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 145e155fac..c5c6771bdf 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -23,19 +23,20 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.14"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
