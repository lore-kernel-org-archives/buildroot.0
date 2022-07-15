Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67265C43334
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC32A84F9C;
	Fri, 15 Jul 2022 21:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC32A84F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-XbSkQpgp-5; Fri, 15 Jul 2022 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E382784F90;
	Fri, 15 Jul 2022 21:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E382784F90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E22E41BF34E
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB97240166
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 21:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB97240166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hibFXdy94UoU for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 21:11:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FB0400CB
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92FB0400CB
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 21:11:15 +0000 (UTC)
Received: from 1oCSae-0000Xv-VN by out3a.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1oCSag-0000cJ-TS; Fri, 15 Jul 2022 14:11:14 -0700
Received: by emcmailer; Fri, 15 Jul 2022 14:11:14 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3a.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1oCSae-0000Xv-VN; Fri, 15 Jul 2022 14:11:12 -0700
Received: from tsdebian.ts-local.net (97-120-89-198.ptld.qwest.net
 [97.120.89.198])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 04EF52142;
 Fri, 15 Jul 2022 14:11:11 -0700 (MST)
To: buildroot@buildroot.org
Date: Fri, 15 Jul 2022 14:10:41 -0700
Message-Id: <20220715211041.7902-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Message-Id:Date:To:From; bh=GcarKjkpDmbMMxx4xujWKBehaA0A2+HwQiSSkYwpKZ4=;
 b=JwLajCJtJ5qS1rArIU2Lh4qQcf/NGR9XFsWLzP26laOw/R5w7hgg4HduKo38zOMCiY0q8J3BOke/VMbfE9WhM062CTKT5PaANeSHk5q8TSvbEFQicv5ziRW7xMeuTTK5nmsJvvpMS22hKaQkToSf0YtxGNLAdtCuVvKPJExN0WW05Pfgf7UuUX5MeNIlqFrrPXM9BLZGIhVoFwmUDkM8dLwO5xFv2lp4UY4G/tvoXI9iwdHEbRcqL7isCoA9ukbcBKZVuXB99bHGMQZ0e4Iuau/Nf6G3IAh9l6b2RkS7Q8K5GBAMuVjT8HCrGnqMAP3qo3va6frkxJWSmxd/JUDAzQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=JwLajCJt
Subject: [Buildroot] [PATCH 1/1] package/wilc-driver: fix kconfig syntax
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sub-options SPI and SDIO weren't rendering as nested options for
wilc-driver, instead showing on the same indent level. Move the
comment and depends on to bottom of file to correct this.

Fixes: 1a47c42b33 ("package/wilc-driver: add missing BR2_LINUX_KERNEL dependency")
Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc-driver/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index 24a7b05b17..7ed062bb66 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -17,9 +17,6 @@ config BR2_PACKAGE_WILC_DRIVER
 
 	  https://github.com/embeddedTS/wilc3000-external-module
 
-comment "wilc kernel module needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
 if BR2_PACKAGE_WILC_DRIVER
 
 config BR2_PACKAGE_WILC_DRIVER_SPI
@@ -60,3 +57,6 @@ config BR2_PACKAGE_WILC_DRIVER_SDIO_OOB
 	  time division interrupt.
 endif
 endif
+
+comment "wilc kernel module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
