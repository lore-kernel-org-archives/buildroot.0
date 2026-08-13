Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42470C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDBE405A4;
	Fri, 14 Aug 2026 13:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnuGspYSmiWi; Fri, 14 Aug 2026 13:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A0940C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713694;
	bh=WHI+X31JH509Trx/OCxT5WGFJGDVhXf3ZJdMx4gPTX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=stcbYxGohsfvT0R9dlG9Hd1suxdiJRTB4APwB1l39lxFLM+ea2XXCSB5GPVrfHmrI
	 xj4mrocpqg+XX9TH1XPFmDZOafbqPJyprk/YyqeMIsKVhnXLrggvVJz7R6Ppo/oGMC
	 Nr3d3RpqQrzXclA0WDRxnUeCbjA221g8NZpsN26h2mkFsF4uJDCD1OfQYKv9lmMFfl
	 Apdop0mO6GpW/nf0eAFOS3q1I4J5G/CnkuwSudoxzbbkRlUI+Kxs1oiQU2XYc+poH7
	 p2jwY11vyZhA1HyMwthiwloaL+XUKI7zlNh66HdqijO0FgV7OfkOaAbeCEzdB0vg9u
	 tWX3DYzDFWsOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02A0940C91;
	Fri, 14 Aug 2026 13:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7D8323F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E612F60803
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBsAIZSqw2EQ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988E46082D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 988E46082D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CD7A8D665; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0de79da7a674849f6751368f67e93e5f505729bd
X-Git-Newrev: d1fc34482a9ae9036c1dbe5a99082bd54917419f
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.9CD7A8D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ts4900-fpga:
 remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1fc34482a9ae9036c1dbe5a99082bd54917419f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The ts4900 defconfig was removed, this package is no longer used.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47b558b11134c66d58482acafe4b7f4e23d65219)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/ts4900-fpga/Config.in        | 11 -----------
 package/ts4900-fpga/ts4900-fpga.hash |  5 -----
 package/ts4900-fpga/ts4900-fpga.mk   | 21 ---------------------
 5 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 96fab167ef..21f63e6169 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05.2"
 
+config BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga removed"
+	select BR2_LEGACY
+	help
+	  The ts4900 defconfig was removed, so ts4900-fpga package
+	  has been dropped.
+
 config BR2_PACKAGE_ARGPARSE
 	bool "argparse has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 31e958bcdc..bf6c276528 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -447,7 +447,6 @@ menu "Firmware"
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
