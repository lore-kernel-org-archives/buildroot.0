Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48A9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1610E40550;
	Sat,  5 Feb 2022 21:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nou0cMC6thIf; Sat,  5 Feb 2022 21:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52C2040593;
	Sat,  5 Feb 2022 21:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15B251BF2CF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02F054011A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2mymDR45X_r for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 21:18:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D366C40119
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 21:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D792F82650; Sat,  5 Feb 2022 21:10:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 22:16:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18a19c985f3363510d8ae317e66d53680475db26
X-Git-Newrev: f22bff4a79faee5e4501e0f7653c09e6dcf5387e
X-Patchwork-Hint: ignore
Message-Id: <20220205211057.D792F82650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynq-boot-bin: drop legacy package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f22bff4a79faee5e4501e0f7653c09e6dcf5387e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 6dd5a33c485c (zynq_zed: bump U-Boot to xilinx-v2016.2), we
have no in-tree users of zynq-boot-bin.py, as U-Boot has since v2016.01
been able to natively generate Xilinx images.

zynq-boot-bin.py is python2-only and there is zero chance that upstream
will move it to python3. We could carry a python3-compatible copy, but
that tool is now virtually unused.

6 years have passed now; let it rest in peace at last.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                         | 13 +++++++++++++
 boot/uboot/Config.in                     | 12 ------------
 boot/uboot/uboot.mk                      | 11 -----------
 package/zynq-boot-bin/zynq-boot-bin.hash |  2 --
 package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ----------------------
 5 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 62717463df..34d8c71cc8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,19 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_TARGET_UBOOT_ZYNQ_IMAGE
+	bool "Generate image for Xilinx Zynq"
+	select BR2_LEGACY
+	help
+	  Since 2016.1, U-Boot can natively generate the Zynq boot
+	  image, and so the Xilinx-specific format and tools have been
+	  removed. Should you still have an older U-Boot that needs
+	  this, a python3 version of the zynq-boot-bin.py script can be
+	  downloaded from the URL below and called from a post-build
+	  script.
+
+	  https://gist.githubusercontent.com/jameshilliard/e09235dfc6f96c11418a134e6ebf7890/raw/135b7480c405ae8a77a9db615e495f9a9f2d3242/zynq-boot-bin.py
+
 config BR2_PACKAGE_RPI_BT_FIRMWARE
 	bool "rpi-bt-firmware package was renamed"
 	depends on BR2_arm || BR2_aarch64
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c630fc6552..1fd4dede92 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -455,18 +455,6 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
 	  MLO on OMAP and SPL on i.MX6 for example.
 
-config BR2_TARGET_UBOOT_ZYNQ_IMAGE
-	bool "Generate image for Xilinx Zynq"
-	depends on BR2_arm
-	depends on BR2_TARGET_UBOOT_SPL
-	depends on BR2_TARGET_UBOOT_FORMAT_DTB_IMG
-	help
-	  Generate the BOOT.BIN file from U-Boot's SPL. The image
-	  boots the Xilinx Zynq chip without any FPGA bitstream.
-	  A bitstream can be loaded by the U-Boot. The SPL searchs
-	  for u-boot-dtb.img file so this U-Boot format is required
-	  to be set.
-
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
 	depends on BR2_aarch64
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 574fc7089a..a61d1c8135 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -432,17 +432,6 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
-define UBOOT_GENERATE_ZYNQ_IMAGE
-	$(HOST_DIR)/bin/python2 \
-		$(HOST_DIR)/bin/zynq-boot-bin.py \
-		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
-		-o $(BINARIES_DIR)/BOOT.BIN
-endef
-UBOOT_DEPENDENCIES += host-zynq-boot-bin
-UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
 ifeq ($(BR2_TARGET_UBOOT_SPL),y)
 UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
diff --git a/package/zynq-boot-bin/zynq-boot-bin.hash b/package/zynq-boot-bin/zynq-boot-bin.hash
deleted file mode 100644
index 0bc23de197..0000000000
--- a/package/zynq-boot-bin/zynq-boot-bin.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://raw.githubusercontent.com/Xilinx/u-boot-xlnx
-sha1	940331ee02b0007099effa61e382fe7ea4174054	zynq-boot-bin.py
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
deleted file mode 100644
index deba5f4096..0000000000
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# zynq-boot-bin
-#
-################################################################################
-
-ZYNQ_BOOT_BIN_VERSION = 2015.1
-ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
-ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/xilinx-v$(ZYNQ_BOOT_BIN_VERSION)/tools
-ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
-
-HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
-
-define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
-	cp $(HOST_ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
-endef
-
-define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
