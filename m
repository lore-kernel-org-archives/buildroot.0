Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9750EFEC11D
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 22:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585C1830C5;
	Tue, 24 Mar 2026 22:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ndy7Q_vjnDlf; Tue, 24 Mar 2026 22:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A39B682768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774392017;
	bh=N1QnO///xsnV0r7KaWobyjDw+2ZarZGWdFTBDbGkxQo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NmH9o3Qp0D8ATyth8B0qw6pNqzpiDiJU+dqFFN84InkRMO+yU0G7GDt1IPOvs96sN
	 64orc7pemPVzJAJq9rY6ZG691NU90lGytBi3VJfi2jG2SA0Ql52hg+1nVPYK2B+85t
	 Qh46UObztHqgtc6vjdDelcco990N9PawTDsM6W9AKm6qfWfqTrOXg3r2HnopJ50/RM
	 1n9hnzsnATTWDUiwIAOWryTDfChngx3GXizIvcSUDQ2G1a6SVcYymEAaqbRmTwpNy0
	 9sKunWrPCdeX3tyfqksPViagYHFI9TWVjmtZlEziuUwl0xEYgZFJrW/U/UjAUreqE3
	 /+REuusae7iLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39B682768;
	Tue, 24 Mar 2026 22:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2701D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3CFF40A24
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBbA4xpK1Ujw for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 22:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FDF240A25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FDF240A25
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E7E84BCB; Tue, 24 Mar 2026 21:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e656b8b6394231e26d18cd9567d25893ffe2868b
X-Git-Newrev: e28b94d00820474588c286e09e44e7e706135341
X-Patchwork-Hint: ignore
Message-Id: <20260324212247.46E7E84BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: add pre-filled content to
 mailto
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e28b94d00820474588c286e09e44e7e706135341
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Clicking on the mailto tag will prefill the email with the following
content:

> Thanks for showing interest in the Buildroot LTS Sponsorship. We would
> appreciate if you could introduce yourself and your company by
> answering the following questions: in which products do you use
> Buildroot ? How are you using Buildroot ? How many different
> configurations do you have ? How long do you support your products ?

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/lts.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 988415482c..fd684ab3a9 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -338,14 +338,14 @@
         </div>
     </div>
 
-    <div id="sponsor" class="br-lts-section-header">
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?" id="sponsor" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsor now !</div>
         <div class="br-lts-decoration-dot"></div>
-    </div>
+    </a>
     <p>
     Interested ? Contact us at
-    <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
