Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2249DE92733
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B6B813A9;
	Mon, 29 Dec 2025 16:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrxNMXN4LW4E; Mon, 29 Dec 2025 16:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF652813AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027170;
	bh=Kf25+awZptTLOVGy09PFVICfpiukIYq8Mwabizl6aXs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/qmyk8wyhBiioZonSF+lVvOo5WZTfNNAvWl6Qr8tZTvAjG98pl+wF5aAD+mBAyfv
	 FPpAe+zElrvjUl4PwOrdiuIcMGRRPP8ucRaFBjBqmW9c+NB8iEy/hsFwkTAWxph6Eu
	 9eij2zgG7Y9+2ucaVpwK1mnWtV/Yopni2YmPRX0MBJl/TA6xT1zkCBaSjrmVFnVgWh
	 WRlUBlYKItWerPzicIDg5q17tr4XWGrt+bwDfR5JCCBWR56gzIzZf3nW1sb1g/PH1O
	 q5EksSUaFuIOA2JTQXUs41hvWb9D4zx51nsCV/R2pLXyE2hKvJ39QPaTwWTIEywjnc
	 tqURMkfQgXAbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF652813AC;
	Mon, 29 Dec 2025 16:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 798B0B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731D8813AC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLGcRDucuZ4V for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E531813A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E531813A9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A83B87B7F; Mon, 29 Dec 2025 16:52:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 17:52:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6750719a20ff58bba61936320ce4c76b02eefc7a
X-Git-Newrev: ff0bd00468fe9f935d9385c084ff05539ea68c7e
X-Patchwork-Hint: ignore
Message-Id: <20251229165247.8A83B87B7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/s500-bootloader: drop package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff0bd00468fe9f935d9385c084ff05539ea68c7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the removal of the roseapplepi defconfig in commit 56091a581854a
("configs/roseapplepi: remove defconfig, broken") there are no (in-tree)
users of the s500-bootloader binary blob package, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                          |  6 ++++++
 boot/Config.in                            |  1 -
 boot/s500-bootloader/Config.in            | 17 ----------------
 boot/s500-bootloader/s500-bootloader.hash |  2 --
 boot/s500-bootloader/s500-bootloader.mk   | 34 -------------------------------
 utils/genrandconfig                       |  5 -----
 6 files changed, 6 insertions(+), 59 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e10fd95f8d..329336fa2a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_TARGET_S500_BOOTLOADER
+	bool "s500-bootloader"
+	select BR2_LEGACY
+	help
+	  s500-bootloader package has been removed
+
 config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "opencv3 ffmpeg support removed"
 	select BR2_LEGACY
diff --git a/boot/Config.in b/boot/Config.in
index d3e1b9c055..6816531be9 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
-source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
diff --git a/boot/s500-bootloader/Config.in b/boot/s500-bootloader/Config.in
deleted file mode 100644
index 7bb689f305..0000000000
--- a/boot/s500-bootloader/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TARGET_S500_BOOTLOADER
-	bool "s500-bootloader"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  1st level bootloader for Actions Semiconductor S500 SoC.
-
-	  https://github.com/xapp-le/owl
-
-config BR2_TARGET_S500_BOOTLOADER_BOARD
-	string "board to configure for"
-	depends on BR2_TARGET_S500_BOOTLOADER
-	help
-	  Specify the board to configure the bootloader for.
-	  This should be the name of a directory under s500/boards
-	  containing a suitable bootloader.ini file.
diff --git a/boot/s500-bootloader/s500-bootloader.hash b/boot/s500-bootloader/s500-bootloader.hash
deleted file mode 100644
index 2ebd933e52..0000000000
--- a/boot/s500-bootloader/s500-bootloader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  b183024ac69f51ea7befd28d03b2ec35a7280e270405600fb4f37aa91d9c9571  s500-bootloader-a8d7fa1d9a7f353ec4613febf30f4ca99a10a106.tar.gz
diff --git a/boot/s500-bootloader/s500-bootloader.mk b/boot/s500-bootloader/s500-bootloader.mk
deleted file mode 100644
index bc87b091c7..0000000000
--- a/boot/s500-bootloader/s500-bootloader.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# s500-bootloader
-#
-################################################################################
-
-S500_BOOTLOADER_VERSION = a8d7fa1d9a7f353ec4613febf30f4ca99a10a106
-S500_BOOTLOADER_SITE = $(call github,xapp-le,owl,$(S500_BOOTLOADER_VERSION))
-S500_BOOTLOADER_LICENSE = PROPRIETARY
-S500_BOOTLOADER_INSTALL_TARGET = NO
-S500_BOOTLOADER_INSTALL_IMAGES = YES
-
-S500_BOOTLOADER_BOARD = $(call qstrip,$(BR2_TARGET_S500_BOOTLOADER_BOARD))
-
-define S500_BOOTLOADER_BUILD_CMDS
-	cd $(@D) && ./tools/utils/bootloader_pack \
-		s500/bootloader/bootloader.bin \
-		s500/boards/$(S500_BOOTLOADER_BOARD)/bootloader.ini \
-		s500-bootloader.bin
-endef
-
-define S500_BOOTLOADER_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/s500-bootloader.bin \
-		$(BINARIES_DIR)/s500-bootloader.bin
-endef
-
-$(eval $(generic-package))
-
-ifeq ($(BR2_TARGET_S500_BOOTLOADER)$(BR_BUILDING),yy)
-# we NEED a board name
-ifeq ($(S500_BOOTLOADER_BOARD),)
-$(error No s500-bootloader board specified. Check your BR2_TARGET_S500_BOOTLOADER settings)
-endif
-endif
diff --git a/utils/genrandconfig b/utils/genrandconfig
index ac80982f63..5ebd552a1d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -362,11 +362,6 @@ async def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n')
         configlines.remove('BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n')
 
-    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
-       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
-        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
-        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
-
     if 'BR2_TARGET_TI_K3_R5_LOADER=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
