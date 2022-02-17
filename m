Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4595EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F4D61B82;
	Thu, 17 Feb 2022 15:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EucWMtx21UIM; Thu, 17 Feb 2022 15:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C1561B89;
	Thu, 17 Feb 2022 15:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8436F1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1CB40165
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPer7FoiPQAn for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:11:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B79D401B3
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:11:05 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4JzyvS2g50z9skw;
 Thu, 17 Feb 2022 16:11:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645110658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Itm+zJxNNmD1jseHbwGg6mGqza6vosbaiRy2tY8P4SI=;
 b=lJavl0MW0TwBTwtRFX0IXz5QmWXiIdFbCnwPqmUt/+cyTHxEWt1UNuYceAaj9G/HGWDrW2
 Z33zIGYh5MsBL7+PHKxeIMLnF0Is5dmcrS0lqc6em26JT0VYKUYKFGkqGt6/cNW03OqPzP
 JqSJR222J+OKIBdkoIWcSeijxR64pG3EElQoc4QvuSBXB80cv6v7y+DvjCPyr+hN4ivzXe
 R/+98ba/vW74vNqU09yvDVTdEaXkLJF1uZlDpcaohUvCFc/f323abX+H2AeI2nTgkvHsLz
 vxbptG8uzWRJC2MQfMjh8/FFlqTdhmCUCes4BlrBx2+b1QhB3FBlqPKkhlizQQ==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:10:53 +0100
Message-Id: <20220217151054.865073-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217151054.865073-1-marcus.hoffmann@othermo.de>
References: <20220217151054.865073-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/friendlyarm_nanopi_r2s_defconfig:
 uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following compile error:

In file included from include/bootm.h:10,
                 from tools/image-host.c:12:
include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~
compilation terminated.

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 configs/friendlyarm_nanopi_r2s_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 818c847f4b..ce252a5d76 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
