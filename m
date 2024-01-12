Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3ACC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCEE60B12;
	Fri, 12 Jan 2024 16:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCEE60B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIPrjyz_i2cQ; Fri, 12 Jan 2024 16:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD76D60B24;
	Fri, 12 Jan 2024 16:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD76D60B24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B52471BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0F6843B3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B0F6843B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiMmYIxCJdCx for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:21:21 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D52D9843B2
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52D9843B2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6463B00576;
 Fri, 12 Jan 2024 17:21:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Jan 2024 17:21:15 +0100
Date: Fri, 12 Jan 2024 17:21:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Badel, Laurent" <LaurentBadel@eaton.com>
Message-ID: <ZaFm-9lGgWu9Ew8g@landeda>
References: <20240111131932.11760-1-laurentbadel@eaton.com>
 <ZaAIkDXOQV9QUazR@landeda>
 <DM4PR17MB5969BAE4BC2BEC7D6417DC81DF6F2@DM4PR17MB5969.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR17MB5969BAE4BC2BEC7D6417DC81DF6F2@DM4PR17MB5969.namprd17.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705076477;
 bh=Ga2xjZz7Cz71DlRBaUmdhwxGyvD6G+MAC4/wZfoMOfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fBByrkhPyzl4nfkOUJfJF/gYSwXIud3/YGzp9h+9IjykigZ82sJl2A/OJNLLEtMYc
 MbA2xprH43tPALPtJHSLD9h31Mm6wXRMKFgs+o8XLxE9YGbefksEjAydj1WtJGW0yL
 bF73IUSBq5q/33jCde984KgEoqWfiEz6zvcGgrKDHy59Avq9GNDwiKNkcWH8sNi284
 wPfszxkiCOWJZkEj1+IQDCTF8/lMZqFVLwqGWNsCOUV/kEqHNfAJwE8l8QsyunvlI9
 MM+7EQWZCnhMLesPB7NhdaHtd3kgmWINZcHFPahw1EA3dbEKeep43sDgC4jh0AnJJg
 2ZGyV7/gTQlBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fBByrkhP
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Laurent, All,

On 2024-01-12 08:30 +0000, Badel, Laurent spake thusly:
> Thank you very much for your time reviewing/commenting on the patch.
> I spent some time trying to find a way to support multiple DTSs for
> the sake of completeness, please see the patch below.

After a cursory look, it looks quite OK.

> I would have preferred to use a single loop for all cases but couldn't
> find a good way to iterate with an empty string, so this results in
> slight duplication of code unfortunately.

Err... I don't have a much better idea either... We could cheat with
with some quoting tricks, like adding an item in the list that is just
a pair of sngle quotes, which for the _SED macro would close and reopen
the sed expression, and for the _ELF_TOSB would be interpreted just as
an empty string. That's a dirt trick, though, and quite a bit fragile.

I.e. somethinglike (nopte also the use of patsubst instead of foreach):

    # '' is used to create an empty item:
    #  - closes and reopens the single-quoted string of the sed expression
    #  - opens and closes an empty string in the elftosb output filename
    MXS_BOOTLETS_DTS_NAMES = '' $(patsubst %,.%,$(LINUX_DTS_NAME))

I'm not sold on the above, because, yes, it's fragile...

I've quickly tried a few tricks involving the use of $(space) and/or
$(empty), but none did work...

> I have tested building mxs-bootlets with the following setups:
> 1. zImage with appended DTB, two DTSs configured (one in-tree, the
>    other out-of-tree):
>     -> generates 2 SB files with extension .$(dtb_name).sb
> 2. zImage, no DTS:
>     -> generates a single SB file with the .sb extension.
> 3. zImage, two DTSs as in (1) but not appended:
>     -> generates a single SB file with the .sb extension

Cool, thanks for the effort in looking into, and in testing, that!

