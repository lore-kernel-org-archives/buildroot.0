Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE71CCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 23:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 924714060E;
	Sun, 18 Oct 2026 23:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQelUEPpAcek; Sun, 18 Oct 2026 23:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A1EAF4060F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792366169;
	b=I/Z6AVSG0hrpE4l//nphfDp1+wqMvwPJfVeSZL6E1twGxxSnoMLcF/Bifw10Dxzxc9XF
	 /ricIDY2EEGLMXxYr7WhB9k4VAiFLAi0wGDY2jynhNUAN4BIKESJLTd9NUi2TgdLfaFe/
	 7BE+eXbOHSLL/ECkaovOJ8YsYMzzg96L6hx3fS6eWmsCWIlPJi45aS7idtOCofU7DfHPV
	 OhXXxzvSKQtJc9nwHNig7Uvzxsndxd3iakH24egAMwQgIE3llaNYemCGLLmYk6oV2a0DC
	 lavUbe5fsqjLzQbK9tjagN/MadJKwm3PpNBkWBb2RY23S+VGFaxxVxWd8UXKAVIpQRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792366169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6/oJkSoVf+TcN/39jQu6LpvwkH56wtvDDtJju/c9FSs=;
	b=PPH5rgLAvsBJkD4iWjymeYeJH0cCf/jvgEA9RvBYgT20bZAyB0aswV1+CWz+w1h/CuIW
	 rP6YqGT+eviBLMmkALMjR8w4+vISwoaOnR9yoA2ggaQYasJBDXCTNXv3wQm61yZqIEhtl
	 ItJ152KbMKwc4/p1Uh78OJTezCHn9eng/g1QFgkWvbRGUO2EI1SFqJ4IvOP/zhmCtWlUM
	 cw0b2UZD77MnRmYUnPdHQKmnax3Tcauvk55i89pExDD02RWBNcf2ZD3+GdJKD1KqFGQfj
	 RM5rGoLBf+op+7axaEg/ZMp/RqqrBB6hrP4Y5va7IJ+nZ127X00QSGmt5Dp7I6H8xTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792366169;
	bh=6/oJkSoVf+TcN/39jQu6LpvwkH56wtvDDtJju/c9FSs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=p5fuND3w6BD9fbbJ+HTtzVXlolXDBwvF6mai9WFIoPz19ln828XNy59GJLypIDPJ+
	 GdPrE8rF009yasc5XAn3ieUNHF84TLZfEuLLgEuxYV1miiUxVXLZaQ8aw0kIb/PceR
	 xLfaJqP0ZXb+suLbsKbPQ62Gg4EuAoHDL1mPuAIKvFtDGIZbFUx1pNrclUUAWF0DOu
	 CNyTY33LKjvbjkLmnOBfzEbiOE+TR9kmIS+JrbMnYQg3ZjKMdyC12+LQiCpTBwpApH
	 6HliHTaWwjcNWNJhSscSAXucGaG4UC2I+sNfOfoOR3y+gXb3WI7W4cQCSVmo+t3EkJ
	 gVxv2paLFaVeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EAF4060F;
	Sun, 18 Oct 2026 23:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C1362A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 23:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71BB46062C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 23:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmJCYJMcPU3s for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 23:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5461960606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792366166;
 b=POq+u2d9TRB7JEjJzpowYyy0DV0InoTsb91q/wCE+Iqjqr8iQX8IyDmBpoHESPKnkIkA
 oIMpbnRppANrB0gAOgFrFBZuuylOyoct8b9rVjVU4+mo5zqP2ZVkx+dd1WV8ZR584lTns
 BWrvAHsd9Mor1BfPF4o7QDhC3XxXnKFc7qZB3xMxyJNLHFamqleuVCD1PJvzxk9vptNLW
 wCvbjn0/aUBR+hw7bcnVWXMPcAIQlmINvlLZ23uRGPYq5ZnRzIZuvltUxNIfM0DuM6lK9
 J2Y/7oRTziq5cdOy8TkKIjuOX4w7IOe4OG6vGK9wHYdF66uPVRpxd9R0NIC6UzRmmTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792366166;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=eVAwVCJ6yQklJ6mPZAnsP6t+akw8LJCKzVqYMEd200w=;
 b=apvYyXLaFOax/s+8S07L4O3SDxVAldPa3f0aH4IPjUYY8+bXvgqyrFX9uhde3Gmf1Y2q
 8gfC0DRf+2pSGOANgRQCE4HhNra3lpwhBvXpTVavEbhXNMxeFQwkVJdZK/onn3cMWOogF
 HxZnwuTHSX4k2ZPG8gumwsBET1//+1grq91acL8EuorF/LteYB/hmqg9wEn4Um7CPPTgc
 y9gg62yt+p2QQjVX9sR8jZtu9PrwcGd1XNdGtNWq3t/t/t4R+X/VNnMy8qR9CiExEGs3m
 qrHFsgm2EKi4RQsVpsbio1TWB/L535FbA1OqdbW2mYotnLCVo7ZT7GtPDxog+zZhXYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=O7QfCH2O; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5461960606
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 23:29:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1wp2vn1LEC-00fzS1; Mon, 19
 Oct 2026 01:29:23 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 19 Oct 2026 01:29:15 +0200
Message-ID: <20261018232916.3896517-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FptI9F7b7tdPzMW72xwq0keiGFhMux83d4AJJSWGBxmzgsGLK5r
 X+Z9SI9lhEs1ODhLZTXSCefT9sFQC7p6UcJaU/BkA9xDTU8Framb+KUSBMqkgLnkulf+u+H
 FuSdcITKaNJMpkn7bUtWVrSAMdH+nVp7GvjSxRNoEMQeWexDhCItongX3wtMOHlKK7TrEgv
 3o8sRH3USl6/s4R54iRww==
UI-OutboundReport: notjunk:1;M01:P0:l4ZfOzFSyGM=;dhtJwb9GftJpdGAmD8zSvnldwAS
 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
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build without FIT
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
fix target FIT signature support") changed how options for FIT support
are written to include/generated/autoconf.h, removing the
unconditional "echo" call (possibly with empty arguments) that existed
before. Because of this, include/generated/autoconf.h was not created
when U-Boot was built without FIT support, making the build fail
because of the missing header. Add a "touch" to ensure the file is
always created.

Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 32fe9f1d7b..87b708ac5c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -31,6 +31,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
