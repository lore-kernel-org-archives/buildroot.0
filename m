Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D83EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 07:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F2E81E9D;
	Fri, 14 Jul 2023 07:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F2E81E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWxoHfut3Z3s; Fri, 14 Jul 2023 07:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465FE81E8E;
	Fri, 14 Jul 2023 07:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465FE81E8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67EB1BF419
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 07:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0670416F4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 07:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0670416F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuB6WWUdPOKz for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 07:03:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CFB9416F3
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CFB9416F3
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 07:03:55 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 92DA3A042E;
 Fri, 14 Jul 2023 09:03:53 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 75F5E80172;
 Fri, 14 Jul 2023 09:03:53 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 9D3EEA031A;
 Fri, 14 Jul 2023 09:03:52 +0200 (CEST)
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Fri, 14 Jul 2023 09:03:52 +0200
Message-ID: <1857024.tdWV9SEqCh@kilian-aisec>
In-Reply-To: <f345dbb5-066f-fbbc-4018-7205b3fdfc61@theobroma-systems.com>
References: <20230709123355.17002-1-kilian.zinnecker@mail.de>
 <20230709123355.17002-2-kilian.zinnecker@mail.de>
 <f345dbb5-066f-fbbc-4018-7205b3fdfc61@theobroma-systems.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 5416
X-purgate-ID: 154282::1689318233-697F8199-8ACCC0F0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689318233;
 bh=COqlWRI0XbusrLrtspPJEyZ49fILZxZlVbWOa+yGj54=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=w/3eonwXhBC8hcbsxZfztAvgxVouM1zwihgu/vvIkHD4/T+om7VZjnHVKiPs4smIf
 BK2sGIy78631YD2Z7Kgs7au/02tT/n8fIzEF1HX4lj/UcnAS78AV5IoQaz8pM0DNWy
 wSJioLYq3/rJmXwFNDGWlrVXtOKI1xfB8C9xjGcvAU20e802QbcFh0pE+QGMLPq9sz
 zrlKd8mhPlp3cQNSocvYFZQoHteE7QySmHxR/YVGfRbrudqvCj6T7m13kaK7D/Wxe8
 Enq9mrmltJkmmQu2I2CjXj0mDfu4cy067chBeZVDqFXeAaTH8kyMg+VIfm5wCuS3zG
 7bzDWWwHZmodQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=w/3eonwX
Subject: Re: [Buildroot] [PATCH v5 1/3] package: add rockchip-rkbin package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,

> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
> > +UBOOT_DEPENDENCIES += optee-os
> 
> I think this is a mistake? We want to use the one from rockchip-=rkbin
> package and so we don't need to build optee-os package dont' we?

Yes, a copy-paste mistake. Fixed in v6, thanks.

> > +if BR2_PACKAGE_ROCKCHIP_RKBIN
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION
> > +	bool "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c"
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> > +	bool "Custom version"
> > +	help
> > +	  This option allows to use a specific version.
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
> > +	string "Rockchip rkbin version"
> > +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
> > +	string
> > +	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
> > +		if BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION
> 
> It'd be nice if we could reuse the version already in
> BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION symbol but I looked 5min and
> didn't find anything :/

I removed the LATEST_VERSION now anyway: Rockchip renames the binaries, so an 
option to use the lastes version would anyway not be stable, as the blob names 
will then change unpredictably and defconfigs will break. So there is now the 
default version of the package, or a custom version, if somebody wants to use 
it.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> > +	bool "Rockchip rkbin tpl file"
> > +	default n
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> > +	string "ddr.bin file path"
> > +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> > +	help
> > +	  Full path to the tpl file inside the rkbin repository. The
> > +	  specified file will be copied and used by U-Boot as tpl.
> > +
> 
> I think we can merge those two together? If it's an empty string, then
> we don't use it?
> 
> ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL),"")
> instead of
> ifeq ($((BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> 
> Just a suggestion.

I understand your point, but I actually do like it better the other way: There 
is one option to tell, whether one wants to use any of the binaries and 
another to tell which binary that is. This way I can toggle the option in 
menuconfig without having to erase or retype rather long file paths.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> > +	bool "Rockchip rkbin bl31 file"
> > +	default n
> > +
> 
> Shoudl this depends on !BR2_TARGET_UBOOT_NEEDS_ATF_BL31 ?

I don't actually see much benefit. Ok, it would maybe prevent a rare error if 
someone has a misconfigured defconfig, but then one could introduce all kinds of 
error checks all over the place, e.g., some check, that it is not an IMX SoC 
etc..

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
> > +	bool "Rockchip rkbin optee file"
> > +	default n
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME
> > +	string "optee.elf file path"
> > +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
> > +	help
> > +	  Full path to the optee file inside the rkbin repository.
> > +          The specified file will be copied and used by U-Boot as
> > +          optee.
> 
> Issue around the indent, probably tabs vs spaces?

Yes, thanks, fixed it in v6.

> Also, to U-Boot, it's a tee not op-tee. OP-TEE OS is just a possible
> implementation of a tee OS. You could have something else than OP-TEE OS
> (though I am personally not aware of any).

Ok, I changed it to only "tee" in v6.

> > +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> > +ROCKCHIP_RKBIN_REDISTRIBUTE = NO
> > +
> 
> I think it's fine to redistribute it since it's already public? Any
> reason not to?

I don't think, that because it is on github, that this implies allowance to 
redistribute. And as I don't know whether it is allowed to redistribute, I go 
with "NO".


> > +ROCKCHIP_RKBIN_INSTALL_STAGING = YES
> 
> I think this is incorrect and should rather be:
> ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS?

I agree. Fixed in v6.

> > +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> > +ROCKCHIP_RKBIN_BL31_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME)) +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> > +ROCKCHIP_RKBIN_TPL_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME)) +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
> > +ROCKCHIP_RKBIN_OPTEE_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME)) +endif
> > +
> > +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
> > +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $
(BINARIES_DIR)/bl31.elf)
> > +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $
(BINARIES_DIR)/ddr.bin)
> > +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_OPTEE_FILENAME) $
(BINARIES_DIR)/tee.elf)
> 
> I honestly would prefer to keep the original file extension. Not sure
> how to handle this on U-Boot package makefile side though.

I did figure out how to handle different file extensions. Added this in v6.

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