> I checked the output shell commands and they looked as expected, too.
> I also minded your comment regarding the naming of variables, thank you
> for pointing this out.
> 
> If you think that is a better solution, I am happy to re-submit a clean
> patch.

Well, just looking at the code, it looks better, because we do not rely
on the ordering of the DTS names to generate one mxs-bootlet, aa we get
as many mxs-bootlets as there are configured DTS.

However, I have no idea if it makes sense to have as many bootlets as
there are DTS names; you are better placed to know that. Sorry if my
review seemed misled you into this change.

What my point in my review was, was two fold:

  - _if_ it does not make sense to have multiple DTS configured when
    using mxs-bootlets, then the situation must be caught and the user
    must be warned about that (hence my code snippet to detect the
    case);

  - otherwise, _if_ it is OK to have multiple DTS configured, and that
    it is OK to build a single mxs-bootlet in that case, then it is sad
    to rely on the ordering (but I did not provide any suggestion to fix
    that, sorry; maybe just a comment stating so in the help text for
    BR2_TARGET_MXS_BOOTLETS_LINUX would be enough);

.. and the third point that I did not initially adress:

  - otherwise, then we need to generate as many mxs-bootlets as there
    are DTS configured, but I did not suggest that; you are probably
    better placed to answer that question than I am! ;-) Your new patch
    does address that part quite nicely, if that makes sense to have.

The next step depends on which of the above three scenarios you believe
is the best.

Thank you!

Regards,
Yann E. MORIN.

