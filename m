Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53E9FF886C
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 08:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E978D411AE;
	Tue, 28 Apr 2026 08:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ov0MvTvTlgad; Tue, 28 Apr 2026 08:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA83409FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777365891;
	bh=6oeuuLNw5IFXoYIHT8tzceaS7dn338nQxL057QVhB3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JjQ8UR46cVwm/jz7UPoHFQ8y0mZGejEMw/h1tIRpNZ1nsrzvsqG68b7O4868pjG6Q
	 eqMxXdCfOZeFHaoJ43FUGtPuJnNB86U8apL23RMEvRAJ0arZbHvGP3SN7GXpja028h
	 VBYGFIy7JqrvkCGqitx5CWu8rm9jfJrx+s/wR1AvP3zIGLIR6mmKHvU9VL54rYQhnC
	 Q9DBss12bZJxA0Fn+wpeJNuod5m82uJoA62d6hldyz/3QH4wSwDhNxzgJCdePMBE/8
	 TOnjbqWHCbeXiUPGQht7qPL+9WkgY1zDvHyPRysyMI1zuQ6s/bxIhci4XOR0Mnr1Gc
	 RvCCmbXuO6O1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA83409FE;
	Tue, 28 Apr 2026 08:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9EC1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C81404ED
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lcm06cO4MIt for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 08:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7814048C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7814048C
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:44:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C5F583845; Tue, 28 Apr 2026 08:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 10:37:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a48ede9c2f7378b1e091057ed5bf025965a4cb76
X-Git-Newrev: 3590862c9cc33a5920c05d9db948ff1d1334bce1
X-Patchwork-Hint: ignore
Message-Id: <20260428084449.1C5F583845@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.13.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3590862c9cc33a5920c05d9db948ff1d1334bce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_13_5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index f4c81bbe4c..c01bcd8f1b 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.4
-sha256  4a7ef278b39d031b9ec524c0778d24bdb3e761940ed368060b54594f15559537  ccache-4.13.4.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.5
+sha256  7a8945f4ac7d4bb79c0055cd3db7857a6934c2b7ab3d80bb11a0f5271e36fd94  ccache-4.13.5.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 744d962abc..74fa2fbf90 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.4
+CCACHE_VERSION = 4.13.5
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
