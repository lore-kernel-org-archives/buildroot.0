Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59612C5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCE740CD9;
	Thu, 13 Aug 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3QTxP_Kjlnl; Thu, 13 Aug 2026 19:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C982B40CCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786650030;
	bh=m9BN40zIr/qeol61lPHDdLxoshyKXIAsIXj90tt7m44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kheYJMjPmcnslb2loFe/sO3YIqYLTjIArk/7q1tecPo8gTHRr7J+ZC+YX8kMp4/Aw
	 O/mKZ0foRhveqr3RZzR354WVidjd3JICLrvYMvgpQB739Mof60ICvI7jLvWs13fU8V
	 08wRf0mdzBPGJZcNRKfU//c25SUCwIx9z8tdmsRAnFafdkh9NAmdGwzTnPj6JBpiIl
	 FOEKsg9W1u1OV/Z2ASZf+eKZI3BVOyR/JVVZFaaKLtg0uJnj9CAb8pbN+yh1143BYN
	 3+kj9UygEfvgOcQe1o6w3VlPCylxVL4MkFXIPRtTXB7XE+n6PlIkSHjGK8qxvyAKZv
	 LyJTpl8+b8Vqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C982B40CCA;
	Thu, 13 Aug 2026 19:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A8E33B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DA460627
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uGTxIyxYI2B for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE20B60DCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE20B60DCA
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:40:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A8E8D55D; Thu, 13 Aug 2026 19:39:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9809b30290582d03244dd716c8e0e8e7be9261c3
X-Git-Newrev: 1213189e81f82fa83e8055fecf99220cc184d924
X-Patchwork-Hint: ignore
Message-Id: <20260813193938.43A8E8D55D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1213189e81f82fa83e8055fecf99220cc184d924
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Redis 8.10 is a new feature release, see the changes:
https://github.com/redis/redis/blob/8.10.0/00-RELEASENOTES

Since upstream commit 4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad [1],
Redis must now be built with `make build redis` to avoid building extra
modules, which are distributed within the source code archive since 8.10.0

Moreover, because the default upstream configuration now includes those
modules, attempting to launch redis-server with this would fail, because
it cannot load the missing modules. Therefore, we use the provided
`make sync-redis-conf` to regenerate a full redis configuration that
take the absence of modules into account, and we install that config
file instead of the default one.

[1] https://github.com/redis/redis/commit/4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e6ba97290b..db03ded5e4 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477  redis-8.8.1.tar.gz
+sha256  f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c  redis-8.10.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 0105f2b77c..13cc7b687a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.8.1
+REDIS_VERSION = 8.10.0
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
@@ -49,13 +49,15 @@ REDIS_BUILDOPTS += BUILD_TLS=no
 endif
 
 define REDIS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) build redis
 endef
 
 define REDIS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
 		LDCONFIG=true install
-	$(INSTALL) -D -m 0644 $(@D)/redis.conf \
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
+		sync-redis-conf
+	$(INSTALL) -D -m 0644 $(@D)/redis-full.conf \
 		$(TARGET_DIR)/etc/redis.conf
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
