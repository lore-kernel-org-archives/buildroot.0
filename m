Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA806CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14AA084FD7;
	Sat, 30 May 2026 10:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVwH3BZ-HBu0; Sat, 30 May 2026 10:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4CDA84FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137990;
	bh=SDv/NpCcr44a0SFAJFSpIIDpzzG0joQUZgqnp3sC5iQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wbt7QO1fUIFx74+Uexk3FfTo3SIkS6Pepj/iAPqY0NcCkgc5aJWKhXL/IQcWalGzP
	 a6a/ZAuDlMarptRgmaYbI1US00KXFiqqz7vOOOnoPINfJXz9Fz3/2eEHiI5BloSn+I
	 bmByu6a9Yn4VOSHqOQLYr5yP9fImuSnVFA9jNN2ONtRQKSf4SzJ1IqqCRJwYIVsqHV
	 sKozmZ2Fy7+4aExAP3feV/lP9ZVKDDUDXWyDZ6lC83AcZNCIP/oRU0gVI1h/d6JoWH
	 QGalRZGrHzv2aK3hzGQD+rAYxfSYLJk24zkXIvMxsPCkkKBQiMxOlmGdqo9LzTOk5B
	 7wSOTf10x32cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4CDA84FB2;
	Sat, 30 May 2026 10:46:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB3AF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B9C84EE3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m3UQ6wyPRqP for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA0D84FB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA0D84FB2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 187C28747E; Sat, 30 May 2026 10:46:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:45:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 23e70547ca1746c638a4e327548eefeb205faeff
X-Git-Newrev: 8d6c49f8d86eb81e143e8dee7806d9896f3eaec1
X-Patchwork-Hint: ignore
Message-Id: <20260530104616.187C28747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jemalloc: bump version
 to 5.3.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d6c49f8d86eb81e143e8dee7806d9896f3eaec1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/jemalloc/jemalloc/blob/5.3.1/ChangeLog

Although it's a patchlevel bump, it contains a _large_ number of new
features, optimizations and refactors.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/jemalloc/jemalloc.hash | 3 ++-
 package/jemalloc/jemalloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 214fe8062b..7abaccd6b3 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,3 +1,4 @@
+# From https://github.com/jemalloc/jemalloc/releases/tag/5.3.1
+sha256  3826bc80232f22ed5c4662f3034f799ca316e819103bdc7bb99018a421706f92  jemalloc-5.3.1.tar.bz2
 # Locally calculated
-sha256  2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa  jemalloc-5.3.0.tar.bz2
 sha256  94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index bd8a2d7654..c351620c26 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 5.3.0
+JEMALLOC_VERSION = 5.3.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
