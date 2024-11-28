Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCB5D70DEE
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 21:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D7D40734;
	Thu, 28 Nov 2024 21:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btnzoyf4vbhd; Thu, 28 Nov 2024 21:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CE14072F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CE14072F;
	Thu, 28 Nov 2024 21:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6528A71F
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A0D606AF
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPI3-h5ZPysM for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 21:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666A1606AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 666A1606AA
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5093286782; Thu, 28 Nov 2024 21:16:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 22:15:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a6db4cde0fcbe7f047305a38b461668f4a9b553c
X-Git-Newrev: b4789a9b995105264649a39ccd8005bede82e288
X-Patchwork-Hint: ignore
Message-Id: <20241128211614.5093286782@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/versal_vek280_defconfig: bump to xilinx-v2024.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4789a9b995105264649a39ccd8005bede82e288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps the versal_vek280_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PLM xilinx-v2024.2
- PSMFW xilinx-v2024.2
- U-Boot v2024.01

The board specific Linux patch for the vek280 needs to be changed for the
2024.2 release.  While the Linux vek280 dts files were correctly updated, the
prebuilt vpl_gen_fixed.pdi file is still not defining the DDR memory region
from address 0x8 0000 0000 to 0x8 8000 0000.

For this reason, a new patch is needed for 2024.2 which is only a work around
until the pdi file is corrected.  This is why the dts patch will not be
applied upstream.

The following patch has thus been removed:
board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch

And replaced with:
board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch

Upstream: n/a

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Julien: remove the package patch numbering]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-versal-vek280-prebuilt-pdi-is-incorrect.patch} | 33 ++++++++++++----------
 configs/versal_vek280_defconfig                    |  8 +++---
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
similarity index 54%
rename from board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
rename to board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
index d894ad35d1..357c0abb2f 100644
--- a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
@@ -1,47 +1,50 @@
-From: Michal Simek <michal.simek@amd.com>
-Date: Mon, 15 Jul 2024 08:24:57 +0200
-Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+From e79a96ff89b11fea03680633ab830894288ee9f0 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Thu, 28 Nov 2024 07:50:28 +0000
+Subject: [PATCH] arm64: versal: vek280 prebuilt pdi is incorrect
 
-Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
-configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
-(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
-tab but not available as option in wizard. That's why only describe 8GB by
-default.
+The prebuilt vpl_gen_fixed.pdi for the vek280 is incorrect and does not define
+the DDR memory region for address 0x8 0000 0000 - 0x8 8000 0000.  For this
+reason, the intree Linux dts memory node for the vek280 will not boot.
+
+This patch works around the issue until the prebuilt pdi file is changed.
+
+https://github.com/Xilinx/soc-prebuilt-firmware/blob/xilinx_v2024.2/vek280-versal/vpl_gen_fixed.pdi
+
+Upstream: n/a
 
-Signed-off-by: Michal Simek <michal.simek@amd.com>
 Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
 ---
  arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
  arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-index 1641dc0b5141..ad5d590318e6 100644
+index ad5d590318e6..a306eacca5b3 100644
 --- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
 +++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
 @@ -19,7 +19,7 @@ / {
  
  	memory: memory@0 {
  		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x1 0x80000000>; /* 2GB + 6GB */
 +		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
  	};
  
  	chosen {
 diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-index fda47cd87b3a..80aae8fa4b11 100644
+index a5ee80a373e2..ba54a5ef0c73 100644
 --- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
 +++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
 @@ -19,7 +19,7 @@ / {
  
  	memory: memory@0 {
  		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
+-		reg = <0 0 0 0x80000000>, <0x8 0x00000000 0x1 0x80000000>; /* 2GB + 6GB */
 +		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
  	};
  
  	chosen {
 -- 
-2.43.0
+2.25.1
 
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index fcf440ed89..e90408e6b4 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
@@ -18,13 +18,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -35,7 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
