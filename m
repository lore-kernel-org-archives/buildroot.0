Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E83C3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4090860B00;
	Mon,  5 May 2025 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKEL9c98Yf3J; Mon,  5 May 2025 20:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 438C4608C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438C4608C1;
	Mon,  5 May 2025 20:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA02412E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC2FD4067A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHCr22zkb42D for <buildroot@buildroot.org>;
 Mon,  5 May 2025 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7A940798
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7A940798
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9064864C9; Mon,  5 May 2025 20:53:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 May 2025 22:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a36d5fd2f8283b849d7b0837cefdb2c2ed1dff51
X-Git-Newrev: 299f803cad1cec354529224a721c598b3d2fb3fb
X-Patchwork-Hint: ignore
Message-Id: <20250505205315.C9064864C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/xilinx: add xilinx-fpgautil to
 xilinx defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=299f803cad1cec354529224a721c598b3d2fb3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the xilinx-fpgautil application to all Xilinx zynq, zynqmp and
versal defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Luca: build-tested only]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/versal_vck190_defconfig     | 1 +
 configs/versal_vek280_defconfig     | 1 +
 configs/versal_vpk180_defconfig     | 1 +
 configs/zynq_microzed_defconfig     | 1 +
 configs/zynq_zc702_defconfig        | 1 +
 configs/zynq_zc706_defconfig        | 1 +
 configs/zynq_zed_defconfig          | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2f40c210a8..368133e916 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index af8bed884f..1d83e55499 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index afa606ec8c..7729c655c3 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index b9b2da3849..f9be297b99 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-microzed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ab42abe655..4c6361a9b7 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc702"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d7ce9cf11a..bc853f522d 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc706"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c9e8e7ea2c..d0fbaf2ea5 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 261b73d6cf..4ba4be861f 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2cf2b98aa5..fdd868bbb5 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ef6a23f2a2..ff03f87b54 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 762a54d968..856c1d896d 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 92e0d41736..c21058be74 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 51287fdffb..5e13c39a1a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
