Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F2ECD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56AF9617BA;
	Tue, 16 Jun 2026 21:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_csr5C-tVqH; Tue, 16 Jun 2026 21:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B7E60AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781643711;
	bh=3oay4usNKC0O2n9qlb2fRZDu0/evj6CbkdP+ZkdnS2E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IcTGwpuhGrTknnXvWF7sAfs73/mo/tUmI6j4967JPV2UZgZJQNHSeYljHGJQlHab6
	 YuOsRvfoyWL7tCnb124VLhIypa2bpRF+I8NMPwDMoxZa2Gq1VHTH6V5nGg3+FRULuu
	 OCDWQ8K0EspDFfz0g3s6prwc6/3w6cbUY5iP85639SeQX8BtoIkjjLTKFPaYEOWuy9
	 GDSAeQfWV11r5p76iF+EtTGGGM64yHIZsPBFBM55T7ZFCCI6MkvxqeJcWBb7JPpz53
	 mDm2sLIvOFJxMyqjOwknmCIlDWlGthzbsfsIhN717avBKqoGOTKPraz3ISdZ8FCrbB
	 ihZ/9zLHE7Rnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B7E60AD6;
	Tue, 16 Jun 2026 21:01:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C01355
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012A4404CE
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbEJdD9ShD8X for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4586640493
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4586640493
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E961380F4C; Tue, 16 Jun 2026 21:01:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:00:17 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: dad077f48d19c7dbcee062dcfc273fc875da1bff
X-Git-Newrev: 679b9ead7620bbf193620d1ebf56f53c1764d37a
X-Patchwork-Hint: ignore
Message-Id: <20260616210127.E961380F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Makefile: Update for
 2026.02.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/679b9ead7620bbf193620d1ebf56f53c1764d37a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5a44df1fda..a1aeb9814d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02.2
+export BR2_VERSION := 2026.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1779278600
+BR2_VERSION_EPOCH = 1781643700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
