Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C145EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8EA81DEA;
	Sun,  2 Jul 2023 13:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8EA81DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbWTp7FSdiPE; Sun,  2 Jul 2023 13:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5428C81DE3;
	Sun,  2 Jul 2023 13:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5428C81DE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 335E21BF321
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 13:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B5041477
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 13:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B5041477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RoVS8rCUvgoh for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 13:45:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E994137D
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08E994137D
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 13:45:15 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id E2BA4A0670;
 Sun,  2 Jul 2023 15:45:13 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id C764FA03C2;
 Sun,  2 Jul 2023 15:45:13 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id D0F54C009A;
 Sun,  2 Jul 2023 15:45:12 +0200 (CEST)
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Date: Sun, 02 Jul 2023 15:45:12 +0200
Message-ID: <5948002.lOV4Wx5bFT@kilian-aisec>
In-Reply-To: <12237337.O9o76ZdvQC@kilian-aisec>
References: <mailman.173.1688221173.139798.buildroot@buildroot.org>
 <c623c8d67b9f9af6423b719d812c6e1f@umbiko.net>
 <12237337.O9o76ZdvQC@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1654
X-purgate-ID: 154282::1688305513-A7FFBC09-E9AD26CE/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688305513;
 bh=CuTEQMDZteQv+dPCOXlGSbA3BQAjIiKncfHO5mX2Tuw=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=bX/i8hAtIPqS4iEXdUu2FQa5SH0O9YrUOCEUoLhGLv0hhBcAes908SHugZw33gf46
 DFDlzKPLqq7h4K6bvCr2BqwbLWATT6KUvnYa+DQBb+jGHUw7wiybwpU1uw1pmCDgME
 l2zXajt0sUg6ZvYRjonLJy1GtojZvphOd6OXc+n1xGkLVixwujU5NHTzcy3uFSEYLX
 Q+7wb8NLgjGeWIRlS7Fk0jixQ2bL3A8QpIDpKXzdKCRVd8Wvs9Prh8UzkNQM/lAPZH
 CTRT/N7UuCcvP3ykYUIomz9hPckeLjiYvD7HeafAxpZ1+EHBYT+PYbhlEwyXzs7Sq5
 OgEZJEN9IicaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=bX/i8hAt
Subject: Re: [Buildroot] [PATCH 1/3] package: add rockchip-rkbin package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

I just saw that I sent the old defconfig again, whithout the change. Here is 
the change for the rock5b_defonfig:

============

From cb8212a41f9e41829de44dfe82cda1d5185985a6 Mon Sep 17 00:00:00 2001
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sun, 2 Jul 2023 15:40:10 +0200
Subject: [PATCH] configs/rock5b_defconfig: Change uboot rkbin files

Use the BR2 variables to define the actual rkbin files which u-boot
shall use during build. This way changes made via menuconfig in any
of those files in the rockchip-rkbin package are properly
propagated to the u-boot build.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 3c814bf356..65893f7501 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/rk3588_bl31_v1.38.elf 
ROCKCHIP_TPL=$(BINARIES_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/$
(BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_EL3FW) ROCKCHIP_TPL=$(BINARIES_DIR)/$
(BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_DDRFW)"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.34.1

============

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
