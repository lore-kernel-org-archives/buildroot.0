Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CE8CD4949
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 04:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E715860BC7;
	Thu, 21 Sep 2023 04:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E715860BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zg-RQpPTc7sX; Thu, 21 Sep 2023 04:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA22607DE;
	Thu, 21 Sep 2023 04:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA22607DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCA581BF295
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54E6820F4
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A54E6820F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tuv5h61pH2ey for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 04:00:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A54D82090
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 04:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A54D82090
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M5wPh-1qkWJp1xXv-007UeE for <buildroot@buildroot.org>; Thu, 21 Sep 2023
 06:00:38 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 06:00:30 +0200
Message-ID: <20230921040031.70822-1-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fzulM2a1g0ozgY+KhqvltvoimF6ZRzwJJHfIPAHRvRhGxo3OcsM
 yfnB/4VlS6WiOMvoRTfE3iuH/H+O6Mp6S3t8RJbZ7wG6qXmu2o3tHKVvfE018DACWFwZ90a
 ChJb77Miosixbe7e7eMlCqmB3GPd3Q6APUMh0KURgByu7uCJBYwivq+ThGLHTtVmUatTVIn
 D3qMa6hm0rk9tB+JPdq3Q==
UI-OutboundReport: notjunk:1;M01:P0:72H0Qvie/50=;GkY4E83Lx7rVAbHytjfZg9SVOfx
 cPc4xV0Qkxgntn3xb1SJDGbisWP+uXM5RPvKZAXGL9puH13h547OeqWVSbqsj+Mnx+YbrsT3u
 MKzAPhTuotkb6+8gPVojml5sfJhXxvHUQGt68IYx2oiyOAF5ORLq0kArcHAzIH5wNThSvsOsh
 cnxo/SnSvaxQToD5/g8AXJklUHdpXhBC5e/YUSoTtA5/WA+lKDcu0p0bmKPlic0/SxaUjb0L7
 lX2AOkKbK6LY77j+KDkVVB/zqryvYIC6A18v2USBiH1eHPZbB5KF+Rn1bhQYC/oVOMYBr6syb
 BnuTTT6m/k0nEbX0f5cVa59qpRDYojrB0QQOO5YMl60XB4hk8FusIqhECNt9mFArf9tcYDEbE
 bYkVp50GwBy6A32zGxtLBoU/SWHXj1/xMnUEpeFU2Qn78R9t32NWVSmtKpocXGaSHl0hCfp4X
 EqO/uMSjyOYWKMxhiTJlkZH/0UXNkBMtu1oV6wjnqHKEG74p5mJbHED/U2BFD3eGcG6J3eH8h
 7Q6hvoMyjdd1NdnH1A4PkLSTYb+FtbIFw6jUBnmPFBYVy9StwqCrgc2GhPRb0VZDAKZpb5/i5
 SzAQxE6/qFPHSeWLhESmOH341xwIEYt5Sz2qfkSGpCdEfKQeQII8/GtWWEY6nlqWk9zggJdyn
 Pe3eNI3ZrB4GicWdIEXaRRcSJ8DmNJ8Q01pZ7dO+woFZ6ZYYf1sC3UrruMVNUXrpQv5R4YC8x
 iC5EKFA+slF58jWLxVg1ES4jbq33x65v9jeb2hajPv4Hjwy3IxIMbbvxJqwhd5x7L1Iq1V6y+
 XjEm/kIkYE1DET3zNjon/nQweOyumiZPPFgKXF+VQrqxjF0WNING3Fb24CoTMgeAY/mhuvRZO
 9xklrbBOMx2HxOZSJgRj/nt5MFSmjlcofdr1ukrzzeQU10TkwSZd4QMbkzTPLr80Paxb0hCIT
 I/zYN+kpUnjKOWIlKeB6ikD86/Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695268838; x=1695873638; i=dalang@gmx.at;
 bh=4Qro+YMs8u1LjtC1BsmqprpZlIzfQM/FBK2aQ9/isLc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=k8+w2FjhO75WGna51UbIJuruyoStouA1YRbwSscxtTzk3uy6J6ZANzNhN7kL4svaB7EEXcydprI
 ZHoewFiZ7nfogXN6WypA8pyiCHgX2JviiBsCdgp3vYKTvvSeVgPBYeYagsYHuR8mCf/pRBnwEySEX
 pOjUGGVo17Va/48x3o4QIQ2zOniIqFm6pO7Ho2ZsAzVmzp1YPBX91tBOv2PLyucgtNjQFeC9rl6Fw
 0t7hRPBbvbhhKxAkGlEFOlyKx2mUQUoeroysEQZueCpJ/RWkOpGjhE/+aJ5UOHHksaeMUIp1aWGhU
 hhg2b4EWD9KmNwmOUEVoNKS0eGmu1mhd8XSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=k8+w2Fjh
Subject: [Buildroot] [PATCH] package/icu: drop CVE-2021-30535 from
 IGNORE_CVES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mentioned patch was removed in 7549e05b when bumping to 70-1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index d4be2e4e8f..73547a7537 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -17,9 +17,6 @@ ICU_CPE_ID_VENDOR = icu-project
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
 ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
-# 0005-ICU-21587-Fix-memory-bug-w-baseName.patch
-ICU_IGNORE_CVES += CVE-2021-30535
-
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
