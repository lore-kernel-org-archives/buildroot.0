Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5FDC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C278198D;
	Sat, 15 Jul 2023 19:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C278198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQmZfrDUBgdQ; Sat, 15 Jul 2023 19:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51B2819BE;
	Sat, 15 Jul 2023 19:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51B2819BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3C021BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B836640945
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B836640945
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3mNIdZ15h0E for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:47:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E91B40942
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E91B40942
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:47:06 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 8A936A03C9;
 Sat, 15 Jul 2023 21:47:04 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id 6BFFF801D0;
 Sat, 15 Jul 2023 21:47:04 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 34A4CA025D;
 Sat, 15 Jul 2023 21:47:02 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Sat, 15 Jul 2023 21:47:01 +0200
Message-ID: <3751483.kQq0lBPeGt@kilian-aisec>
In-Reply-To: <20230714234326.1ab918e8@windsurf>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-2-kilian.zinnecker@mail.de>
 <20230714234326.1ab918e8@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 10821
X-purgate-ID: 154282::1689450424-C1B4A647-D5AB6A9B/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450424;
 bh=7W1dK+qg269AJT7ryFZF0w1CC0W62cTaH9i1Q2eMjeQ=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=dy9lA0JngbxDrkpOqblv2oNDZGxP1rPyGkIESzKP3AyOrNzQJXzJWICdP8Rhq+qzc
 TpxtlJ6os5vxYptCq/MTdJZHpZwvcnW7/kNxw5lFxUdzZXT4iLL0a983NPloRnzeqN
 WfNL1QTRqauHuaWgL8pp9IkULoyPJxlExqbBnxAfZVqUORmh5Jedg1ZjcUn27J5ABQ
 hLi7xS9Xy1DKYtKUqJqUw0OXCARqnr8bjGwZttSFReokB15LQsuJHILkgXjsYCP2CF
 FMD0vAnqgubDqbH/VrZy3vN7OUURBOe3ytR/EiJLtHgxVYboCvLJt9c3gYgq0J1/c/
 N2R8c0pUyoCmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=dy9lA0Jn
Subject: Re: [Buildroot] [PATCH v6 1/3] package: add rockchip-rkbin package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Thanks for your work! See below some comments.

Thank you for your review and feedback!

> Nit: the commit title should be:
> 
> 	package/rockchip-rkbin: new package

Thanks, will be fixed in a new patch revision.

> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> > +UBOOT_DEPENDENCIES += rockchip-rkbin
> > +define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
> > +	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin $(BINARIES_DIR)/
> 
> We need a full destination path here: $(BINARIES_DIR)/u-boot/rockchip.bin

Thanks, will also be fixed.

> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> > +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31${suffix $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))}
> What is this ${...} ?

My intention was to rename the binaries to a generic file name (e.g., 
"bl31.xyz" and "tpl.xyz"), while keeping the file type extension. However, I 
now changed this anyway: The original file names are preserved. Hence there is 
no more need for special file type extension anymore and this code has changed
anyway.

> > +endif
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> > +UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr${suffix $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))} +endif
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
> > +$BOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee${suffix $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))}
>    ^^ typo, should be UBOOT_MAKE_OPTS
> 
> > +endif
> > +endif
> > +
> 
> These changes to boot/uboot/ should be in a separate patch, after the
> patch adding rockchip-rkbin.

Yes, that makes sense. In the next version these changes are put in a separate 
patch.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN
> > +	bool "Rockchip rkbin binary blobs"
> 
> Just:
> 
> 	bool "rockchip-rkbin"

Done, thanks.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
> > +	string
> > +	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
> > +		if !BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> > +	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
> > +		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> 
> Is it really likely that a different version, but from the same Git
> repository will be needed?

Yes, I actually believe that in this case, this is a valuable feature: I 
deliberately implemented the package such, that the user will define which 
binaries they want to use, by specifying the binary file path. The problem now 
is, that the Rockchip maintainers of the repository remove or rename the 
binaries between different commits. If we bump this package, we can look for 
all official buildroot board defconfigs and change the binary names specified 
inside those. However, if someone uses their own personal defconfig for some 
own board (e.g., some company which develop custom boards), then their 
defconfigs may break, if we bump the version. Even worse: What if Rockchip 
removes a TPL with some specific frequency, needed by someone? This feature 
allows people to specify commits, where their desired binaries are present.

I don't think this is needed in general for packages. But in this specific 
case, where different binaries may only be present in different commits, I think 
it is a appropriate. However, if you really don't like this, then it would 
also be ok for me to drop this.

> I see in your defconfig you're using a
> different version than the default used here. Why?

Between default commit of the package and the one I chose in the defconfig, the 
binaries needed for the Rock5B actually did not change. I just chose a 
different commit to show and reassure myself, that this feature works, i.e., I 
correctly copied the code from the uboot.mk.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> > +	bool "Rockchip rkbin tpl file"
> > +	default n
> "default n" is never needed, as it's the default.

