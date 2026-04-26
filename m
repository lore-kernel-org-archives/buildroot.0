Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31A8FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5491960852;
	Sun, 26 Apr 2026 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMurtjN7Y_74; Sun, 26 Apr 2026 16:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7506660F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777221002;
	bh=3c+e/pqTawn9yc9VWE05OcibmlgGgF407mDtyVnmNrQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WOYAtBFJdqPM0Pzf9/iqr6njDaqruWxjppAMnu1fvfT7+1M0SkBPbF54HMM5hyuOV
	 FHIaBol+sfat0mipLPqVTRrMlL9PtW2ysf3X7Fo8sjSQctZmX70TRtvXrNBARhtbcD
	 da13h64zm35U9jZkg2pP5x3XAzYG1wRDXwwM+6YVZ80GXuxJ1htzDeM/LaT4gGjbc3
	 7E2wAi0CxoFefmHgJHJMCl2LrKLxiwqGpi/52LLS1VIFz0rCrCVz/eYxJJ3lAWHIxN
	 RMdW1tHaF6rjpFYsO8ZnWeeSPnNcoyx6XKDoF7FYN2ToN1XrsPxsFuJo0ld4NGbyWy
	 FGSVzCnLjBYIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7506660F58;
	Sun, 26 Apr 2026 16:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 597091B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A9F580560
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_c5XtE9UQlZ for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0F88055F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A0F88055F
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57D2D836D2; Sun, 26 Apr 2026 16:29:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 18:25:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d5ccd553ad4383bdcfdf5cbd1265419ad7d6777
X-Git-Newrev: c3dfd775b0084e3fb07fa52c75c15577407065e4
X-Patchwork-Hint: ignore
Message-Id: <20260426162959.57D2D836D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3dfd775b0084e3fb07fa52c75c15577407065e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes

Fixes CVE-2026-41080.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 37a9c2ab9f..a0f8b514a8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
-sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
+sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 68af751233..07c209543e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.5
+EXPAT_VERSION = 2.8.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
