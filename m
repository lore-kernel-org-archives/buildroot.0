Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94021C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 14:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC5B41757;
	Sun,  4 Feb 2024 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC5B41757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7g6Q6pT50KY; Sun,  4 Feb 2024 14:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208F941755;
	Sun,  4 Feb 2024 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 208F941755
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5771BF368
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B1160A6A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B1160A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYdXb8TWCTIA for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 14:51:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06CD760A66
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 14:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CD760A66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E62A9868F2; Sun,  4 Feb 2024 14:51:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 15:50:18 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 343aa7d5a0ddfef8a7ab763db253e05b099b0f2b
X-Git-Newrev: fcef868c6088a628eef2a82eac48af2fffe832aa
X-Patchwork-Hint: ignore
Message-Id: <20240204145122.E62A9868F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/redis: security
 bump to v7.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcef868c6088a628eef2a82eac48af2fffe832aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

================================================================================
Redis 7.0.15    Released Tue 09 Jan 2024 10:45:52 IST
================================================================================

Upgrade urgency SECURITY: See security fixes below.

Security fixes
==============
* (CVE-2023-41056) In some cases, Redis may incorrectly handle resizing of memory
  buffers which can result in incorrect accounting of buffer sizes and lead to
  heap overflow and potential remote code execution.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index cbbb29ca13..61ae276de9 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  7e1cdf347f4970ea39d5b7fdb19aedec4c21942e202de65bdeb782d38d2f299f  redis-7.0.14.tar.gz
+sha256  98066f5363504b26c34dd20fbcc3c957990d764cdf42576c836fc021073f4341  redis-7.0.15.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 5bf15821ba..2c5702d10d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.14
+REDIS_VERSION = 7.0.15
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
