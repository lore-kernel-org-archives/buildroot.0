Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6FECD6D6
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B49384045;
	Wed, 11 Feb 2026 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxqAebX9Ggej; Wed, 11 Feb 2026 20:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3446983F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770842264;
	bh=Xlpy5eyX6yoS3VjMgxrTmGBW/e4mwaQ4Uc9CZam/U/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qopUxqSvFe7su+vyE81EW07s8X3h8NBcFn6GQRZKKR/+Hj1xXVx0vYmw/5nLhpDSI
	 UPDqkycJTEpiG9Y8CVMUCLkHEekrHcEGhkZVkex6XgBIOZWxPiTAKmtlZ6Sm4w330v
	 DiQ5GA3gjWC+kkXrrqCvjOOuVoVX1440suWmv3AagDgMO2GRJ/7XCU6wt45cniYGOs
	 91Amr0KJudnAPolF5WSanEMNQ/rwKIzZ5OubqBKrLrjXutPdcm4yAAzsl0mCTNBydr
	 NpVxN71kdmFAlUvH7ol+bY0Px6rckAnXrzM5A5rTl4Ry+wY7ADASriNs1JiYmDQY7I
	 sq3II39DuZUhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3446983F7A;
	Wed, 11 Feb 2026 20:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D2C23D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A44640068
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EY91brQIHCeA for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4371040057
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4371040057
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:37:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24B5786BFE; Wed, 11 Feb 2026 20:37:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 21:35:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c637c3dda4a9b8fc1200b32181162dc48a940b1a
X-Git-Newrev: fc9a75807967e684c87cbcafead045ba0b62cc94
X-Patchwork-Hint: ignore
Message-Id: <20260211203742.24B5786BFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: bump version to 6.52
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc9a75807967e684c87cbcafead045ba0b62cc94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.42...v6.52

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index e2196b5b77..f5351e4f9c 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40c10b522c34bcb95bda9844a5a2a06173fea9a5d948882d70740cbe1fe7a8b4  ustreamer-6.42.tar.gz
+sha256  db00adfa02acfbdf6682ffae8e418b582d623e1971672d5df19858e02e2f3b0e  ustreamer-6.52.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index bf87dc8abd..b699b30c84 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.42
+USTREAMER_VERSION = 6.52
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
