Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075F3C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BFB40FA7;
	Wed,  1 Jul 2026 19:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1XzCNOSMsqB; Wed,  1 Jul 2026 19:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352FC41263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935985;
	bh=SQrSfNDiP88ACdPiGnS56RmPSIYLZbCHZB7/yaNG294=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X3rxdUEjbES3G4HCxgS0sq522rzhyblKOgmob6ifEjEKIu+OkGHbQOoPMB9Zxl+O6
	 WMcaa3yRSlPn+aWpyJZbtQqcHDxYrLJng/+DmC3Drk+/RhVNneoAHNszdrWUJ9BHl5
	 El9+rrpQyRgUnUksuqrmc3oMiTEcb1wxG09Y0YJJe52lEQhJv50xwSwoVkammxA9x5
	 QZO2vOVjx5ANtMZ/hmtLKamLmWAY6ZcNyNbFmVZ0kcULd9fD2/o8op3kYYoyQi3lRK
	 EwlXTXvLt0uh8YwVyjbL9WJAYBnk5L1lHMVeaffIoLUVdW61N6C2GgI1FrMuNKQlyX
	 r+m42MUMzeYWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352FC41263;
	Wed,  1 Jul 2026 19:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 240A1316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A37440061
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0sM47zewUxS for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DCBC4005B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DCBC4005B
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2A3F87A6C; Wed,  1 Jul 2026 19:59:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 21:58:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bb532a100139d3189ed180945e165e3a941efb8
X-Git-Newrev: 48dd3eedc4da52a2c1740c8d25772c06ab3010d6
X-Patchwork-Hint: ignore
Message-Id: <20260701195911.A2A3F87A6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48dd3eedc4da52a2c1740c8d25772c06ab3010d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.11/ReleaseNotes

Fixes TROVE-2026-025 & TROVE-2026-026.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a6771b1fa1..b888270f14 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
-sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.11.tar.gz.sha256sum
+sha256  2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed  tor-0.4.9.11.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index ca5a4d026c..3e63fbacac 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.9
+TOR_VERSION = 0.4.9.11
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
