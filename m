Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD7BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B4781331;
	Mon, 12 Dec 2022 07:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B4781331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJoL6BWRZr7A; Mon, 12 Dec 2022 07:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9933380C1B;
	Mon, 12 Dec 2022 07:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9933380C1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F32D1BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B69080BA5
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B69080BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCaSDZJzWKLa for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:29:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7CC280B89
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7CC280B89
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:29:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 53461CA5B4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:18:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B16CC0005;
 Mon, 12 Dec 2022 07:17:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p4d4S-00Brye-Oe; Mon, 12 Dec 2022 08:17:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:17:47 +0100
Message-Id: <20221212071747.2829022-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221212071747.2829022-1-peter@korsgaard.com>
References: <20221212071747.2829022-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] boot/sun20i-d1-spl: drop package
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 delete mode 100644 boot/sun20i-d1-spl/Config.in
 delete mode 100644 boot/sun20i-d1-spl/sun20i-d1-spl.hash
 delete mode 100644 boot/sun20i-d1-spl/sun20i-d1-spl.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index cb0176a31c..d513bfea73 100644
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
 config BR2_KERNEL_HEADERS_5_19
 	bool "kernel headers version 5.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 04047d43da..2dc2d3820c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2300,7 +2300,6 @@ F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	board/visionfive/
 F:	boot/shim/
-F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 40472ae07d..ff98a49796 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
-source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
