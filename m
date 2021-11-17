Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFF1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B641A61B95
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B641A61B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892E040483;
	Wed, 17 Nov 2021 15:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enEv_jzVPLhO; Wed, 17 Nov 2021 15:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACCE94048E;
	Wed, 17 Nov 2021 15:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BCBC1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD106606C5
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozWM2ducOzRk for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5434160679
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E310F8D45D; Wed, 17 Nov 2021 15:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:02:59 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d0222b4e8957e83fdb1b7900d2ca737302845f88
X-Git-Newrev: 04c5b72118e08eb4039729f856d948397ee2f5bc
X-Patchwork-Hint: ignore
Message-Id: <20211117150119.E310F8D45D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/rcw-smarc-sal28:
 don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=04c5b72118e08eb4039729f856d948397ee2f5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override RCW_SMARC_SAL28_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d653a7abd7f5e2fccb73343cb3f50ad0858bd0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
index 0dce543811..c2961b1311 100644
--- a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
@@ -14,7 +14,7 @@ RCW_SMARC_SAL28_INSTALL_IMAGES = YES
 RCW_SMARC_SAL28_BOOT_VARIANT = $(call qstrip,$(BR2_PACKAGE_RCW_SMARC_SAL28_BOOT_VARIANT))
 
 ifeq ($(BR2_PACKAGE_RCW_SMARC_SAL28_BUILD_UPDATE_SCRIPT),y)
-RCW_SMARC_SAL28_DEPENDENCIES = host-uboot-tools
+RCW_SMARC_SAL28_DEPENDENCIES += host-uboot-tools
 define RCW_SMARC_SAL28_UPDATE_SCRIPT_BUILD_CMDS
 	MKIMAGE=$(HOST_DIR)/bin/mkimage $(MAKE) -C $(@D)/contrib all
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
