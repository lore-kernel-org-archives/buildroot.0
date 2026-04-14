Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D037F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEC342C95;
	Tue, 14 Apr 2026 17:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nC9XIJMIboM; Tue, 14 Apr 2026 17:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DD042CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188956;
	bh=3MaK7jLLmwxR06AoZijCeE+kTgzuOuoh2VI2le9dplY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QxFqxZesSXnPPoD2RIGk3B3vqAOpiqJKWxP/TgdqIh6mZuSSQX+P1lef/3T7kus38
	 gpJ61uBwVhB2uX/0G6nkMwOVA9fAIGpLw87BitkKR41t3ovtfv/k+YAvSMcB3w5ZIe
	 p8ecNejFM/QI9IxN04VyS2KgoRhfPslfX2y+Pq9nKRY+GrrbgiZ5uU/LlLR7I3ogPh
	 2mVASzmtwpdbl9oL6JvlDob3dK1h1kaTViOLa5adNVljEm8ssGnBBqd88JzSYTsJdG
	 TyLhYjuJ5mrEGyv33fAVqWe69a8hNyGl2KJHUOIHRuCDZxzs52CeTPL5w5N8zYYEnL
	 gXplgcatPp7HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DD042CAE;
	Tue, 14 Apr 2026 17:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E41F1283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B577B403D6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNOIltsuj9ix for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F19403E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33F19403E4
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFF87FB2E; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c81798b6828707080c76167789b857b8cf2c357
X-Git-Newrev: 081c27aea5516e4657b690d80a7f6105456e4b20
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.BDFF87FB2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: remove optional support
 for pcre, keep pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/081c27aea5516e4657b690d80a7f6105456e4b20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/haproxy/haproxy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 51878e754f..9504ec6b7a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -59,11 +59,6 @@ HAPROXY_DEPENDENCIES += pcre2
 HAPROXY_MAKE_OPTS += \
 	PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config \
 	USE_PCRE2=1
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-HAPROXY_DEPENDENCIES += pcre
-HAPROXY_MAKE_OPTS += \
-	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config \
-	USE_PCRE=1
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
