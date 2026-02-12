Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C301DEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D6084732;
	Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6WvlomvBvfe; Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D0E84739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011471;
	bh=S6hlWVENZDaCipIQpA+qVHFXtEbArlM7NjEiKODeJ3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pqnqzX0rxHmfy/Ug4IoJEFeEYL4ePagh+yZhsXBZecHZ9tq5ZBQt2yQo/UARefP5A
	 6rFd/rtZzJeK0TIufqFaFyts2B7nPsePSpYPr0V4dfCnMglj2SfUdGKLRlR0hql/2Z
	 GWOS/QqGOX1gcj4tL3fcSsR0L86cBfy0nLB4DgCWAPrgPAE+xuOAIi5IsZfHHsDIFc
	 kUFP73sg2T2xqjABgthbo5pNd8Pz5khRZyD4ME/76SBUIMaI5h14Dzuhuw6h0fT9zi
	 cPZ42qkme+KEqkz9oPtTzeSxAv7Cof7Iv3QEfK3/7lizs9Geep0XK9LhhEBsd2S0sS
	 9cAL8GjOF3vlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D0E84739;
	Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16735283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0563B41336
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YY6ZKIk9JuVY for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 398A040380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398A040380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EA2983593; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:33:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: bf3867231e97c4c034b4fff192e7bdff9e1763bf
X-Git-Newrev: 734694ada127c9b9e2f4fe4020174c1452d951bd
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.2EA2983593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mpir: use working
 upstream site
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/734694ada127c9b9e2f4fe4020174c1452d951bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Update project URL and _SITE as the previous site is no longer
available, see: https://github.com/wbhart/mpir/pull/298

Fixes:

  https://autobuild.buildroot.net/results/7e961af4261a6c883d0b5c37e2ebf20c632f842f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f45bec1edfc684e9fa0506903b2bf882d16ddb47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpir/Config.in | 2 +-
 package/mpir/mpir.hash | 2 +-
 package/mpir/mpir.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mpir/Config.in b/package/mpir/Config.in
index da4cc9f44e..b22350b23b 100644
--- a/package/mpir/Config.in
+++ b/package/mpir/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_MPIR
 	  MPIR is a highly optimised library for bignum arithmetic
 	  forked from the GMP bignum library.
 
-	  http://www.mpir.org/
+	  https://github.com/wbhart/mpir
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
index 71d0c19d12..3b1b3e877d 100644
--- a/package/mpir/mpir.hash
+++ b/package/mpir/mpir.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
+sha256  86a5039badc3e6738219a262873a1db5513405e15ece9527b718fcd0fac09bb2  mpir-3.0.0.tar.gz
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 46cd35e436..87bf8247a5 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 MPIR_VERSION = 3.0.0
-MPIR_SITE = http://www.mpir.org
-MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_SITE = $(call github,wbhart,mpir,refs/tags/mpir-$(MPIR_VERSION))
 MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
@@ -14,6 +13,9 @@ MPIR_DEPENDENCIES = gmp host-yasm
 # 0002-Fix-configure-failures-with-Xcode12.patch
 MPIR_AUTORECONF = YES
 
+# We don't care about the documentation
+MPIR_CONF_ENV = MAKEINFO=true
+
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
