Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B831ACDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B054037A;
	Tue, 22 Oct 2024 20:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hDRr0tKhLjR; Tue, 22 Oct 2024 20:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3D9403BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3D9403BE;
	Tue, 22 Oct 2024 20:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0428E2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D84EC40226
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqTZwHMdJbDP for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9568E40222
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9568E40222
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BA1886238; Tue, 22 Oct 2024 20:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 22:56:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06a1cf485434decd9ac0627b3c739e1b66b3163a
X-Git-Newrev: 908ba9d637975b820eaf1299d1adbdeb0daf9c6f
X-Patchwork-Hint: ignore
Message-Id: <20241022205647.8BA1886238@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rockpro64: bump Linux kernel,
 U-Boot and TF-A
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2449062979443696283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2449062979443696283==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=908ba9d637975b820eaf1299d1adbdeb0daf9c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to v6.10.14 and add the dependency on host python3.
- Bump U-Boot to v2024.10 and add the dependency on GnuTLS and
  util-linux (for uuid).
- Bump TF-A to v2.11.
- Turn on hashes verification and add hashes for the Linux kernel and
  U-Boot.
- Fix shellcheck warnings in the post-build script.
- Remove the related exceptions in .checkpackageignore.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                         |  2 --
 .../rockpro64/patches/linux-headers/linux-headers.hash      |  1 +
 board/pine64/rockpro64/patches/linux/linux.hash             |  2 ++
 board/pine64/rockpro64/patches/uboot/uboot.hash             |  2 ++
 board/pine64/rockpro64/post-build.sh                        |  4 ++--
 configs/rockpro64_defconfig                                 | 13 +++++++++----
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f38b900735..fbebf404d6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -63,7 +63,6 @@ board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-sp
 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch lib_patch.Upstream
 board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch lib_patch.Upstream
 board/pine64/rock64/post-build.sh Shellcheck
-board/pine64/rockpro64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
@@ -226,7 +225,6 @@ configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/roc_pc_rk3399_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
 configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
-configs/rockpro64_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash b/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/pine64/rockpro64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/pine64/rockpro64/patches/linux/linux.hash b/board/pine64/rockpro64/patches/linux/linux.hash
new file mode 100644
index 0000000000..396c18dd5c
--- /dev/null
+++ b/board/pine64/rockpro64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
diff --git a/board/pine64/rockpro64/patches/uboot/uboot.hash b/board/pine64/rockpro64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/pine64/rockpro64/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/board/pine64/rockpro64/post-build.sh b/board/pine64/rockpro64/post-build.sh
index ba29375c05..e947745488 100755
--- a/board/pine64/rockpro64/post-build.sh
+++ b/board/pine64/rockpro64/post-build.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR=$(dirname "$0")
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
+install -m 0644 -D "$BOARD_DIR/extlinux.conf" "$BINARIES_DIR/extlinux/extlinux.conf"
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index d70fd83c03..d6c217e946 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/rockpro64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPRO64"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64/post-build.sh"
@@ -8,30 +10,33 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y

--===============2449062979443696283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2449062979443696283==--
