Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E7F44841
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 11:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CCF40CB3;
	Fri, 10 Apr 2026 11:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YMeHWS3aHI8; Fri, 10 Apr 2026 11:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0594640CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775821677;
	bh=OsVnFVlTai5NwCcSzuQN5QfQtFv1MhNH1RIACNKF1Rc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GEzEkw/ZilLD5J6Fk0woz1+C+NS+U4oL89SsTU1P4GlC9L9CPOvxE2BvLDHLS2fYj
	 Jr9A6ZbQMP5YakxmI0kU+a1rE6SWZS0Y1aZ6V+MLlrRIEBaTRwukbs0rwB/E7xfrO+
	 Agnpuvxo5ExWuohyJlCJoH+uR+jfHThlsI9BPpGEEb46MfysQvGuiJiMwNK6YPZF1c
	 xHXK7+uSVx/RT9pRBFlEzruZ0Cc+DL8SlN2D6xeUmJ92FX0NqlWOGZxza6+odM/1R/
	 ODlTXo8kK477a2HYmmnDE37flzGvMRSc0v8K4gvbNR+K1qVlVkWXcZ63oXU62DLayI
	 rgqcgi+12WV7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0594640CBD;
	Fri, 10 Apr 2026 11:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53534237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50CD640399
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5QMwUiZgOVm for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F49E40060
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F49E40060
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 063068108B; Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 13:43:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76e4d8e3dfb2e5353f1473f72860e62b61a953d1
X-Git-Newrev: 29a49271574095fb813ce7896c630a6e5fd78764
X-Patchwork-Hint: ignore
Message-Id: <20260410114754.063068108B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29a49271574095fb813ce7896c630a6e5fd78764
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.4.2/00-RELEASENOTES

================================================================================
Redis 8.4.2    Released Mon 23 Feb 2026 10:00:00 IST
================================================================================

SECURITY: There is a security fix in the release

- A user can manipulate data read by a connection by injecting \r\n sequences
  into a Redis error reply

================================================================================
Redis 8.4.1    Released Sun 8 Feb 2026 9:00:00 IST
================================================================================

Update urgency: `SECURITY`: There are security fixes in the release.

- #T1837, #J1474 Hide Personally Identifiable Information from server log
- #P936 Cuckoo filter: crash on RDB load on 0 buckets (MOD-11593)
- #P945 Bloom filter: crash on RDB load on large number of filters (MOD-11590)

(And a whole lot of other bugfixes)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 1ac1b1764d..e690dd1eaa 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ca909aa15252f2ecb3a048cd086469827d636bf8334f50bb94d03fba4bfc56e8  redis-8.4.0.tar.gz
+sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 36a13a34ef..fb166b6f49 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.4.0
+REDIS_VERSION = 8.4.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
