Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCB7C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F8360FAF;
	Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLQlKPu7Xouw; Fri, 26 Jun 2026 14:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED5B60F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485505;
	bh=G9RJAZRAArssHgKrvvrU9p5gX26JVtnoWImNXMzhekQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c3qnXPnkyMtI/YcBTzXaQQpcUpliF4J7KbRiGe+wa6i6ax31SITOKXu9COysysQ2o
	 PzbpUfa3JPYqI3N4+jVKeMMBpJWoB7VdZ7nctliwfnkTeeaXchBuR9QfHFVJEpnBz3
	 GWzGsOMJ8iVPLc7e/X6zzcr7AT3M32O6We1Mges7m8w7brewfusbqGpi7+EW1kIXqL
	 /HTjypB8v+IXpVrTKfBfNhrwFxabT7zuOYl1fpUL3gHFTVuRT9yee/pO4ZWq28PFKn
	 CpVYAUW6IN0J6QAPRYd9bOtYQ3O+PhlHEHIIisG5XpoXzHjJg/CEdgSHVP0UULk+Me
	 ZrkDaKHYJj/4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED5B60F34;
	Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCF63A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C6F809E9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diecKYo_Ki2p for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A0E980972
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A0E980972
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F162F864EC; Fri, 26 Jun 2026 14:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:33:30 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b3289aa1b6b96167289ea827a1998861af34519a
X-Git-Newrev: 75f6dc84a22bdd2eedbad8b34307ffe9e74cbac5
X-Patchwork-Hint: ignore
Message-Id: <20260626145107.F162F864EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/squid: security
 bump version to 7.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75f6dc84a22bdd2eedbad8b34307ffe9e74cbac5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/squid-cache/squid/blob/SQUID_7_6/ChangeLog
https://seclists.org/oss-sec/2026/q2/896

Fixes CVE-2026-47729 and CVE-2026-50012.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9bbc8c0aca19fc1a699dd3313cd7ce9ef1512b9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/squid.hash | 4 ++--
 package/squid/squid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 508b5517c5..fe362e9a2e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,4 +1,4 @@
-# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
-sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
+sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6d403c6c2e..627fef0b9e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 7.5
+SQUID_VERSION = 7.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
