Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED7CAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48EB8264C;
	Tue, 16 Sep 2025 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an1i1x8pFPd7; Tue, 16 Sep 2025 18:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF84382605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF84382605;
	Tue, 16 Sep 2025 18:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3463279
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8984882605
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPjUbsFeMnyX for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 18:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE1B825D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE1B825D3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD3038484A; Tue, 16 Sep 2025 18:59:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 20:54:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a93602c00b355e54322c8b0ce0a1cea98ea202f9
X-Git-Newrev: f8fd48a9241286e7a6e329b9e371c151baa510a6
X-Patchwork-Hint: ignore
Message-Id: <20250916185903.CD3038484A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8fd48a9241286e7a6e329b9e371c151baa510a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes
(https://github.com/redis/redis/blob/8.2.1/00-RELEASENOTES)

=============================================================
8.2.1 (v8.2.1)    Committed  Mon 18 Aug 2025 12:00:00 IST
=============================================================

Update urgency: `MODERATE`: Program an upgrade of the server, but it's not urgent.

- #14240 `INFO KEYSIZES` - potential incorrect histogram updates on cluster mode with modules
- #14274 Disable Active Defrag during flushing replica
- #14276 `XADD` or `XTRIM` can crash the server after loading RDB
- #Q6601 Potential crash when running `FLUSHDB` (MOD-10681)

- Query Engine - LeanVec and LVQ proprietary Intel optimizations were removed from Redis Open Source
- #Q6621 Fix regression in `INFO` (MOD-10779)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 41d2797cd0..74fadfa8c0 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ff95b83b7cf2f7a33af3be1e52fdf2e791c259f8272465c3b09f9e6bc901b604  redis-8.2.0.tar.gz
+sha256  e2c1cb9dd4180a35b943b85dfc7dcdd42566cdbceca37d0d0b14c21731582d3e  redis-8.2.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8b5005ccda..f2d7d43b7a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.0
+REDIS_VERSION = 8.2.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
