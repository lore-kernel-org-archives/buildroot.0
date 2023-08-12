Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF92C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B0E41558;
	Sat, 12 Aug 2023 19:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B0E41558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ySsTUW8pyWpJ; Sat, 12 Aug 2023 19:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB9C841568;
	Sat, 12 Aug 2023 19:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB9C841568
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2EC1BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 807208191E
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 807208191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FtQPRFXkuK96 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:16 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B35081911
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B35081911
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6DWi-1qSgJQ46jw-006bSz; Sat, 12 Aug 2023 21:29:09 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:30 +0200
Message-ID: <20230812192842.135682-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SD/ASxVusSaz7UtDfb4bhRYVq7x52P9XKjnLgBNlKq+RKeu1zlx
 Qu8iR8i1p+/Np//W9zuEBEkC/AU8ICgPmmIZ+4BHIGvaRMLtzeDPya2QKpTLQiZCXGBlpC0
 nxzHDwzIj6VBd2ivphFTda4fr4CGXYRz6bApGuz+reJoSjhP9wfqkgDc1ndLv78GQubgKG/
 UYnAbm1MpEFLqqN6sBHUQ==
UI-OutboundReport: notjunk:1;M01:P0:arKBWBV5+5c=;O0Nb4iRyTU0IlpUIJaapYHW61nZ
 eFHcZvVIxtrSB7ojAzuESUKE2yPWmomwWCdXWs1nFiD2T9Zfb/m+yGbiK6sCTlHQFl92WvvHG
 6fAll2x78SeJn2wat1cXBaKeXO4WLvCWF8Uh5CinLkrL1Xw1tIeazKPydtpnYyqr9qsdyso0Y
 S+x60f4wSzibaMrs1lsUn4lCeV0tKwmnvTpjZuirpIoTpvzYwfogFa3xi4Nj5H5Fn2a6lG1Mm
 CaZNw+dTZpz6BEDJG1UXD2ZX1P1UMwsdSAW1RFb5l+1sK4Ggpqk6sMPz92+gas9nTNplwi/aq
 z5JtD+GWWAsMXZMMFMXUpoSMMIWz9vqwp1jOBdxv5s5yAvzJC1ytcxYVZZlPGlXVairUMSoFm
 dMcA3bfbOoSdOBd25TksIZmB4/Vnv8jOpTVMYe2IceMt3ieA1oHbysyZc2PdpobE7nj+I5/09
 lo+MITfayulIJ/OKqLk/Hea7XiZqgbD+xnqbjI8VdsrS/WQkJfmhFmI1QVnCc1DEE/X5S9nja
 eMAtPvirpSfIa5DKofA1NhwNsKri+Th8mTPQ4E5QwNa7upKJLNFoeAP8ON5MQIHQf0nitT+dd
 1MrGInJrruE1GgxzC2cpy5TFuNDyIXevfsA6u6a0JZsh9Ph5FN00SIMnx/fLPQ+LbkEv51kEy
 ARPUe5WVGEIfeMzNccRkKuN1+wEvBwix8Ts7BsGr/jYAGIdl3NT+dO35cLtIDd70bjZtZIxwC
 I124JRoO/QmOdQ74nt7r5adiXp60kWybMUaNS5yd9qjPP1JgXys4dPHDXJLDk99VUVWA8R+tT
 0YSGtJdjsduvwUaN6QFyAASUhx1WnE30oDfCzrRadyYFI1IjtqJM+OfPbe/3KcnnOaGfG9DJ6
 wAd+xjjtyveOgMhjCggPF3FOwM42OiLJaQmTg5+pEiDjxudfOqzZdHoVR5Te7fgnLAkIjG/6Q
 kXlekNGQk1yREPoeWtIrfRQjx10=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868549; x=1692473349; i=dalang@gmx.at;
 bh=gaefaDU5/bDqQGC3wMDyv+t4aXDubkAp3CvkXUCRBFc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ULsoO42SHfd5joTvTtkbigO3ggPC07R3CwHMedw3vdZjNFUyX67SecZnOKxYv7FDDEGyKHn
 jmtl/pkARNTqI+LPmgiKAcLAroT5Jj2sVtH6cbEQLKxjtlZOrZu/RJzA78wfVR6qGJmvJBSQQ
 V2zVl1yx4H7Qf+3kLTNGRiJ97nF0VSlha8N1cJjueLf1kHCeyC9ncenOqTsZZDsvI9mrbOzGm
 ndUAKZ5aqJAroIZYyY93VO321oT+j3OkagFNDDBOkUcq0/43vjQwiyCineIan3P1iRi5lcIWt
 pEny0ksFQi3UfHisw60nACA7W9Lb4azS71W+f9CJRx9is/2nVJpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ULsoO42S
Subject: [Buildroot] [PATCH v3 2/8] support/scripts/pkg-stats: ignore
 llvm-project.mk
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
f6eaf60 ("package/llvm-project: new group for llvm packages")

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eea900124c..1ac538f5f9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -345,6 +345,7 @@ def get_pkglist(npackages, package_list):
                      "package/gstreamer/gstreamer.mk",
                      "package/gstreamer1/gstreamer1.mk",
                      "package/gtk2-themes/gtk2-themes.mk",
+                     "package/llvm-project/llvm-project.mk",
                      "package/matchbox/matchbox.mk",
                      "package/opengl/opengl.mk",
                      "package/qt5/qt5.mk",
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
