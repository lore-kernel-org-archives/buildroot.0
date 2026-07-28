Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B0C54F51
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 14:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CEE40638;
	Tue, 28 Jul 2026 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvyOEMIs9ssK; Tue, 28 Jul 2026 14:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8593F40A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247260;
	bh=HpEkXy4+PLrmFqJZiT91piB0SWg7if4M1tgLZmNkTxo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A2NHl1lvzIJDI3DfbumDIrnDOhl+VbK89Cu4diDd0xrsNRL4jImHymZs1NfrJpH++
	 Z1O8HP/ecCQXoldU220Kjq5KXI/erNorce/gJDPu3zUWLDNNeW+HqbV29jEPFIFHWJ
	 p7drXR99VYiEq21oxREKI+ayPVeA9VDJmFSa5qyrRqjvT6hlN1iKPhkq+PEZAUQymX
	 SURmzYsW6RPdVyCECIunQxaxJbCIs56jUVxHR3uJ3vrNG8+EzOmOJ6QL5mLmuOZspF
	 LGWlg8wbIv293yddX3D25cuvu0Pe+cYVvFT2glhO9kenEGBPgP+WgrBCIkdpvdoXjd
	 Ubd2ZbItTonSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8593F40A63;
	Tue, 28 Jul 2026 14:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 252572E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B6054031D
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOvIdU0Zy0oP for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 435B740323
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 435B740323
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 984BB8B40F; Tue, 28 Jul 2026 14:00:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 15:53:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdeeb9b9c688b5bcdcc80bf89f2c046b0bd55bb8
X-Git-Newrev: 44d250a2e2a5242a36a84ba622ec4f2914377284
X-Patchwork-Hint: ignore
Message-Id: <20260728140016.984BB8B40F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.8.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44d250a2e2a5242a36a84ba622ec4f2914377284
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.8.1/00-RELEASENOTES

This fixes the following vulnerability:

- Crafted RESTORE payloads in RedisBloom and TDigest may trigger
  out-of-bounds writes, potentially leading to remote code execution

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 00aa3e4497..e6ba97290b 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b  redis-8.8.0.tar.gz
+sha256  1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477  redis-8.8.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a876c56f08..7829aa6143 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.8.0
+REDIS_VERSION = 8.8.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
