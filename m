Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1DEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 15:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32AF54033C;
	Sat, 22 Jan 2022 15:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X033kpGyYlxL; Sat, 22 Jan 2022 15:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4874540319;
	Sat, 22 Jan 2022 15:05:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 863AF1BF391
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E0F6076A
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lexina.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0P0Adul208A for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 15:05:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.msync.work (mx.msync.work [IPv6:2a01:4f9:2b:2dc2::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83C6960648
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 15:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1125F272F3B; Sat, 22 Jan 2022 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1642863907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=pfeLa8S0eJhAHOkgBD8tb/iTKZ2TTRMff9g8GWxO34g=;
 b=poqUtagIURceoZ3pqQGP+hbsVqU6Pt/ZqxxzeZAit8w3kycq2FOywoevGbLx5hbQwqnqWq
 VePHpF/6nVNx6UlKv+sGUHA5cfRQBKHhtWD+K6EkSsiPbGUuPWn8wAjbZkWkwUfeGntpPw
 P9Lsy+obKwZmXYFJr7MF6QDguIRmtk0oExdaAQBbt6ru4dfSWsLxHvthzMPopu/pw0HgH0
 Mxn72fL7+ZxSyTZVPUNSJY3dKzHjt170sQbcBvQAn1UIq8T1RCiqKfYjc8u7PnwbzeEvd/
 qz+ovLS4J38Yjp33JlYoaSGFLAuBcQh0EXA7BDvsbq5AnTs+g0Fnr26z0vUwoQ==
Message-ID: <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
Date: Sat, 22 Jan 2022 18:05:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220118111457.2491318-1-adeep@lexina.in>
 <20220122143327.7d1a1cf7@windsurf>
In-Reply-To: <20220122143327.7d1a1cf7@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
From: Vyacheslav via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav <adeep@lexina.in>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

22.01.2022 16:33, Thomas Petazzoni wrote:
> Hello Vyacheslav,
> 
> [Arnout, Yann, Peter: question for you below.]
> 
> On Tue, 18 Jan 2022 14:14:58 +0300
> Vyacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:
> 
>> Firmware Image Package (FIP) sources to sign Amlogic SoC u-boot binaries
>> in LibreELEC, Armbian and meta-meson, buildroot.
>>
>> https://github.com/LibreELEC/amlogic-boot-fip
>>
>> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> 
> Thanks for this contribution. I have a few small details below. But
> apart from the small details: there is one very significant issue. The
> LICENSE file says:
> 
> // Redistribution and use in source and binary forms, with or without
> // modification is strictly prohibited without prior written permission
> // from Amlogic.
> 
> So how can the contents of this repository be useful? OK, then can be
> used locally for your own experiments. But for building an actual
> device that you can ship/provide to others, using the contents of that
> repository, because Amlogic does not even allow you to distribute the
> contents of this repository.
> 
> So I am wondering if it's really reasonable to package this in
> Buildroot.
> 
You already have package/odroidc2-firmware with same license.
amlogic-boot-fip just put all similar binaries together and Neil 
Armstrong made a build system for aml uboot binaries.

> Arnout, Yann, Peter: what do you think about this? See the license file
> at https://github.com/LibreELEC/amlogic-boot-fip/blob/master/LICENSE
> for the full text.
> 
> 
>> diff --git a/package/amlogic-boot-fip/Config.in b/package/amlogic-boot-fip/Config.in
>> new file mode 100644
>> index 0000000000..ceb09f8247
>> --- /dev/null
>> +++ b/package/amlogic-boot-fip/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_AMLOGIC_BOOT_FIP
>> +	 bool "amlogic-boot-fip"
> 
> Indentation is wrong here: it should be just one tab, but you have one
> tab + one space. Make sure to run "make check-package" and fix the
> coding style issues.
Thanks, i missed this.

> 
> Also, you need:
> 
> 	depends on BR2_TARGET_UBOOT
> 
> because this package depends on U-Boot being enabled.
> 
>> diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
>> new file mode 100644
>> index 0000000000..5d6dd237e3
>> --- /dev/null
>> +++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
>> @@ -0,0 +1,2 @@
>> +# Locally calculated
>> +sha256  cdf9d3872457c33a2755cc504f6b0560a62a6ee04437ac28e66623a345ed4936  amlogic-boot-fip-7ff0004e0e4d261ba81334a2f46302bd06704aca-br1.tar.gz
> 
> Please add the hash of the license file.
> 
>> diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
>> new file mode 100644
>> index 0000000000..6f646ae871
>> --- /dev/null
>> +++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
>> @@ -0,0 +1,37 @@
>> +
>> +################################################################################
>> +#
>> +# amlogic-boot-fip
>> +#
>> +################################################################################
>> +
>> +AMLOGIC_BOOT_FIP_VERSION = 7ff0004e0e4d261ba81334a2f46302bd06704aca
>> +AMLOGIC_BOOT_FIP_SITE = https://github.com/LibreELEC/amlogic-boot-fip
>> +AMLOGIC_BOOT_FIP_SITE_METHOD = git
> 
> Please use the Github macro. Replace the _SITE variable by:
> 
> AMLOGIC_BOOT_FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(AMLOGIC_BOOT_FIP_VERSION))
> 
> and drop the AMLOGIC_BOOT_FIP_SITE_METHOD variable.
> 
>> +AMLOGIC_BOOT_FIP_INSTALL_IMAGES = YES
>> +AMLOGIC_BOOT_FIP_DEPENDENCIES = uboot
>> +
>> +AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY
> 
> Please add AMLOGIC_BOOT_FIP_LICENSE_FILES as there is a license file in
> the repository (which contains the problematic clause)
> 
>> +AMLOGIC_BOOT_FIP_REDISTRIBUTE = NO
>> +
>> +AMLOGIC_BOOT_BINS += u-boot.bin.sd.bin
> 
> Just = instead of +=. But is this variable really needed? See below.
> 
>> +
>> +define AMLOGIC_BOOT_FIP_BUILD_CMDS
>> +    mkdir -p $(@D)/fip
>> +    cp $(BINARIES_DIR)/u-boot.bin $(@D)/fip/bl33.bin
>> +    cd "$(@D)"; ./build-fip.sh $(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)) $(@D)/fip/bl33.bin $(@D)/fip
> 
> Please use tabs for indentation. Is copying $(BINARIES_DIR)/u-boot.bin
> to $(@D)/fip/bl33.bin if it gets passed as argument to build-fip.sh ?
> 
> Would something like:
> 
> 	cd $(@D) && \
> 		./build-fip.sh \
> 			$(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)) \
> 			$(BINARIES_DIR)/u-boot.bin \
> 			$(@D)/fip
> 
> work ?
Seems to yes. It really can be improved. Thanks.

