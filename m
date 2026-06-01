Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BA2CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D03040A50;
	Mon,  1 Jun 2026 20:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvHMm0XJKD-u; Mon,  1 Jun 2026 20:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ECE440A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780345054;
	bh=Y6bAoCQFFjPySnwsTDIjl9hKWdQktxeTw03/veO/dJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZQVZ5s4O3DevXPmiNrz2sMG7gYJvMBrK4RHGnP2lN6LhJqRRRvmwi+uG1Md/0fUnd
	 dCfZ3u9ZnC62IHIvCwowK3q1zpWALbvZOUhlf3ALFJQIIZjGbhWpk0xinqh+Q6Q6Qr
	 CGpXMLmqi8IWA3Dsnp1GDs03//BXrCl2tBbv5aO5myl9Ddc1pios46qmT67QB+R2eb
	 QHnQYTEYEwcj86VTRkrQXUCdaqGgd/tEknNEDwc9qd2NpZV55Hle60potpoSV5VTkE
	 4l5z87PDScnNg79jm7IxZcQm4IUpLdfl7u7DgRX8Wr7ESYc021nhmm4i3OaCZ0EV+h
	 I71J26VoRLCRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ECE440A34;
	Mon,  1 Jun 2026 20:17:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB296223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCA24401A2
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EXbQhvHNEWF for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F020940186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F020940186
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:17:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF8CA86F7D; Mon,  1 Jun 2026 20:17:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 22:12:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b71b14793ac4b45f3058528b4d8452d47e617d90
X-Git-Newrev: f9a9f240c1de99ca9607c378be43f154f0abc282
X-Patchwork-Hint: ignore
Message-Id: <20260601201717.CF8CA86F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9a9f240c1de99ca9607c378be43f154f0abc282
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.9/ReleaseNotes

Fixes
TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
TROVE-2026-021 & TROVE-2026-022.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f748afecfc..a6771b1fa1 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
-sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
+sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a24708ddad..ca5a4d026c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.8
+TOR_VERSION = 0.4.9.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
