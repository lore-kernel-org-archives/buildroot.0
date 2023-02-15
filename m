Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2CC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0DF581F1B;
	Wed, 15 Feb 2023 20:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DF581F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_Y2PMy23mhL; Wed, 15 Feb 2023 20:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126FA81959;
	Wed, 15 Feb 2023 20:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126FA81959
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C32621BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90A31417A4
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90A31417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dyxBFEGCRnz for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:09:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2626041762
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2626041762
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:09:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SO5Pp9PjF3NxdSO5QpSkMu; Wed, 15 Feb 2023 21:09:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 21:09:02 +0100
Message-Id: <20230215200902.538238-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215200902.538238-1-giulio.benetti@benettiengineering.com>
References: <20230215200902.538238-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFo7iVcTOJG+nxCLhZ4ygy/UIZBW/0dYbg7L3evUIjx8v+GhkyNuQx9V28SfZvd/pJOEhzUSICUbF7A11FID55b+B1ZO8sYMBV6bC4rauX0fyeB/glPO
 WoPrzFmWVqTY5kRvlgyDPNAcSGNK6n8YA1w62NwT4KmhekxX7O5QInspNmO54CIG0lNM8KLQdqZYxjFeC0W/Csa5oAncmFdRHR81U2w7pJKokEUID9E8h5oY
 90M1haVhfPQuCvDdhJZL7EbPbbyJYrOtkgHyBQ+gjEzrfe+9ykfL3tP9lKkIZgnqIfv5y/jCksGDvA47BjZ7Iw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676491744; bh=4cdXArgw/cJsTNt0K2X5C9zq0cM5emfVGVTrNCJ2K40=;
 h=From:To:Subject:Date:MIME-Version;
 b=jO7zfUMA/VhpmClN8XefphpE859XruU/QAgnUhpV7AFWni5BSYMOlovnB30shSyh1
 HnqMbqiHC8BzOpix5Ib2uHckDxumWIuIHajK5FZqN1QIrL7pS2JaSPSQS7jW5e25VS
 lP+xo5LBmaqs/3J2HOaWL07eWkT+fEY7VCRXm90z/yko4Z+K/UG3LCgOsbZrdKitQ3
 iEcJSf+lr5cnueU2ddve9sQ1PkmJz3qaoou3+CXBVFB36y8a71L7VzeFpSV0xUmHs6
 Q5Tyc01XVPBs8Z4p0lcOHS8fdmdQ/Aww5qCae8S8aQHaTpusc0RLIZjnzoIxs/p0oP
 9tMBx1QiUIunw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jO7zfUMA
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti as
 maintainer for board bananapi-m2-ultra
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ef00ccef3f..7ab2bb5bff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1135,10 +1135,12 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imxrt1050evk/*
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
