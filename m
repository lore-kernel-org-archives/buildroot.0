Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E47AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6713610C8
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6713610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E7F940886;
	Fri, 22 Oct 2021 11:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEx2ueZZ8_zO; Fri, 22 Oct 2021 11:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA9F408A3;
	Fri, 22 Oct 2021 11:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9379D1BF57B
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EF90401B7
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6RmjpLLYjT9 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 11:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09D43400BD
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 11:51:37 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6AEBC24000F;
 Fri, 22 Oct 2021 11:51:35 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 13:51:31 +0200
Message-Id: <20211022115134.345595-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022115134.345595-1-kory.maincent@bootlin.com>
References: <20211022115134.345595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/5] boot/grub2/grub2.mk: remove the
 unnecessary \-continuations
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
Cc: aduskett@gmail.com, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch cleans the code by removing unnecessary \-continuations.
It replaces the semi-colons by separate lines and uses && not semi-colon.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index a18696b6cc..e72a91d21a 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -149,8 +149,8 @@ HOST_GRUB2_CONF_OPTS = \
 
 define GRUB2_CONFIGURE_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
-		mkdir -p $(@D)/build-$(tuple) ; \
-		cd $(@D)/build-$(tuple) ; \
+		mkdir -p $(@D)/build-$(tuple)
+		cd $(@D)/build-$(tuple) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(GRUB2_CONF_ENV) \
@@ -178,7 +178,7 @@ endef
 
 define GRUB2_INSTALL_IMAGES_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
-		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple))) ; \
+		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple)))
 		$(HOST_DIR)/usr/bin/grub-mkimage \
 			-d $(@D)/build-$(tuple)/grub-core/ \
 			-O $(tuple) \
@@ -186,11 +186,11 @@ define GRUB2_INSTALL_IMAGES_CMDS
 			-p "$(GRUB2_PREFIX_$(tuple))" \
 			$(if $(GRUB2_BUILTIN_CONFIG_$(tuple)), \
 				-c $(GRUB2_BUILTIN_CONFIG_$(tuple))) \
-			$(GRUB2_BUILTIN_MODULES_$(tuple)) ; \
-		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple)) ; \
+			$(GRUB2_BUILTIN_MODULES_$(tuple))
+		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple))
 		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
 			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
-				$(BINARIES_DIR)/grub-eltorito.img ; \
+				$(BINARIES_DIR)/grub-eltorito.img
 		) \
 	)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
