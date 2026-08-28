Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBE9C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E6D680F7A;
	Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGJCN9z-6mhL; Fri, 28 Aug 2026 14:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927055;
	bh=gZYWqNk3QxAB/zbMS9X+GptGaRAgAeOc4uQjs2Ib0sA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CLigzlbmKl3YUi7RfykShjXY+XpqVvLSyrN2y0cjzgIyclV0NXgWU6XGAIDfFqkuz
	 AmhLh/fJUfnHB+1RsfJMBD8ztBOqbIVWCQVSbICJT5PUp12lfL5QOk5x52lgARrv+k
	 ggdpafUvAy3egp26uRxxtJ5NK/h4Yq6iUP1vMgAQTm1QbVlfwILgP9+4WPFcbImmHm
	 oae1/Hwo/OGPS5xB/DDYEwoCX/Mz6n5N3GDlmwzAfiFjeFkkrvrjFOEahIgXMZ+rHY
	 aTMon9Y18/2gARDEHdF99h2zPvOY3geg6TPdSuWB7ngjceKFIJGgmPl3ahcGUkfeaB
	 Paj+x5qKjJWOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5DE810AD;
	Fri, 28 Aug 2026 14:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A0CD2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5CA6407B3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R43Z9M5wPWqi for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC0154085B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA767921FA; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f66d1f027bc3a1d623507c5108260edd2396b8d9
X-Git-Newrev: 5b3425a850a4e4daf74ab86e23dc36cb419ce4ff
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.CA767921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/redis: security
 bump to v7.2.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b3425a850a4e4daf74ab86e23dc36cb419ce4ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://github.com/redis/redis/blob/7.2.16/00-RELEASENOTES

This fixes a few security issues (without CVE number)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index cbd4255df9..1d58f98462 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  7bf7975331511fdb788e85dae63964b128fccee1df026a10db57444babc9c9c4  redis-7.2.15.tar.gz
+sha256  960a8ec15e34ff40e57ff16837b26b33bd81f2da6d24497bb63de532a323a18e  redis-7.2.16.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 02c25327ed..31b4aad2b2 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.15
+REDIS_VERSION = 7.2.16
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