> 		
>> +endef
>> +
>> +ifeq ($(BR2_PACKAGE_AMLOGIC_BOOT_FIP),y)
> 
> Use:
> 
> ifeq ($(BR2_PACKAGE_AMLOGIC_BOOT_FIP)$(BR_BUILDING),yy)
> 
> so that this check is only done when building.
> 
>> +ifeq ($(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)),)
>> +$(error No board u-boot firmware config name specified, check your BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD setting)
>> +endif # qstrip BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD
>> +endif
>> +
>> +define AMLOGIC_BOOT_FIP_INSTALL_IMAGES_CMDS
>> +	$(foreach f,$(AMLOGIC_BOOT_BINS), \
>> +			cp -dpf "$(@D)/fip/$(f)" "$(BINARIES_DIR)/"
>> +	)
> 
> Why have a loop with a $(AMLOGIC_BOOT_BINS) if there's only one file to
> copy?

In some cases you may need more than one file. But you're right it's 
better this way.

> 
> Just:
> 
> 	$(INSTALL) -D -m 0644 $(@D)/fip/u-boot.bin.sd.bin $(BINARIES_DIR)/u-boot.bin.sd.bin
> 
> I would have fixed myself all those small details, but the
> licensing/redistribution restriction seems to be a major issue to me.

Thank you for sorting out the bugs. I'll fix them in the next version of 
the patch, if we come to a consensus on the possibility of using the 
license.

> 
> Best regards,
> 
> Thomas

-- 
Vyacheslav Bocharov
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
