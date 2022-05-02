Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2773EC4332F
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AC9409B2;
	Mon,  2 May 2022 22:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qiTi9knRXcX; Mon,  2 May 2022 22:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6911A40866;
	Mon,  2 May 2022 22:02:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27CD61BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D9660F97
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fW8qJEyhcz9l for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B6260ECB
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0B03084F0E; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5ff1de64e60f6ab2faaa751378fce0ec6bf1010
X-Git-Newrev: fd3dfd177225ad5dd25bb181e07b92075eb380a7
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.0B03084F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v7.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd3dfd177225ad5dd25bb181e07b92075eb380a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
(See https://github.com/redis/redis/blob/7.0.0/00-RELEASENOTES)

Introduction to the Redis 7.0 release
=====================================

Redis 7.0 includes several new user-facing features, significant performance
optimizations, and many other improvements. It also includes changes that
potentially break backwards compatibility with older versions. We urge users to
review the release notes carefully before upgrading.

In particular, users should be aware of the following changes:

1. Redis 7 stores AOF as multiple files in a folder; see Multi-Part AOF below.
2. Redis 7 uses a new version 10 format for RDB files, which is incompatible
   with older versions.
3. Redis 7 converts ziplist encoded keys to listpacks on the fly when loading
   an older RDB format. Conversion applies to loading a file from disk or
   replicating from a Redis master and will slightly increase loading time.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 74a9392a63..582c3afa03 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
+sha256  284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720  redis-7.0.0.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f3c030d68c..3b91fbf8c8 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.6
+REDIS_VERSION = 7.0.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
