Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C23C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682C161BAA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 682C161BAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399FA60758;
	Wed, 17 Nov 2021 15:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KB4MjzyrcdkN; Wed, 17 Nov 2021 15:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D7F60703;
	Wed, 17 Nov 2021 15:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4711BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44AF240494
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyhQaZMVX3vR for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 818F8404A9
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1B2208D479; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:03:04 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: ca4ef6b4fe8382b3e7194008affddbbe290db665
X-Git-Newrev: 384f34e1df41ac13a27b42cd4932b5e0c91f27c8
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.1B2208D479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/rcw-smarc-sal28:
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

commit: https://git.buildroot.net/buildroot/commit/?id=384f34e1df41ac13a27b42cd4932b5e0c91f27c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override RCW_SMARC_SAL28_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d653a7abd7f5e2fccb73343cb3f50ad0858bd0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
index 4928f1a7f8..2bc740027f 100644
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
