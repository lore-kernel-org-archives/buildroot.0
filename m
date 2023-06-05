Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FC7C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 09:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C4F60F27;
	Mon,  5 Jun 2023 09:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C4F60F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCp7TY8O7JxS; Mon,  5 Jun 2023 09:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A924D60F1E;
	Mon,  5 Jun 2023 09:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A924D60F1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A910C1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82C7F40195
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82C7F40195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3w5uoRcugLD for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D22F40141
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D22F40141
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6840C86C2B; Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 11:35:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25e485f462b7459dda6793d7eaa385c8617febff
X-Git-Newrev: c29bf1d2db5afb8a0109260ed2477fa8fc49c2ba
X-Patchwork-Hint: ignore
Message-Id: <20230605093927.6840C86C2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v7.0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=c29bf1d2db5afb8a0109260ed2477fa8fc49c2ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
