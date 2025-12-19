Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D2FE64A92
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44EE83DE1;
	Fri, 19 Dec 2025 22:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YowykH6Ca28c; Fri, 19 Dec 2025 22:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC0083DDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766183683;
	bh=5YTysxGO3hqBrVU9ic3wfjdB6QNxQ0fByPbPBVH/VYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oanyri4xbII1RyJwWd82NnshKwPt/0NAieD2p9CBPsydbAnuEoMic2yrHOykb4IMS
	 xPWHamu1233vCuPMdZ+0Ys8l6b206jWsrne+YJz46Ois4Zvm9ioqDfbZw/HvjhPuIm
	 nDQFsVtHoaqzkwEb56vhd82GmN2llEqeEOPht79PakDw257jot5KFz7QFkvGzOrox2
	 tHjm8sOOSf+njEle8FiHmNeL8oDT3xD4jqjCPntkRgZrHeQBM6ISeTxR0+FCAjiQYs
	 CFng0Yei1887H/ktnRBgTb1ZsJ2WOqzR32eMIII7fPj+vKl32D3i1nEUuDHx7VD82B
	 wakGA7/kc8JOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC0083DDC;
	Fri, 19 Dec 2025 22:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BABC81A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A122060C17
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZQVhDeMqQzT for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27AD60C09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27AD60C09
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E3D87428; Fri, 19 Dec 2025 22:34:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 23:28:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2a5e5b52f80f096fda558a83b1f3a31bcc4738b
X-Git-Newrev: 44eea720c0351ddec6b6bda41520cb78a3ac80a9
X-Patchwork-Hint: ignore
Message-Id: <20251219223441.B2E3D87428@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=44eea720c0351ddec6b6bda41520cb78a3ac80a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes: https://github.com/redis/redis/blob/8.4.0/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index f9c70c469f..1ac1b1764d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  d88f2361fdf3a3a8668fe5753e29915566109dca07b4cb036427ea6dc7783671  redis-8.2.3.tar.gz
+sha256  ca909aa15252f2ecb3a048cd086469827d636bf8334f50bb94d03fba4bfc56e8  redis-8.4.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c8073407b9..36a13a34ef 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.3
+REDIS_VERSION = 8.4.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
