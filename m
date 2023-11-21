Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47697C5ACB3
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEBF417AA;
	Tue, 21 Nov 2023 10:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEBF417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMoEZ1pmyRAn; Tue, 21 Nov 2023 10:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B35417A9;
	Tue, 21 Nov 2023 10:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B35417A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257901BF239
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB483417A3
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 10:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB483417A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWmu9QrFS1Ml for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 10:33:58 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1051417B4
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 10:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1051417B4
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E30FACE79A
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 10:26:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79FA1FF803;
 Tue, 21 Nov 2023 10:26:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 11:26:31 +0100
Message-Id: <20231121102632.74304-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700562392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VV270LibCSgxqFptVZnNR4lCrbuSr9jyS5MCBR3QYfI=;
 b=nxxTEDpRC6HxUtE+hvO+YG/eXnG8WNrg6iXct5JFl1a9FPwnq3ueRnMc3juDCPPgftPlPE
 U+bmI7bTII8jn+Nvyvw4MhFm1VvbBVDShLmBJcZcrb8zHXkPHvnkCawuyTaeiF1QX7E1/f
 DKU/4DMpmqByvSbwuqZJan/yRu2EzXi7FIGOeg7lH0cgJ6UkhcJVD9Cxtuo1ECpeJFH38h
 KH6L5o60YIquIXUyikCK2jZ4Qfl4IN3eoUGsCV+tkJpt1Mm73XMU5yrXlcTpQ/kIGCXc2d
 R4vn+nQ/fEnLO80hLgHLrscl5/bIDe7KqhcgBly7o28zOuIxMR2xYEFSX+8CYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nxxTEDpR
Subject: [Buildroot] [PATCH] package/gcnano-binaries: bump version to 6.4.13
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Jens Kleintje <scooby22@web.de>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v6.1-stm32mp-r1 kernel from the
STMicroelectronics BSP.

The location of the driver has changed it is now in the
gcnano-driver-stm32mp directory instead of an archive.

The VERSION and PREFIX temporary variable in pkgconfig file came back
therefore the sed replacement also came back.

The EULA license file has changed due to copyright year update, so its
hash has changed.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  4 ++--
 package/gcnano-binaries/gcnano-binaries.mk   | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index 7bb942e6da..3192b0d854 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b122a0cd7a1bd2cee8c6117b259ef977a765d24e48655f639694cbef471da99b  gcnano-binaries-0ac1a89d7a59d040a69745a85f0da7e98644cc4b.tar.gz
-sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
+sha256  8bb1f6ee633f3c30e16b33ff6913286edf31f77b69105a14d147509beba3ea94  gcnano-binaries-5d02efd5cb4cfa85307633891f3cf87550a8bc1d.tar.gz
+sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 83261f3b7c..c3aa5d48d2 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.9
+GCNANO_BINARIES_LIB_VERSION = 6.4.13
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20221206
-GCNANO_BINARIES_VERSION = 0ac1a89d7a59d040a69745a85f0da7e98644cc4b
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20230517
+GCNANO_BINARIES_VERSION = 5d02efd5cb4cfa85307633891f3cf87550a8bc1d
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -25,7 +25,6 @@ GCNANO_BINARIES_PROVIDES = libegl libgles libgbm
 # self-extractible binary for the user-space parts. So we extract both
 # below, and also extract the EULA text from the self-extractible binary
 define GCNANO_BINARIES_EXTRACT_HELPER
-	tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_DRIVER_VERSION).tar.xz -C $(@D)
 	awk 'BEGIN      { start = 0; } \
 		/^EOEULA/  { start = 0; } \
 			{ if (start) print; } \
@@ -36,10 +35,12 @@ endef
 
 GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
 
+GCNANO_BINARIES_MODULE_SUBDIRS = gcnano-driver-stm32mp
+
 GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	KERNEL_DIR=$(LINUX_DIR) \
 	SOC_PLATFORM=st-mp1 \
-	AQROOT=$(@D) \
+	AQROOT=$(@D)/gcnano-driver-stm32mp \
 	DEBUG=0
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
@@ -55,8 +56,11 @@ define GCNANO_BINARIES_INSTALL
 	done
 	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
-	mkdir -p $(1)/usr/lib/pkgconfig/
-	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/*  $(1)/usr/lib/pkgconfig/
+	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
+	for file in *.pc ; do \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|22.0.3|" $$file > $$file.temp ; \
+		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
+	done
 endef
 
 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
