Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91819C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C2E4037C;
	Thu,  4 Aug 2022 20:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C2E4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWwb_IUS5V7e; Thu,  4 Aug 2022 20:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4B640141;
	Thu,  4 Aug 2022 20:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4B640141
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D76E1BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09BE640370
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BE640370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwIBLU-9l7yi for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FDC40104
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0FDC40104
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:42:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9F42F240004;
 Thu,  4 Aug 2022 20:42:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 22:41:56 +0200
Message-Id: <20220804204157.30731-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
References: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659645722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsef0+fowtBQpT20qhBuxORpLt2LsFAcrnjkjlnRm9E=;
 b=DuBJPQuby8Th11J1gwD8wVrld5zUyKy+cmtouMVcpt9sYt3UKv3ACM0nBKbP7/PNqxX8Tm
 g1g6IfmxKuaX64qONbS1HY15C5JSvjh4U5WKkj1zLt1f4bgTBcO6QkLfcg2ac4g8kproXN
 dWYwjm1Xf38+LPA08r98c24//guossKZ/qLbwKYRFJREMg/SgPXnsX2UBK6mdma9mtYFdI
 blQn3AvLJwDJA5zlutfa1BvHgEtn2eBc5NY5xdRrb83gCmgSIpcK7i12Rdq8PduS9IMh2B
 tRrAF7CH+CsVxWh5dvbaybHCfAWwMW/mKz9g3WjBTOWgCW1Giigqi9kuSfDHfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DuBJPQub
Subject: [Buildroot] [PATCH 2/2] package/gcnano-binaries: set Version: field
 in .pc files
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: kory.maincent@bootlin.com, Jens Kleintje <scooby22@web.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All .pc files have a Version field set to #VERSION#, which needs to be
replaced, otherwise packages checking the version of OpenGL ES, EGL,
GBM, etc. will fail. For example:

Dependency gbm found: NO unknown version, but need: ['>=17.1.0']

Such problems have been seen with both libepoxy and SDL2.

The version 21.1.1 is chosen because it matches what the Yocto recipe
is doing for this package:

  https://github.com/STMicroelectronics/meta-st-stm32mp/blob/kirkstone/recipes-graphics/gcnano-userland/gcnano-userland.inc#L42

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index ce9b24cc3a..d9c47bf64e 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -60,7 +60,7 @@ define GCNANO_BINARIES_INSTALL
 	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|21.1.1|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
