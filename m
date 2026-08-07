Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A0BC5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13B0409FB;
	Fri,  7 Aug 2026 09:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fHl8TZWf1Gb; Fri,  7 Aug 2026 09:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6587409FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095332;
	bh=Lp2RbUGsjnk3qeUhFUhn+ObQysSWdL/xo6/hJrNIGO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nT7LZLo8vneTNH8FvErF8bbbDfCX9yz2gv2NBoTPfbGxEEXx6mY2pySJsD4CJ9AU/
	 Cvehk4nkHhcc9Kg0xKf9ofZUniFBDvQJNIMIWWld0N2mapoYSaCPrK5+sPfLsuLSTb
	 hOw70IwYt173Yx/QAxgIK10ehYCsindTPVbL/uNFbcj6LKHgOwKBkHtyZcr3KgqeZv
	 VI9rIZZmXQKTqfxlZdM1wrYQBfmVBnysCw+g7WpnM3qd44rql4mXoM4w4QOp8zV1rC
	 SVUU/ujnblduN/O7H16I5sIgPDCovSLTpAop7mb+nVPDJ4HhZvzMCIiGtxORX3GRlt
	 kbrdAT4ZUhHPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6587409FC;
	Fri,  7 Aug 2026 09:35:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 530FC704
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3795A403DB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq1aJU1zQDNq for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5188A40064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5188A40064
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D915C8CA40; Fri,  7 Aug 2026 09:34:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:14 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: bcb82b7fee2291366ebd6fb05ee7ea82dd3fda40
X-Git-Newrev: e862cede26b5651f9d1840afcf5eb77492037fed
X-Patchwork-Hint: ignore
Message-Id: <20260807093441.D915C8CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/redis: security
 bump to v8.6.5
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e862cede26b5651f9d1840afcf5eb77492037fed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See the release notes:
https://github.com/redis/redis/blob/8.6.5/00-RELEASENOTES

This fixes the following vulnerability:

- Crafted RESTORE payloads in RedisBloom and TDigest may trigger
  out-of-bounds writes, potentially leading to remote code execution

(alternative to commit 44d250a2e2a5242a36a84ba622ec4f2914377284)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 2bbbc9e2a7..bfe94b8a76 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
+sha256  cd04337495fda9be071d4e1e3c6a61134f83995bd23d1794cad18f878b7012ad  redis-8.6.5.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ba41b3f922..e5a6e39792 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.4
+REDIS_VERSION = 8.6.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
