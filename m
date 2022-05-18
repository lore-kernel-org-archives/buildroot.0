Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C920C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 08:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3E641A58;
	Wed, 18 May 2022 08:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xM2JKBiVb1jU; Wed, 18 May 2022 08:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD97741A3A;
	Wed, 18 May 2022 08:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF7741BF3B9
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 08:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE50B83EAF
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 08:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EHjWmogKzEL for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 08:26:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81D0B83E40
 for <buildroot@busybox.net>; Wed, 18 May 2022 08:26:19 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 56BCC44041F;
 Wed, 18 May 2022 11:25:08 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652862308;
 bh=TAGrCgUX9tLomEy56KRv/5g5X3WWt41IL4XNclniRo8=;
 h=From:To:Cc:Subject:Date:From;
 b=L43RpPCiSOIGGx1NURjSqpvUEYqwKS/yabhPRGyo9S1hIucllUkFJWbqaLnUBo7Tt
 ajMBbAZbIJa+W5kp+M/qrRLT9CjujMLDeiHl9fWRqMdpBKjPxVIIb8oeCKi2nc4S1+
 kOPC2kVBteruh72IKXAMzsKZQ3MvGlaiy68cRzFXVMp/SqxtANEAk/0WqvYzh2jUNx
 HWDTBcnyh2btVHysho5nc963z0llhxtfjvMPg30bY4/gIgBhuRRnERC6KCik58Cita
 +hW34bBiJQT5ZT+09tTPAPtXmExmdjBoz0Zd/hoB0nKyD5R2FHlk6gWyL0oJKvvWpb
 XjF260AlkjdWg==
To: buildroot@busybox.net
Date: Wed, 18 May 2022 11:26:00 +0300
Message-Id: <dd41c88b74f3fdf0e67996c5fc999af7a4122c91.1652862360.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libnftnl: remove json support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

JSON support and the jansson dependency have been removed in version
1.1.2.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnftnl/Config.in   | 10 ----------
 package/libnftnl/libnftnl.mk |  7 -------
 package/nftables/nftables.mk |  4 ----
 3 files changed, 21 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 347223ce22a0..0d17751e5092 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -13,13 +13,3 @@ config BR2_PACKAGE_LIBNFTNL
 	  currently used by nftables.
 
 	  http://netfilter.org/projects/libnftnl/index.html
-
-if BR2_PACKAGE_LIBNFTNL
-
-config BR2_PACKAGE_LIBNFTNL_JSON
-	bool "enable JSON support"
-	select BR2_PACKAGE_JANSSON
-	help
-	  Enable JSON parsing support
-
-endif
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 616afa630720..7ba1158154d9 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -12,11 +12,4 @@ LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
-ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
-LIBNFTNL_CONF_OPTS += --with-json-parsing
-LIBNFTNL_DEPENDENCIES += jansson
-else
-LIBNFTNL_CONF_OPTS += --without-json-parsing
-endif
-
 $(eval $(autotools-package))
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 232d54148868..a64c36094ec1 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -42,10 +42,6 @@ else
 NFTABLES_CONF_OPTS += --disable-python
 endif
 
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
-NFTABLES_LIBS += -ljansson -lm
-endif
-
 NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
 define NFTABLES_LINUX_CONFIG_FIXUPS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
