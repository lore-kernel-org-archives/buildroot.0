Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBC2C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 22:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B0B60FED
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 22:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B0B60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A843483A8B;
	Wed, 28 Jul 2021 22:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxlmbHV1AXPS; Wed, 28 Jul 2021 22:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EE683A86;
	Wed, 28 Jul 2021 22:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D879E1BF37C
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 22:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D52CF4059F
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 22:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIYNl086UWjp for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 22:13:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F02DF40588
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 22:13:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 571DB89173; Wed, 28 Jul 2021 21:38:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 00:13:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbda38afbbfa79ff436e1a187bb267b8d9558036
X-Git-Newrev: 84582b4d6a0ce87ff284600f68fa35a0772a39b8
X-Patchwork-Hint: ignore
Message-Id: <20210728213854.571DB89173@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtomcrypt: use makefile.unix,
 brings pkgconfig support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=84582b4d6a0ce87ff284600f68fa35a0772a39b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change from makefile to makefile.unix:
  - brings pkgconfig support (libtomcrypt.pc will be installed)
  - remove NODOCS (legacy, not used anymore)
  - remove INSTALL_USER/INSTALL_GROUP (not needed for makefile.unix)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtomcrypt/libtomcrypt.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 35886057d4..fa2a585047 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -24,13 +24,12 @@ LIBTOMCRYPT_CFLAGS += -fPIC
 endif
 
 define LIBTOMCRYPT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f makefile.unix $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
 endef
 
 define LIBTOMCRYPT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
-		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
-		INSTALL_GROUP=$(shell id -g) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f makefile.unix \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
