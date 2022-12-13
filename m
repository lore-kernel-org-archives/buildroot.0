Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDCCC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C17554EDC2;
	Mon, 20 Feb 2023 22:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C17554EDC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkeyYkSfGol5; Mon, 20 Feb 2023 22:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A714ED37;
	Mon, 20 Feb 2023 22:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A714ED37
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5181BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20093416D9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20093416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyU5pt6uRIH9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466754015F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466754015F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3702A86495; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:20:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8e8d312418e7eb4b0b2c14fdb17560d185f0ea9b
X-Git-Newrev: 0a3a7169d66b610c968128688b6475ffc333cc96
X-Patchwork-Hint: ignore
Message-Id: <20230220205210.3702A86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/sun20i-d1-spl: drop
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a3a7169d66b610c968128688b6475ffc333cc96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

U-Boot has now gained SPL support for D1, so this temporary bootloader is no
longer supported.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                      |  7 +++++++
 DEVELOPERS                            |  1 -
 boot/Config.in                        |  1 -
 boot/sun20i-d1-spl/Config.in          |  8 --------
 boot/sun20i-d1-spl/sun20i-d1-spl.hash |  2 --
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 23 -----------------------
 6 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 28c6822689..852189f0ff 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_TARGET_SUN20I_D1_SPL
+	bool "sun20-d1-spl removed"
+	select BR2_LEGACY
+	help
+	  U-Boot has gained SPL support for D1, so this temporary
+	  bootloader is no longer supported.
+
 config BR2_PACKAGE_PYTHON_M2R
 	bool "python-m2r removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f0dcc42de7..831e60982e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2305,7 +2305,6 @@ F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	board/visionfive/
 F:	boot/shim/
-F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index ce17b2df6b..2d4d077632 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
-source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/sun20i-d1-spl/Config.in b/boot/sun20i-d1-spl/Config.in
deleted file mode 100644
index 9d94d87b1c..0000000000
--- a/boot/sun20i-d1-spl/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_TARGET_SUN20I_D1_SPL
-	bool "sun20-d1-spl"
-	depends on BR2_RISCV_64
-	help
-	  Allwinner D1 boot0 code with modifications to use as U-Boot
-	  SPL.
-
-	  https://github.com/smaeul/sun20i_d1_spl
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
deleted file mode 100644
index 11d17a9a16..0000000000
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  08e2d0574e58c99734cd1d9ea89b86464242bf2db4f6769b23803bf9dcdac3c4  sun20i-d1-spl-882671fcf53137aaafc3a94fa32e682cb7b921f1.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
deleted file mode 100644
index 6bcea0fa96..0000000000
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# sun20i-d1-spl
-#
-################################################################################
-
-# Commit on the 'mainline' branch
-SUN20I_D1_SPL_VERSION = 882671fcf53137aaafc3a94fa32e682cb7b921f1
-SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
-SUN20I_D1_SPL_INSTALL_TARGET = NO
-SUN20I_D1_SPL_INSTALL_IMAGES = YES
-SUN20I_D1_SPL_LICENSE = GPL-2.0+
-
-define SUN20I_D1_SPL_BUILD_CMDS
-	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" p=sun20iw1p1 mmc
-endef
-
-define SUN20I_D1_SPL_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/nboot/boot0_sdcard_sun20iw1p1.bin \
-		$(BINARIES_DIR)/boot0_sdcard_sun20iw1p1.bin
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
