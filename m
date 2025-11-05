Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E17CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0AA4143F;
	Mon, 17 Nov 2025 20:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRxOQpDv6V76; Mon, 17 Nov 2025 20:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 232644143B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232644143B;
	Mon, 17 Nov 2025 20:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CB92D3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDD7183E1E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSVvMvw8bhch for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D787D8349A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D787D8349A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5F8781E81; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:49:43 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: ab3680b89ddc2afd62e96313313f98d670b3aa87
X-Git-Newrev: cff6724a9ab14b8fca5ced499ed6e517b48376a7
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.D5F8781E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/bind: drop
 unrecognized option
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cff6724a9ab14b8fca5ced499ed6e517b48376a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Buildroot commits 7b43e248180ad3b3dd1804687bc4457f29a88137 and
8adeaec8afacbc680edebae91524f6144926ac92 removed the possibility for
static builds but forgot to remove some related _CONF_OPTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 636b2a8503f437dfe91ce0c01638c69458342a96)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 350f6c6fbe..11730b6e7e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -109,16 +109,6 @@ else
 BIND_CONF_OPTS += --with-readline=no
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-BIND_CONF_OPTS += \
-	--without-dlopen \
-	--without-libtool
-else
-BIND_CONF_OPTS += \
-	--with-dlopen \
-	--with-libtool
-endif
-
 define BIND_TARGET_REMOVE_SERVER
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SERVER_SBIN))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
