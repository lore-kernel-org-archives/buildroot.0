Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30537C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A905B408F7;
	Fri, 10 Jul 2026 13:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anekX88VTDL3; Fri, 10 Jul 2026 13:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988F64096E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690985;
	bh=ZlGcL7jGqxpoqqn3RTLzc7dVuocnduGtUGsRO/rMUMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pab02u9r7f+oNSLx9ulAIDg/X/dgjldKDUjhPM4gE3TLzdz1cIhCc+iO4+2XTcAM2
	 63UM9+aHk46Pw6hREEBCMUcwpnmM4zwKapVher8rIM27NYqMleXuKH5Wy1K6qqAwqz
	 DTlp2PBK3N2Y0lKCr/mJSLMU1C4XoOYBUYq2AIK3qZNDGK51zoGlEek1azZkey3HfW
	 F9U8yzKADrq0EDiEOh9DufZ4pCY7WmqHnT/trd2Npy1U+AzE3X9CsbMLJgIgUIO8VP
	 OMORX/X6pr6CLHuALHf1T0NibQyJ8Ap52WUwBtvVhY2hcqDHFmFT20n7UL8XjCpFoN
	 2B4OSBMlJMUfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988F64096E;
	Fri, 10 Jul 2026 13:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3657F2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CDDE810BC
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQHtYlNEiKH2 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B2C810B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B2C810B8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B26F88675; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:51:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03b12ace154cfd58aa1be0670ad527de718352d0
X-Git-Newrev: 8e173aa06955e7352d26afbf4b118c6ca52d070b
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.4B26F88675@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e173aa06955e7352d26afbf4b118c6ca52d070b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.11/ReleaseNotes

Fixes TROVE-2026-025 & TROVE-2026-026.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 48dd3eedc4da52a2c1740c8d25772c06ab3010d6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
