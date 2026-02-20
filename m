Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B3C54FD0
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A614B401A0;
	Fri, 20 Feb 2026 08:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5Am0ebF7KTq; Fri, 20 Feb 2026 08:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6500640177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771575042;
	bh=w4DQxSei+shhsRtAJe6xixmtK64yft3tWit9GmBtrD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z5w9AR3HvW1sw0uoAViuDxiD5zDTM9itW+fgnptmzZlg8NrhH5CjqWtOj2KQESed0
	 51g0K2WxVhp8TaZIrX8Z6bfaEUx6PTgWVUvK3vV9LK63j/EaE2pwolJLQ8lKEMDRkC
	 g9rE/bbCKyKxrljo2m9ttaT5c4Yfp65KedwCdkip9gFLyuaiC2j5fw79ldgBLnfa+f
	 Iw0tq0TPs+T7qJMMmRxZDK7n9nhwp39/tX5hO2xU4tRtO9iz3Pe6D/C+mo+0qdpRuh
	 R9RhQIYRUthD42dFj8f6SdrRtvZBVniK2V7QGjV7vXFvM31ehTKt3RYtU7Y1V2cyhE
	 EdWcR5exnOtkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6500640177;
	Fri, 20 Feb 2026 08:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C57CB183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAFF04137D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMfFoPBV-0h6 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 08:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D125A4136F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D125A4136F
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC0D187148; Fri, 20 Feb 2026 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 09:08:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 25dfd17a11c07ec1abfe17112b5b68ae60846ad2
X-Git-Newrev: ff3b00e7d01894963ce05f8cc9077ac0d61d4ad9
X-Patchwork-Hint: ignore
Message-Id: <20260220081039.CC0D187148@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: update for
 2025.02.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ff3b00e7d01894963ce05f8cc9077ac0d61d4ad9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 74ca67787d..639997d7d1 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.10
+export BR2_VERSION := 2025.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1768937900
+BR2_VERSION_EPOCH = 1771574400
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
