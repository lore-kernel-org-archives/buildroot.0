Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D7C61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74556812EE;
	Thu, 12 Jan 2023 19:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74556812EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioflSdsshOhD; Thu, 12 Jan 2023 19:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2E681F6B;
	Thu, 12 Jan 2023 19:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2E681F6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F097C1BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCF0C812EE
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCF0C812EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeXMqHf_nRxb for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBD6281F96
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD6281F96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAD4E87AA3; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:27:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6abb8721dbf0987ec43f248c84ce4f0f4d11b697
X-Git-Newrev: fbdc0f8ef8bdbe919925e281b2d5ce1583fd1aab
X-Patchwork-Hint: ignore
Message-Id: <20230112193229.CAD4E87AA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v7.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbdc0f8ef8bdbe919925e281b2d5ce1583fd1aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes
(https://github.com/redis/redis/blob/7.0.7/00-RELEASENOTES)

================================================================================
Redis 7.0.7 Released Fri Dec 16 12:00:00 IST 2022
================================================================================

Upgrade urgency: MODERATE, Contains fix for a regression in Geo commands.

================================================================================
Redis 7.0.6 Released Mon Dec 12 12:00:00 IST 2022
================================================================================

Upgrade urgency: MODERATE, Contains fixes for a few non-critical or unlikely bugs,
and some dramatic optimizations to Geo, EVAL, and Sorted sets commands.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index a10df46031..eb8c21be98 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3  redis-7.0.5.tar.gz
+sha256  8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586  redis-7.0.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7a637c106c..b08be11538 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.5
+REDIS_VERSION = 7.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
