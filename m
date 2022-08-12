Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB34C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 11:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1B9418EB;
	Fri, 12 Aug 2022 11:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1B9418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yp2zkAZp9Oa; Fri, 12 Aug 2022 11:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0584189B;
	Fri, 12 Aug 2022 11:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0584189B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E40881BF287
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 11:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC5F3610CA
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 11:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC5F3610CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmpbnWwh6XUN for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 11:25:54 +0000 (UTC)
X-Greylist: delayed 00:08:54 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8976108A
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C8976108A
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 11:25:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6F35C320046F;
 Fri, 12 Aug 2022 07:16:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 12 Aug 2022 07:16:58 -0400
X-ME-Sender: <xms:qTb2YuNnKeVWiBMONL4MYK5tkGBQXSeGbkbSMGx2jn8RMym8jxJhoA>
 <xme:qTb2Ys9JMa3PPacifwpfC1VR-qQfi3LPtR4oASUiu2BGv-HocSjdXg9V3Q-odx_OG
 hhQpl-NXR6kSofNsQo>
X-ME-Received: <xmr:qTb2YlS_gIrFQDDq8KTmYcOPsk5vAo4uTRYS7Z2iaAyU99HDtSa_5p7uxct-b3tPxnRZCXYHD8Gb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegiedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgr
 ihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqe
 enucggtffrrghtthgvrhhnpedufeevfeetheekledvfeejueeghefghfeileefveekgfek
 ledvhedvgeefhfdvheenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurh
 hoohhtrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrd
 hmvg
X-ME-Proxy: <xmx:qTb2YutaCiOH34DsYJLpHbq-Vjl-WG2hM2YKE2s5otuYxmxqhiTrEw>
 <xmx:qTb2Ymec_w_EgEY2XUNdbDnfynBldsM5SW6rixTSWowVM2g2F8MG_A>
 <xmx:qTb2Yi2-NHjynZPrr9jUeRNnUAv_nj_R3msJ0GFxvmVQ-hL6_7mXRA>
 <xmx:qTb2YqG4Gyf3GFuJcEukvlWFMKrSy6O_JplOXpl-eSBTz4lLATQmXg>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 07:16:55 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 21:16:51 +1000
Message-Id: <20220812111651.329130-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alistair23.me; 
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1660303017; x=1660389417; bh=iiiHPLSRXi
 AIk+0pYmuYPReoQNj8u7nzqC4Ry/ns5h0=; b=pUrMUnemM0q5BR/x9S0g3dmWdC
 nLaxliPL/UnIP36jnRveD9rnaQfiQDJWSU441OyqDpecH87BIGdmp7yoVjawf9vL
 eXuyv9xAubsr3en7KVu9MfGHiTsSeBd39SFFBtr6kJKgRGW7vJEs58krzTFslmYu
 h+1V1kgQhHUDbIr1MeT0zKohebBWypc9oZ1DfpGk5Rc3uboMjvgclzb25KNLt5yj
 LsEo+XDRbFz9AllFFZVKAlG6Iws2IeGrI/8Wwbav1SEeHJSd9AF6vODs9IROELRp
 2hob0GQeKFM9wQuBifmx3aS5EqwAJJ1IDeU1fj3sSdJT9RusoYy0WNw9kl1g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1660303017; x=1660389417; bh=iiiHPLSRXiAIk+0pYmuYPReoQNj8u7nzqC4
 Ry/ns5h0=; b=Eqv8KIKJB/QQORfMaJ4NJ9c4n8sTfyuqvtrHvo9DdnoxmJLRZoZ
 9ihtomIAwHAeasrD6B+CLoCg7Fw98qVxNSvzvc6TWqtAx10ntpT/e6YKe5TMKv/r
 w1iCJ1WVBKxe+yp202xM4GzBFXx9j4S8Jqba5U42O3rcHfYw4s9XszoGUA03cZ74
 GJaAxb5ouTj3hUtFKIk5M1V5Lr0fzywwYPjvvDZzvh+JX5Ut2JaGjHUesTaSrj+X
 nuWoHDfjdzkemPFWZUnPSUjIp4Z9N2cKKqwrSArrVttTgRONwE/kDryj2zrk2kjn
 eibmBlzlYuvoSSzcRY6Mi+dZVtHOQTt+6KQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=alistair23.me
 header.i=@alistair23.me header.a=rsa-sha256 header.s=fm1 header.b=pUrMUnem; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Eqv8KIKJ
Subject: [Buildroot] [PATCH v2] pine64_sopine_defconfig: Use mainline ATF
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

Fixes:
  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 configs/pine64_sopine_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
index 6fa511477c..f59f2387eb 100644
--- a/configs/pine64_sopine_defconfig
+++ b/configs/pine64_sopine_defconfig
@@ -7,10 +7,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
