Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C028C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A080260EE2
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A080260EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7834660781;
	Sat, 23 Oct 2021 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X52HxH6M8uTS; Sat, 23 Oct 2021 22:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D034260839;
	Sat, 23 Oct 2021 22:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB3D1BF958
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3593E81A64
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrqTI8uwVhy9 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5834381A3B
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 373428851A; Sat, 23 Oct 2021 21:57:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 22:41:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e077b3997c0a1aabe4bec8fe9068aaed5f899fca
X-Git-Newrev: 7edf28468d0299e685e13c95d00b26e1a4ab5791
X-Patchwork-Hint: ignore
Message-Id: <20211023215739.373428851A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: remove the unnecessary
 \-continuations
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7edf28468d0299e685e13c95d00b26e1a4ab5791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch cleans the code by removing unnecessary \-continuations.
It replaces the semi-colons by either && or separate lines.

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
