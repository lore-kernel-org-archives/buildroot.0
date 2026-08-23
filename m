Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DC6C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4027580D16;
	Sun, 23 Aug 2026 21:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPVj1Ckq1jUU; Sun, 23 Aug 2026 21:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787518849;
	bh=sR8jY9D1+7AEVdrPXoXH86UJhUSUmytF1RwFihPHau0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gNRuPOYj0BWRIlmW1LRuQXJVH0JUQW7hQZ8PKinIVP/RbEwEQwSTWbnWqCqIuZchE
	 9w5r86eOTY6dhyodiR+gSJAh0q/G7bC7sDS/DfY6o3Z+H/AKgJ1hQ69+To9tFSAbMd
	 SQeRRguCguyhtaOKimBLJ2/cVcAqTl/iF70AWsIsk2aiGMBseaf22ETIubAicR7oWz
	 g4TVKG/GutUy23euv3tJ7g/y9IDkC++opYtWXzauLoq4KJchtc247I+ugaTatcrcxf
	 WfC+aeYOxQTY6v+4n54N/KYAAWpKjeCPYQXBSzHcgvM8WI6nH4anXixM0pSdigo3sD
	 pYBH18Za5N2xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8848280CF0;
	Sun, 23 Aug 2026 21:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 948E22FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B40580CF0
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTguMgQpw9Jw for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E8680B1D
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:00:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E8208EE98; Sun, 23 Aug 2026 20:59:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:59:48 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: a87cdf66c47f10d6f93997946a31276fe4a83cae
X-Git-Newrev: 72d9d4fa636a371ef9eb99c92a735ce9f6d829d5
X-Patchwork-Hint: ignore
Message-Id: <20260823205952.2E8208EE98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] Makefile: Update for
 2026.05.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72d9d4fa636a371ef9eb99c92a735ce9f6d829d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9de07c2740..e3dd63518d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05.1
+export BR2_VERSION := 2026.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1784143900
+BR2_VERSION_EPOCH = 1787518800
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
