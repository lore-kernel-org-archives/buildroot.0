Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B187D26296
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3743608EA;
	Tue, 20 Jan 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLOY6hIrJ_5X; Tue, 20 Jan 2026 19:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55602608E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768938081;
	bh=msYrh9I839kYX8DXnvW6c1403qCP26J9vhb2GLzXUt8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PcqyFtYdpQt3DNq98FUrGSDeTwwdZcOToi/bxflMSo+Uqc4hObW3Wgmn7RI5c2EoX
	 0ZvBXVJw+EoxMfld11yLbaeqAyDxb4lfJHKRpi/hCYgkU+satD5ppI+EbK8TsKJvUC
	 TCQAuY9ld+m+9dJu6WNTkGUjrMFRdX+yKwHkDoVujfPted0Ksde6NGXtyNdhNV9+e+
	 tZ8vNSpLXcyIvds/St/yc1glzoATx40W/iFh05mQFGi9EIRHEI+iirBj5XGvInQ4BX
	 CacImZqTiU8zDo/1Syq5P5IDovZrLVYpfWJE7t7mRPV+Kk8QUBsPR1rL2tvKCR0nUL
	 UrOKKKM/Ksyow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55602608E4;
	Tue, 20 Jan 2026 19:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BD1122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D541C818A1
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UE45v2w4QoPG for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 19:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E762E81401
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E762E81401
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D323C88550; Tue, 20 Jan 2026 19:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 20:37:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 900c8524d5a7dabbb7d762edc369713207bfa92f
X-Git-Newrev: e644eca5aca05b375ec078a7bcff3112d21806b7
X-Patchwork-Hint: ignore
Message-Id: <20260120194118.D323C88550@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: update for
 2025.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=e644eca5aca05b375ec078a7bcff3112d21806b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 872f1a3900..486bf3fadc 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.9
+export BR2_VERSION := 2025.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1765441500
+BR2_VERSION_EPOCH = 1768937900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
