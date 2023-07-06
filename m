Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F1EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 22:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A5F41925;
	Thu,  6 Jul 2023 22:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A5F41925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXk598cYAwG0; Thu,  6 Jul 2023 22:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF5341927;
	Thu,  6 Jul 2023 22:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF5341927
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B03E81BF4D5
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 22:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8963C821CB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 22:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8963C821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-4STUn2wRAu for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 22:56:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E24B821AE
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E24B821AE
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 22:56:52 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 2D552A2DB1;
 Fri,  7 Jul 2023 00:56:50 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 1039AA00E2;
 Fri,  7 Jul 2023 00:56:50 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 21B5BA01BA;
 Fri,  7 Jul 2023 00:56:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 07 Jul 2023 00:56:47 +0200
Message-ID: <6573492.4vTCxPXJkl@kilian-aisec>
In-Reply-To: <6331fb32-d30a-4cbb-dc4c-058a9b75b5ee@theobroma-systems.com>
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
 <20230705062142.10968-1-kilian.zinnecker@mail.de>
 <6331fb32-d30a-4cbb-dc4c-058a9b75b5ee@theobroma-systems.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 8347
X-purgate-ID: 154282::1688684209-6BFFF199-30197DA4/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688684210;
 bh=2qDJvEVpItddViudBNHhauiYNfM5TIOdGpSzCYQuysU=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=13ULWsolfv9In3IOjzOFWWpcFi/ZYOIXjZLhMK+D9e0LXWnAaGyLmktTC7UC63Rbm
 sBzsZfI9VStUJgqRdbP+VEIIxKZ3QGHKwCZNsuQPLCSitlEk3aTVRWV8n36o6xWHiS
 xB/IfdQiAy3Xlo6anH5gdoXZbR9Q3luG0c29yIeQ8/yzMTC9VZIBVPE/uz7HBdqhVR
 l0a1X880tYBOwk3S11NOZJTnIQxksPAXHRP/5cwhQ9jNujqjPgf5SvSA2mB6X2SDQW
 SltHrpIz+35vZQ5qeMz4asrnHfnD7pjGRdWeuBBvmyZ1D9npGxuabXaIQT3EU32BlD
 yqv0P1BJsUKhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=13ULWsol
Subject: Re: [Buildroot] [PATCH v3 1/3] package: add rockchip-rkbin package
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Quentin, All,

> Thanks for the patch.

You're welcome and thanks for your feedback.

