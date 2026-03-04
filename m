Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A1EEB7EA7
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C10F40706;
	Wed,  4 Mar 2026 08:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIKEh2B-iR2X; Wed,  4 Mar 2026 08:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D512640661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772612522;
	bh=67cxEMWCziahMrwE2gWQ9RDnr2D57RmvXladrd/uh2Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oVdM/cNFMmXo7xYWaFLERzMpEzQmz7WF8XqsQ+U+c4jQSiHpr3hslJ2QwFmpcjy1P
	 zg2O09HOwYs+2AHjpy8pBTjIsiIuoNJP9E7cInp5OA28ZKN5sG1gjZkS6IWDR44deM
	 rXnduCicYkqhTs2tw3lDZ5FoNCFIeiEfZCxv07S/znKeFOolO61jS4tN3k0uV4LLMF
	 mbSgu+5lbekkEaVYm1d5cCwMVgw5FSrtWf8sM/QboIpmWzc4Iw19UbIT4jvZ7QTJZA
	 dVjfk1efNmCSS2Ccx+LWHMr0cpG4qvFD4erfz9RK1YwxoUdq9yNpmDHY+xwi7hHIH3
	 NjFnVDWOw/5WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D512640661;
	Wed,  4 Mar 2026 08:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BFB231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B28C340394
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYcHbu10YRRB for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08DA340296
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08DA340296
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03026860DD; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 09:20:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ee2f5644da5389634b2465f1dc31deb5a4807c
X-Git-Newrev: d374a736d88f37625c5c561d7c6bec9ab1f51ec4
X-Patchwork-Hint: ignore
Message-Id: <20260304082201.03026860DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2026.05 cycle
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d374a736d88f37625c5c561d7c6bec9ab1f51ec4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8e2cb0ae14..f51155b0ed 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02
+export BR2_VERSION := 2026.05-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1772611600
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
