Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE16D715C6
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 12:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9F4405F3;
	Sat, 24 Jan 2026 12:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jJxFkkyTMdq; Sat, 24 Jan 2026 12:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA1240737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769256123;
	bh=OiL2GznZpDe6CBn/Qpg+89j28ituJsI+EsfGf8MEW6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RBTT4Lf3U/spXFLFg8GWHV/w7iK4+6x7FCON7wM69F4p8E1axGj2Va1zDh0M5Paht
	 snJjIMHQdzfttDw/CbMZ5ZT3mRw6gReyWKqDTHmYcA9TYcJ9LpRyLNAi3AdqztikzK
	 HKeF+49RoRyiLq4o0Z5oP0Jj/VF8RBA5qoDKj3p3RGNSphI32RlNU3A28zWzHBgDH8
	 wGGVKP1a//AXpXSbTP1x6xRnM4TvWdXFz8WqtFFhRZeHIGqZZ6YfdWhVEmztbypJJq
	 4yHAtXn2jZaloSrClV/AgmLP8WWHBpFts20tkJKica757wSzrWczrajOoKCYu6PaiC
	 hiqFD3lTqOZ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA1240737;
	Sat, 24 Jan 2026 12:02:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A06BD358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AFDA40737
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_K_oWtN4TgE for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 12:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B630F405F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B630F405F3
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:02:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2544875B8; Sat, 24 Jan 2026 12:02:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 12:30:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93a91c7ae3c189055d9f5cdb61b2fbfde33d19c
X-Git-Newrev: 612c27c1918d1a199c0eb4df0a60ad9c72eb1dc6
X-Patchwork-Hint: ignore
Message-Id: <20260124120200.A2544875B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.23.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=612c27c1918d1a199c0eb4df0a60ad9c72eb1dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.samba.org/samba/history/samba-4.23.5.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 363c6c26eb..cc07b2527b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
-sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
+sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7976e9ae05..5d9eacef90 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.4
+SAMBA4_VERSION = 4.23.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
