Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D5CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC22C6F571;
	Tue, 16 Jun 2026 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anXGugiycOpP; Tue, 16 Jun 2026 21:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0856F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781644351;
	bh=JEqmFMZzJms6BiNvucOk2K6AOHCVajXsid8chsb6/Dc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dQr++WqCHalmBJXExda+UHsUgcbG532rZCj2iLmcz0f8y/M3LOHnVZfqHrvREFxOI
	 LnJTzhD4cxfpyiJOYQFAh+VNK3Qt1VCvbS2z8IpTyznfUT7QQ0mDWsOv7rjS4aIH/5
	 3Mbczh/WBmx/vluJZvM30ntjekZMOadnyOiZr/y//SyrH/gXiirXGz2ziJ6R3lZbVE
	 sS8yWM+Xyspwv/2C2C4wNNmFYGji0hAD65SReR1FqDdmLzJ2NQU4hbWrnCt1pNlcZ5
	 GqHT9DCb5rbRk45XR9yw57U3jNoo1rNsDZ252+0etCgSdi4vbEroA1Q8ZGE84UQNBJ
	 Yxf3x5w5qd0Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0856F576;
	Tue, 16 Jun 2026 21:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE921355
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03AD42E94
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jD4anf-BoVmy for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B7E42E93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B7E42E93
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A11F280F5C; Tue, 16 Jun 2026 21:12:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:10:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 62ef29936b13122a322d38de7c29069ca755582b
X-Git-Newrev: c49ae7216786d3cb62a8e8de5556007b4b539233
X-Patchwork-Hint: ignore
Message-Id: <20260616211206.A11F280F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c49ae7216786d3cb62a8e8de5556007b4b539233
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5d7528af64..94588583f2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.14
+export BR2_VERSION := 2025.02.15
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1779278500
+BR2_VERSION_EPOCH = 1781644300
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
