Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA6ECDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69C4C41496;
	Sun, 15 Oct 2023 18:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69C4C41496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbBecaXcgf3K; Sun, 15 Oct 2023 18:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2190541493;
	Sun, 15 Oct 2023 18:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2190541493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEB561BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8B141491
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8B141491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oa9jJXWRSBDw for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64B7A41479
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B7A41479
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 400B585233; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4919f7f9c312ab6680bf888d2ab438788f1c7475
X-Git-Newrev: d49f53f8aaf0bff9c8d04c16485c844fef2832d0
X-Patchwork-Hint: ignore
Message-Id: <20231015181834.400B585233@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v7.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d49f53f8aaf0bff9c8d04c16485c844fef2832d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/0001-uclibc.patch | 8 +++++---
 package/redis/redis.hash        | 2 +-
 package/redis/redis.mk          | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/redis/0001-uclibc.patch b/package/redis/0001-uclibc.patch
index 197f43e7a7..6761f9f3fe 100644
--- a/package/redis/0001-uclibc.patch
+++ b/package/redis/0001-uclibc.patch
@@ -12,17 +12,19 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
 Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 [Fabrice: update for 6.0.9]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Titouan: adapt to 7.2.1]
+Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
 
 =========================================================================
 diff -ur old/src/config.h new/src/config.h
 --- old/src/config.h	2012-10-26 07:20:24.000000000 -0700
 +++ new/src/config.h	2012-10-31 13:41:51.206309564 -0700
-@@ -62,7 +62,7 @@
+@@ -71,7 +71,7 @@
  #endif
  
  /* Test for backtrace() */
 -#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__)) || \
 +#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)) || \
-     defined(__FreeBSD__) || ((defined(__OpenBSD__) || defined(__NetBSD__)) && defined(USE_BACKTRACE))\
-  || defined(__DragonFly__)
+     defined(__FreeBSD__) || ((defined(__OpenBSD__) || defined(__NetBSD__) || defined(__sun)) && defined(USE_BACKTRACE))\
+  || defined(__DragonFly__) || (defined(__UCLIBC__) && defined(__UCLIBC_HAS_BACKTRACE__))
  #define HAVE_BACKTRACE 1
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 69bfc1475f..b73df17790 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
+sha256  5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4  redis-7.2.1.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index e5d3de8eb9..04f4697e7d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.11
+REDIS_VERSION = 7.2.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
