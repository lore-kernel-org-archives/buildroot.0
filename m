Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47731C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 18:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B4481ADE;
	Sun, 13 Mar 2022 18:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCeTQRe_piDB; Sun, 13 Mar 2022 18:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DBA81975;
	Sun, 13 Mar 2022 18:15:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33311BF41C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD6BD81975
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dI4sP_zr5kMN for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 18:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A3B18196E
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 18:15:22 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so17446267oos.9
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DkUqBozHaUSaJr9GV+xRYNbbgizYlTeGQ4lqoMuZZQ=;
 b=Bg+epPf5LcPOjczGxLqG0Y9KQtCHlzASN//O5JjhXl9i1GkpZOLT3iPHG8Xm4t/sxm
 4Y47lIwOT22t/eJNP7q2KFPkI1GOPda+VrUsxAUlXe8yrM6G5J308UnMa0xIPulA5Hlq
 0Detaj+f24yBr88Ub6m53jyPy+9OUJpDFDxLhOC726+rzjO8OQ2wVOojZW+fEk4HMg/M
 4dd/YoRjpcPC5+8pGniphwBftrZ0X3ZB93FyZpGC12U3kdANzuRbKehiOGqDV3obbVwK
 JS9g80KEmCim6yBjumn3/Ssp+bF1HLcW5wpEjvNK9DJ2PuDZrH1TIin1ub0uphlTGTEa
 D2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DkUqBozHaUSaJr9GV+xRYNbbgizYlTeGQ4lqoMuZZQ=;
 b=7MuC9SgQy0xlgN4HTI5EIqL3tZANXI7ogpyDKuol+sTCN+J3XqeM8c/IbNHjGIytju
 sRsDGXq408UNfsyfOcOkG/fyxEOsSvWi0Kd2RmBccnFm2T2xjGHYjgGmYfRZ9kUL6zXp
 Pjw0J3tYIH2jYPVJlao56iS9XUzVPBrlt6hKiGw60oCKNC44AHFbapAIqP8W1esaljL5
 GzI6IoeiRvqK6Zm4sKJ+zUgW+lYz6TYQFsHLg1DLOfm3IHWM8fmSok5hJSixlvoDO/uc
 VaklvgBoJuvLbXMM/7qYDpsX3kKKyTWymSzCauehSOgK6hZXKbAZLeOjbgEJE2HF3pc2
 5DZQ==
X-Gm-Message-State: AOAM531Q16OHnbjJ5+dzTF6S58nRF2b7qy8pbab1gq8AYupCufHroDqa
 YtNk9kR8Rb+n6U1Bm6gnt5xZdWUSHCcgHeCw7l0=
X-Google-Smtp-Source: ABdhPJyNuVOhjbEe6wQdy1zCXWhJGFQ2pgj6pdZMaCD4tjjE9+FaImPX3enCxW3R+onpLzqNFAvMHQBFnxJnY7Ksu/Q=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:2b29 with SMTP id
 h16-20020a056870d25000b000da0b3f2b29mr14570901oac.200.1647195321113; Sun, 13
 Mar 2022 11:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220313122112.261290-1-james.hilliard1@gmail.com>
 <20220313162132.GT283544@scaer>
In-Reply-To: <20220313162132.GT283544@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Mar 2022 12:15:10 -0600
Message-ID: <CADvTj4r_AndQR_zNNbUR+B-JzoGt4vgqJ9EeP5LL+WDAnPfrcQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-python: migrate flit to new
 bootstrapping sequence
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 13, 2022 at 10:21 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-03-13 06:21 -0600, James Hilliard spake thusly:
> > There are a number of flit toolchain dependencies currently in the
> > process of deprecating distutils based fallbacks.
> >
> > This will be needed in order to update tomli.
> >
> > We need to migrate these to use a new bootstrap based build+install
> > sequence which relies on flit's bootstrap wheel build+install
> > features to build and install host-python-pypa-build and
> > host-python-installer which gives us a full pep517 toolchain.
>
> Would it be possible to split this change into separate patches:
>
>   - introduce the new support,
>   - migrate patches one by one
>   - drop the leftovers of no longer needed stuff
>
> Also, see below...
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 52ce402281..6dee8aa7d1 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> [--SNIP--]
> > @@ -212,7 +215,16 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
> >  else
> >  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
> >  $(2)_BASE_BUILD_CMD = -m build -n -w
>
> So this assignment to $(2)_BASE_BUILD_CMD...
>
> > -$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
> > +$(2)_BASE_BUILD_CMD = $$(if $$(filter \

Removed in v2.

>
> ... is completely overriden here...
>
> > +     host-python-flit-core \
> > +     host-python-installer \
> > +     host-python-pep517 \
> > +     host-python-tomli,$(1)),\
> > +     -m flit_core.wheel,\
> > +     -m build -n -w)
> > +$(2)_BASE_INSTALL_CMD = $$(if $$(filter host-python-flit-core,$(1)),\
> > +     -m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS),\
> > +     $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS))
> >  endif
> >  else
> >  $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> > @@ -235,9 +247,19 @@ endif # ($(4),target)
> >  ifeq ($$($(2)_SETUP_TYPE),setuptools)
> >  $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> >  else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> > -$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> > +$(2)_DEPENDENCIES += $$(if $$(filter \
> > +     host-python-flit-core \
> > +     host-python-installer \
> > +     host-python-pep517 \
> > +     host-python-pypa-build \
> > +     host-python-tomli,$(1)),,\
> > +     host-python-pypa-build)
>
> This is totally unreadable. One can't easily spot what is filtered from
> what...
>
>     $(2)_DEPENDENCIES += $$(if \
>         $$(filter \
>             host-python-flit-core host-python-installer host-python-pep517 host-python-pypa-build host-python-tomli, \
>             $(1)) \
>         , \
>         host-python-pypa-build
>     )

