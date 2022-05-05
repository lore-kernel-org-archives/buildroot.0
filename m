Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD2C418FC;
	Thu,  5 May 2022 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sbt71SGQVnOr; Thu,  5 May 2022 20:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB91F41976;
	Thu,  5 May 2022 20:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 448061BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4080041976
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbN1I8VUSeJ5 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A675E418FC
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:54:03 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id y63so5584759oia.7
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oZOF88nrfw8iGEt22XudpO2ZO2YcEAoechKP5U8yh5I=;
 b=MXJtDO7I4FkE7ih/qL0/wwGJZmBJc1F/OzCJzLcb0+KFvHxI0bABen9yhTyLYzE1Mm
 PmbknB1EvX6LtpmTCIaBWyMoSeL/ki4W2UP0zPpu5u6jOzUfA2qksFwsccyKmE8v3UlD
 hPNhs1lyCkZjCtLrnCinsa40OWJS7yb7rQ5N889404Ta1JD+ysXANcssOHej+vuDEdkF
 tq91u9HsiA0dBUL0yT79kEbep74p3hZDVavymDW0HojIb8HCgAiIBJN8N0yYkMMyXQl4
 Ad9kNZubze9I51vW+xbEMekdQrQeM8CXb+L3/grnG8c8dGijU62fvBKJ/75+45+13IBI
 MW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oZOF88nrfw8iGEt22XudpO2ZO2YcEAoechKP5U8yh5I=;
 b=2soDFaC3OnVlLPGdjcxpvTpHwGkZM4Jc0d2S2pqfcF2O6/S+nSUt4mV/72xjmICPbV
 DeARWGFppkON8b0tTBVAVX9ZSJbL7F6Rsfcawwrx31bo5/RAqG5xwr5MuX0k/9yHJ7T/
 8P0883ok8DkSSDUA7hAtokJXPc1kUL41y2IoW0QU6zjulp16T/y/JyoscVxz8c42pMgz
 0ZqxdESgexQNHpIaklxxglKnrEXdVNnZwiV6XrTNs0YgWTTuwchPX5RicUbOt2dUa87/
 WFBYgZR9zDthnKEb1/ExSdH5DnXg3I1WXB/fnAx3URfTQxKDFGeO3orXWAMPFy10SDv5
 Z9YQ==
X-Gm-Message-State: AOAM533z6UP5GinEoENd0kiKZd4ZzBpQqq3+1gOcq4ZVWNt874xAMFuE
 DaZRYaQicJF/wFCzhDQ0eYMa0zcyUh3+TUoRPJ0=
X-Google-Smtp-Source: ABdhPJwvUaU4YEhpr0+z+qsPLt8I1smiav38rtSItKiTGpNs8CFWPGFiYpBiDh24eytO16W5busHqh5ALUPer+uMXIg=
X-Received: by 2002:a05:6808:1da:b0:325:bf8e:df25 with SMTP id
 x26-20020a05680801da00b00325bf8edf25mr57547oic.99.1651784042620; Thu, 05 May
 2022 13:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220505064009.2542433-1-james.hilliard1@gmail.com>
 <e4ccdb7f-f09f-ffbd-4450-4dcf459a6ee9@mind.be>
In-Reply-To: <e4ccdb7f-f09f-ffbd-4450-4dcf459a6ee9@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 5 May 2022 14:53:51 -0600
Message-ID: <CADvTj4q5cDh2YPxwUBCiZd4VCoGz9M6Md3Efz92mBDxphBLuPQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, May 5, 2022 at 2:02 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/05/2022 08:40, James Hilliard wrote:
> > As of version 0.54.0 meson has had the ability to build and install
> > packages rather than having to run ninja directly as before.
> >
> > This will allow us to use features such as meson install tags in
> > the future which require meson to be used for the installation.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   .../gobject-introspection.mk                  |  4 +-
> >   package/pkg-meson.mk                          | 52 ++++++++++++++-----
> >   package/systemd/systemd.mk                    |  4 +-
> >   3 files changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> > index 41d64171a7..ea5100247d 100644
> > --- a/package/gobject-introspection/gobject-introspection.mk
> > +++ b/package/gobject-introspection/gobject-introspection.mk
> > @@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
> >       host-python3
> >
> >   # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
> > -GOBJECT_INTROSPECTION_NINJA_ENV += \
> > +GOBJECT_INTROSPECTION_MESON_ENV += \
>
>   If there are external packages that use this, they'll need to be updated as
> well. Yann, Peter, do you think that's acceptable?

I assume this is fairly rare, as it is barely even used in buildroot itself.

>
>   For sure, the documentation docs/manual/adding-packages-meson.txt will need to
> be updated.

Docs updated in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20220505205203.1079204-1-james.hilliard1@gmail.com/

>
>   Regards,
>   Arnout
>
> >       CC="$(TARGET_CC)"
> >
> >   # When building, gobject-introspection uses tools/g-ir-scanner to build several
> >   # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> >   # links to the system-installed libglib2 path. To remedy this issue, defining
> >   # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> > -HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> > +HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
> >       LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
> >
> >   # Use the host gi-scanner to prevent the scanner from generating incorrect
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index f1390a18d0..bdea893d93 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -21,13 +21,13 @@
> >   ################################################################################
> >
> >   #
> > -# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
> > +# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
> >   # $(HOST_DIR)/bin/python3 will not look for Meson modules in
> >   # $HOME/.local/lib/python3.x/site-packages
> >   #
> > -MESON                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> > -NINJA                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> > -NINJA_OPTS   = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> > +MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> > +MESON_BUILD_OPTS   = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> > +MESON_INSTALL_OPTS = --no-rebuild
> >
> >   # https://mesonbuild.com/Reference-tables.html#cpu-families
> >   ifeq ($(BR2_arcle)$(BR2_arceb),y)
> > @@ -172,13 +172,23 @@ $(2)_DEPENDENCIES += host-meson
> >   ifndef $(2)_BUILD_CMDS
> >   ifeq ($(4),target)
> >   define $(2)_BUILD_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   else
> >   define $(2)_BUILD_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >   endif
> > @@ -189,8 +199,12 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_CMDS
> >   define $(2)_INSTALL_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > @@ -200,8 +214,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_STAGING_CMDS
> >   define $(2)_INSTALL_STAGING_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(STAGING_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > @@ -211,8 +230,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_TARGET_CMDS
> >   define $(2)_INSTALL_TARGET_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(TARGET_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index b309507e12..ea6f5febc2 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -746,7 +746,7 @@ endef
> >   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> >
> >   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> > -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> > +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >   define SYSTEMD_LINUX_CONFIG_FIXUPS
> >       $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> > @@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >       host-gperf \
> >       host-python-jinja2
> >
> > -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > -
> >   # Fix RPATH After installation
> >   # * systemd provides a install_rpath instruction to meson because the binaries
> >   #   need to link with libsystemd which is not in a standard path
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
