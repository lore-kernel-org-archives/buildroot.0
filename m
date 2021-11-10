Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30DFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8177D61105
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8177D61105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5713B4041C;
	Wed, 10 Nov 2021 09:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8hgGT-0jfIV; Wed, 10 Nov 2021 09:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B110440413;
	Wed, 10 Nov 2021 09:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697871BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 426AC401FC
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmDb6Src-wrF for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BBB44021B
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C13C58B882; Wed, 10 Nov 2021 09:36:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 10:39:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c9e88120d9545696afd5ff20f6422542811e4e1
X-Git-Newrev: 7d653a7abd7f5e2fccb73343cb3f50ad0858bd0d
X-Patchwork-Hint: ignore
Message-Id: <20211110093634.C13C58B882@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rcw-smarc-sal28: don't override
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d653a7abd7f5e2fccb73343cb3f50ad0858bd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override RCW_SMARC_SAL28_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
