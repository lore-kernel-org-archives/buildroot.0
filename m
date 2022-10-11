Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59BCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 19:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AF8D40C08;
	Tue, 11 Oct 2022 19:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF8D40C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Um6aszUgDdgq; Tue, 11 Oct 2022 19:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 895FD40BFD;
	Tue, 11 Oct 2022 19:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895FD40BFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA3C1BF855
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEE0C417BD
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE0C417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a043KWEslsPy for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 19:25:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE1F241913
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 19:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE1F241913
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BA7986BD9; Tue, 11 Oct 2022 19:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 21:22:42 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0c058e99320ef50390144140122d47225499a972
X-Git-Newrev: e665d20f7afaf531d9de1334884879caaa84a76b
X-Patchwork-Hint: ignore
Message-Id: <20221011192552.9BA7986BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/redis: security
 bump to v7.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e665d20f7afaf531d9de1334884879caaa84a76b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

From the release notes:
(https://github.com/redis/redis/blob/7.0.5/00-RELEASENOTES)

================================================================================
Redis 7.0.5 Released Wed Sep 21 20:00:00 IST 2022
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-35951) Executing a XAUTOCLAIM command on a stream key in a specific
  state, with a specially crafted COUNT argument, may cause an integer overflow,
  a subsequent heap overflow, and potentially lead to remote code execution.
  The problem affects Redis versions 7.0.0 or newer
  [reported by Xion (SeungHyun Lee) of KAIST GoN].

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af56cfe372a064a3de2e3baf446cdc59f81cdfd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d9b6ebea54..a10df46031 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f  redis-7.0.4.tar.gz
+sha256  67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3  redis-7.0.5.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 245e9b4d1f..7a637c106c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.4
+REDIS_VERSION = 7.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
