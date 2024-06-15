Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB3C27C77
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 21:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DFFC8112C;
	Sat, 15 Jun 2024 21:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPkaD2eblgrN; Sat, 15 Jun 2024 21:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78CB1811CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78CB1811CD;
	Sat, 15 Jun 2024 21:19:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8939A1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE0880F52
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rQ_u9uwGb3x for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA8181090
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BA8181090
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB8E181379; Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 23:16:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8271323649c42420adaf4513b0472a7203f7784d
X-Git-Newrev: 1fbeeb23c8fca597beda37b9394d4099f1cadc41
X-Patchwork-Hint: ignore
Message-Id: <20240615211915.EB8E181379@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/versal-firmware: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fbeeb23c8fca597beda37b9394d4099f1cadc41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes the package/versal-firmware as this package is replaced
by the boot/xilinx-prebuilt target boot firmware package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr: handle legacy]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  8 ++++++++
 DEVELOPERS                                         |  1 -
 .../patches/versal-firmware/versal-firmware.hash   |  2 --
 boot/xilinx-prebuilt/Config.in                     |  1 +
 package/Config.in                                  |  1 -
 package/versal-firmware/Config.in                  | 24 ----------------------
 package/versal-firmware/versal-firmware.mk         | 21 -------------------
 7 files changed, 9 insertions(+), 49 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c1d6fd646e..29c386bec4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware has been replaced by xilinx-prebuilt"
+	select BR2_TARGET_XILINX_PREBUILT
+	select BR2_LEGACY
+	help
+	  The versal-firmware package has been replaced by the more
+	  generic xilinx-prebuilt package.
+
 config BR2_KERNEL_HEADERS_6_8
 	bool "kernel headers version 6.8.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 75642ed77f..8bfd36f1d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2353,7 +2353,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
deleted file mode 100644
index c4d745f22c..0000000000
--- a/board/xilinx/patches/versal-firmware/versal-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 7c992e6de3..d3df1c06e7 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -17,6 +17,7 @@ config BR2_TARGET_XILINX_PREBUILT_VERSION
 
 choice
 	bool "family variant"
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
diff --git a/package/Config.in b/package/Config.in
index bfbec1c21d..550fdc1f41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,7 +459,6 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
deleted file mode 100644
index 01daefd204..0000000000
--- a/package/versal-firmware/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_VERSAL_FIRMWARE
-	bool "versal-firmware"
-	depends on BR2_aarch64
-	help
-	  Pre-built firmware files for Xilinx Versal boards.
-
-	  https://github.com/Xilinx/soc-prebuilt-firmware
-
-if BR2_PACKAGE_VERSAL_FIRMWARE
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
-	string "firmware version"
-	default "xilinx_v2023.1"
-	help
-	  Release version of Versal firmware.
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
-	string "board name"
-	default "vck190"
-	help
-	  Name of Versal target board.
-	  Used for installing the appropriate firmware.
-
-endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
deleted file mode 100644
index 1ced259be1..0000000000
--- a/package/versal-firmware/versal-firmware.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# versal-firmware
-#
-################################################################################
-
-VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = MIT
-VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
-VERSAL_FIRMWARE_INSTALL_TARGET = NO
-VERSAL_FIRMWARE_INSTALL_IMAGES = YES
-
-define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
-			$(BINARIES_DIR)/$(f)
-	)
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