Thanks, removed.

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> > +	bool "Rockchip rkbin bl31 file"
> > +	default n
> > +
> > +if BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
> > +	string "bl31.elf file path"
> > +	help
> > +	  Full path to the bl31 file inside the rkbin repository. The
> > +	  specified file will be copied and used by U-Boot as bl31.
> > +
> > +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
> > +	bool "Rockchip rkbin optee file"
> > +	default n
> > +
> > +if BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
> > +	string "tee.elf file path"
> > +	help
> > +	  Full path to the TEE file inside the rkbin repository.
> > +	  The specified file will be copied and used by U-Boot as
> > +	  TEE.
> > +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
> 
> For those 3 files, do we really need a boolean + a string option? Can't
> we simply rely on string options: if the value is empty, there's no
> TPL/BL31/TEE, if the value is non-empty, use the file provided.

I actually like it this way. But you are not the first one who suggested that 
simply checking, whether the string is empty or not is a better way to go: 
Quentin Schulz also shares your opinion. So I changed it accordingly.

> > +# Locally computed
> > +sha256  6f7b58fe35108101031ebfd3cc6eb7a186f258a1cdbd93c4256888997ab52c8f 
> > rockchip-rkbin-d6ccfe401ca84a98ca3b85c12b9554a1a43a166c-br1.tar.gz +
> 
> Nit: useless empty new line.

Thanks, removed.

> > +#########################################################################
> > ####### +#
> > +# rockchip-rkbin
> > +#
> > +#########################################################################
> > ####### +
> > +
> 
> Nit: only one empty new line.

Also removed.

> > +ROCKCHIP_RKBIN_VERSION = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION)) +ROCKCHIP_RKBIN_SITE =
> > https://github.com/rockchip-linux/rkbin.git +ROCKCHIP_RKBIN_SITE_METHOD =
> > git
> 
> Any reason not to use:
> 
> ROCKCHIP_RKBIN_SITE = $(call
> github,rockchip-linux,rkbin,$(ROCKCHIP_RKBIN_VERSION))
> 
>  ?

If I use $(call github,rockchip-linux,rkbin,$(ROCKCHIP_RKBIN_VERSION)) I, the 
following error occurs on my PC:

fatal: repository 'https://github.com/rockchip-linux/rkbin/archive/
78cbbc4f9c36b77a620132ad38d2c6823b4b25fe/' not found

I am not familiar with this, to be honest, so I don't know how to fix this, 
other than using the URL directly.

> > +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> > +ROCKCHIP_RKBIN_REDISTRIBUTE = NO
> 
> This is the problematic part I believe. What is the license of this
> stuff? Without any license, nobody is allowed to redistribute it. So as
> it is, all images produced by Buildroot with this package cannot be
> redistributed, making them quite useless, unless it's used by a
> hobbyist building his own images for his own usage, without any
> redistribution.
> 
> We have the same issue with some Amlogic blobs I believe. Blobs are
> annoying, but they are even more annoying when there's no license
> attached to them that allows redistribution.

Well, that seems to be unfortunate. I guess then, there is no point in 
integrating all this into buildroot, if the binaries are not allowed to be 
redistributed?

I wrote an email to some of the Rockchip contributors of the rkbin repository, 
asking them what the license is, regarding the binaries. I hope to get an 
answer soon, and that a LICENSE file is added to the repository. Let's see ...

> > +ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
> > +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> > +ROCKCHIP_RKBIN_BL31_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
> > +BL31_EXTENSION=${suffix $(ROCKCHIP_RKBIN_BL31_FILENAME)}
> 
> All variables must be prefixed with the package name. Again this
> ${suffix ...} thing, weird.

Fixed the variable naming and the "suffix" is not there anymore.

> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> > +ROCKCHIP_RKBIN_TPL_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
> > +TPL_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TPL_FILENAME)}
> 
> All variables must be prefixed with the package name.

Also fixed.

> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
> > +ROCKCHIP_RKBIN_TEE_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
> > +TEE_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TEE_FILENAME)}
> 
> All variables must be prefixed with the package name.

And this, too.

> > +endif
> > +
> > +define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
> > +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME)
> > $(BINARIES_DIR)/bl31$(BL31_EXTENSION)) +	$(if $(filter y,
> > $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME)
> > $(BINARIES_DIR)/ddr$(TPL_EXTENSION)) +	$(if $(filter y,
> > $(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE)), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME)
> > $(BINARIES_DIR)/tee$(TEE_EXTENSION))
> The filter y construct is a bit useless, you can just do:
> 
> 	$(if $(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),\
> 		do something)

Thanks! I changed this part as well. It now actually checks for the string, as 
the bools were removed (see above).

> > +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
> > +ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
> > +$(error No custom rockchip-rkbin version specified. Check your
> > BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting) +endif
> > +ROCKCHIP_SOURCE = rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
> 
> Hum, I wonder why this needs to be defined. It seems to work for U-Boot
> without having to define UBOOT_SOURCE in uboot.mk, the infrastructure
> does it for you.

Well, this ROCKCHIP_SOURCE is just there, because I copied this part of code 
from the uboot.mk, and there there was this variable. But I agree, it is not 
needed and I removed it.

> > +BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_SOURCE)
> > +endif
> 
> This check should be enclosed in a:
> 
> ifeq ($(BR_BUILDING),y)
> ...
> endif
> 
> condition.

Added, thanks!

> Overall, mostly cosmetic comments that I could have solved myself, but
> the licensing problem is much more significant and I cannot resolve it.

Well, as said before, maybe we get some clarification about this in the future. 
At least I hope so, because else this whole board support effort would probably 
then be pointless after all :D

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
