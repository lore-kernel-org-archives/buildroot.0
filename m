Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86B3C433FE
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B544400C8;
	Wed,  1 Dec 2021 17:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgOvt-QoAbIL; Wed,  1 Dec 2021 17:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF9E4014C;
	Wed,  1 Dec 2021 17:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE841BF2A0
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BA5661BD5
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kswMo_PS7Mn8 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 17:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BBEC60665
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 17:56:55 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so14875218otu.10
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LF9jO6/RMfB+yoN695QaJWDp+ztrnsba397o6x3Bdsk=;
 b=C7+5ydKrLCvHI6wwWd/jbru1Se7+0UXTaIvREN+WJeMnsBLVl3kRTeR/AjpEn0OdRO
 tKloNKaCo7iLPDr48GoRg6+Z1Zmas0haGJY924uSX22wHOmS5W7louWNplRxDVUek/b4
 HMQ2thT9NAGnRsF/HFSnFPGxvFY99A/8gNoJgKgMiWoUjRnuWyorYiNeXg4g6+BkLFxy
 j55DamciBsI9lpperdaV+c9HHyuQjwkWByzvqsQkDyuVbqtUL3q756+sKnD4KSlKTB7H
 VGI4yoAmg1QGlIkS5eVfWeOVbEbu4T7ClqxJUoSh9U4fBZqPRCb7JOTs+Oqt6NUg5PhJ
 SZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LF9jO6/RMfB+yoN695QaJWDp+ztrnsba397o6x3Bdsk=;
 b=KDiIyHHpCa64si56g5Fh1IPSlMqoPjrYw2YPGBcwS2d4D9ObWF+zQcy59Ebt9jHCi6
 ofrERjiI8ZwlKAl1ijdSZaxCwaShQp52m2zmyMeG+T0tJyyV4Dv4jp7ffH+zqPnltsVp
 H5lWijRmbgvWeQCUiEK04fJJ2/krh+Y1HU+V59GQlMpNo1d1eFegjgIvCoMeATQnUJXw
 bDXvP+P6AHKpvr5AHJ+A/u3IuIUg+9mvxc06m29GVP2oVurAenB0ZzCqWinCJeO58cxU
 +cEIztYxJ9itavcXINfBaDnkFsKgcB1eqXttL8CJiG3pJM4uv5GVNVSoqdPEnNqukJgf
 Ksgg==
X-Gm-Message-State: AOAM531y1PVULaOFXAUYCsAHz3IaFDcCnMJBP9Kz7owpGJbGa8b9cyJE
 nfT5hY7O0meYtRMTkkTLH7Y+ctw9bIQsZCpGdd5Vpvrwg406lA==
X-Google-Smtp-Source: ABdhPJyxiyfodYEDnfdyJXPYrgEUOiKBfcvtbgUNYpRuJ8PZV/wD62NrrsuCrr0ws7MONlIBR6oDdjyMRUqf+lOa5Es=
X-Received: by 2002:a9d:4509:: with SMTP id w9mr6841712ote.214.1638381414340; 
 Wed, 01 Dec 2021 09:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20211130215547.3717152-1-yann.morin.1998@free.fr>
 <CAFSsvmotx0kvnVsKf+bCwh4SCecsfUyds0zDUytMDfcgeH0-NA@mail.gmail.com>
In-Reply-To: <CAFSsvmotx0kvnVsKf+bCwh4SCecsfUyds0zDUytMDfcgeH0-NA@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 1 Dec 2021 09:56:43 -0800
Message-ID: <CAFSsvmqi7q7EEQyLLrXk89zPAr6GEhYJ9dER59mAK7Ceb000dw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCHv5] package/mender-grubenv: fix grub module
 checks
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

May I suggest:

define MENDER_GRUBENV_INSTALL_EFI_CFG
mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
$(BINARIES_DIR)/efi-part/EFI/BOOT
endef
endif

and

define MENDER_GRUBENV_INSTALL_I386_CFG
mkdir -p $(BINARIES_DIR)/boot-part/grub
cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
$(BINARIES_DIR)/boot-part/grub
endef
endif

?

