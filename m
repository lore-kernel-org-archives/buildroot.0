Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667EDC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C3E406EF;
	Fri, 16 May 2025 10:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4FL-KqIW4IA; Fri, 16 May 2025 10:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055DE4069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055DE4069B;
	Fri, 16 May 2025 10:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A84F1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE6740A94
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMRWXy_6rFvb for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A3440AC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A3440AC1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4363E86906; Fri, 16 May 2025 10:42:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:41:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42357f0b1322ec57ef54fa7105b46380acfec579
X-Git-Newrev: 506c9b8e0d908b214df4b1286bf51755a5a7f46b
X-Patchwork-Hint: ignore
Message-Id: <20250516104257.4363E86906@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r3s: bump TF-A,
 U-Boot and Linux versions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=506c9b8e0d908b214df4b1286bf51755a5a7f46b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- TF-A to version v2.12 (LTS)
- U-Boot to version v2025.04
- Linux kernel to version 6.14.6

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash         | 2 --
 board/friendlyarm/nanopi-r3s/patches/linux/linux.hash              | 2 +-
 board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash              | 2 +-
 configs/friendlyarm_nanopi_r3s_defconfig                           | 7 +++----
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index b5898cba3f..0000000000
--- a/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
index b2e8ee602b..451159a6dc 100644
--- a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b80e0bc8efbc31e9ce5a84d1084dcccfa40e01bea8cc25afd06648b93d61339e  linux-6.13.4.tar.xz
+sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
diff --git a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
index f9bb6166d1..b550824126 100644
--- a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e54102f17328397d5d63b00865e9108d5806d18018509fc24ce6e7e3fe6a12f1  u-boot-2025.04-rc2.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 5844c5bb4c..beeab11c5e 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,14 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3568"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04-rc2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
