Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE953D2629C
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C63E60A39;
	Tue, 20 Jan 2026 19:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XDlSyLmVZVW; Tue, 20 Jan 2026 19:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D9160906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768938711;
	bh=U8rSanNzwoboO4UQCwVs20/606sB2Xq+y42+V2Huy68=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kXuKH65PtkOfMyuTDcqEG2b/OWGUGh/r6zu9kB2a5TA7JuTdPiklVkG3uS5P2zNVk
	 B/l3fO/6/MpPTdX35vF7kbBQL311uhjYKhom782gikfZJpD3M6MaBszwB/A0TKxVwn
	 KiFqgEbVJogazt3f08mUTpuyDImVGB34Dbsdz/7XI5ROsa8aAgB22fFrhIGLM0e+FI
	 +1MXj4SUBf+DKPHxQ7fUCMGUTmYQN40cbLTtjimOYr3JGVxwVJjg2LxjBmfottUfCp
	 bWXPoPFaeDFVy5F3fQcghOpj+znGbMhR3Cp0P2JYH/m2JyWy7Z0Bff9WIeKjFBGA/N
	 QUQYUQM7kbESQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D9160906;
	Tue, 20 Jan 2026 19:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 885B2122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82FE1400A8
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW_ClI-fm2hU for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 19:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D35104051C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35104051C
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C407A886CB; Tue, 20 Jan 2026 19:51:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 20:51:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e272875fa7747f0e38a781d0583f4fc61ba2e755
X-Git-Newrev: 1bf78b41855b907afd86327b1b96268c80ec3b44
X-Patchwork-Hint: ignore
Message-Id: <20260120195148.C407A886CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] Makefile: update for
 2025.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bf78b41855b907afd86327b1b96268c80ec3b44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4145574db0..600dfd58ca 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11
+export BR2_VERSION := 2025.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1765493000
+BR2_VERSION_EPOCH = 1768938600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
