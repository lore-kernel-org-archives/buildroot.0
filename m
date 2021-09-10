Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA0FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F0E6120E
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95F0E6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719366067D;
	Fri, 10 Sep 2021 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3VRQg8eM13s; Fri, 10 Sep 2021 21:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E111461BA3;
	Fri, 10 Sep 2021 21:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E56681BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D129F80F21
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuEJsIJ1iI2o for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C9780F19
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 05F4D88EAC; Fri, 10 Sep 2021 21:32:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 23:00:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088cf29f135d05cb07ed3c4870e1c38d2c7a5f53
X-Git-Newrev: 0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9
X-Patchwork-Hint: ignore
Message-Id: <20210910213231.05F4D88EAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: enable for
 BR2_aarch64
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4494772684542392670=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============4494772684542392670==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bayer2rgb-neon/Config.in         | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
index 8fd18b4fa9..7822171020 100644
--- a/package/bayer2rgb-neon/Config.in
+++ b/package/bayer2rgb-neon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BAYER2RGB_NEON
 	bool "bayer2rgb-neon"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index a483890c81..212fe76766 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -13,6 +13,12 @@ BAYER2RGB_NEON_INSTALL_STAGING = YES
 BAYER2RGB_NEON_DEPENDENCIES = host-pkgconf host-gengetopt
 BAYER2RGB_NEON_AUTORECONF = YES
 
-BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"
+BAYER2RGB_NEON_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_arm),y)
+BAYER2RGB_NEON_CFLAGS += -mfpu=neon
+endif
+
+BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(BAYER2RGB_NEON_CFLAGS)"
 
 $(eval $(autotools-package))

--===============4494772684542392670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4494772684542392670==--
