Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A77AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A4240477;
	Tue,  1 Feb 2022 19:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEJ0zcp7O-Px; Tue,  1 Feb 2022 19:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 440EE404F9;
	Tue,  1 Feb 2022 19:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02E8D1BF293
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1E51404F9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x62lB8nzxkAL for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 19:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 630D540477
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 19:47:54 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id f8so16320358pgf.8
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUQNIgz5OosK/7Uz5kTTyFXnfg7rnx8ZMtmD/wlDJSE=;
 b=kbrfYiz+uyyiV7AWishRRK/tC9Qp9eBY0ITyeujfjA30PJU5EHKnc6461KMjvrXbD7
 p0XVTE+LS9em00bsSGRmKVZPiAC+BVCWhlXTxOgzVtbLoSSO1BpNwGHiiHxCbEZtFu6t
 cNf5/ISVezYjKx8gBzPs09FEpKWoYnw53SYUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUQNIgz5OosK/7Uz5kTTyFXnfg7rnx8ZMtmD/wlDJSE=;
 b=47F65PiiTzHRPZ+pLG72jEMNLS98imQRH/pUEHCJw2E0ZqP77lfDjLN1Pm9K3iFsGp
 ALcgFS8W6v8BOm/EjyJ/ahseABuCTegSso/g0O5wXGJhCCGwRxFJt/4/L/ztg1sSZw5l
 blkj3PSUzkNbRH2KtKZI2gjMdUahGerokp4sR/ISWhQPSQNDBEJQUdNx33Z1MbuOTSxp
 PcoeMVm2drDDtkMG1ZdGbkH0tIWR8gJRwx+O9TZYpbMW361KlMGnxvjHoHJKwCZl8EAd
 /sqJN9hZL6EfCuyMUDw8zNAS+l940egOJVDP8JqizgRWCQ4stCVdsrGZNclqMaSmyRO5
 Buzw==
X-Gm-Message-State: AOAM533k3PtmypNKP1+dM+fugBRziDXrByFu5YVOKZwOFR4w3r7FDoOk
 DuQFA3pV33ax5CisPDfuwG2e5L1pn/tIxDOxhIW0kQ==
X-Google-Smtp-Source: ABdhPJwFOh9O/DN4ch7vNziO3OgTkQ7ZQUVS+Vk8UOPBTzSbptm44P4j8nS8+E3sYnDd/6laLwFP2EPI2OZMqsyyYZU=
X-Received: by 2002:a05:6a00:1d94:: with SMTP id
 z20mr26006412pfw.40.1643744873484; 
 Tue, 01 Feb 2022 11:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20220201091342.143010-1-michael@amarulasolutions.com>
 <20220201171441.GV457876@scaer>
 <CAOf5uwmK-+jU3eRRPQ4NqKaFq=OUSBTK-_kRXTc6cEsGiwm=Gg@mail.gmail.com>
 <20220201190126.GW457876@scaer>
 <CAOf5uw=StvMEOoRad37J_4DcKQOjfMVKApcTr3pkSAJwz4BY6Q@mail.gmail.com>
In-Reply-To: <CAOf5uw=StvMEOoRad37J_4DcKQOjfMVKApcTr3pkSAJwz4BY6Q@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 1 Feb 2022 20:47:41 +0100
Message-ID: <CAOf5uwmGp_3REU4PQC=kS+Oh+M+8UkzyGMebJO_+saD8PJsrGA@mail.gmail.com>
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

