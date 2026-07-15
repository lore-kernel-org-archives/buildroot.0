Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411B3C44507
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB0460707;
	Wed, 15 Jul 2026 19:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PscmTKf6Hlvt; Wed, 15 Jul 2026 19:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696E66070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784143972;
	bh=+OwfY8+TO1nwC2ZEqv6aJaYWXpZS/dIsvTZdQtapEf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f6nXwATaYXtKtnsnEUVr3KIugU8LYUXiS9OPWkXGGzcjr9cIL34YCaltFrLnFF5t6
	 jii+bzIIMxNESc3oFJJX0ZN1WmKnNn3kmRsiTKNV/4GgYQPvxWcatgj4TKUXXmm3AN
	 RfMfHgRSyL+NquxDYFpreUVns0vsenEpIKr9tWhOoQbVCpJafjTGT2VOuMag+GHagh
	 FnH0djQZPOPFlNVF+Ng670Re6/FCTbh7py7qAlheUzTodbB1KyPw95zZ7oj2Pplx98
	 lx/ZJSCPnxmSti0kPGa1Zz3ZfyO0vVcx+smsyQlA5ibJ2UbSCmgscqQp2hUN8gNABj
	 x+hqDG20oEkrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 696E66070C;
	Wed, 15 Jul 2026 19:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E357203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F97240659
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGiqnRer9xc7 for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98FC940612
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98FC940612
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:32:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F4BC8867B; Wed, 15 Jul 2026 19:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:31:30 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e70f8f2ae17edca118f04d2e16e56b41695a50d2
X-Git-Newrev: cb857ba4c87a93e5265a9e4a3f32071abf39e14a
X-Patchwork-Hint: ignore
Message-Id: <20260715193215.3F4BC8867B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] Makefile: Update for
 2026.05.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb857ba4c87a93e5265a9e4a3f32071abf39e14a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 93afd97507..9de07c2740 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05
+export BR2_VERSION := 2026.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1780950000
+BR2_VERSION_EPOCH = 1784143900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
