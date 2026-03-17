Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0398FEDA1B
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59373414B2;
	Tue, 17 Mar 2026 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeqajDKkJWbr; Tue, 17 Mar 2026 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D67414CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773776944;
	bh=x49yvZDKVI7bmdRfkipllg6CZPFCDgJFNtWieB7Dwec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FV7Ew3XE5ces1s8Ydq7vW5e7j/jcU1NEgClGuZHZy8eL4pfzDYLrt7HtWAp25Dk/T
	 1eFYdxMUoAFIVJBwvnr9OEaVo4lxWcuSKdRBO8C0nuUHTrWxzQvawSbQ3F3x5/xEF9
	 OMQMwUn04FRuu1lCf+fDpLMQFEprJ5Jku1hbB39jskBoTUirlOMTAbD29C+GzJd+ig
	 pjVBcdREBxijtrQXaBW0Yedfeu26i9ZxHCU3CTYsGrV/F995OOSjARiuBH4d6ST1dS
	 Q8Al6NoUfmiADD9iuqiB+eEnLONHVYJok8sncqU4eHaq9uVtBV37gV3IGUiko4fM1J
	 ciT+U72bxunaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D67414CA;
	Tue, 17 Mar 2026 19:49:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB271B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1FE40105
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HNkzLeqpYnB for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 19:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C1D2400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C1D2400C7
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 19:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32D3187581; Tue, 17 Mar 2026 19:49:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 20:48:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8e3c43d9cc44d3a8197574d83d199843aa3d2076
X-Git-Newrev: 137a566bf5353831d97c068a4c22e6df5b4d07a0
X-Patchwork-Hint: ignore
Message-Id: <20260317194901.32D3187581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: update for
 2025.02.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/137a566bf5353831d97c068a4c22e6df5b4d07a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 639997d7d1..b92d5ade10 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.11
+export BR2_VERSION := 2025.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1771574400
+BR2_VERSION_EPOCH = 1773776700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
