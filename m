Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2B5D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 12:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE68180FA4;
	Mon, 29 Dec 2025 12:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z2QpqsQayoi; Mon, 29 Dec 2025 12:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F9280FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767010577;
	bh=idVplPLyQ7T5xLsTjzQdP/I3gzbl30VYohRg6eLokEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mLRQMBdiKXHGV2+uxdtegZ863USLS7ht3f2BBomHMz9fK4d4NND0zOPSQmTQurd2G
	 Zd4wYNrJQvjtuRg7p7QfklXOfhwusucXhWNalmWYbJvanrS6Q28xTW3XUlIRsm0ncR
	 TzPaJ0iLAsb/z0NgNVPqehMNiduLepEm8mkTwPuQXcZt2mSxSOw32kVe90AEpx859o
	 DGrCDvXz6wJQnGPEG6mztASwxZr/QwwgqPhGNtViZd8Lu4j33g++Lm7LRke/AF5DCV
	 AEJ409sT4LXuhTaBO4cfWcHSOwRysCkURoKy1+BhiWywH3LyG/bt2ZlgAWGTT3im+g
	 Q3vfMAr3cZ40Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F9280FB0;
	Mon, 29 Dec 2025 12:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A477D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E584E40422
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APFM97dFfDhb for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 12:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3012940421
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3012940421
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27E3C87A88; Mon, 29 Dec 2025 12:16:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 13:13:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e1d51533cc0c28d5fd86edd90adce250ade5b18
X-Git-Newrev: dc9fc60ca12bad99183663f266c278540057f15e
X-Patchwork-Hint: ignore
Message-Id: <20251229121615.27E3C87A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: bump to version 2.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc9fc60ca12bad99183663f266c278540057f15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 2541e845a9..9f0fb868f4 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  eb7e8d9285d3848c2bc108b41fed4c49ea47df6b0018362319d2736a6f5821e1  pocketpy-2.1.5.tar.gz
+sha256  b0e4ee0ffcc6111f67a405c6418f5539caa0ab0368adb2027af23fbf17de88a6  pocketpy-2.1.6.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index b171840890..06aa0faca0 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.5
+POCKETPY_VERSION = 2.1.6
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