On Tue, Feb 1, 2022 at 8:12 PM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Yann
>
>
> On Tue, Feb 1, 2022 at 8:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Michael, All,
> >
> > On 2022-02-01 18:57 +0100, Michael Nazzareno Trimarchi spake thusly:
> > > On Tue, Feb 1, 2022 at 6:14 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > On 2022-02-01 10:13 +0100, Michael Trimarchi spake thusly:
> > > > > Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> > > > > into the U-Boot image using binman. This patch brings the necessary changes to
> > > > > enable this feature.
> >
> > Also, comit log not nicely formatted: it should be wrapped at ~72 chars
> > on every lines.
> >
> > > > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > > ---
> > [--SNIP--]
> > > > >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
> > > > >  UBOOT_DEPENDENCIES += optee-os
> > > > > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
> > > > >  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> >                          ,^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Note this for later ----/
> >
> > > > > +define UBOOT_COPY_TEE_FIRMWARE
> > > > > +     cp $(BINARIES_DIR)/tee.elf $(@D)/
> > > > Why do you need to copy it, when TEE is pointing to the original in
> > > > $(BINARIESD_DIR), just above, and that has worked well so far?
> > > The copy are needed to binman to include it
> >
> > As far as I understand it, BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF is supposed
> > to behave like the code we had so far, and so far we did not have the
> > copy, and that seems that it worked OK without the copy.
> >
> > Now you are adding the copy: why was it not needed before, and why is it
> > needed now?
> >
> > And if binman needs it in the source tree, then why do we point the TEE
> > variable to the original location in BINARIES_DIR, as I highlighted
> > above?
>
> binman takes this and put an image on each part. We already copy atf.
> Now nxp I need to copy tee-raw.bin in tee.bin
>
> fit {
>                         description = "Configuration to load ATF before U-Boot";
>                         fit,external-offset = <CONFIG_FIT_EXTERNAL_OFFSET>;
>                         fit,fdt-list = "of-list";
>                         #address-cells = <1>;
>
>                         images {
>                                 uboot {
>                                         arch = "arm64";
>                                         compression = "none";
>                                         description = "U-Boot (64-bit)";
>                                         load = <CONFIG_SYS_TEXT_BASE>;
>                                         type = "standalone";
>
>                                         uboot_blob {
>                                                 filename = "u-boot-nodtb.bin";
>                                                 type = "blob-ext";
>                                         };
>                                 };
>
>                                 atf {
>                                         arch = "arm64";
>                                         compression = "none";
>                                         description = "ARM Trusted Firmware";
>                                         entry = <0x960000>;
>                                         load = <0x960000>;
>                                         type = "firmware";
>
>                                         atf_blob {
>                                                 filename = "bl31.bin";
>                                                 type = "blob-ext";
>                                         };
>                                 };
>
>                                 tee {
>                                         arch = "arm64";
>                                         compression = "none";
>                                         description = "OP-TEE Trusted
> OS (bl32)";
>                                         load = <0x5f800000>;
>                                         entry = <0x5f800000>;
>                                         type = "firmware";
>
>                                         tee_blob {
>                                                 filename = "tee.bin";
>                                                 type = "blob-ext";
>                                         };
>                                 };
>
>                                 binman_fip: fip {
>                                         arch = "arm64";
>                                         compression = "none";
>                                         description = "Trusted Firmware FIP";
>                                         load = <0x40310000>;
>                                         type = "firmware";
>                                 };
>
>                                 @fdt-SEQ {
>                                         compression = "none";
>                                         description = "NAME";
>                                         type = "flat_dt";
>
>                                         uboot_fdt_blob {
>                                                 filename = "u-boot.dtb";
>                                                 type = "blob-ext";
>                                         };
>                                 };
>                         };
>
> The above work working for rockchip so as we copy atf, I need to copy tee
>

For your better understand this is my config change for the board I
sent yesterday

BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="BL32_BASE=0x5f800000
BL32_SIZE=0x800000"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="imx-mx8mnevk"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_UART_BASE=UART4_BASE
CFG_DDR_SIZE=0x20000000 CFG_TZDRAM_SIZE=0x600000
CFG_SHMEM_SIZE=0x200000 CFG_TEE_CORE_NB_CORE=1"
+BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee.bin tee-*_v2.bin tee-raw.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
@@ -36,6 +47,7 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"

I have sent a patch upstream for atf in order to calculate better reserved area.

Michael

> Michael
>
> >
> > > > > +endef
> > > > > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> > > > > +else
> > > > > +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> > > > > +define UBOOT_COPY_TEE_FIRMWARE
> > > > > +     cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin
> > > > Ditto: why do you need to copy it, when TEE, just above, also points to
> > > > the original in $(BINARIES_DIR) ?
> > > Same as above
> >
> > Ditto.
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
>
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com



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
