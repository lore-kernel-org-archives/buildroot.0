Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2212EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5BB613AA;
	Fri, 13 Feb 2026 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIWXYRu8UoxF; Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EEE613AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011342;
	bh=C573Ms7ioZgcH2KOoe2/ifDJOOdg2LUnafw3DucxyUU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRGf7ERS+g1zPKD9hvMZ3lXvtAbQOa+wWnr3Bn5klGGlyFPKxvR1Y4r3TNU56twmL
	 tiVVP8c3ZIbdKqxtM8G43NS9qxEVqU7ysgCuG1vjxojwbTgzFTHwxn5xZM+ulnBce+
	 RQDeaEjvNHdUbj+icrSwGNkbpVngk7mUlNLEPqNKZFmYRTlNP7NoTwxeKr6k1Pd/Ih
	 vzvluL89fvckABI7DEKLFBBqhXbFxe3XbOYxxAyAs0H7hv1EfxpDGQOsaHGcFJ+g+I
	 IKCJ+ks9UpIkBmHDEG84I7ayECr9d6fmjspCRSlsYWrRWuX3mNeRcsEgy/obFP23F9
	 t6fYGMre1y8rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EEE613AF;
	Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E33B31F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A2F41298
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU7YaGoFHtZr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFE74035F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DFE74035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 531F282B68; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:33:30 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: acce5714ed12b34b8673ae0e03e6d2dc0b073e21
X-Git-Newrev: ac673c6bbbddecece6e3422c4633af8751a73780
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.531F282B68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpir: use working
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac673c6bbbddecece6e3422c4633af8751a73780
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
