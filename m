Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDA2CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F1D60C00;
	Thu, 11 Jun 2026 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ii0cjQ09ANy; Thu, 11 Jun 2026 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E2E60BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781210502;
	bh=nd0cIvWCKQpki7lOGvlDmA2c5vSXYa01pQ1WcgETSnE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e/u9bPLFEMGce5Rv1NPpUBygbE0vBqz0deik4DA3+kICFp8JQIvqcBhJTUleFLTBl
	 fcHLm2leCNS61K5br6sdCdCFOF2zqj/3TAM2QMCQ6xdC7KcVMu61njCuciAlaULW/6
	 2bLuitAdZZ4EvKC6IPnOX8DPSB3/9Jvutj/xiIBhCuwPQuGLqqv5NyNDeHetd9USJI
	 BSvxPDzwk5BucKWSW9XM8ntib7Q8iN2JzZtws5Cb2RtPLHEKPQVmorvQYk1x4lpSm6
	 +1bdjSUY9gB2TTIsnW0fm/xrHAMLH+DkYiGxfCqDaqD7nt639TwTzp+sPRi5FtZHhD
	 iYpWmK0MJ/4bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E2E60BEF;
	Thu, 11 Jun 2026 20:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB63FF4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AADC682277
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnMAL_CU2WfK for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0888E82273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0888E82273
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:41:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10EC488030; Thu, 11 Jun 2026 20:41:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 22:36:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dab0de6277c484998842f4617a9730ce2ae3b050
X-Git-Newrev: 39c935852ac8e4a0c9583f8040c559d4f88456f0
X-Patchwork-Hint: ignore
Message-Id: <20260611204122.10EC488030@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39c935852ac8e4a0c9583f8040c559d4f88456f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a new feature release of Redis Open Source. See the release notes:
https://github.com/redis/redis/blob/8.8.0/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 2bbbc9e2a7..00aa3e4497 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
+sha256  88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b  redis-8.8.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ba41b3f922..a876c56f08 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.4
+REDIS_VERSION = 8.8.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
