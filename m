Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E76EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:42:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6034261037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6034261037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BFF9405A9;
	Tue,  3 Aug 2021 23:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FpUC_TF-K28; Tue,  3 Aug 2021 23:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3997D4051F;
	Tue,  3 Aug 2021 23:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 109321BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9AAC40F23
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5npdR_fiFNF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D90740EB1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B373686AA7; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 19:52:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b1b95e0770252d7ae87ed71f1254d8b7817ac154
X-Git-Newrev: d8f5a017b83265f96e154ac0e75ecb5a6fbdf8a5
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.B373686AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uboot-tools: concat
 files before passing to env image tool
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8f5a017b83265f96e154ac0e75ecb5a6fbdf8a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
as described in the help text.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b378ab65f4..a87956d028 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -156,11 +156,12 @@ endif #BR_BUILDING
 
 define HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE
 	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
-	$(@D)/tools/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
+	cat $(UBOOT_TOOLS_GENERATE_ENV_FILE) | \
+		$(@D)/tools/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
 		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
 		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
 		-o $(@D)/tools/uboot-env.bin \
-		$(UBOOT_TOOLS_GENERATE_ENV_FILE)
+		-
 endef
 define HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/uboot-env.bin $(BINARIES_DIR)/uboot-env.bin
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
