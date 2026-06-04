Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23B4CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA90D821E7;
	Fri,  5 Jun 2026 12:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaD8en2kV6CT; Fri,  5 Jun 2026 12:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88CB81F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663228;
	bh=zkWQt6ImRhFprEPoiwsYcXs9NVOvwxv3W/r3bRLHKgM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K9nvY+ofKjrXUGnnP3GzQaEYrsDLSStlC2YVo/kzn5CX6/SsgSp6+rW5CcT4z+l5b
	 gfAYHNt5BHGyUbPOsY86YPRQU/tw5PSKWJtxYQ8vWWfYlYbRFGWQPugiplaDwIyN3D
	 13R6toYCaKOooznhzQeyMFxtJhdqYSXJRZbNmMcCuGdDGRhgxBp/zbuPMJzlEAP/BI
	 9eSuV9NRbvL6O6wDPk/z6RMAjCEmY96DzQd9N9P5JjjOdeGRe3yxWjgbDPGbJqUCG/
	 kuIlXSaJ6YXhXZPDA2gYPsYkzK7onREla0UqmV+a1241ldmIl6fQ+79ux2+K42sl9f
	 c11/sHKDU5Q1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88CB81F1A;
	Fri,  5 Jun 2026 12:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEA0388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C51F410AE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxe0ldqYEvxr for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA7B40FC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA7B40FC9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39645872F5; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:00:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bbca2bf4b0a38a833a38a31f085a252da0189719
X-Git-Newrev: cf2b6482edb84e29d24f53c483521aece0fe5d86
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.39645872F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/icu: drop
 outdated comment about git tags format
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf2b6482edb84e29d24f53c483521aece0fe5d86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit 5bf0db998b ("package/icu: bump version to 78.1") dropped the
dash-to-dot conversion logic as upstream now uses dots in the tags names
(E.G.  release-78.1), but forgot to drop the comment explaining why we were
doing the conversion - So drop the now outdated comment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d22ff1628f4d0ba2ae6f24515e1a87fd3649a18d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ee1ede6f2c..9b97011f55 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# Git tags (and therefore versions on release-monitoring.org) use the
-# XX-Y format, but the tarballs are named XX_Y and the containing
-# directories XX.Y.
 ICU_VERSION = 78.2
 ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
