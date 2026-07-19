Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E1C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76916068A;
	Sun, 19 Jul 2026 19:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqcEi1id32RY; Sun, 19 Jul 2026 19:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF05606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489319;
	bh=HBetLXMsvSjKkkcjjvC+sqtAPIKCW54giC8FJMuRvQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZXQHVIh3rT0wMStJ3x/ZxnZDVaYgRR7yaLDO7HQb37XGN8fDLx+8DtRqoo+ARu/zj
	 y9GH7zATOZZAjLQm4N43pFpgW6nSn//KjmF/P2tKAX+ek+AzpbhIT6yMIHWKfZvUUx
	 /ey0pEkGobMoTMYPjVPSULgnCSNd/KGAbewCLFY28glWDgCspOs6KhCewbB/OFREjV
	 G3cmxzaKeptA4/1aXw+9T493tdsxzp1fKs+MKxonAdCrAQhR1aIfxNJImAYhdqUALF
	 yCbJLVVRubxTYr9cxlwcmK8Kz2hOzNujwn+wlCrUMZVACiWabLyreLhMyu9t/Ba00l
	 4qobICLvWd9Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF05606B4;
	Sun, 19 Jul 2026 19:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8159D7F
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B0180B7D
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBuAbhJZbeY7 for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D819280AA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D819280AA9
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73D7888FB5; Sun, 19 Jul 2026 19:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 16:49:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fa3cf47542ece686f9b2d987c795bd59722712e
X-Git-Newrev: 1cebe63fafd7d083df1f41c47219285dad5aee8d
X-Patchwork-Hint: ignore
Message-Id: <20260719192757.73D7888FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1046a-frwy: bump BSP tag to
 lf-6.18.20-2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cebe63fafd7d083df1f41c47219285dad5aee8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash       |  2 +-
 board/freescale/ls1046a-frwy/patches/linux/linux.hash    |  2 +-
 board/freescale/ls1046a-frwy/patches/uboot/uboot.hash    |  2 +-
 board/freescale/ls1046a-frwy/readme.txt                  | 16 ++++++++--------
 configs/ls1046a-frwy_defconfig                           |  8 ++++----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7981c74137..4a62068d29 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
+sha256  658af40a90fd8e2460d364775a0c37e0507201e49de7f69c8a22d61e179f81e1  atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index f30030c86a..85d5173aa7 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
+sha256  206f997d41bb958099bf7a89a02a6889942b118984f81f9a45bec9907f60708f  linux-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index 38d54d9922..80bbe7d219 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
+sha256  04aed627132db7b656117c7a35fb29d314172319fa3a297ea6748eebac2b5ce3  u-boot-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 57eb743d5a..4312afe40f 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -12,7 +12,7 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.18.20-2.0.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -22,13 +22,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.34-2.1.0
-  - atf (fork), lf-6.12.34-2.1.0
-  - uboot (fork), lf-6.12.34-2.1.0
-  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
-  - linux (fork), lf-6.12.34-2.1.0
-  - fmlib, lf-6.12.34-2.1.0
-  - fmc, lf-6.12.34-2.1.0
+  - rcw, lf-6.18.20-2.0.0
+  - atf (fork), lf-6.18.20-2.0.0
+  - uboot (fork), lf-6.18.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.18.20-2.0.0
+  - linux (fork), lf-6.18.20-2.0.0
+  - fmlib, lf-6.18.20-2.0.0
+  - fmc, lf-6.18.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 838d132d55..346931bc2d 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.18.20-2.0.0)/linux-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.18.20-2.0.0)/atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.18.20-2.0.0)/u-boot-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
