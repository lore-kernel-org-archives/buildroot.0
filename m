Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA35EE93805
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F07840DEF;
	Sun, 12 Apr 2026 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR0YEKaqWq9u; Sun, 12 Apr 2026 20:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3364241D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776026495;
	bh=hZAJ0vEI4+H4UhG8nRB3nBewFGz/lXt1qDkMDzTDJ9o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r0SJVvFJkWHRu4MYSqqTYa2yleJcnDJN7szApXiyOP+khgxv+j1t82nGUJnr9eZ8E
	 nmEiam4iJkRF4OvhaFk0c2xifrYsexBsbo5KnuFabfH0Vj4xl1B4S6kZyAqDLbxgMu
	 tXlrJ0SrSNS1q0ET5TV3Y49fouoRzZ39rlv1Kb4pAaWIoAaG/fRjXquteGVrYqPOJE
	 FtbhOJCoNSHlma6Lvmn2vTKMYe5nB5PznPpWVCdZ9Ooe+S4ki79Rx2ZgNNsNZ1ZZz4
	 oVGAFK3hdotKoFcbPA436vejGOei+CeOjYA1gzL3mS1chTD5PI3OpiqqPizTk41Ly3
	 9aQOFunDLEqlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3364241D;
	Sun, 12 Apr 2026 20:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CB5283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 564854243A
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIkv4WiIWypH for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 20:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 366A74241D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 366A74241D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:41:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C073A81228; Sun, 12 Apr 2026 20:41:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 22:29:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceaf09299bffd022e75045dfc9d8216aa9a5b63b
X-Git-Newrev: 356c092389cf91a992442d5ea050841c6695fac7
X-Patchwork-Hint: ignore
Message-Id: <20260412204132.C073A81228@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/am574x_idk_defconfig: bump linux
 to 6.18.16 and u-boot to 2026.04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/356c092389cf91a992442d5ea050841c6695fac7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit:
  - updates the Kernel from LTS 6.6.14 to 6.18.16
  - updates U-Boot from 2024.01 to 2026.04
  - switches to Bootlin external glibc stable toolchain
  - enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add custom hashes stored
    in BR2_GLOBAL_PATCH_DIR="board/ti/am574x-idk/patches" and removes
    the exception entry in .checkpackageignore.
  - enable BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y to install the board
    devicetree in the boot (vfat) partition keeping the directory
    prefixes (ti/omap/am574x-idk.dtb). u-boot nowadays is looking for
    boards devicetree using such directory prefixes [1].
    Update genimange.cfg file accordingly.
  - While at it, add a label to the boot (vfat) partition to not use a
    generated label.
  - set BR2_TARGET_ROOTFS_EXT2_SIZE="256M" since the rootfs no longer
    fit in the default size (60M).
  - Remove the rootfs partition predefined 1G size to avoid a parted
    warning about "unallocated space within the partition."
  - Update extlinux.conf kernel command line to use "console=ttyS2"
    instead of "ttyS0". Seems a typo introduced with the defconfig
    (AM57xx always used ttyS2 as kernel console).

[1] https://source.denx.de/u-boot/u-boot/-/commit/649f4a7d3ca753991c27c9c159a0aacc9954d96f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                          |  1 -
 board/ti/am574x-idk/extlinux.conf            |  2 +-
 board/ti/am574x-idk/genimage.cfg             |  5 +++--
 board/ti/am574x-idk/patches/linux/linux.hash |  2 ++
 board/ti/am574x-idk/patches/uboot/uboot.hash |  2 ++
 configs/am574x_idk_defconfig                 | 13 ++++++++++---
 6 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6599435b62..a708b081e7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -70,7 +70,6 @@ boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch lib_patch.Upstream
 boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_patch.Upstream
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
-configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/ti/am574x-idk/extlinux.conf b/board/ti/am574x-idk/extlinux.conf
index 29e0ecfa14..4faa8f7eed 100644
--- a/board/ti/am574x-idk/extlinux.conf
+++ b/board/ti/am574x-idk/extlinux.conf
@@ -1,4 +1,4 @@
 label am5749-idk-buildroot
   kernel /zImage
   fdtdir /
-  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
+  append console=ttyS2,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
diff --git a/board/ti/am574x-idk/genimage.cfg b/board/ti/am574x-idk/genimage.cfg
index 02a9ffe013..e7ab22f29b 100644
--- a/board/ti/am574x-idk/genimage.cfg
+++ b/board/ti/am574x-idk/genimage.cfg
@@ -4,9 +4,11 @@ image boot.vfat {
 			"MLO",
 			"u-boot.img",
 			"zImage",
-			"am574x-idk.dtb",
+			"ti",
 			"extlinux"
 		}
+
+		label = "boot"
 	}
 
 	size = 16M
@@ -25,6 +27,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 1G
 	}
 }
diff --git a/board/ti/am574x-idk/patches/linux/linux.hash b/board/ti/am574x-idk/patches/linux/linux.hash
new file mode 100644
index 0000000000..020dc72386
--- /dev/null
+++ b/board/ti/am574x-idk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/ti/am574x-idk/patches/uboot/uboot.hash b/board/ti/am574x-idk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/ti/am574x-idk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
index 5d3ec12ad6..3ec8829ff7 100644
--- a/configs/am574x_idk_defconfig
+++ b/configs/am574x_idk_defconfig
@@ -1,26 +1,33 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am574x-idk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
