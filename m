Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00266F94CB0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA4842150;
	Tue, 21 Apr 2026 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4gv_cqvbKYo; Tue, 21 Apr 2026 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB97405BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776805224;
	bh=FgiFm2XkTKav/2b9/+g4dX0qgQMwT9rNeiMjWNJ3HEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dqgF2DSJTQC1f3dqLopXGa2wbOzQj5iDSi5KmVN5UkIf8+9QuBt1pHHT6h/jFpnVv
	 8vV56UlBoiuALsAMEsubk8GFskZG2RxIbT2J4OuaTdkUZ5b4VSAXRjwg4Z2iuNL/eD
	 vMpnAN8laUxzFcJ991ikqm0boQp/WK+sqXMmGF1Ui90LYm7i1pyKPbqNfa1HbrUmWp
	 HloiHTRx3dvhBd5GNyPAgVMENate/LNrLGXecX4GmNu9WJC+Bo3Z0/biLpY8mrpV3T
	 nv36posPpaNTykHWKYjACQLC+Cut1W8zo9xYdgQ4S8gQQnMJBfXNo9yEv53KUd0m13
	 Au6cg8Rb35dZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB97405BF;
	Tue, 21 Apr 2026 21:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D00183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC25D4040A
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHs37SNrbZ-w for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E48D403AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E48D403AA
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82F6821F9; Tue, 21 Apr 2026 21:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 22:58:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 79aa477a56a46b080f797ddfc5bb56d1a184bc6f
X-Git-Newrev: cb24a5a52303abfcb050a160934d25d9042480d8
X-Patchwork-Hint: ignore
Message-Id: <20260421210022.A82F6821F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb24a5a52303abfcb050a160934d25d9042480d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e2cb6a687b..eecfec95d5 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.12
+export BR2_VERSION := 2025.02.13
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1773776700
+BR2_VERSION_EPOCH = 1776805100
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
