Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5136FC54FD4
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AAF740159;
	Fri, 20 Feb 2026 08:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYPJPZAll-pf; Fri, 20 Feb 2026 08:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D0441845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771575045;
	bh=qa7deKFBabF2vE88e3AOiP5p7Srv2771UOqqZLfLKmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bdGi2HChdsK5NRvCSwc7AnBJ4T97Wnz1PRqh9FcDaYx66K1czouhf4VmutQbkoVaG
	 kh0ifRP/57qbmbf7PPzNbRMXe+Nk7ESp6oB+k/ANkg4AgiitPgJLzPVp5NAIUUZv8n
	 G+K5/dhqAD2ZZtyug8HSbW3fbxjArIyEjZ1M8V8ioSC7RXunA85L49UKFu14FzRuCU
	 Lbj8rjUbreeEwZGU+Q0JyUVCOuoly0Q0DeBYt7WvmkgRO2CgwYVG4m9l0Xqxlbt3Wz
	 0pQqS7Xxj7mRK2lBvijimhng6cTf6FamVfu8Pq6QrZuT+aV7KlDLKAnjRflRFOPm4H
	 MyVLQW1YtoSPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D0441845;
	Fri, 20 Feb 2026 08:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C450206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A26682390
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esLN_lRPtjK9 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 08:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B5AD83BF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B5AD83BF9
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C21387155; Fri, 20 Feb 2026 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 09:03:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c1143cd06cd3409d697121971a946b12d7ef5fdb
X-Git-Newrev: a739fb7a0f34a83901cc90594a0050ad90a38893
X-Patchwork-Hint: ignore
Message-Id: <20260220081040.8C21387155@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] Makefile: update for
 2025.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a739fb7a0f34a83901cc90594a0050ad90a38893
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8e36265fce..5769cf5e0e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11.1
+export BR2_VERSION := 2025.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1768938600
+BR2_VERSION_EPOCH = 1771574700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
