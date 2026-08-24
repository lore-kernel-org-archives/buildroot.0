Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAD3C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 17:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4705080E84;
	Mon, 24 Aug 2026 17:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gZv3-CuzaXP; Mon, 24 Aug 2026 17:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787591103;
	bh=U7p6ywvsomvxw5KFEvm7Pmbci+zfHYR9AgJdtZWSchQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j7ju3PcMw/q5gMztt62aDq/SpJruwnh9+c3wIGPmw1g6vn1l7K0SIM5B2CXNn7CxU
	 h3rRXmDUi8yBtt1IrwnrV4F2pYUhDkX6DlXu4OZfiAUhmkXbPr5lDNXSS+iJZsG004
	 SkUELS7mwjSDB+bIcp+4kNvv9FYRbojxXcI6QaCTGpzk3khsnBYaA47VimkHf4OmXP
	 vIGKTtLfmtvhHqbV8NUrtfe02q2UPyDH2O+2SgOaZeCTusBth5l67/zbbwFXLpVJ57
	 r/hF/wJwExRdUhT0/UXO39j2oWPDB9Oim36izYMQb+jZsNX8xmggxxc2LYOiybcoG8
	 9E7H1R9AByIzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E24380E5B;
	Mon, 24 Aug 2026 17:05:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34B2A41A
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF8D40587
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TV82JvcMiwuf for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 17:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201CD40581
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E32EE8F8F3; Mon, 24 Aug 2026 17:04:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 18:58:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0a51767a0d33b5f8da866a6a0f1f35968311614
X-Git-Newrev: fab3c4eb92877284f39ba59289affc8fcbccf1a7
X-Patchwork-Hint: ignore
Message-Id: <20260824170405.E32EE8F8F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fab3c4eb92877284f39ba59289affc8fcbccf1a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.10.1/00-RELEASENOTES

Notably, this fixes CVE-2026-62356: miscalculated buffer size in
`CMSketch` RDB loading may lead to heap OOB write, as well as other
security fixes without CVE number

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index db03ded5e4..c3239337d6 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c  redis-8.10.0.tar.gz
+sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 13cc7b687a..30142bc0e5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.0
+REDIS_VERSION = 8.10.1
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
