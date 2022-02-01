Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FB0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 19:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1DE60B1B;
	Tue,  1 Feb 2022 19:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGC3oRPcbU5D; Tue,  1 Feb 2022 19:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541C560BD1;
	Tue,  1 Feb 2022 19:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2B551BF297
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C93B440524
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaaGjE7xV1iH for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 19:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7580C400C4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 19:13:01 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 133so16258513pgb.0
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 11:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XAixQ9f6y2Z8nodY+BUR4S/sAQfeUkyE53+5trqpEGU=;
 b=O41Ih8mUE+dbyc3f2ync1JnkuN5k5fREuUV+SNvYp4KURU16aY7sqb1xTxFiq0rYSE
 Fjlq+pGy2mJqm6gvgEaVw3moaqC/0O/nWpISIxiaSMXLp7MSaA5YG54vdBH9+TBPa9kc
 KZJUaeRbNbSQ3T3Yd7DFBNA8TEyZkC1F2FJDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XAixQ9f6y2Z8nodY+BUR4S/sAQfeUkyE53+5trqpEGU=;
 b=QU2HiK70iyWb2cNTEN6dEeGE/OnTMeSkC0GsbTR+E324RV+Auo6HG7noffQCsh3+VY
 0/B0SH9UL8flfGeoJrBCrpdXnPwTZ9UYh4HcfiE/ciaFWxa4g7D/h9PIWBDFLE2ILbi6
 G0zi6zXQ656aDSHr4GGUwIEuvpnJeXXHneaspGXdGzGVeHJvteZW9x3/+TvEZdc90SQ+
 XGnDCwKT1qJ4UKIL1PaqGVw0Thn7ZsmDtIvg87J5tQbe0fq7YRZ4tu37iRff9goJCnK1
 VMM7YqNcUzTc9kEUwpQ5mUeGrfoz7EsIAD8ReKxC0NcbMPDahVNHofhgZyWMqp2xgyb/
 4uqQ==
X-Gm-Message-State: AOAM53120SjgxX1QhOA+EKQ5QHIBHD7YdbGb0AjzCUTSMEsDRHJ4wMnl
 pWeD0BZmTndWkDGmpNfqabxJVH+h4Pf4OVCvQjIfeQ==
X-Google-Smtp-Source: ABdhPJwqrtLGbpD2scl0zi025Q3bn+Nc1PC/ts4KnZpq96gJWaE0EvK3rKaVbn3E2V1ie3FIoRhKMYG5wnHCgbGnOHs=
X-Received: by 2002:a05:6a00:1d94:: with SMTP id
 z20mr25890239pfw.40.1643742780725; 
 Tue, 01 Feb 2022 11:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20220201091342.143010-1-michael@amarulasolutions.com>
 <20220201171441.GV457876@scaer>
 <CAOf5uwmK-+jU3eRRPQ4NqKaFq=OUSBTK-_kRXTc6cEsGiwm=Gg@mail.gmail.com>
 <20220201190126.GW457876@scaer>
In-Reply-To: <20220201190126.GW457876@scaer>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 1 Feb 2022 20:12:48 +0100
Message-ID: <CAOf5uw=StvMEOoRad37J_4DcKQOjfMVKApcTr3pkSAJwz4BY6Q@mail.gmail.com>
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

Hi Yann


On Tue, Feb 1, 2022 at 8:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Michael, All,
>
> On 2022-02-01 18:57 +0100, Michael Nazzareno Trimarchi spake thusly:
> > On Tue, Feb 1, 2022 at 6:14 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2022-02-01 10:13 +0100, Michael Trimarchi spake thusly:
> > > > Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> > > > into the U-Boot image using binman. This patch brings the necessary changes to
> > > > enable this feature.
>
> Also, comit log not nicely formatted: it should be wrapped at ~72 chars
> on every lines.
>
> > > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > ---
> [--SNIP--]
> > > >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
> > > >  UBOOT_DEPENDENCIES += optee-os
> > > > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
> > > >  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
>                          ,^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Note this for later ----/
>
> > > > +define UBOOT_COPY_TEE_FIRMWARE
> > > > +     cp $(BINARIES_DIR)/tee.elf $(@D)/
> > > Why do you need to copy it, when TEE is pointing to the original in
> > > $(BINARIESD_DIR), just above, and that has worked well so far?
> > The copy are needed to binman to include it
>
> As far as I understand it, BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF is supposed
> to behave like the code we had so far, and so far we did not have the
> copy, and that seems that it worked OK without the copy.
>
> Now you are adding the copy: why was it not needed before, and why is it
> needed now?
>
> And if binman needs it in the source tree, then why do we point the TEE
> variable to the original location in BINARIES_DIR, as I highlighted
> above?

binman takes this and put an image on each part. We already copy atf.
Now nxp I need to copy tee-raw.bin in tee.bin

fit {
                        description = "Configuration to load ATF before U-Boot";
                        fit,external-offset = <CONFIG_FIT_EXTERNAL_OFFSET>;
                        fit,fdt-list = "of-list";
                        #address-cells = <1>;

                        images {
                                uboot {
                                        arch = "arm64";
                                        compression = "none";
                                        description = "U-Boot (64-bit)";
                                        load = <CONFIG_SYS_TEXT_BASE>;
                                        type = "standalone";

                                        uboot_blob {
                                                filename = "u-boot-nodtb.bin";
                                                type = "blob-ext";
                                        };
                                };

                                atf {
                                        arch = "arm64";
                                        compression = "none";
                                        description = "ARM Trusted Firmware";
                                        entry = <0x960000>;
                                        load = <0x960000>;
                                        type = "firmware";

                                        atf_blob {
                                                filename = "bl31.bin";
                                                type = "blob-ext";
                                        };
                                };

                                tee {
                                        arch = "arm64";
                                        compression = "none";
                                        description = "OP-TEE Trusted
OS (bl32)";
                                        load = <0x5f800000>;
                                        entry = <0x5f800000>;
                                        type = "firmware";

                                        tee_blob {
                                                filename = "tee.bin";
                                                type = "blob-ext";
                                        };
                                };

                                binman_fip: fip {
                                        arch = "arm64";
                                        compression = "none";
                                        description = "Trusted Firmware FIP";
                                        load = <0x40310000>;
                                        type = "firmware";
                                };

                                @fdt-SEQ {
                                        compression = "none";
                                        description = "NAME";
                                        type = "flat_dt";

                                        uboot_fdt_blob {
                                                filename = "u-boot.dtb";
                                                type = "blob-ext";
                                        };
                                };
                        };

The above work working for rockchip so as we copy atf, I need to copy tee

Michael

>
> > > > +endef
> > > > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> > > > +else
> > > > +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> > > > +define UBOOT_COPY_TEE_FIRMWARE
> > > > +     cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin
> > > Ditto: why do you need to copy it, when TEE, just above, also points to
> > > the original in $(BINARIES_DIR) ?
> > Same as above
>
> Ditto.
>
> Regards,
> Yann E. MORIN.
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
