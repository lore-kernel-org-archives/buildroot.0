Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57328EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E3D81DE4;
	Wed, 14 Jun 2023 13:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E3D81DE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiV5cxmpTg-l; Wed, 14 Jun 2023 13:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 211DA81D0B;
	Wed, 14 Jun 2023 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 211DA81D0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0437F1BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C176C8399E
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C176C8399E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xHnPg7ex9qe for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5B89837B9
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B89837B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3B1F83685; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:42:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 952bf976b230cd1ce92281b81716a4a899525fcc
X-Git-Newrev: 675142ca66fecdf38dbf1862092aafe7b0f822ea
X-Patchwork-Hint: ignore
Message-Id: <20230614135234.D3B1F83685@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/redis: security
 bump to v7.0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=675142ca66fecdf38dbf1862092aafe7b0f822ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

From the release notes
(see https://github.com/redis/redis/blob/7.0/00-RELEASENOTES):

================================================================================
Redis 7.0.11 Released Mon Apr 17 16:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-28856) Authenticated users can use the HINCRBYFLOAT command to create
  an invalid hash field that will crash Redis on access

...

================================================================================
Redis 7.0.10 Released Mon Mar 20 16:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service

...

================================================================================
Redis 7.0.9 Released Tue Feb 28 12:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-25155) Specially crafted SRANDMEMBER, ZRANDMEMBER, and HRANDFIELD
  commands can trigger an integer overflow, resulting in a runtime assertion
  and termination of the Redis server process.
* (CVE-2022-36021) String matching commands (like SCAN or KEYS) with a specially
  crafted pattern to trigger a denial-of-service attack on Redis, causing it to
  hang and consume 100% CPU time.

...

================================================================================
Redis 7.0.8 Released Mon Jan 16 12:00:00 IDT 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
  commands can drive Redis to OOM panic
* (CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and ZRANDMEMBER
  commands can lead to denial-of-service

...

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c29bf1d2db5afb8a0109260ed2477fa8fc49c2ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index eb8c21be98..69bfc1475f 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586  redis-7.0.7.tar.gz
+sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b08be11538..e5d3de8eb9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.7
+REDIS_VERSION = 7.0.11
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
