Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFA6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A4460E9B
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0A4460E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB6F403C1;
	Tue, 14 Sep 2021 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ehbRku-xMPu; Tue, 14 Sep 2021 19:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02848403B0;
	Tue, 14 Sep 2021 19:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 909B41BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 800DA403B0
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJ_wVFa_DT8U for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:36:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D5D403AB
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2A0618B392; Tue, 14 Sep 2021 19:34:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 21:36:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 200e6b014254ccd97affe63e5a8ddb49d4728ffd
X-Git-Newrev: 3af9c55de08bf0650ed10c1e1ac7b37fd15f6ef6
X-Patchwork-Hint: ignore
Message-Id: <20210914193437.2A0618B392@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix hook to copy imx firmware
 files
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

commit: https://git.buildroot.net/buildroot/commit/?id=3af9c55de08bf0650ed10c1e1ac7b37fd15f6ef6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Simplification has broken it. Fix it again.

Fixes: af99e7a5f3863049 ("boot/uboot: copy IMX firmware files to uboot package dir")

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 184f822af4..2eb1792de9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,7 +194,7 @@ define UBOOT_COPY_IMX_FW_FILES
 		cp $(BINARIES_DIR)/$(fw) $(@D)/
 	)
 endef
-UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