Reformatted in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20220313175615.406390-1-james.hilliard1@gmail.com/

>
> So, what this is saying, as I can understand, is that if the current
> package is one of the list;
>     host-python-flit-core host-python-installer host-python-pep517
>     host-python-pypa-build host-python-tomli
>
> then we want to add host-python-pypa-build to their dependency.

No, host-python-pypa-build and those packages are normally flit infra
dependencies
but we must exclude them as bootstrapping requires special
build+install procedures
needed to prevent circular dependencies.

>
> However, from what I understand, all those packages really are packages
> that implement the 'flit' and pep517 now?) infrastructure, and thus the
> dependency should be explicitly listed in those packages, rather than
> implcitly added by the infra.
>
> > +$(2)_DEPENDENCIES += $$(if $$(filter \
>
> Why use an other assignment to the same variable? It could be a single
> assignment...

This is an exclusion to avoid circular dependencies.

>
> > +     host-python-flit-core \
> > +     host-python-installer,$(1)),,\
> > +     host-python-installer)
>
> Ditto, this should be explictly added to the packages.

This is also an exclusion to avoid circular dependencies.

>
> >  ifeq ($$($(2)_SETUP_TYPE),flit)
> > -$(2)_DEPENDENCIES += host-python-flit-core
> > +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
>
> I don't understand how this is going to work. The dependency exclusion
> here is correct, indeed, I am not questionning that.
>
> However, I don't understand how host-python-flit-core can use the flit
> type at build time, when it is not already installed, especially since
> host-python-flit-core does not define any custom configure/build/install
> commands...

Flit's bootstrap builder and installer both work without special
handling since we
run from the package source directly, this is fine for flit since flit
is pure python
and does not technically need to be built before it can run.

>
> You will have to add a blurb in the commit log to explain how it
> works...
>
> >  endif
> >  endif # SETUP_TYPE
> >
> > diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> > index 0e058a1f17..d206a72f82 100644
> > --- a/package/python-flit-core/python-flit-core.mk
> > +++ b/package/python-flit-core/python-flit-core.mk
> > @@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
> >  PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
> >  PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
> >  PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
> > -PYTHON_FLIT_CORE_SETUP_TYPE = pep517
> > +PYTHON_FLIT_CORE_SETUP_TYPE = flit
>
> Yup, see my comment above, about the corresponding change in the infra.
>
> >  $(eval $(host-python-package))
> > diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
> > index 862a251415..97a158b738 100644
> > --- a/package/python-installer/python-installer.mk
> > +++ b/package/python-installer/python-installer.mk
> > @@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
> >  PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
> >  PYTHON_INSTALLER_LICENSE = MIT
> >  PYTHON_INSTALLER_LICENSE_FILES = LICENSE
> > -PYTHON_INSTALLER_SETUP_TYPE = distutils
> > +PYTHON_INSTALLER_SETUP_TYPE = flit
> > +HOST_PYTHON_INSTALLER_ENV = PYTHONPATH=$(@D)/src
>
> Why do we need to provide this here? Can't that be made generic be using
> something like HOST_PYTHON_INSTALLER_SUBDIR=src ?

This is needed to allow host-python-installer to install itself, it's
a one-off special case
just needed for this package to avoid a circular dependency on itself
for install.

>
> python-package already uses $(2)_BUILDDIR, which by default is the same
> as $(2)_SRCDIR, which by default is (basically) $(@D)/$(2)_SUBDIR, so it
> should jsut work automatically, no?

We only want to modify PYTHONPATH, the installation still should be
invoked from the
$(2)_BUILDDIR as we normally do. We need to add $(2)_BUILDDIR/src to
the PYTHONPATH
since $(TOPDIR)/support/scripts/pyinstaller.py depends on host-python-installer.

>
> Regards,
> Yann E. MORIN.
>
> >  $(eval $(host-python-package))
> > diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> > index 99aa62d51d..1ca1bc4e35 100644
> > --- a/package/python-pep517/python-pep517.mk
> > +++ b/package/python-pep517/python-pep517.mk
> > @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
> >  PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
> >  PYTHON_PEP517_LICENSE = MIT
> >  PYTHON_PEP517_LICENSE_FILES = LICENSE
> > -PYTHON_PEP517_SETUP_TYPE = distutils
> > +PYTHON_PEP517_SETUP_TYPE = flit
> >  HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
> >
> >  $(eval $(host-python-package))
> > diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> > index b8c20ca736..3539a505be 100644
> > --- a/package/python-tomli/python-tomli.mk
> > +++ b/package/python-tomli/python-tomli.mk
> > @@ -7,7 +7,7 @@
> >  PYTHON_TOMLI_VERSION = 1.2.0
> >  PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
> >  PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> > -PYTHON_TOMLI_SETUP_TYPE = distutils
> > +PYTHON_TOMLI_SETUP_TYPE = flit
> >  PYTHON_TOMLI_LICENSE = MIT
> >  PYTHON_TOMLI_LICENSE_FILES = LICENSE
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
