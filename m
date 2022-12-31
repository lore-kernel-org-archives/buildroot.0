Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ECAC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 13:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01AE660774;
	Sat, 31 Dec 2022 13:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01AE660774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lkttswHuTSb; Sat, 31 Dec 2022 13:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51BCD60AC1;
	Sat, 31 Dec 2022 13:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51BCD60AC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256FB1BF2EF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 007CA60A99
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 007CA60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olxr8dgynfgK for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 13:56:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27CC960644
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27CC960644
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 13:56:18 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.133.83])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9181A5FFC0;
 Sat, 31 Dec 2022 14:56:10 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 14:55:56 +0100
Message-Id: <20221231135559.34464-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672494974;
 bh=vHJH5aUl/Mnx9jRuWy5SkXa7MANVgn/HwcOvF3U22Ik=;
 h=From:To:Cc:Subject:Date:From;
 b=Cxwcd3r3L1NCvRLpXF6MT7abPXQPl2rQtV2HdMNfOdVwuLm0uKzgalPVGxhIxxb6a
 VbMtq2Wu12AxxruEp4dAxPqo8a3ick7jTlR2l/IFOFYDJZ7vCTez09Nlun30NTAvjJ
 Uqw4DGAMeKOskk31+Ioy9oQUTH7SSg6qYcHENSqibXmcbUr2DqhF51gLjisvdkmzCo
 8K7eXdZZ8x5MS8LgjQ/g7HGIubnO1yp21JooaanZCNw7U5oP1zT0zSrLyA445HU/B5
 NRtVr/ZVZjuhBJQMaspfkWOzqNvkAk1YSFB/jG/alxj/RvRmgEHoS0T6iA0ElsEan3
 nWlyMHK4bGkzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cxwcd3r3
Subject: [Buildroot] [PATCH 1/4] package/freescale-imx: update SITE to
 directly use https
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://www.nxp.com/ has a redirect to https://www.nxp.com/ for quite
some time now. It is also quite common to directly hit https:// urls
now.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 5f32a098a2..b119d90ec3 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,6 +4,6 @@
 #
 ################################################################################
 
-FREESCALE_IMX_SITE = http://www.nxp.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = https://www.nxp.com/lgfiles/NMG/MAD/YOCTO
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
