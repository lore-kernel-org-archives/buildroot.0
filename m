Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D60BC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5DCD6054F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5DCD6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E99983BA0;
	Fri, 30 Jul 2021 16:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFWVUF7DdraD; Fri, 30 Jul 2021 16:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE79883B8E;
	Fri, 30 Jul 2021 16:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4CF1BF348
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6986C83B8E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1l8v_5B3hTX for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 16:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A56A83B25
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 16:22:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DF6658A2F9; Fri, 30 Jul 2021 15:48:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 18:22:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 49cb1aa62613c88390ed952b860e4a27d50f5ef0
X-Git-Newrev: 4c35085470291250d9e075f4bc9686ae9982a3bb
X-Patchwork-Hint: ignore
Message-Id: <20210730154807.DF6658A2F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/redis: security
 bump to v6.0.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4c35085470291250d9e075f4bc9686ae9982a3bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

From the release notes:
================================================================================
Redis 6.0.15 Released Wed Jul 21 16:32:19 IDT 2021
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues that affect
authenticated client connections on 32-bit versions. MODERATE otherwise.

Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
An integer overflow bug in Redis version 2.2 or newer can be exploited using the
BITFIELD command to corrupt the heap and potentially result with remote code
execution.

See https://github.com/redis/redis/blob/6.0.15/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 15b55eb501..d736c09489 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  c3e60c928b183ca9fe8e878936a6f8ba99e0441b9b6e04d2412a750ea576c649  redis-6.0.14.tar.gz
+sha256  4bc295264a95bc94423c162a9eee66135a24a51eefe5f53f18fc9bde5c3a9f74  redis-6.0.15.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 925279274c..f66397b216 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.14
+REDIS_VERSION = 6.0.15
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
