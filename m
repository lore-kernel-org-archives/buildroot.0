Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E846FD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED856072E;
	Thu, 26 Feb 2026 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-osSM-Q4hoV; Thu, 26 Feb 2026 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2571E60750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772139632;
	bh=aIaRBmh+Ub5kRxnkUCt7NSGQuGJmDHGVbUlG0QaK4rY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GrPPbggz1o+bfQzX4MQ4pJcEeK/TZcrbOuasG0++zaNfTrRgEXPL4kdtMp3mJRYbB
	 Be2oqYSq/1AJwN3A+bDm3fZ08MZa2JyHeR4krFBjWbBLxUfKC3CkMbVeKeAtr/ifCk
	 lFThcoQw2qQpojUkJNNqp2LpjfRvUdIZ2SO5MfHZZkWlsaimmDv5v7L4jf/pbyg/Wg
	 WCshFQjWQCuyo3gF3LTmyhfv4mPPA/yW7LLg75vpP6ExeJdQ3GBc7Py0JxfWHbIo+p
	 XSiY8s3Ggu+nT7Tcmibpf8HsTpUJ6q8fxS1aVwY5d47UsIddNXc7deCgbD/w+4UipV
	 tOrWp5UZjC7dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2571E60750;
	Thu, 26 Feb 2026 21:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 321B423D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B8C407A8
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7ryzJs8XO-v for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 21:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F3A8407A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F3A8407A5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 254C08757F; Thu, 26 Feb 2026 21:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:40:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 664daf6459fd0a867948ac78da3037386a2f5233
X-Git-Newrev: a4980af0dfd82e98781752120f47d27c9ebf19dc
X-Patchwork-Hint: ignore
Message-Id: <20260226210030.254C08757F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/versal_vpk120_defconfig: new defconfig
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4980af0dfd82e98781752120f47d27c9ebf19dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add versal_vpk120_defconfig for vpk120 evaluation board.  This board has a
Versal Premium VP1202 soc, and this defconfig further extends the portfolio
of example defconfigs for Xilinx Versal SoC products.

More details about the evaluation board can be found here:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal/readme.txt         |  4 ++++
 configs/versal_vpk120_defconfig | 50 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 3bcaccbb0e..80ab068495 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -5,6 +5,7 @@ Xilinx Versal boards:
 Supported Versal Boards:
 Xilinx VCK190 board
 Xilinx VEK280 board
+Xilinx VPK120 board
 Xilinx VPK180 board
 ******************************************
 
@@ -16,6 +17,9 @@ https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vck190
 VEK280:
 https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek280.html
 
+VPK120:
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html
+
 VPK180:
 https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk180.html
 
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
new file mode 100644
index 0000000000..1c9ef448e3
--- /dev/null
+++ b/configs/versal_vpk120_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk120-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.2)/xlnx_rebase_v2.12_2025.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk120-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_BOARD="vpk120"
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
