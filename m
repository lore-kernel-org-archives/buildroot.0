Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A53C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C63A6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C63A6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4741D4046C;
	Tue,  3 Aug 2021 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5WfUok5QfLU; Tue,  3 Aug 2021 21:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E8E40001;
	Tue,  3 Aug 2021 21:38:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 320221BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B505C4053D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HWYGIi664TC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 179AD40535
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6287D85F62; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 2 Jun 2021 19:32:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94a3b3f062db63ed92ae38f97c49b6de2fb59c0d
X-Git-Newrev: 7cf8adc03999a39a9b80a4612b5f14baae73ce5c
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.6287D85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netperf: move SITE so
 s.b.o
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7cf8adc03999a39a9b80a4612b5f14baae73ce5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The original site is gone.

Fixes:
http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netperf/netperf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 8b2280830f..85f6bce033 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETPERF_VERSION = 2.7.0
-NETPERF_SITE = ftp://ftp.netperf.org/netperf
+NETPERF_SITE = http://sources.buildroot.org/netperf
 NETPERF_SOURCE = netperf-$(NETPERF_VERSION).tar.bz2
 # gcc 5+ defaults to gnu99 which breaks netperf
 NETPERF_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
