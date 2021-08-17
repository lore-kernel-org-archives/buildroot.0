Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D024C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D61F600D4
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D61F600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4D9402CE;
	Tue, 17 Aug 2021 21:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUk18VzIeZUg; Tue, 17 Aug 2021 21:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E84240304;
	Tue, 17 Aug 2021 21:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1CD71BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A146E40404
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbiUWVKGhOP0 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:31:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681BE402CE
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:31:15 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G6fxm5yQlxC2nG6fxm1JGz; Tue, 17 Aug 2021 23:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629235874; bh=+T3Bo3MgZhCyPxaoF8N1GafMAMrzHw91cUy3QbJZB8s=;
 h=From:To:Subject:Date:MIME-Version;
 b=FHza5T6nTO8obKly7Ayu7oydzn+qZMFIXk5eNCbT8Z40O4Om/4VcqvGitu9hMZR7o
 UBiUpuFeZQ97nAMogfwts4X5MjTWgf+xwSeEPc5echNHz2zu+7m9DP0/o4DSNqaVs5
 /E8pPD1e23bKINk9JUrdwRng9PudbTBVKytddMxIEUkKma/e5KJU2/m9G1aOWyuWG9
 id6Jkpv4BGtU31hmg7bEbMtc1qVrcH/EAe0IRGrFk4aVuqPy6FtuDdpKlMwpkE6Kg3
 ctSNEbKCIOfLPQ53lwBLjuSCgsIzHj/+FydthbG7m3rEdsel4RRq2KUgGB1TgQoKyj
 Ja9QGPgkFZXmw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:31:10 +0200
Message-Id: <20210817213112.302830-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKVz6bi1KLZKM362IJrU24X7T+7vL45RE6yPTOyOcYvfDOIej/ZzasbIGMLvM5XMm3tgFlBEMPxGZUEB90jM5UFp26qRqiHDsl2Hel+/jTm5Hq5voDzZ
 4s8ydlbE3jAWU9iP5AxZY4biKSZ3fC4G9yrokEvXA/5MzI/w7Czk8Vje5bD7xB18Zz0D+xZIq/tnLVIJJJJYk+wd7GOAZDJvqXJD5pKzz3HPpN5uPieGHYV2
 XtPSLG6NdTXuz81UpSI4FQBhXeA8lR9zBxDabZSOljYOAhqAPNEZ+cz1B28TRfOtS5aLZ0UhygqvEf0f92dBYJcM1/Qwu0JawxsU2vFE82G52vmIiRwoYjzb
 hKKdEFJxHta6Cv08qUT/W1UEdIDFEQ==
Subject: [Buildroot] [PATCH 0/2] Introduce and work-around bug 101952 on
 bullet
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset introduce gcc bug 101952 and reference to it in bullet to
work it around by disabling optimization(-O0).

NOTE: this patchset must be applied *after* this patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=258074

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_101952
  package/bullet: fix build failure due to gcc bug 101952

 package/bullet/bullet.mk | 2 +-
 toolchain/Config.in      | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
