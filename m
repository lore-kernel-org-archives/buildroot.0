Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D1C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D224053A;
	Tue,  4 Aug 2026 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDqoxQm0UylR; Tue,  4 Aug 2026 20:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F69402B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785873681;
	bh=srPYMwfDWgH7g58BMgkO8GivsLnKULALQrCm/OdzliA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mAHEDafhCJ6X1vBBygQEerpLrJh8UXvDHYezaHAwSTAyt8aIGvEAmvlKVJ8He3N4C
	 MV8ZstezTP3/t2hEQtySghacILn+K1uOgA1+AlihcRhHATveBamR20kJ/OHZ12y0D+
	 gHK9C1GcAdz1y5x9IFsk9NyibwbtaxRRfl65bU6vfgUSxIw3c+XSONOlX/m+jG2qUj
	 /CHEcbooGbl881i1p7IFX+KukSWwAPq06p3/zZsVmMbW+IfskxwkvvLKAUZFDOFHmz
	 kzRTDD8ahPz/CchsoENgogPc6N5fiur6WrDQ+vIA7ItUBMCSkxD3Yk1qYUyFJHAgoJ
	 qt/2KDoP3KmZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F69402B3;
	Tue,  4 Aug 2026 20:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18CE9350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C44808C9
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LYvVwjCO9um for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4BC808BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B4BC808BD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F327E8C586; Tue,  4 Aug 2026 20:00:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:00:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fac93ecea81a35f4535df7844896710f46103858
X-Git-Newrev: 47b558b11134c66d58482acafe4b7f4e23d65219
X-Patchwork-Hint: ignore
Message-Id: <20260804200032.F327E8C586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ts4900-fpga: remove package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47b558b11134c66d58482acafe4b7f4e23d65219
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ts4900 defconfig was removed, this package is no longer used.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/ts4900-fpga/Config.in        | 11 -----------
 package/ts4900-fpga/ts4900-fpga.hash |  5 -----
 package/ts4900-fpga/ts4900-fpga.mk   | 21 ---------------------
 5 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0f9b7e9e7a..e2f9d9131f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga removed"
+	select BR2_LEGACY
+	help
+	  The ts4900 defconfig was removed, so ts4900-fpga package
+	  has been dropped.
+
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2045bcf135..9be569fe0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,7 +449,6 @@ menu "Firmware"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
-	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
deleted file mode 100644
index 9f704fbc8c..0000000000
--- a/package/ts4900-fpga/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_TS4900_FPGA
-	bool "ts4900-fpga"
-	depends on BR2_arm
-	help
-	  TS-4900's FPGA implements clocks, UART MUX, and GPIOs. One
-	  of these GPIOs is used to enable the wifi module.
-
-	  It is loaded by U-Boot during the boot sequence, the default
-	  U-boot script expects to find it in the /boot folder.
-
-	  https://docs.embeddedts.com/TS-4900#FPGA_Changelog
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
deleted file mode 100644
index 1d3c62bfd1..0000000000
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20170510.bin.md5
-md5  86c7c3d7fb9c607af1ef55e1222b4416  ts4900-fpga-20170510.bin
-
-# Locally calculated
-sha256  f15edd6813ee5e93e7f380d85df2dc31e764ebca465093fb9006d56ee15b476b  ts4900-fpga-20170510.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
deleted file mode 100644
index 73e7a28e31..0000000000
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# ts4900-fpga
-#
-################################################################################
-
-TS4900_FPGA_VERSION = 20170510
-TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
-TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
-# No license file provided, Yocto recipe from the vendor claims MIT.
-# https://github.com/embeddedTS/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
-
-define TS4900_FPGA_EXTRACT_CMDS
-	cp $(TS4900_FPGA_DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
-endef
-
-define TS4900_FPGA_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
