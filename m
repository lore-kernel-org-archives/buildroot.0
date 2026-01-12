Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AB3CF45BC
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156A060BE6;
	Mon, 12 Jan 2026 17:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GSWblR7u8E1; Mon, 12 Jan 2026 17:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867166063E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240670;
	bh=/Us+UEpjNPLjNoKMuUEP0gj5DsUq45CrDtevluFUohk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CaFeHnMtxwhOG1sMOz1ln4DsybGZANe8Q6VvNA8JOVW5a0uFqV4h7niIRd2RRgh3T
	 XSfNEIBauyCOEPTu8Bjzpj5zXUWuUTffR5lc/nrnVZjXGOhI5YAvZ4iTb10ZPP8/gj
	 3Nqqeh2fhNCpqTO99ynImqfcSo0FDiPJpl895+QT8LyILci9yrz/cFyN2NHoTIruOa
	 +Gwf/hZxgHnYLE9PUKpzSj6wsl9h8Mt302uWJnx+kjIOrigEG3ggEYLwX27NujY7TW
	 gZB5+fznNC9frnznjPorfLyBObhTji2P3YFjl7nx9hpXXyRsCT/Cmjz6s6/VB+No+2
	 xRJQJV+dWcd/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867166063E;
	Mon, 12 Jan 2026 17:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6B9D18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46F2400C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id us-323FHeiAu for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBB0340166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBB0340166
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D89838852A; Mon, 12 Jan 2026 17:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:56:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae81440dd0114a39bfb768ce6ff32349934f16e3
X-Git-Newrev: a37c958238c0e81b0fbeb9322a443e089c26a682
X-Patchwork-Hint: ignore
Message-Id: <20260112175748.D89838852A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rockpro64: update U-Boot, TF-A,
 Kernel
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
Content-Type: multipart/mixed; boundary="===============8935856927729256269=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8935856927729256269==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a37c958238c0e81b0fbeb9322a443e089c26a682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit:
- updates the Kernel from 6.10.14 to 6.18.4
- updates arm-trusted-firmware from v2.11 to v2.14
- updates U-Boot from 2024.10 to 2026.01
- switches to Bootlin external glibc stable toolchain
- removes hash for linux-headers (no longer needed)

In order to reduce the differences with the rockpro64_ebbr_defconfig,
this commit also:
- slightly increases the rootfs size from 120M to 128M,
- unsets the rootfs tar archive which is not needed,
- removes rootfs.tar from board/pine64/rockpro64/readme.txt

Tested on board Rockpro64_V2.1 2018-07-02.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  |  2 +-
 .../rockpro64/patches/linux-headers/linux-headers.hash      |  1 -
 board/pine64/rockpro64/patches/linux/linux.hash             |  2 +-
 board/pine64/rockpro64/patches/uboot/uboot.hash             |  2 +-
 board/pine64/rockpro64/readme.txt                           |  1 -
 configs/rockpro64_defconfig                                 | 13 ++++++++-----
 6 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..0bf70b5542 100644
--- a/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  6fd749e53c455aec3418288630544e7552bbffab4442ddc48b20ebef9aee87ff  arm-trusted-firmware-v2.14-git4.tar.gz
diff --git a/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash b/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/pine64/rockpro64/patches/linux/linux.hash b/board/pine64/rockpro64/patches/linux/linux.hash
index 396c18dd5c..5810d3d580 100644
--- a/board/pine64/rockpro64/patches/linux/linux.hash
+++ b/board/pine64/rockpro64/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
+sha256  f850139ca5f79c1bf6bb8b32f92e212aadca97bdaef8a83a7cf4ac4d6a525fab  linux-6.18.4.tar.xz
diff --git a/board/pine64/rockpro64/patches/uboot/uboot.hash b/board/pine64/rockpro64/patches/uboot/uboot.hash
index 904fa56c02..b6a925ea4e 100644
--- a/board/pine64/rockpro64/patches/uboot/uboot.hash
+++ b/board/pine64/rockpro64/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/pine64/rockpro64/readme.txt b/board/pine64/rockpro64/readme.txt
index de86970104..d2a865670a 100644
--- a/board/pine64/rockpro64/readme.txt
+++ b/board/pine64/rockpro64/readme.txt
@@ -20,7 +20,6 @@ output/images
 ├── rk3399-rockpro64.dtb
 ├── rootfs.ext2
 ├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
 ├── sdcard.img
 ├── u-boot.bin
 └── u-boot.itb
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index d6c217e946..c31365ca6b 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/pine64/rockpro64/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
@@ -10,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,17 +21,18 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.14"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

--===============8935856927729256269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8935856927729256269==--
