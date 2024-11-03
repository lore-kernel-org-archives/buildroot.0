Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0123D11194
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653CD40313;
	Sun,  3 Nov 2024 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNMIgCQpgqG1; Sun,  3 Nov 2024 22:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6955400D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6955400D7;
	Sun,  3 Nov 2024 22:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE328B8
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E71A74011F
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JLjEO1PB9md for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 22:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A20400AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88A20400AB
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:06:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 721D9857B1; Sun,  3 Nov 2024 22:06:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Nov 2024 22:51:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12de75644b427e317628d2a7c4169f7e74c10e73
X-Git-Newrev: d74a5a218fabee928abb347086648ad142f7d5a5
X-Patchwork-Hint: ignore
Message-Id: <20241103220640.721D9857B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_vek280_defconfig: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=d74a5a218fabee928abb347086648ad142f7d5a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for Xilinx Versal VEK280 Evaluation Kit.

VEK280 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vek280.html

The VEK280 requires a patch for the memory node in the dts file because it is
not currently correct.  This patch has been applied to the linux-xlnx repo and
will be included in the 2024.2 release.

Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Julien: regenerated defconfig with savedefconfig for config ordering
and kept BR2_TARGET_XILINX_PREBUILT_VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 board/versal/readme.txt                            |  4 ++
 ...64-versal-Fix-vek280-memory-configuration.patch | 47 ++++++++++++++++++++++
 configs/versal_vek280_defconfig                    | 44 ++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index edf823b34b..d66717175b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2436,6 +2436,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
+F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 9cf499b35b..4d8406fb1f 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -4,6 +4,7 @@ Xilinx Versal boards:
 ******************************************
 Supported Versal Boards:
 Xilinx VCK190 board
+Xilinx VEK280 board
 Xilinx VPK180 board
 ******************************************
 
@@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
 VCK190:
 https://www.xilinx.com/products/boards-and-kits/vck190.html
 
+VEK280:
+https://www.xilinx.com/products/boards-and-kits/vek280.html
+
 VPK180:
 https://www.xilinx.com/products/boards-and-kits/vpk180.html
 
diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
new file mode 100644
index 0000000000..d894ad35d1
--- /dev/null
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
@@ -0,0 +1,47 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 15 Jul 2024 08:24:57 +0200
+Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+
+Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
+configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
+(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
+tab but not available as option in wizard. That's why only describe 8GB by
+default.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
+---
+ arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
+ arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+index 1641dc0b5141..ad5d590318e6 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+index fda47cd87b3a..80aae8fa4b11 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+-- 
+2.43.0
+
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
new file mode 100644
index 0000000000..fcf440ed89
--- /dev/null
+++ b/configs/versal_vek280_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
