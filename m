Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823F2D0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5638D811C6;
	Wed,  7 Jan 2026 22:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD6N7hjVjEuu; Wed,  7 Jan 2026 22:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E34E80CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767824853;
	bh=bwbx/mkjutA4g45SZbJLs9VfXCsxEir+puGurPn7cG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nDJHYi26wceALt1daXxTvU/XggH7+ubzkdgALHA+RbAlmwTwFRrzUmGRF2o0qLI8g
	 EzjQlcQYlGe61OzY+GcIH8PO85qIKcoCTYnVGKjBS8vccJ0NmM8JinkG0QxAZsdjEB
	 u2PP1CPpiTsQ1SFRDiJSd6lk+hmvzcVyw1kbqG4i9ZOvgs1q9lD4BetTS6quRyUfva
	 ZbdTQVmMoL+XYWFn0yYgOrD3TgSFxqrOQbZStVyvjh0Gwyf+jgPD58ca748t+pJkIL
	 gEdY/2tYnjg91bC0NRFuxCxKLEWqFvo8o9jItdxzFZp8/yAIuME72syLxPPb4wtx1A
	 gL8iGBiRoXbQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E34E80CEB;
	Wed,  7 Jan 2026 22:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9049436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC4F40B04
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfuV2IPTTbPV for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E714140AD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E714140AD9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0B3C883B7; Wed,  7 Jan 2026 22:27:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:25:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98e71e54ba3df12b660cd56caa1678e497545dd6
X-Git-Newrev: f44ee72d01eb36438c9a99fc0d1c201a8afa3e09
X-Patchwork-Hint: ignore
Message-Id: <20260107222730.E0B3C883B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.12.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f44ee72d01eb36438c9a99fc0d1c201a8afa3e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/catchorg/Catch2/releases

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 291f9deeb0..1cf29821c9 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  82fa1cb59dc28bab220935923f7469b997b259eb192fb9355db62da03c2a3137  catch2-3.11.0.tar.gz
+sha256  e077079f214afc99fee940d91c14cf1a8c1d378212226bb9f50efff75fe07b23  catch2-3.12.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 6118fd86bd..d3da027d2b 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.11.0
+CATCH2_VERSION = 3.12.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
