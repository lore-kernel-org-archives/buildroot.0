Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5EF94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A744341293;
	Tue, 21 Apr 2026 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vil29Zs0fMdD; Tue, 21 Apr 2026 21:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B988342150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776805560;
	bh=7THf38pHEpqEMOblvHj8WW5gxkm3FE9eaPuSau2Eyc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iTTXID6gmriIlSLfIS+CFg6lKOxqeJMl1JN7EqorAGa0Qrt3+f3NQ5TH5oF2SdQaH
	 +uBo1Et88AwT5qUER/UCi5cpSlulp8NV+R8TsSy3BPhlIfOhgZ/GDiKzds2gUIltWa
	 9z3KZKyYitWZHx6Tei529kPQ5Ub162NxSoSsiMSlzPkVFQyoE7to18oPrzzhEg9tQm
	 ph9+H7XRlVdbJmi/SrmwRzOWV5/bbUlhW3guKDJwPu+w+7kP74GY+PbQtRG7WvEhEv
	 dGA+pX5CQvFFXmyq1nY3Ptxc+l5GJklY3ChNtmYseOqQ6CnL9Ibp3A9oZOulnJcmjk
	 l8CyqOVDMIa1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B988342150;
	Tue, 21 Apr 2026 21:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE176257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B039A41293
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPfCJojuprOW for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CD341243
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3CD341243
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83258821FA; Tue, 21 Apr 2026 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 23:03:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b1cb4bc5091c0c35b758abd57499404f2b47957a
X-Git-Newrev: 0141ca3fa5302c0c3c583cb898bd3f8792bced69
X-Patchwork-Hint: ignore
Message-Id: <20260421210558.83258821FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Makefile: Update for
 2026.02.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0141ca3fa5302c0c3c583cb898bd3f8792bced69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 176c0391bf..ac2ff17de4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02
+export BR2_VERSION := 2026.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1772611600
+BR2_VERSION_EPOCH = 1776805500
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
