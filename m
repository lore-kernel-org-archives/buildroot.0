Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7EEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:11:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6830060FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6830060FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C40540384;
	Wed,  4 Aug 2021 11:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynPELMHQjdPt; Wed,  4 Aug 2021 11:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1D140696;
	Wed,  4 Aug 2021 11:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 637501BF327
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 507A160685
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fi84eE2aNbv1 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C9E460650
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2410C8B4B0; Wed,  4 Aug 2021 11:10:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 12:59:47 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 957bd21bc611ed188eb593c9f81b50984222b92c
X-Git-Newrev: 4e8fda0f37a94403916734f5988cbbb67ad92f77
X-Patchwork-Hint: ignore
Message-Id: <20210804111056.2410C8B4B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/uboot-tools:
 concat files before passing to env image tool
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e8fda0f37a94403916734f5988cbbb67ad92f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
as described in the help text.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d8f5a017b83265f96e154ac0e75ecb5a6fbdf8a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 8963d6182e..4d1fc46e25 100644
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
