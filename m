Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6978C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768A961100
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 768A961100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D54C404AD;
	Sat, 11 Sep 2021 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMIwaB1TyLHj; Sat, 11 Sep 2021 20:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74FB14049E;
	Sat, 11 Sep 2021 20:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C94C01BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B68FF402A4
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYfvSCB8jQ2q for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D44534029A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1B6F38A258; Sat, 11 Sep 2021 20:57:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:53:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eec9cfb310a824c56f87c390235933bd5eb50de7
X-Git-Newrev: 291eb252ac3d64365bf08992bb7eb38b3cfb8f8f
X-Patchwork-Hint: ignore
Message-Id: <20210911205709.1B6F38A258@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: copy ATF bl31 binary to uboot
 package dir
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=291eb252ac3d64365bf08992bb7eb38b3cfb8f8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the ATF binary is used by U-Boot, the file is expected to be in the
toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4f3c9b7c3a..1a840d9cc1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -162,8 +162,16 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
+define UBOOT_COPY_ATF_FIRMWARE
+	cp $(BINARIES_DIR)/bl31.elf $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 else
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
+define UBOOT_COPY_ATF_FIRMWARE
+	cp $(BINARIES_DIR)/bl31.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
