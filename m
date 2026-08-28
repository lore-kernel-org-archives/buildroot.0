Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F423C61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D073160845;
	Fri, 28 Aug 2026 14:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aClYoxOuS2aY; Fri, 28 Aug 2026 14:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927144;
	bh=sJSRp6ALcBQ1saRYqjYxFKO5/Xi3HMTMjddb8UHh76I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WrjToO9i0S9s59Kn2yfCTfbnDqNrkrUq09jKDXxEoMpk6tdU7Q7S0duwuzjXwxLuD
	 y8PViInCEf6eF8XuHQVE4XlCjKLKCwsYojAtSPbvkoYd29vJNlLYDiUZE0A0CNh2jG
	 ubY1E8+71kxi9rvNF7cnaXD7bt2Br3++LgZC5fCbjT1XwFwpVZ9hc9jY7rpMFfUsnL
	 xpEawncwXzWllVP31sS3lq77TLN8sd5xW29J8nq7c3YXyVcmDZDcPbJ1TWulfo965P
	 hDLF9tYJ3nxg/GTJdadocjpuLcUiCxwzfcc/Z4dada3Qbh4gwh/JEWGu63zwvaUCFj
	 iJccer4UtSWDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1332560836;
	Fri, 28 Aug 2026 14:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83645D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69FCE80F50
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLntA4I6iG14 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC4180E6A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE020921F9; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 20d16b36941f31fac3582da47d54ab4106e7ed0a
X-Git-Newrev: 7fee4818cddcc8df32b30610abfcab59c92c1d62
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.BE020921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgit2: security
 bump version to 1.9.7
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fee4818cddcc8df32b30610abfcab59c92c1d62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes CVE-2026-5917 when used with libssh2

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.7

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2d40ae9f2c6026fe201c894c79b2fc844e953465)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 38486c4e4d..f8e8a042d5 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a88a42a4ea9bdab7aa8686eead3bf7d9c6dd74529caca16ab22eaa92433d31d9  libgit2-1.9.6.tar.gz
+sha256  1a4fbe7589e814777ae76b64734ad80f4ecad22cd33a22682a2aaea4ae5375e7  libgit2-1.9.7.tar.gz
 sha256  e0938121c0554985fe17196ac38fc590d149268e9c46e0c0e7a2eae1354fae71  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b4d9984540..7ae02654f6 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.6
+LIBGIT2_VERSION = 1.9.7
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
