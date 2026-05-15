Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2658FCD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F300A41D24;
	Fri, 15 May 2026 17:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1T5uo7AQdWM; Fri, 15 May 2026 17:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 288A141D6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867124;
	bh=R4neNV7XBFh1xAsHM4hIEuUCzTvzjS4smf+JV/w1WRw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CJTOfbpDof2RDtYvmGYcQJzOH4CThHwkaurqftGIdgioZC3n9Df6OpF9Tvla3QFUk
	 IKeJurLVkAiyNlyy/VVvVCPtu6RfGFmDKQGKHH2V0Lg0Z3vlsLl5eN0DP2/JoNnFAF
	 jor1bkHNPVYzkwevgUxzj4rPMvwH+z9mxbbPj3ezRugrskzA8+au4jo79Xvo+Nrw0P
	 dKl9HR9U5r0+CFDVvMPylVVEGFPcXcOTdEMqagD+eKK8KR9h3cYxuMttqkUYXbY7+f
	 ZD1TSar9qjcK/G3xdNRyf8e/Ud04HZEm+p2mDFpkAVYFmV+MVh51R8GMu5d95MuqfC
	 MBWNfxmdamHyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288A141D6A;
	Fri, 15 May 2026 17:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECB045B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44DDE843F5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFBBrWeTsNEg for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B083C8419A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B083C8419A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDB9686365; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 62038906f4909419cbedcabd11a9ad3b5e0e64cc
X-Git-Newrev: 417dcac3d28d3bfa93176aab4f5cdb48595cd4c0
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.EDB9686365@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/417dcac3d28d3bfa93176aab4f5cdb48595cd4c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Version 0.4.9.7 fixes the following security bugs:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes

Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
TROVE-2026-007, TROVE-2026-006:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Version 0.4.9.8 fixes a bug introduced by the bump to 0.4.9.7:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.8/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15fbc52884847dde589aa7a472cdddfe89d1ca06)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a70b9e9baf..f748afecfc 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
-sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
+sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f11afcc449..a24708ddad 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.6
+TOR_VERSION = 0.4.9.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
