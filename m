Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D5C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 05:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEB560709;
	Mon,  8 Jul 2024 05:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIO9nQsTon4W; Mon,  8 Jul 2024 05:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91106081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91106081E;
	Mon,  8 Jul 2024 05:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A55D11BF48D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912D780EAB
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgwtaPOvstLM for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D9B80F39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3D9B80F39
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF23A83D28; Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 07:33:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b4b87277b64e4360ca19340818954adc5e8103c1
X-Git-Newrev: 9068c31eff297494078a27146d7a3864d629f14f
X-Patchwork-Hint: ignore
Message-Id: <20240708053622.BF23A83D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/redis: bump to
 v7.2.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=9068c31eff297494078a27146d7a3864d629f14f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

From the release notes:
================================================================================
Redis 7.2.5    Released Thu 16 May 2024 12:00:00 IST
================================================================================

Upgrade urgency MODERATE: Program an upgrade of the server, but it's not urgent.

Bug fixes
=========

* A single shard cluster leaves failed replicas in CLUSTER SLOTS instead of removing them (#12824)
* Crash in LSET command when replacing small items and exceeding 4GB (#12955)
* Blocking commands timeout is reset due to re-processing command (#13004)
* Conversion of numbers in Lua args to redis args can fail. Bug introduced in 7.2.0 (#13115)

Bug fixes in CLI tools
======================

* redis-cli: --count (for --scan, --bigkeys, etc) was ignored unless --pattern was also used (#13092)
* redis-check-aof: incorrectly considering data in manifest format as MP-AOF (#12958)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61a7edc0c89b336d63551469f5a2291418fdbc19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 378b930374..5c3a5ea4d8 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59  redis-7.2.4.tar.gz
+sha256  5981179706f8391f03be91d951acafaeda91af7fac56beffb2701963103e423d  redis-7.2.5.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 2680b11b74..852bf31ca0 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.4
+REDIS_VERSION = 7.2.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
