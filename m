Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AB1C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED2D81434;
	Tue,  9 Aug 2022 19:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED2D81434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rg-_zicvMZwB; Tue,  9 Aug 2022 19:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5F3812D2;
	Tue,  9 Aug 2022 19:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5F3812D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1DB81BF31A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A09160ACF
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 19:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A09160ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQrn58GaBPBt for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 19:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B2C60AA4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35B2C60AA4
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 19:34:37 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.220.117])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 73D9B780504;
 Tue,  9 Aug 2022 21:34:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 21:34:25 +0200
Message-Id: <20220809193425.9359-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660073674;
 bh=lMm/3wLTapRozm6amuwZ1pFjzm0K0g0eMJvNNP/5N3g=;
 h=From:To:Cc:Subject:Date:From;
 b=bIlpU15YpvpvocVTXP2Q1/DMr8Jv0bRu1MbHcq86odiET3H12b9v0k9FBzVI3MYZo
 P6C+CsEPX+9Sgud5zqjxHMTv6tculjb8tRyKtbYskxHIhrYY17xbR/Kb6SsgSuB1y8
 jfQCU3BkHDjPsy47bH2bFVsyHGVI5bhqJklQbKlss1v9u8uzhl4V1DGRNmgc2Kmmlw
 0UKczJ1TLiRbLELWIe1dx1JUqX1odoCsu4sn2ZNXNaJrqMGxxlJu6SAw4w2E1vCbzp
 BDc5Za3u7FF8h/5zWnGul6r33cUElOLw5iuAwkcLTM5Zdmqjm/rqqUPf/hfP96fcqM
 DrBeawaVpUKCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bIlpU15Y
Subject: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add findutils
 in dependencies
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The "find" and "xargs" commands, from the "findutils" package are used
during the build process. See for example [1].

Even if it's a quite common package which is almost sure to be present
on the host, it should be listed here. When writing new recipes, hooks
and scripts, it is generally safe and portable to restrict to the
host dependencies listed in those prerequisites.

This commit just add the missing "findutils" package in this list.

[1] https://git.buildroot.org/buildroot/tree/Makefile?h=2022.05.1#n737

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 763fe79041..48be489f90 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -37,6 +37,7 @@ between distributions).
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
 ** +bc+
+** +findutils+
 
 * Source fetching tools:
 ** +wget+
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