> > +config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
> > +	bool "U-Boot needs rockchip-rkbin"
> > +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
> > +	help
> > +	  U-Boot currently needs binary blobs during build for the
> > +	  Rockchip RK3588 SoC.
>
> This isn't specific to RK3588. It is in fact how Rockchip starts with
> each of their new SoCs. This currently applies to RK3568 as well and
> since there is at least one Radxa board (Rock 3A if I'm not mistaken), I
> guess we're gonna see patches for this one soon?

Yes, correct. Do you refer to buildroot patches for support of further Radxa 
boards or to u-boot patches to support further Rockchip SoCs? Personally I 
currently don't have any plans to provide patches to bulidroot regarding board 
support of other Radxa boards. Still I think the concern is of course legit, 
i.e., that someone wants to use this rockchip-rkbin buildroot package for 
other Rockchip SoCs, but it (in its current form) does not provide 
functionality for that.

> Also, users can decide to use blobs instead of compiled-from-sources
> binaries for TF-A, OP-TEE OS and TPL for those SoCs like RK3399 which
> have upstream support.

I agree.

> I would suggest to just say that this provides binary blobs (such as DDR
> init (usually called TPL in U-Boot world), TF-A and OP-TEE OS) typically
> used for new SoCs designs until different upstream projects get support
> for the new SoCs.

Ok, I will change it.

> >   UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
> >   endif
> >
> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> > +UBOOT_DEPENDENCIES += rockchip-rkbin
> > +
> > +define UBOOT_COPY_RKBIN_FW_FILES
> > +	cp $(BINARIES_DIR)/bl31.bin $(@D)
> > +	cp $(BINARIES_DIR)/ddr.bin $(@D)
>
> This is an issue with supporting multiple Rockchip SoCs with the same
> package since we would need to have an option in RKBIN package to select
> the original file to rename to bl31.bin and ddr.bin.

Yes, I agree. For my purpose (i.e., only support for Rock 5B) I guess it is ok 
this way, but if the rockchip-rkbin package should also be usable for other 
SoCs, some way to identify the particular binaries would be needed.

> How bad of an idea is it to parse the BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> variable for BL31, ROCKCHIP_TPL and TEE variables to find out the exact
> name of the file to use?

I guess this would work but I don't know if it is a good idea.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN
> > +	bool "Rockchip RKBIN binary blobs"
> > +	depends on BR2_arm || BR2_aarch64
> > +	help
> > +	  This package provides binary blobs, currently needed by
> > +	  u-boot for the Rockchip RK3588 SoC.
>
> Don't specify the Rockchip SoC part number, this is already not
> encompassing all SoCs that need RKBIN (such as RK3568). You can however
> say that this is typically needed by U-Boot for the U-Boot proper fitimage.

Ok.

> > +RK3588_DDRFW = rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
> > +RK3588_BL3FW = rk3588_bl31_v1.38.elf
> > +
> > +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
> > +	cp $(@D)/bin/rk35/$(RK3588_BL3FW) $(BINARIES_DIR)/bl31.bin
>
> I would highly recommend to keep the same file extension to not confuse
> people since the OP-TEE binary apparently has different formats which we
> can (more easily) distinguish from their file extension (though IIRC,
> reading the header may be enough).

Thanks.

> > +	cp $(@D)/bin/rk35/$(RK3588_DDRFW) $(BINARIES_DIR)/ddr.bin
>
> I would highly recommend to not have a so common name which abstracts
> the SoC part number.

Why is the SoC part number so important to you?

> I can think of two ways of doing this: create a
> subdir after each SoC part number in BINARIES_DIR (e.g.
> BINARIES_DIR/rk3588/bl31.elf) or have the part number in the filename
> (e.g. rk3588_bl31.elf).
> This should allow to install the binary blobs from all SoC supported in
> RKBIN without having to deal with Kconfig options.

How so? Because we would then copy all blobs at once into the BINARIES_DIR 
everytime?

> The rename to remove the possibly changing filename is a good idea
> though, so we don't need to update the BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> variable in the defconfig to reflect updates to RKBIN.

I agree.

> Also, OP-TEE OS is available as a blob in there (see bl32 file), maybe
> making it available would be good too?

Agreed.

> Ok so another thought now...
>
> In boot/u-boot.mk, we already have
> ```
> ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
> UBOOT_DEPENDENCIES += arm-trusted-firmware
> ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> define UBOOT_COPY_ATF_FIRMWARE
>          cp $(BINARIES_DIR)/bl31.elf $(@D)/
> endef
> UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
> else
> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
> define UBOOT_COPY_ATF_FIRMWARE
>          cp $(BINARIES_DIR)/bl31.bin $(@D)/
> endef
> UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
> endif
> endif
>
> ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
> UBOOT_DEPENDENCIES += optee-os
> UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> endif
> ```
>
> which should set everything up correctly for bl31 and tee-os, without
> needing to add BL31 and TEE to BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS manually.
>
> We would however probably need to go with a virtual package (or whatever
> the proper name for Buildroot would be for two packages providing the
> same functionality and have a selection mechanism in place in Kconfig
> for it) for TF-A and tee-os so that UBOOT_DEPENDENCIES picks up the
> correct dependency. RKBIN would be one of the possible provides for
> arm-trusted-firmware and optee-os for example.

Or I just add the UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin to the 
BR2_UBOOT_NEEDS_ROCKCHIP_RKBIN block?

> Looking at the code above, if we want to keep it a bit automagical,
> maybe having the RKBIN binaries called bl31.bin and tee.elf and have a
> Kconfig option for the RKBIN package to select which SoC binary blobs to
> install would be best.

In the readme of the rkbin repository they present their file naming scheme. 
However, I don't think I like making use of it:

1. We introduce a lot of Kconfig code for some logic that adds choices and 
selects files within the rkbin repository. But in the end the user still has to 
make the decision, which files are to use, anyway. Then the user can also just 
directly specify the true filename in the board defconfig or .config.

2. We add a lot dependency: Rockchip may remove or rename files in their git 
reblobitory as they like. If we (or any other users) then want to use a newer 
commit of their reblobitory, e.g., to use newer blobs, and the file name / path 
scheme breaks, we have to fix that again.

> We would still however need a special case for the TPL coming from RKBIN
> package since there's no piping for this at the moment in boot/u-boot.mk.
>
> I feel like RKBIN package should be able to handle multiple SoCs (either
> by providing all SoCs binary blobs at once, or have a Kconfig option for
> it) and we should make it not too error-prone on the user-side for the
> U-Boot configuration.
>
> At the same time, I don't know if it's worth the added complexity.

Thinking out loud:

For the rockchip-rkbin package we could feature:

* custom git version option (then defconfigs could freeze the repo version)
* option to specify tpl file name
* option to specify bl31 file name
* option to specify op-tee file name
* logic, which copies the specified files to BINARIES_DIR, while renaming them 
to generic names (e.g., "bl31.elf")

For the u-boot package we could add BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN in 
uboot.mk: It adds the dependency for the package rockchip-rkbin and introduces 
code, which parses the rockchip-rkbin BR2 variables and adds the needed 
options to UBOOT_MAKE_OPTS accordingly. So it is very similar to 
BR2_TARGET_UBOOT_NEEDS_ATF_BL31, but knows from the sprecified rockchip-rkbin 
variables which uboot make opts to add (or not to add).

What do you think?

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
