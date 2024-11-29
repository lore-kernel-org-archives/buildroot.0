Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28124E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AC5608A8;
	Sun,  8 Dec 2024 13:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-C4U-e8nwlC; Sun,  8 Dec 2024 13:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55BB608D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A55BB608D0;
	Sun,  8 Dec 2024 13:08:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 122D2ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0246D6084F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIMv_FJEe4SZ for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D4360831
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70D4360831
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C0ED86B73; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Nov 2024 21:31:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4789a9b995105264649a39ccd8005bede82e288
X-Git-Newrev: b854b125f6e58240f0c96fef183c02a2980e8bc5
X-Patchwork-Hint: ignore
Message-Id: <20241208130653.6C0ED86B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kd240_defconfig: bump
 to xilinx-v2024.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b854b125f6e58240f0c96fef183c02a2980e8bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.2 which
includes the following updates:

- ATF v2.10
- Linux v6.6.40
- U-Boot v2024.01

The board specific u-boot patch for the kd240 is no longer necessary, as it is
included with the xilinx-v2024.2 release tag.

The following patch has thus been removed:
board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch | 81 ----------------------
 configs/zynqmp_kria_kd240_defconfig                |  8 +--
 2 files changed, 4 insertions(+), 85 deletions(-)

diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
deleted file mode 100644
index 0cc10d344e..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 73c99c29508d7adfe11b6a81f13cf00efab5f9de Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Tue, 4 Jun 2024 09:15:23 +0100
-Subject: [PATCH] arm64: zynqmp: Enable usb3 for k24 som
-
-This patch corrects the mio and pll configuration registers for using usb3
-on the kd240 starter kit.  Without this patch, the usb3 to sd card bridge does
-not initialize correctly and u-boot is unable to find the OS located on the
-kd240 starter kit sd card.
-
-In addition, this patch correctly configures mio76 and mio77 as gpio pins
-which are used as reset gpio pins on the kd240 starter kit.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/
----
- .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 23 ++++++++-----------
- 1 file changed, 10 insertions(+), 13 deletions(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-index 166e61431b..274203ffaa 100644
---- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-@@ -528,8 +528,8 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF18012C, 0x000000FEU, 0x00000002U);
--	psu_mask_write(0xFF180130, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180134, 0x000000FEU, 0x000000C0U);
-+	psu_mask_write(0xFF180130, 0x000000FEU, 0x00000000U);
-+	psu_mask_write(0xFF180134, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
- 	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
- 	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
-@@ -569,21 +569,16 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x0093C018U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF180390, 0x00000004U, 0x00000004U);
- 	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000040U, 0x00000000U);
--	psu_mask_write(0xFF180310, 0x00008000U, 0x00000000U);
--	psu_mask_write(0xFF180320, 0x33840000U, 0x02840000U);
--	psu_mask_write(0xFF18031C, 0x7FFE0000U, 0x64500000U);
--	psu_mask_write(0xFF180358, 0x00000008U, 0x00000008U);
--	psu_mask_write(0xFF180324, 0x03C00000U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000080U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000400U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00008000U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000010U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00007800U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000004U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000006U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
- 	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
- 	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
-@@ -591,13 +586,15 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
- 	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
- 	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0284, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0288, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	mask_delay(1);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000002U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0000U);
- 
- 	mask_delay(5);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	return 1;
- }
--- 
-2.25.1
-
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8cbc172a41..d47c3e27e5 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -17,14 +17,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
