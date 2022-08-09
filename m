Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06685C25B06
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9444B81A3B;
	Tue,  9 Aug 2022 11:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9444B81A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vetUx2jwm2Sc; Tue,  9 Aug 2022 11:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E4281A33;
	Tue,  9 Aug 2022 11:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E4281A33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C344A1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7872E408A6
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7872E408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8QfhoYrIhgB for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:40:48 +0000 (UTC)
X-Greylist: delayed 00:06:59 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E904089B
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42E904089B
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:40:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E25935C007B;
 Tue,  9 Aug 2022 07:33:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Aug 2022 07:33:46 -0400
X-ME-Sender: <xms:GkbyYnSWbpucrpLwpNYa1anRgi2URSRzuvNvH7AdccuU2S-zYJBFXg>
 <xme:GkbyYoxjKBwblLVqKgpeDVeP9NDjmIiB-HsFbG5g906rSZLnYuNKDDu8eP7jSBF0m
 foU6z2cUSkj_rd2Fss>
X-ME-Received: <xmr:GkbyYs2CEmvcH31_-445YFPJt_fan6078oRAEEBZhv5A-D4DsD2a4vA1-OrfAByZZdwi95rpaCke>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegtddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgr
 ihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqe
 enucggtffrrghtthgvrhhnpefgieejjeehteeggfeuuefgtddugfegteeuuedvudevkeek
 ueekfeeufeegjeetgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegr
 lhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:GkbyYnBLRdiv5vga6it30KFN6DKmpFAYTnW1VzFKlyK1MLOTToQTHg>
 <xmx:GkbyYgiDyz5q7SuXzvCaEHVQ_RuX5Cs-2bEk7orf-hZ5FoVppBjNDw>
 <xmx:GkbyYrqWptDMOLyT0T5A78Bi9j5WeSXVNGWWy3X_8ZNjvul-qv6mag>
 <xmx:GkbyYsZUUH1NkUyTRLf-z3DeffOrRrtajw3BEdpdN43_pg3NcZkc3g>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 07:33:45 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 21:33:29 +1000
Message-Id: <20220809113329.249779-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alistair23.me; 
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1660044826; x=1660131226; bh=52FxlJVOBg
 vWomCG2+DU6l4IGE4GVNwOHV4Q9yuRznc=; b=HOgCZsNjXSih/X5P/xUuHg6Nj5
 Rva8wAu96h4RSvRXMaonJIdoZUsv9eojGAq1QftfPNrtVycbDBhTBsY39GRSUfdH
 urLHypJtPnPhU877KkXSWOtl1SuNRErCdd9lb9rNKsnVbpEd47T+n3B3K0MlpMoc
 yrsho7aGYCsxFtClhuqDy877VoyasQZddUGIlZtmkERfdZsUQ6Y0k16475US+AhL
 poXDg1qP54aBL/h9yOY+m5LWdGMEGNR/7h0d3uxTEORu8Uv3VKGmmbawTKKuliqC
 x8orHggRYHwVkdRL0IUbNHS7OL/lLvDjFZ5ZK5Az+5OUNIUPsJPzYyxqWDZg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1660044826; x=1660131226; bh=52FxlJVOBgvWomCG2+DU6l4IGE4GVNwOHV4
 Q9yuRznc=; b=dJrc8RiLx49c7z2BhT03ap0N/pDpl3qHp1D90a8nRoqXIloDKQQ
 GVyEm+XCtIrCh9IkDwd7xaNfqAEW0WC8CY/5gOrN6RKQdOq9OsNa6/aXMs74ovik
 7j6FIappEVggy6OFgtepN+HsnDjF4gDUW/A3JZbpbjvG4b8VnyMJj8JN8rnCRinH
 y37MyLL0OT2IN8X3ERDNvvl2u5KLL8CbgFYvxcbzhyesrYx0jqO1J4nTBSuHWgrt
 mxKCf16udxBWmqu2d+qAlAXqh5XWfHcjWkz2NEYpSfTbmCQrRESyVgpR9lNi3DCe
 KzJOnFMBI6HcVDNjB64u+gAPp5+xMg4n0NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=alistair23.me
 header.i=@alistair23.me header.a=rsa-sha256 header.s=fm1 header.b=HOgCZsNj; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dJrc8RiL
Subject: [Buildroot] [PATCH] pine64_sopine_defconfig: Use mainline ATF
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the mainline ATF as it supports the Pine64 SoPine module.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 configs/pine64_sopine_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
index 6fa511477c..2295c9338d 100644
--- a/configs/pine64_sopine_defconfig
+++ b/configs/pine64_sopine_defconfig
@@ -7,10 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
