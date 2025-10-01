Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C19CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 13:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A04883E0B;
	Wed,  1 Oct 2025 13:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYLZxmh22a-9; Wed,  1 Oct 2025 13:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F44183E3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F44183E3D;
	Wed,  1 Oct 2025 13:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE69E26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21CF741050
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SITdXCGACBzJ for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 13:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CB1F4104E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB1F4104E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB1F4104E
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:22:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 479FD1A0F88
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:22:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 12024606BF;
 Wed,  1 Oct 2025 13:22:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35B85102F1A34; 
 Wed,  1 Oct 2025 15:22:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Jens Kleintje <scooby22@web.de>
Date: Wed,  1 Oct 2025 13:22:24 +0000
Message-ID: <20251001132225.1801-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759324957; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=yxsPwcL0Q0ByrgWnB9ES75RhVwKUwij2s3tzQtc0h0M=;
 b=2gE1D90702/y/DhaoGZoOLYskqEWz9oREhsQ7wz938Usha9ZOwO7wE1mqhBExf+d/RvIvP
 Y7iBipudmS8Pbid6P3rpobNGmUBdU0xw78fIwn1MrhZGSamHDGYG34HAyvguV+95AWkGRs
 LJXvATTbT2vNi2jPEyQYfFkg65W338IR8lQCw+8SCAUiV8eRPfdqmf9+4LzWb9tVd1q+i5
 RRYnXhw9BJQoqGlqOuvpeneso0CPcZyLrYrpFxNPp4OB6Zq66IEAL1cdlRHtDLgJ2KuVjz
 CsBZaQzyj9RvQewXyfJ/ZGuChHiYdwHs7xXHHj3+FHxnMv30tlb5kMcJ6jj68Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2gE1D907
Subject: [Buildroot] [PATCH] package/gcnano-binaries: bump version to 6.4.21
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v6.6-stm32mp-r2 kernel from the
STMicroelectronics BSP.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index d3c64d44a3..f1c8b48b0d 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c7454ac44c9e3ead20a978a5c009e8489fa90ce5cf291be31016a7f497bea26  gcnano-binaries-bbaae49a0e4859ed53f898a250269c8a237261bc.tar.gz
+sha256  b4cb4c1e8a39c131fe52781038fea8ae33120eee41eaddb3feb329c4b2205068  gcnano-binaries-7c181cacf89f918039e64934fdc33fe817a052cd.tar.gz
 sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 03912ea585..f171c03059 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.15
+GCNANO_BINARIES_LIB_VERSION = 6.4.21
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
 
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
-GCNANO_BINARIES_VERSION = bbaae49a0e4859ed53f898a250269c8a237261bc
+GCNANO_BINARIES_VERSION = 7c181cacf89f918039e64934fdc33fe817a052cd
+GCNANO_BINARIES_USERLAND_DATE_VERSION = 20250226
 ifeq ($(BR2_arm),y)
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-20240206
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm
 GCNANO_BINARIES_SOC_PLATFORM = st-mp1
 else
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-20240517
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm64
 GCNANO_BINARIES_SOC_PLATFORM = st-mp2
 endif
@@ -68,7 +69,7 @@ define GCNANO_BINARIES_INSTALL
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|23.0.3|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|24.0.7|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
