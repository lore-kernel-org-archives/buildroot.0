Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689EACA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D164155F;
	Mon, 11 Aug 2025 15:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOxEOZCiATb4; Mon, 11 Aug 2025 15:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207574151C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207574151C;
	Mon, 11 Aug 2025 15:28:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6914C1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB8840D91
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgpYyD0t1k3l for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB6F40D7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AB6F40D7E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:28:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7876A84310; Mon, 11 Aug 2025 15:28:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 17:23:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1349cd6031dcff9bdb30bd9c0bd61641cadc99b9
X-Git-Newrev: 874601825f848f9c4f6e8d8086c154f0812666d4
X-Patchwork-Hint: ignore
Message-Id: <20250811152847.7876A84310@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/redis: bump to v8.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=874601825f848f9c4f6e8d8086c154f0812666d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From the release notes:
(https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES)

===========================================================
8.2 GA (v8.2.0)    Released Mon 4 Aug 2025 15:00:00 IST
===========================================================

This is the General Availability release of Redis Open Source 8.2.

- Streams - new commands: `XDELEX` and `XACKDEL`; extension to `XADD` and `XTRIM`
- Bitmap - `BITOP`: new operators: `DIFF`, `DIFF1`, `ANDOR`, and `ONE`
- Query Engine - new SVS-VAMANA vector index type which supports vector compression
- More than 15 performance and resource utilization improvements
- New metrics: per-slot usage metrics, key size distributions for basic data types, and more

Note: the full release note mention three CVEs fixed in 8.1.x and 8.2.x
series. Those security fixes were already included in version 8.0.2 and
8.0.3, already in Buildroot. Therefore, this commit is not marked as
security related.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add comment in commit log about CVE in release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c66223f2da..41d2797cd0 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
+sha256  ff95b83b7cf2f7a33af3be1e52fdf2e791c259f8272465c3b09f9e6bc901b604  redis-8.2.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 5ffb2a929f..8b5005ccda 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.3
+REDIS_VERSION = 8.2.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