> Best regards,
> 
> Laurent
> 
> ---
>  boot/mxs-bootlets/mxs-bootlets.mk | 40 +++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
> index adc22767..0a1f7009 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -41,17 +41,17 @@ MXS_BOOTLETS_LICENSE = GPL-2.0+
>  ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
>  MXS_BOOTLETS_DEPENDENCIES += barebox
>  MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)
> 
>  else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
>  MXS_BOOTLETS_DEPENDENCIES += linux
>  MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)
> 
>  else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
>  MXS_BOOTLETS_DEPENDENCIES += uboot
>  MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
>  endif
> 
>  ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
> @@ -65,11 +65,16 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>                 $(MAKE1) -C $(@D) linux_prep
>  endef
> +
>  define MXS_BOOTLETS_SED_LINUX
>         sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> -       sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> +       sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>  endef
> +
> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB), y)
> +MXS_BOOTLETS_DTS_NAMES = $(foreach dts_name,$(LINUX_DTS_NAME),.$(strip $(dts_name)))
>  endif
> +endif #BR2_TARGET_MXS_BOOTLETS_LINUX
> 
>  ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
>  define MXS_BOOTLETS_SED_UBOOT
> @@ -83,7 +88,13 @@ endef
> 
>  MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
> 
> -define MXS_BOOTLETS_BUILD_CMDS
> +define MXS_BOOTLETS_ELFTOSB_CMD
> +       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
> +       -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
> +       -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(1).sb
> +endef
> +
> +define MXS_BOOTLETS_BUILD_CMDS
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>                 $(MAKE1) -C $(@D) power_prep
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
> @@ -92,15 +103,24 @@ define MXS_BOOTLETS_BUILD_CMDS
>         sed -i 's,[^ *]power_prep.*;,\tpower_prep="$(@D)/power_prep/power_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>         sed -i 's,[^ *]sdram_prep.*;,\tsdram_prep="$(@D)/boot_prep/boot_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>         $(MXS_BOOTLETS_SED_BAREBOX)
> -       $(MXS_BOOTLETS_SED_LINUX)
>         $(MXS_BOOTLETS_SED_UBOOT)
> -       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
> -               -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
> -               -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
> +       $(if $(MXS_BOOTLETS_DTS_NAMES),
> +               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
> +                       $(call MXS_BOOTLETS_SED_LINUX,$(dts_name))
> +                       $(call MXS_BOOTLETS_ELFTOSB_CMD,$(dts_name))
> +               ),
> +               $(call MXS_BOOTLETS_SED_LINUX)
> +               $(call MXS_BOOTLETS_ELFTOSB_CMD)
> +       )
>  endef
> 
>  define MXS_BOOTLETS_INSTALL_TARGET_CMDS
> -       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
> +       $(if $(MXS_BOOTLETS_DTS_NAMES),
> +               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
> +                       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(dts_name).sb $(BINARIES_DIR)/
> +               ),
> +               cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE).sb $(BINARIES_DIR)/
> +       )
>  endef
> 
>  $(eval $(generic-package))
> --
> 2.17.1
> 
> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Thursday, January 11, 2024 4:26 PM
> To: Badel, Laurent <LaurentBadel@eaton.com>
> Cc: buildroot@buildroot.org
> Subject: [EXTERNAL] Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for zImage with appended DTB
> 
> Laurent, All,
> 
> On 2024-01-11 13:19 +0000, Laurent Badel via buildroot spake thusly:
> > When building a zImage with appended DTB, buildroot creates a copy of
> > the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
> > take this into consideration and instead passes the original zImage
> > (without DTB appended) to elftosb to generate the SB file. Thus, make
> > sure that the correct zImage is used in this process.
> >
> > Note: this patch only supports a single DTS specified in the
> > configuration, because there is no obvious use case for multiple DTS's
> > with mxs-bootlets. If multiple DTS's are configured, only the first
> > one will be used.
> 
> That's a bit unfortunate that we have to rely on the ordering.
> 
> So, if using two or more DTS in cunjunction with mxs-bootlets does not make sense, should that be forbidden? I.e. would we need something like the following (code slightly elided for brevity):
> 
>     ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
>     ifeq ($(BR2_BOOT_MXS_BOOTLETS),y)
>     ifneq ($(words $(LINUX_DTS_NAME)),1)
>     $(error More than one DTS specified; mxs-bootlets can only use one)
>     endif
>     endif
>     define MXS_BOOTLETS_BUILD_LINUX_PREP
>         ...
>     endef
>     MXS_BOOTLETS_ZIMAGE_NAME = zImage$(....)
>     define MXS_BOOTLETS_SED_LINUX
>         ...
>     endif
>     endif
> 
> (See below the name of the variable.)
> 
> > Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
> > ---
> >  boot/mxs-bootlets/mxs-bootlets.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/mxs-bootlets/mxs-bootlets.mk
> > b/boot/mxs-bootlets/mxs-bootlets.mk
> > index adc22767..2003b23f 100644
> > --- a/boot/mxs-bootlets/mxs-bootlets.mk
> > +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> > @@ -65,9 +65,10 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
> >       BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
> >               $(MAKE1) -C $(@D) linux_prep  endef
> > +ZIMAGE_NAME=zImage$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),.$(notdir
> > +$(firstword $(LINUX_DTS_NAME))))
> 
> The namespace is global, so the variable names have to be manually scopped with the name of the package they apply to, in this case:
> 
>     MXS_BOOTLETS_ZIMAGE_NAME
> 
> Regards,
> Yann E. MORIN.
> 
> >  define MXS_BOOTLETS_SED_LINUX
> >       sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> > -     sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> > +     sed -i 's,[^
> > + *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/$(ZIMAGE_NAME)";,'
> > + $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> >  endef
> >  endif
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://list/
> > s.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&data=05%7C02%7Clauren
> > tbadel%40eaton.com%7C28583d4b11284523498408dc12b9a4b4%7Cd6525c95b90643
> > 1ab926e9b51ba43cc4%7C1%7C0%7C638405835765391645%7CUnknown%7CTWFpbGZsb3
> > d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > C3000%7C%7C%7C&sdata=koINDlCH%2Bo4Tv20L6jeEvTllYPrpESfnGcFRL%2F%2BbKu0
> > %3D&reserved=0
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
