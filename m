Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990FECCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C7D240D5B;
	Mon, 19 Jan 2026 10:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4Ayhd-1EuZb; Mon, 19 Jan 2026 10:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8185540D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816859;
	bh=VApL2zPtzbW+X6zMGlUshaAJ1SRDki5bxY4bDS2Ct8U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fIfbmNWB2ROAa2foW2x9xCDtTpCc41sTLkOnSJzHP2491eB5dkHiQcZm5q/tmg4dP
	 A978oz2TS46NxADB0dvUID+xe0F2CZOZ7vR6Ml0tSfhiyuEfOIeaTVHkKGrsIbUZom
	 ZobtVk7MeW40BiJDYudzxo7YnS4zJQKpXnz0hVKZFYdXuoFm/TJXZO9d33+It2MMaN
	 1z7JFQ3cZN0wyOgH0MSwQ1U5LptyQv9Iw3vkpT9Lc9CWBrETVmOO+V/pJcAoSQmT9f
	 vIJOl0Cdi7xr8s29LsZmmnEPv8nPzVTB67/A4EtSBTaLeI19NhKg9OZU1IZIRs53Ck
	 TjXe7YzztS/VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8185540D5C;
	Mon, 19 Jan 2026 10:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EBBB160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2AE440CF8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR8yKZTZH1Kk for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A53740D01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A53740D01
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29523885CF; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:35:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 143770fbdc426ff6eed1e09b0570789d6295ef93
X-Git-Newrev: e850c121ef33b9a49f877d3583ee38c9c7e80bc1
X-Patchwork-Hint: ignore
Message-Id: <20260119100041.29523885CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libarchive: bump
 version to 3.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e850c121ef33b9a49f877d3583ee38c9c7e80bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes a bsdtar regression introduced in 3.8.4.

https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: Mention regression fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13c3e723cee2a2c892c51dee9a10c37dc38d873d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 1a61d254f7..db7ed95bd9 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
-sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
+sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 083e913033..f3e90e5910 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.4
+LIBARCHIVE_VERSION = 3.8.5
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
