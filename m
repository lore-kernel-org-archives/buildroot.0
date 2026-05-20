Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F1CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF88283B6B;
	Wed, 20 May 2026 12:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWyJVbi1XSlo; Wed, 20 May 2026 12:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A2483B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278525;
	bh=L3CNpqsTYuT7RqVp54zSbd+mfyYKK3eAj4ctc8rWSas=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nphmOul7h7l6qnbxBrGFsozGh09my8Qe9VFJoS5ILDoau4V9AdyxtHiju6q0IAiI8
	 2oun+M0RmAhuipYWE4pfWK397XGSeZ0fYDl/BYj+GJa9O3FFEbgKbAyY/+DVw8mQmx
	 Y+LInnTidHoVKH9xTwZl3mAI4snyE1IggiogN3fcG/ZOeCyHPWO3/zvgqzfVHUaeF6
	 00+8Et5Ktt+TbWAijQxDrh6freIxtQbFOqitbMcvM3gCSqTesYZJlsK6nAVifahmbY
	 bKicFwx17xfYVkJbTanylq0xRHKCKVSwJY1vWx+vki/6siiKEMIm6jCtCBUCKUNgub
	 HMdVw6BemS6Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A2483B56;
	Wed, 20 May 2026 12:02:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA47282
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9285861056
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz9cBr4uUGah for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F5761054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F5761054
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFFAC868AB; Wed, 20 May 2026 12:01:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 14:00:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 92f968895230a54f4408fe852a9f8efa207ef109
X-Git-Newrev: 898251ee2b83a9cd5ae0ae5db57828035a5a6f85
X-Patchwork-Hint: ignore
Message-Id: <20260520120154.CFFAC868AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/898251ee2b83a9cd5ae0ae5db57828035a5a6f85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index eecfec95d5..fd4f9c85df 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.13
+export BR2_VERSION := 2025.02.14
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1776805100
+BR2_VERSION_EPOCH = 1779278500
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
