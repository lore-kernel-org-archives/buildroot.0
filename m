Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80696C369B4
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C22382F49;
	Sun, 13 Apr 2025 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdbQO1ntWTi8; Sun, 13 Apr 2025 09:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B4881F06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B4881F06;
	Sun, 13 Apr 2025 09:42:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37236108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D63B082CF9
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyG3pTFrk58u for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BD182E14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BD182E14
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B130D84553; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 11:33:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f6f1035a1c7f44741ab81c07dc33dd1c41ecded
X-Git-Newrev: f81bb4a2ca3d9c545b97cffbc344afd9ad92ac38
X-Patchwork-Hint: ignore
Message-Id: <20250413094217.B130D84553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1043a-rdb: bump BSP tag to
 lf-6.12.3-1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81bb4a2ca3d9c545b97cffbc344afd9ad92ac38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest Linux Factory tag is lf-6.12.3-1.0.0 (Q1 2025), update to
that.

The LS1043A-RDB board is currently supported by NXP through a BSP
called LDLSDK. That isn't what we use, so update the documentation to
reflect that for awareness, and provide a link.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 .../freescale/ls1043a-rdb/patches/linux/linux.hash |  2 +-
 .../freescale/ls1043a-rdb/patches/uboot/uboot.hash |  2 +-
 board/freescale/ls1043a-rdb/readme.txt             | 28 +++++++++++++++-------
 configs/ls1043a-rdb_defconfig                      |  8 +++----
 5 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 344a6299d8..41c7ad4068 100644
--- a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
+sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/linux/linux.hash b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
index fa38fb1f75..43dbe074c2 100644
--- a/board/freescale/ls1043a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
+sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
index a1e3b69376..5e36d93487 100644
--- a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
+sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/readme.txt b/board/freescale/ls1043a-rdb/readme.txt
index 2770cc5573..1b6f25904a 100644
--- a/board/freescale/ls1043a-rdb/readme.txt
+++ b/board/freescale/ls1043a-rdb/readme.txt
@@ -8,15 +8,25 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
   - https://www.nxp.com/design/design-center/development-boards-and-designs/LS1043A-RDB
   - https://www.nxp.com/products/LS1043A
 
-for the NXP LDP (Linux Distribution POC), see
-  - https://www.nxp.com/design/design-center/software/embedded-software/linux-software-and-development-tools/layerscape-linux-distribution-poc:LAYERSCAPE-SDK
-
-the components provided by NXP are:
-  - rcw, lf-6.6.52-2.2.0
-  - atf (fork), lf-6.6.52-2.2.0
-  - uboot (fork), lf-6.6.52-2.2.0
-  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
-  - linux (fork), lf-6.6.52-2.2.0
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
+latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
+is used, which may be considered pre-release software, as it may contain
+features which are not yet documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - rcw, lf-6.12.3-1.0.0
+  - atf (fork), lf-6.12.3-1.0.0
+  - uboot (fork), lf-6.12.3-1.0.0
+  - qoriq-fm-ucode (blob), lf-6.12.3-1.0.0
+  - linux (fork), lf-6.12.3-1.0.0
+  - fmlib, lf-6.12.3-1.0.0
+  - fmc, lf-6.12.3-1.0.0
 
 Build
 =====
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index f05113129e..e5a8a00c87 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1043a-rdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1043a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1043ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1043ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
