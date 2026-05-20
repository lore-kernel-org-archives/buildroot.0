Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB2ACD4F54
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6532583B5B;
	Wed, 20 May 2026 12:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5XBDr5xU1KU; Wed, 20 May 2026 12:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C7983B58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278643;
	bh=YRA+AtQs0fIvNt3h/GBeJdKGABIyQekuXGifD3cvNE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xs6+MUUgC6Slk4V6JsNT++DgMYXVBGHG0XAEzjX2nFKLpCRrHUReoD/Ue0ycq4d/k
	 zquPtCtwRizpvPOHmw1XbovC0OIItgUiJAuayVUYBU3wiomrtoHUbkmZK9NNeamgkF
	 FlZwe4Vsk/fa2BwnCqnNfHrY7WXePlx0mIVzspqdZJxj/uMMII0vI6dm8tYG0/W6MG
	 NzTbkE4AA5BHoZ+2QxeLYSzVCLA6QQb4FfKSeLsJhjzyQgy9yx5xW5/Itgew/ktDv1
	 rY1Zw0B0KMswUI6IRwHFooc7oiNjopNirAVmvyeYq0EAdx5e/qzS2QzGp7E8FAgXwt
	 8+kfX0QsxAOxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C7983B58;
	Wed, 20 May 2026 12:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C44CF265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BFC83B52
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFZA_PdzAfxQ for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34D3838FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E34D3838FB
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5669868B0; Wed, 20 May 2026 12:03:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 14:02:52 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9bf4d998d896aeef2cbf984779141e31d4a49a8f
X-Git-Newrev: 71d1dddae12e7cbf322d96864d7757f459801f47
X-Patchwork-Hint: ignore
Message-Id: <20260520120352.C5669868B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Makefile: Update for
 2026.02.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71d1dddae12e7cbf322d96864d7757f459801f47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ac2ff17de4..6c1a4c417e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02.1
+export BR2_VERSION := 2026.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1776805500
+BR2_VERSION_EPOCH = 1779278600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
