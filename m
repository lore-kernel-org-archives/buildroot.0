Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1001EEF319
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A2E4094C;
	Thu,  5 Mar 2026 08:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01j3U2QlKIjD; Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3B040AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697762;
	bh=ArmOXNm3dBGC1Hz4c6zJ+rCECumQcj0ut6SCNnlB0IM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gtOru0NaMOAyIpYzenHnwoKY7khueWKPoVIorleBgdtcQnZfGCal0vnpQxf9JNSFP
	 s0Y+XCwY5ro1biaAX9/RK8jmw3BNF/XKK19t9cDsoYihrptckI2AWhumXK2/hR6VfC
	 UqokcvAD5vVJ7nbmS58MpGm3HbwBPuHXOMMO9cXCCf2dsipQonv4MxLDOWjr3doZ5D
	 quECyIK1ogInlajXmj0pYQ+gGN71hES/ckvVxnT3Zsqqjc9L5o4XvGhABbOHuSWX8M
	 eEEnx+4qf4Xl7LkV99PTkXxfNQc5oum7ddaEcczoixEpa2EwPeva6R6IHmMnxADu/B
	 YRz5LeCpf1p9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3B040AAE;
	Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1102325B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 966C960619
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDwPG8Af7iYg for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17F360611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C17F360611
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD92D828F8; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 17:30:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c61dbf8493f6e6c45e55716617c8f8c3b8224879
X-Git-Newrev: ac0dff075f5c635198b2155426806dcb5be6c00e
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.CD92D828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ullevk: bump Linux to 6.18.8
 and U-Boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac0dff075f5c635198b2155426806dcb5be6c00e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* create a board/freescale/imx6ull-evk folder dedicated to upstream Linux
  and U-Boot to ease maintainance.
* clean up both imx6ullevk and imx6ull-evk readme.txt files

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix IMX6ULLQSG url in readme.txt]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                     |  1 -
 board/freescale/imx6ull-evk/linux_sdma.fragment         |  1 +
 .../patches/linux-headers/linux-headers.hash            |  1 +
 board/freescale/imx6ull-evk/patches/linux/linux.hash    |  2 ++
 board/freescale/imx6ull-evk/patches/uboot/uboot.hash    |  2 ++
 board/freescale/{imx6ullevk => imx6ull-evk}/readme.txt  | 17 +++++------------
 board/freescale/imx6ullevk/readme.txt                   | 13 +++----------
 configs/imx6ullevk_defconfig                            |  9 ++++++---
 8 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 695e0d50c6..8bee044234 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -103,7 +103,6 @@ configs/imx6-sabresd_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/imx6slevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
-configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6ull-evk/linux_sdma.fragment b/board/freescale/imx6ull-evk/linux_sdma.fragment
new file mode 100644
index 0000000000..6f1c8b4313
--- /dev/null
+++ b/board/freescale/imx6ull-evk/linux_sdma.fragment
@@ -0,0 +1 @@
+CONFIG_IMX_SDMA=m
diff --git a/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx6ull-evk/patches/linux/linux.hash b/board/freescale/imx6ull-evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/freescale/imx6ull-evk/patches/uboot/uboot.hash b/board/freescale/imx6ull-evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ull-evk/readme.txt
similarity index 82%
copy from board/freescale/imx6ullevk/readme.txt
copy to board/freescale/imx6ull-evk/readme.txt
index dc7c5f3678..8203a12026 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ull-evk/readme.txt
@@ -2,25 +2,18 @@
 Freescale i.MX6ULL EVK board
 ****************************
 
-This file documents the Buildroot support for the Freescale i.MX6ULL EVK board.
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board
+using Upstream U-Boot and Linux.
 
 Build
 =====
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to do so there are two supported options:
-
-  make freescale_imx6ullevk_defconfig
-
-if you plan to use NXP provided U-Boot and kernel.
-
-or
+In order to do so issue:
 
   make imx6ullevk_defconfig
 
-if you plan to use mainline U-Boot and mainline kernel.
-
 Build all components:
 
   make
@@ -33,7 +26,7 @@ You will find in output/images/ the following files:
   - rootfs.tar
   - sdcard.img
   - u-boot.bin
-  - u-boot.imx
+  - u-boot-dtb.imx
   - zImage
 
 Create a bootable SD card
@@ -68,4 +61,4 @@ Enjoy!
 
 References
 ==========
-[1] https://www.nxp.com/files-static/32bit/doc/brochure/IMX6ULLQSG.pdf
+[1] https://www.nxp.com/webapp/Download?colCode=IMX6ULLQSG
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index dc7c5f3678..80db3a46ca 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -2,25 +2,18 @@
 Freescale i.MX6ULL EVK board
 ****************************
 
-This file documents the Buildroot support for the Freescale i.MX6ULL EVK board.
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board
+using Vendor U-Boot and Linux.
 
 Build
 =====
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to do so there are two supported options:
+In order to do so issue:
 
   make freescale_imx6ullevk_defconfig
 
-if you plan to use NXP provided U-Boot and kernel.
-
-or
-
-  make imx6ullevk_defconfig
-
-if you plan to use mainline U-Boot and mainline kernel.
-
 Build all components:
 
   make
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 38ea8f6940..5d802e6614 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -1,13 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ull-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
@@ -20,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