On Wed, Dec 1, 2021 at 9:29 AM Adam Duskett <aduskett@gmail.com> wrote:
>
> Hello;
>
> Thank you for the help Yann! I really appreciate your time!
>
> On Tue, Nov 30, 2021 at 1:55 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > From: Adam Duskett <aduskett@gmail.com>
> >
> > Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
> > configurations in the same build) broke mender-grubenv by splititng up
> > BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
> > legacy boot, and one for EFI boot.
> >
> > This causes a systematic build failure now, as the legacy variable
> > BR2_TARGET_GRUB2_BUILTIN_MODULES is now always empty (during build).
> >
> > We fix that by suplicating the missing modules check: one for EFI and
> > one for legacy boot.
> >
> > The EFI check is tricky: idneed, there can be more than one EFI platform
> > enabled simlutaneouslyl indeed, on x86_64 we can have bothe ehte 32-bit
> > and 64-bit EFI platforms enabled. So the check is inverted, and we check
> > that no platform is not enabled (yeah, double negation). For consistency,
> > we do the same for the legacy b oot, even though in that case there can
> > only ever be only one enabled at once at most.
> >
> > Finally, the install commands are split into two macros, that are also
> > defined conditionally under the same conditions as the checks are done.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > [yann.morin.1998@free.fr:
> >   - drop superfluous check on empty modules lists
> >   - move EFI and legacy commands under same condition as checks
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> > changes v1 -> v2:
> >   - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
> >     ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2
> > efi
> >     scenarios. (Thomas)
> >
> >   - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
> >     BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)
> >
> > Changes v2 -> v3:
> >   - Check for both MODULES_EFI and MODULES_PC (Thomas)
> >
> > Changes v3 -> v4:
> >   - Add qstrips to needed variables (Thomas)
> >   - Check for empty module lists (Thomas)
> >   - Split up MENDER_GRUBENV_INSTALL_IMAGES_CMDS to work with pc and efi
> >     at the
> >     same time.
> >
> > Changes v4 -> v5 (Yann):
> >   - drop superfluous check on empty modules lists
> >   - move EFI and legacy commands under same condition as checks
> > ---
> >  package/mender-grubenv/mender-grubenv.mk | 56 ++++++++++++++++--------
> >  1 file changed, 37 insertions(+), 19 deletions(-)
> >
> > diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
> > index 07df25512c..a910f55cb4 100644
> > --- a/package/mender-grubenv/mender-grubenv.mk
> > +++ b/package/mender-grubenv/mender-grubenv.mk
> > @@ -31,14 +31,44 @@ MENDER_GRUBENV_DEFINES = \
> >  # These grub modules must be built in for the grub scripts to work properly.
> >  # Without them, the system will not boot.
> >  MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
> > -MENDER_GRUBENV_MODULES_MISSING = \
> > -       $(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
> > +
> > +# grub2 does not provide a syntetic EFI option, so check all of them
> > +ifneq ($(BR2_TARGET_GRUB2_I386_EFI)$(BR2_TARGET_GRUB2_X86_64_EFI)$(BR2_TARGET_GRUB2_ARM_EFI)$(BR2_TARGET_GRUB2_ARM64_EFI),)
> > +MENDER_GRUBENV_MODULES_MISSING_EFI = \
> > +       $(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
> >                 $(MENDER_GRUBENV_MANDATORY_MODULES))
> >
> > +define MENDER_GRUBENV_INSTALL_EFI_CFG
> > +       mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
> > +       cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
> > +               $(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
> > +               $(BINARIES_DIR)/efi-part/EFI/BOOT
> > +endef
> > +endif
> > +
> > +# grub2 does not provide a syntetic legacy boot option, so check all of them
> > +ifneq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),)
> > +MENDER_GRUBENV_MODULES_MISSING_PC = \
> > +       $(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
> > +               $(MENDER_GRUBENV_MANDATORY_MODULES))
> > +
> > +define MENDER_GRUBENV_INSTALL_I386_CFG
> > +       mkdir -p $(BINARIES_DIR)/boot-part/grub
> > +       cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
> > +               $(TARGET_DIR)/boot/grub/mender_grubenv* \
> > +               $(BINARIES_DIR)/boot-part/grub
> > +endef
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
> > -ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
> > -$(error The following missing grub2 modules must be enabled for mender-grubenv \
> > -       to work: $(MENDER_GRUBENV_MODULES_MISSING))
> > +ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
> > +$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
> > +       to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
> > +endif
> > +
> > +ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
> > +$(error The following missing grub2 pc modules must be enabled for mender-grubenv \
> > +       to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
> >  endif
> >  endif
> >
> > @@ -54,21 +84,9 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
> >         $(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> >  endef
> >
> > -# Overwrite the default grub2 config files with the ones in this package.
> > -ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
> >  define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
> > -       mkdir -p $(BINARIES_DIR)/boot-part/grub
> > -       cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
> > -               $(TARGET_DIR)/boot/grub/mender_grubenv* \
> > -               $(BINARIES_DIR)/boot-part/grub
> > +       $(MENDER_GRUBENV_INSTALL_I386_CFG)
> > +       $(MENDER_GRUBENV_INSTALL_EFI_CFG)
> >  endef
> > -else
> > -define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
> > -       mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
> > -       cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
> > -               $(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
> > -               $(BINARIES_DIR)/efi-part/EFI/BOOT
> > -endef
> > -endif
> >
> Bleh, unfortunately, this fails if multiple grubs are selected thanks
> to the following lines in the .mk file:
>
> ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
> MENDER_GRUBENV_ENV_DIR = /boot/grub
> else
> MENDER_GRUBENV_ENV_DIR = /boot/EFI/BOOT
> endif
>
> This fails with the following error:
> mkdir -p output/images/boot-part/grub
> cp -dpfr output/target/boot/grub/grub.cfg
> output/target/boot/grub/mender_grubenv* output/images/boot-part/grub
> mkdir -p output/images/efi-part/EFI/BOOT
> cp -dpfr output/target/boot/EFI/BOOT/grub.cfg
> output/target/boot/EFI/BOOT/mender_grubenv*
> output/images/efi-part/EFI/BOOT
> cp: cannot stat 'output/target/boot/EFI/BOOT/grub.cfg': No such file
> or directory
> cp: cannot stat 'output/target/boot/EFI/BOOT/mender_grubenv*': No such
> file or directory
>
> What would you suggest?
>
> Adam
> >  $(eval $(generic-package))
> > --
> > 2.25.1
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
