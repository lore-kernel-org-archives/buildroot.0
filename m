Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4797DC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B6B60560
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2B6B60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EAF80D68;
	Wed, 18 Aug 2021 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuDbCalEzruz; Wed, 18 Aug 2021 21:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09B880D88;
	Wed, 18 Aug 2021 21:06:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8101B1BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ED9380D68
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wR9CM9z8n_n3 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:06:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42FC980D26
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:06:38 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GSlgm2wX9Zx06GSlgmh9uU; Wed, 18 Aug 2021 23:06:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629320797; bh=tSRT46vwXhHgJwoVwCiWWpllzO0spiPvuBYf9+Rqzo8=;
 h=From:To:Subject:Date:MIME-Version;
 b=g469H93y7pQuepHCo4/3Yf3ul3zne6ZD/N6XdFqUXNc+BsOfMjYW0Gt0Fg5cgJ5sQ
 AA56ljCyXoRrfQlBMOKgNCeN6X0l6KtZuAumGekWvIBwOKkDeGThQmovyBiiyZYG4+
 V2H00s2oy6seleR1mn9M2UFEt+sZNKqGi+G1lNKeP65WtrQVBn0Y4X7iH5I88j2a2c
 wBP9q5haouP8DQ1d5QtVDa+8GbcqaM3pb0mB3NiWre5prBIlTHNskKCz8Ir5MjxlCL
 M/bQ7tvQZ8EO1MfMvBKb9BTKV7xU1thy7pFx5cuVzt95eJfUzo5r1bMGyAHgFBoRpM
 nciaAg+fc0D5A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 23:06:35 +0200
Message-Id: <20210818210635.352231-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPvsXJZoJaQepdXEDY2eGGC74WpKkquyyaY7m1VPu2Vxmufoxx13xLWYj317wLUM3LmYq66fXFYKifMjZtae/AlfpAIA/HQuHRK5Hx/6gxX1E/UKSBNZ
 FOPn+PjXgjQIGTj45StoC9cBnJL61RsbPRDjjQGtfjiQLKZsy+OppuAdv+vkGyrtpmQbTwCzMC2+j73zr9A46cPuS/tnXWA4C+YMWSbLpFQutKbsrRYMf9nW
 +oLk30J+CRwSKhBZIf4qig==
Subject: [Buildroot] [PATCH v2] DEVELOPERS: add myself to toolchain topic
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since I've dealt and deal with toolchain bugs and their work-around very
often add myself to toolchain topic(toolchain/).

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* correct alphabet order
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af97de02de..874d47352c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1060,6 +1060,7 @@ F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/udisks/
+F:	toolchain/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
