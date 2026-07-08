Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10963C44507
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA019810EB;
	Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HprkNgBS-ah; Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F60810FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691103;
	bh=M6bnjd1OOaKgd10lCEZ/XDit6l3DblRy99tezc/2WyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CVBEGTCZ5fnj+BOnC7zDje7c1EOQgmA+lAmTtv5gSAN88srXvCET54WhF+KBxQI0t
	 ugO9iwkwYluWZExPl+Rhp87xxhdOF+LdvFddVuwCkm1Q0fz+5l5neOPn65eTXrqsxZ
	 THjkKothR4mc2iQ5vn0MWsL0Aa8Dh3Jghrj+fgre3WF+BPZ6KQ9SW5d+HeQr+hNYLG
	 yOoDvGaYcoIIcBzZ3MKsfxJoZoNLm6mj1z0gzf2Gu9hAz9qzOj0duJ8HKKcUCmPyZJ
	 FqJeIzY1O3zoHMysnrn7vtNo7YPmkZfFDmMs1k7x6UjRv/0oudkBpReK0Spr5QN+Ye
	 oE3I2U9DI/WBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F60810FC;
	Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C01042FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2295606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOJxNaFt2u1k for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93436068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93436068F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E24E8868B; Fri, 10 Jul 2026 13:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:51:40 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8eb22ee91ff516fc9f6a312752b8f8fb65806929
X-Git-Newrev: 8bb9d8307069dae8ff894ed0689376b95eb91963
X-Patchwork-Hint: ignore
Message-Id: <20260710134413.0E24E8868B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/tor: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bb9d8307069dae8ff894ed0689376b95eb91963
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
