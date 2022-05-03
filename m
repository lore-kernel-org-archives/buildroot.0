Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 09:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D650E813E6;
	Tue,  3 May 2022 09:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYjP480j3lW1; Tue,  3 May 2022 09:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CC1813CB;
	Tue,  3 May 2022 09:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 246251BF279
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 09:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13721813B4
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 09:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02tAHLfgZLuH for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 09:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C8F681389
 for <buildroot@buildroot.org>; Tue,  3 May 2022 09:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A54F484DB8; Tue,  3 May 2022 09:41:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 11:51:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dfb3203bb81f1a7f0b562c12dae77f2b9a7635de
X-Git-Newrev: 60ff1d619db65d797147855b7c1163c327ef6c88
X-Patchwork-Hint: ignore
Message-Id: <20220503094123.A54F484DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/redis: security
 bump to v6.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=60ff1d619db65d797147855b7c1163c327ef6c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

From the release notes:
(https://github.com/redis/redis/blob/6.2.7/00-RELEASENOTES)

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-24736) An attacker attempting to load a specially crafted Lua script
  can cause NULL pointer dereference which will result with a crash of the
  redis-server process. This issue affects all versions of Redis.
  [reported by Aviv Yahav].
* (CVE-2022-24735) By exploiting weaknesses in the Lua script execution
  environment, an attacker with access to Redis can inject Lua code that will
  execute with the (potentially higher) privileges of another Redis user.
  [reported by Aviv Yahav].

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 74a9392a63..6871a59041 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
+sha256  b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319  redis-6.2.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f3c030d68c..fb7f653742 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.6
+REDIS_VERSION = 6.2.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
