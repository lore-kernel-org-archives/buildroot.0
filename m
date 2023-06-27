Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71D2EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 07:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447DF820E0;
	Tue, 27 Jun 2023 07:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447DF820E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZ3XykotDytw; Tue, 27 Jun 2023 07:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D40E82090;
	Tue, 27 Jun 2023 07:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D40E82090
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C15FE1BF2B8
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ADDB60C15
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ADDB60C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoxyf-DMyfIs for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 07:28:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5478A60C01
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5478A60C01
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:28:11 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 62AE2A0388;
 Tue, 27 Jun 2023 09:28:09 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 45E83A03C2;
 Tue, 27 Jun 2023 09:28:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id A3544C004F;
 Tue, 27 Jun 2023 09:28:08 +0200 (CEST)
To: buildroot@buildroot.org, giulio.benetti@benettiengineering.com,
 Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jun 2023 09:28:08 +0200
Message-ID: <12234290.O9o76ZdvQC@kilian-aisec>
In-Reply-To: <898ad257-a549-95e2-44ae-898a9db5c4b8@mind.be>
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <2685852.mvXUDI8C0e@kilian-aisec>
 <898ad257-a549-95e2-44ae-898a9db5c4b8@mind.be>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3776
X-purgate-ID: 154282::1687850889-B4FFDC09-3BE72EA5/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1687850889;
 bh=djkF/WKciFNP+OIvnSX9T67eZKMqnpH5dqdirbzqgvw=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=I4XbVe29PZpuf1U9vi4K1bTPP8gCVKdxFOXEfeuAplc3p7f6d7Dm0btra9FGS/FnL
 KlgDOs+iWbk6qvC0UR7bUcQPc6gHS+Yhf8Z5kyWXLVpf3A8k/R2cUBPtgwgcbiDeuF
 Igze/fPq20qYJMzt0Fcw+78FuW58F1o5tytbJn/R9OeTXKXnH7IIwMg5s83b08zUgc
 kJ/3yn/vp88j8cfgUk13EiUEOkvoRoKOu45gI8yfvGew+hDUKag4VsANDlY5emH4sP
 x6Ph6pgZaDLC1KsivNnm1cavqfASrF3lexpgynmaSssYtNylB9Dku579BMiTdJxT9E
 hhbsrD9UVDrAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=I4XbVe29
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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

Hello Arnout,

>   All the variables have to be ROCKCHIP_RKBIN_ otherwise they don't get
> used.

thanks alot! I actually knew that the names should match from reading the 
documentation, however for some reason I still got i wrong. Maybe because I 
was taking the firmware-imx makefile as basis and didn't take enough care ...


Thanks to your help I now got it working, that the rkbin is properly 
downloaded. I implemented the makefile such, that the needed binaries are 
copied into $(BINARIES_DIR), i.e., buildroot/output/images. I don't know, 
whether this is best practise? I also adjusted the uboot settings in the 
buildroot board defconfig, so that uboot uses the binaries from rkbin. Building 
uboot works now, when manually running "make rockchip-rkbin-dirclean rockchip-
rkbin-rebuild" and afterwards "make uboot-dirclean uboot-rebuild". I could not 
test it any further yet.

Here are my uboot relevant defconfig settings:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
BR2_PACKAGE_ROCKCHIP_RKBIN=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/rk3588_bl31_v1.38.elf 
ROCKCHIP_TPL=$(BINARIES_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
BR2_PACKAGE_ROCKCHIP_RKBIN=y


And here patches to add the rockchip-rkbin package:


diff --git a/package/Config.in b/package/Config.in
index ad438667d2..ccdec3b49d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..be106a6bb0
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip RKBIN binary blobs"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Those packages provide binary blobs for the Rockchip RK
+          SoCs.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+choice
+	prompt "Rockchip RK platform"
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
+	bool "rk3588"
+endchoice
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM
+	string
+	default "RK3588" if BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
+
+endif
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/
rockchip-rkbin.mk
new file mode 100644
index 0000000000..5bdc5607ce
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# firmware-rk
+#
+################################################################################
+
+
+ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+
+ROCKCHIP_RKBIN_INSTALL_STAGING = YES
+
+define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
+	cp $(@D)/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin $
(BINARIES_DIR)/
+	cp $(@D)/bin/rk35/rk3588_bl31_v1.38.elf $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))


I guess I should no setup uboot such, that rockchip-rkbin becomes an optional 
dependency and then set the corresponding option in the buildroot rock5b 
defconfig?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
