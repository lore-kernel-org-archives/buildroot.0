Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56EFC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728AA60FD8
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 728AA60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4DA400C9;
	Thu, 26 Aug 2021 13:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yl8kH-6K-8qU; Thu, 26 Aug 2021 13:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88DAD4022A;
	Thu, 26 Aug 2021 13:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08F81BF391
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C616068A
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRenyTfPU8yD for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 13:18:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DA8A6059E
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 13:18:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A59EC1814BD; Thu, 26 Aug 2021 15:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629983910; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1CTSkbcGRK1yv066ayFwWC3olG5rfCNMYSCOzP84d6w=;
 b=S1tnFfYXX0ylbIt4aj1Bv0UR7oSxakULITJ0vZTnj+mAotkIbWZJcqLNrfWgITHlW5RBCY
 Qjo18KUhOci6BkyuP6pbwA4ftX2RuXaR3JAIZ4/EAo0vyIvhpdnoCczyyRfkoRhjUsFWLR
 2bI1mnWUp7xOxzt9HHr91KyFrkvtu0E=
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 15:18:12 +0200
Message-Id: <20210826131814.18240-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] docs/website: use lore for ml search
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

the nabble.com link is dead and lore has a good search.
So use lore for the search form.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 docs/website/support.html | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 97ca296836..90231f601c 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -59,11 +59,8 @@
 		    list, since there is a good chance someone else has asked the same question
 		    before.</p>
 
-		  <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
-		    <input type="text" name="query">
-		    <input type="hidden" name="macro" value="search_page">
-		    <input type="hidden" name="node" value="2">
-		    <input type="hidden" name="sort" value="date">
+		  <form method="get" action="https://lore.kernel.org/buildroot/">
+		    <input type="text" name="q">
 		    <button type="submit" class="btn btn-default">Submit</button>
 		  </form>
 		</div>
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
