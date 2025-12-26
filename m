Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAF5E8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA0EF60645;
	Fri, 26 Dec 2025 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSXbo6Rk0L8i; Fri, 26 Dec 2025 18:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084E260AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773269;
	bh=skz+0QlxfMnXwzvNLM4234cBsKgFB/6nrhrLDFrLAhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DEg+wRO4sJWA3l6eS5HF3pTfFmgWdlzdMBl+UVrLJGD+OdaubEIff2AwVz5YEsfyX
	 /6/f/4HhRvxudVuDd6Np6rCh1UQKlk09HmlkzFh02PQVEQkVvSQA4WmAEfJV7LkozD
	 y3kHtT64rRMRJ/y3+OHTKt1vx2lxuBN/jVcyAbuAIlJ3IuimDggpOJF8vVuUUDOGqe
	 8R1Q7jS0bkZAP9K7s38DanexKwC7Z9gzvzXof4cJV0P1gt45bJf0UWVDpcn/ZGIgtC
	 ycqo3cn8e8PiHbTX/I6RmxpSTR+kf1aEdbeIeXIfWfGpYiEb6nLDcuQtTzrpve/+78
	 0lY7LF20UYneg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084E260AAE;
	Fri, 26 Dec 2025 18:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B21E5EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38B9E80ACE
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyHDBnWEd_7D for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF71C80B00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF71C80B00
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED98383371; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fce0865c6969acbd2bc21c9531d8e693722754af
X-Git-Newrev: 1b2e3e41aad37bdc93e0ee335ae5d2e6163f4f8f
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.ED98383371@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis-plus-plus: bump version to
 1.3.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b2e3e41aad37bdc93e0ee335ae5d2e6163f4f8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.13
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.14
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.15

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 4cdc176025..6148399634 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  26c1e45cdbafe1af4d2cf756957b2268baab6f802b53bcdd435864620e2c03c7  redis-plus-plus-1.3.12.tar.gz
+sha256  e9288fda74f1501c62dd9ab7d6a8dc67de51aa4d5b7c71770baa51987a945941  redis-plus-plus-1.3.15.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 167d8bfa01..0ee9f091fb 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.12
+REDIS_PLUS_PLUS_VERSION = 1.3.15
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
