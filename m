Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD3EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3F841592;
	Tue,  1 Feb 2022 17:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-DOme24rlcB; Tue,  1 Feb 2022 17:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C732141561;
	Tue,  1 Feb 2022 17:57:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6EBC1BF287
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EBAE82FF9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXQsEdI9B6L8 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:57:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8DFB82FE4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:57:42 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so3312115pjb.1
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8TpeozWdBBX74cjAwnYA0MNofBcgVjxqJ5rw5rMX6Ac=;
 b=JITuS8xZdLzTCnPK79G10HTNKdKnjMVuV1C3uJAb7OnNUAYNu8EshaZVTsB9afCHVM
 HY49w7BvlWNkoCTzLmbZpfNIXoXcYXiPkVGWsigNmbtqZt5f3Wnxn5GxfyGlILwhk9dL
 fXVgS70v1sBjJ/tripMWJ1DCg0hAXfSL7MhSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TpeozWdBBX74cjAwnYA0MNofBcgVjxqJ5rw5rMX6Ac=;
 b=wPf3nwY+8qXE3XhugbOizFJXqii5eqJligJz5KRmSg94FluzE7LB15crFDEPwRa6yk
 sypsGnpg3/OBJmXl5sbeoFyp+cYBeLLNbEACtnqdoPz/D17M08kdGkf09eA8NEdzxzgV
 G/FB5hY8JtJxxEuwGCcLtzYBZsUJQHHxKfMl9YYySUI80nuRjCHqudn1Fa1WiHB6EoPo
 8rqQWKtzXv0aiSLTINov3Tisbr5O5uHjOBaCod1rHMfo/oLs8RdRl/n/oM6FDQRROvsy
 +l7y4RwxKqandqZXNGr6pCyXmAd5gf5H0yBCayBmir1nedtgffZkXuFY+j9Zh77TnYGy
 5law==
X-Gm-Message-State: AOAM533fEHyFBrYjBLRiTNzmXjTywAUEfKK7LdFi/Zy7zuWokZPLHIEe
 1FZFdSTQm2qIa4DoOjvUhRwTpYDR3LaOj6yZAT76fw==
X-Google-Smtp-Source: ABdhPJzfQ8kVe06qWqqOCZif/11FU9U1JesgygF/xhItcgiLe8kuvn3ezETj8a3uRR3Hb7pgjePQLTJhpJAQKbFiOqI=
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20mr27094959pls.97.1643738261898; 
 Tue, 01 Feb 2022 09:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20220201091342.143010-1-michael@amarulasolutions.com>
 <20220201171441.GV457876@scaer>
In-Reply-To: <20220201171441.GV457876@scaer>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 1 Feb 2022 18:57:30 +0100
Message-ID: <CAOf5uwmK-+jU3eRRPQ4NqKaFq=OUSBTK-_kRXTc6cEsGiwm=Gg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] boot/uboot: add support for bundling TEE in
 BIN format into U-Boot
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi

On Tue, Feb 1, 2022 at 6:14 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Michael, All,
>
> On 2022-02-01 10:13 +0100, Michael Trimarchi spake thusly:
> > Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> > into the U-Boot image using binman. This patch brings the necessary changes to
> > enable this feature.
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >  boot/uboot/Config.in | 12 ++++++++++++
> >  boot/uboot/uboot.mk  | 12 ++++++++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index c630fc6552..117bbd3faf 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -237,6 +237,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
> >         U-Boot. This option makes sure optee-os gets built prior to
> >         U-Boot, and that the TEE variable pointing to OPTEE's
> >         tee.elf, is passed during the Buildroot build.
>
> Missing empty line here.
>

ok

> > +choice
> > +     prompt "U-Boot OPTEE BL32 format"
> > +     default BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> > +     depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
> > +
> > +config BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> > +     bool "tee.bin"
> > +
> > +config BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF
> > +     bool "tee.elf"
> > +
> > +endchoice
> >
> >  config BR2_TARGET_UBOOT_NEEDS_OPENSBI
> >       bool "U-Boot needs OpenSBI"
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index 574fc7089a..210fa219ed 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -177,7 +177,19 @@ endif
> >
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
> >  UBOOT_DEPENDENCIES += optee-os
> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
> >  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> > +define UBOOT_COPY_TEE_FIRMWARE
> > +     cp $(BINARIES_DIR)/tee.elf $(@D)/
>
> Why do you need to copy it, when TEE is pointing to the original in
> $(BINARIESD_DIR), just above, and that has worked well so far?
>

The copy are needed to binman to include it

> > +endef
> > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> > +else
> > +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> > +define UBOOT_COPY_TEE_FIRMWARE
> > +     cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin
>
> Ditto: why do you need to copy it, when TEE, just above, also points to
> the original in $(BINARIES_DIR) ?

Same as above

Michael
>
> Regards,
> Yann E. MORIN.
>
> > +endef
> > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> > +endif
> >  endif
> >
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
> > --
> > 2.25.1
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
