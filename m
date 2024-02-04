Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB5C48292
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 14:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D1E41757;
	Sun,  4 Feb 2024 14:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D1E41757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92ejZ41bjsgC; Sun,  4 Feb 2024 14:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154AB41750;
	Sun,  4 Feb 2024 14:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154AB41750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 007381BF36F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDEA980EC4
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDEA980EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7c-p0diqqXFx for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 14:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B38880EC2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 14:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B38880EC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8BDC868F5; Sun,  4 Feb 2024 14:52:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 15:37:26 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 70ab59e19895eb94083bd43fef32ee0bba31156b
X-Git-Newrev: 7964cf52a0f3137ca3359deef46bcd3e9472f504
X-Patchwork-Hint: ignore
Message-Id: <20240204145230.E8BDC868F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/redis: security
 bump to v7.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7964cf52a0f3137ca3359deef46bcd3e9472f504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

See release notes (https://github.com/redis/redis/blob/7.2.4/00-RELEASENOTES):

================================================================================
Redis 7.2.4    Released Tue 09 Jan 2024 10:45:52 IST
================================================================================

Upgrade urgency SECURITY: See security fixes below.

Security fixes
==============
* (CVE-2023-41056) In some cases, Redis may incorrectly handle resizing of memory
  buffers which can result in incorrect accounting of buffer sizes and lead to
  heap overflow and potential remote code execution.

Bug fixes
=========

* Fix crashes of cluster commands clusters with mixed versions of 7.0 and 7.2 (#12805, #12832)
* Fix slot ownership not being properly handled when deleting a slot from a node (#12564)
* Fix atomicity issues with the RedisModuleEvent_Key module API event (#12733)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f59c175a484fcc47c6875db49ad03eb83b90523)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 365fbf4063..378b930374 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7  redis-7.2.3.tar.gz
+sha256  8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59  redis-7.2.4.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 77cfb1e0b1..09a3b9448b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.3
+REDIS_VERSION = 7.2.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
