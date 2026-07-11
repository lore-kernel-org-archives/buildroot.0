Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64489C43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 17:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F184E606CA;
	Sat, 11 Jul 2026 17:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTSo6bJVTTvN; Sat, 11 Jul 2026 17:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD36E60621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783791344;
	bh=cYVfoqAkbeAAB8b5+GNwirGL7ITTrunfrY5nQuj/1ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sUsAb2/T0Iwu1/3GftdGOcE5MBLPzzRiBfzl3yWoARnCvoEPkjXaSTuRQRxX6LqGo
	 WsVBzQNEEtLa9f1fx8lkU+e+Ti5omKmTTP1BEqfOWEAIfoPC99UHUAk/T8e0HUyZAQ
	 2E+h2B9LV1myU+rQ990usAQkDnHXUHsf2XF755VPB0BKfxa499aOXpCovRkFr8BeLl
	 HoURSw7THGDDipxwvOtihqNQN6uLQz+NwbPw2FfoQNoKGxVxcvkPBpqctgGFUtiz1K
	 wgZXvvQ+Hp90Cw/Y+zeYJyK7YmXeh6CtgLawyAXEw/XWgm+28T1Ikmdk9Fscn9+AOw
	 E4QFabBX/jqPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD36E60621;
	Sat, 11 Jul 2026 17:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C791372
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B394068B
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iODpA3vdMwwE for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 17:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE2B4067A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AE2B4067A
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF238872F; Sat, 11 Jul 2026 17:35:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 19:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29f09f3ac4284890eda4a13f3748cb59d390d410
X-Git-Newrev: 1dfcb841f9021310bc81a2d0bb3c52c90050a325
X-Patchwork-Hint: ignore
Message-Id: <20260711173508.DBF238872F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz_defconfig:
 bump tf-a and u-boot versions
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1dfcb841f9021310bc81a2d0bb3c52c90050a325
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Bump TF-A LTS 2.12
- Bump u-boot to version 2026.04.

smhload command has been removed from u-boot 2022.07 [1], use
"load hostfs" generic command as suggested by the documentation [2].

This commit adds BR2_TARGET_UBOOT_NEEDS_DTC=y, because the new
2026.04 version does need dtc. Adding host-dtc also avoid uboot build
failures on hosts with libyaml (uboot builds its own dtc if none is
defined in DTC build variable).

This commit also removes BR2_TOOLCHAIN_BUILDROOT_CXX=y, which was
forgotten when the defconfig was switched to Bootlin toolchain, in
commit [3].

[1] https://source.denx.de/u-boot/u-boot/-/commit/dcc4f9623e27b92a1e0b97326631b0d5841c49cb
[2] https://docs.u-boot-project.org/en/latest/usage/semihosting.html#migrating-from-smhload
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/dbe0896826e7394da71d653c6987d1a119d85336

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien:
 - add BR2_TARGET_UBOOT_NEEDS_DTC=y
 - remove BR2_TOOLCHAIN_BUILDROOT_CXX=y
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/arm-vexpress-tz/u-boot.config | 2 +-
 board/qemu/patches/uboot/uboot.hash      | 2 +-
 configs/qemu_arm_vexpress_tz_defconfig   | 7 +++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/u-boot.config b/board/qemu/arm-vexpress-tz/u-boot.config
index 48b1d06fdb..8633ea18d0 100644
--- a/board/qemu/arm-vexpress-tz/u-boot.config
+++ b/board/qemu/arm-vexpress-tz/u-boot.config
@@ -1,5 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0x60000000
-CONFIG_BOOTCOMMAND="smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.uboot ${ramdisk_addr_r} && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
+CONFIG_BOOTCOMMAND="load hostfs - ${kernel_addr_r} zImage && load hostfs - ${ramdisk_addr_r} rootfs.cpio.uboot  && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
 CONFIG_SEMIHOSTING=y
 # Drop flash accesses
 CONFIG_ENV_IS_IN_FLASH=n
diff --git a/board/qemu/patches/uboot/uboot.hash b/board/qemu/patches/uboot/uboot.hash
index 7762ff3f8f..594d7ebeae 100644
--- a/board/qemu/patches/uboot/uboot.hash
+++ b/board/qemu/patches/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  68e065413926778e276ec3abd28bb32fa82abaa4a6898d570c1f48fbdb08bcd0  u-boot-2022.04.tar.bz2
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 48273cdf5a..84dca264da 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -4,7 +4,6 @@ BR2_ARM_FPU_VFPV3D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -24,8 +23,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -37,8 +35,9 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
