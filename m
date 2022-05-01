Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FEDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 21:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 602658346C;
	Sun,  1 May 2022 21:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IB0WD6kmh9SO; Sun,  1 May 2022 21:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F77083459;
	Sun,  1 May 2022 21:30:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F63B1BF34D
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 21:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C4F940995
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 21:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARYfr-PMFOed for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 21:30:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAEC740994
 for <buildroot@buildroot.org>; Sun,  1 May 2022 21:30:06 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id e4so13751200oif.2
 for <buildroot@buildroot.org>; Sun, 01 May 2022 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0dkDSQ6BocFd+vHV4RtusKzLNj6GZsCmxcCulY43dQ=;
 b=GMBtRaLaSMa/MX+ke84vaHTuiw7mbJ2ObV0IgfS3x0Yd+eBqUokXlhDlleSFiudd1m
 CfDfJctqdVi5a1KLitnq4MYMIpcvAkg4wp+lcDrSz7YrVNfaPMkSKnZsel7TXdSuf4Zj
 PrI2nz8dx2aqSdzDnOSZSLN3+0+7OQsrvqGYh8PYeztyYD6tsMoFw8gi8Ua9qUa2Uvri
 xWuKM0qSyStjrEqlxbTru/WMrKp5Me1OLDfyJxv1Znuuc0ghVg1dnOQ/khesBHNh1W+H
 iw1dxfvQmdtM9BVf/aSPpUrQdhM2XM944w4tuAxFvloE95Zzn7eUGFZY+fbMTtjl59E2
 Sn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0dkDSQ6BocFd+vHV4RtusKzLNj6GZsCmxcCulY43dQ=;
 b=jCPMQdfGkyFU1D/6JDONWBNl4+ZAxDMxrVb5tIf3LzeG3DWrsDveI5VCg+fLi+6Y/i
 LsujHaO977mRiRNFzbZeY1+ajHZUebg29KvN8RLwT5Elk17ViRlDv+PauDPqHgTYiaZG
 2dEaMYxqv4wdMsltkmwZtCtezzHezIucmmJZ5fXq6U3yImKdsvMd+U6JKlGECUI1wDXd
 F6U9i7EgixHqr4vuXitE7LsoLxlqqXloh8fOCw/lpqHkBGsLbV9qJ40WVuzxVV1wzx/c
 sZveC32YF4sInkMRZMgvYcyRPC39/XBx8xOnfd55c8WnpavfMN/pH/YFLiYXVVA8flsu
 FQGw==
X-Gm-Message-State: AOAM533CSQfqcKGRHyMxu+/QXtUqg+lor95RCihx78Y32lZHlh6/3NVN
 6sEyF5OPf6sLP8R4M3UMRIsUwkZd3pr1pXC8Wxo=
X-Google-Smtp-Source: ABdhPJx7kEFOFwW7o9UN+bOPgETtt1QQG6cEm2NrwIuktbGNcWFgGzmf45RYLlVxSfE4FN50T+rS6hWux7RkGsZIIKk=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr5702407oia.200.1651440605557; Sun, 01
 May 2022 14:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220501074401.1135229-1-james.hilliard1@gmail.com>
 <20220501201344.GS3624965@scaer>
In-Reply-To: <20220501201344.GS3624965@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 1 May 2022 15:29:54 -0600
Message-ID: <CADvTj4px6UyPDH3TVUb8OO4LLDYu+wg6XBnfnt2JtG5b=0LZ8g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/pkg-python: add
 setuptools-rust infrastructure
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

On Sun, May 1, 2022 at 2:13 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-05-01 01:44 -0600, James Hilliard spake thusly:
> > The setuptools-rust package infrastructure is essentially a variant
> > of the setuptools package infrastructure which sets up the env
> > and download hooks required for building setuptools-rust packages.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> First, thanks a lot for working on this topic; this is greatly
> appreciated.
>
> However, I believe this one is going a bit too far, at least for now.
> Indeed, in Buildroot, we try to wait for until we have a few examples
> of a specific package type before we add infrastructure support for it.
> Usually, that rounds at about 5-ish packages.
>
> For now, we have a single python package that is partly written in rust,
> and it is not very complex, so we can live with it for now, and it
> serves as a pretty good example of what is needed.

I found it wasn't very clear in differentiating what variables/deps are specific
to setuptools-rust and what are specific to python-cryptography.

>
> However, what I am afraid of, is that even non-python packages may end
> having parts of them written in rust, and so maybe we would need a more
> generic solution, with something that's be used like $(kernel-module)
> or just with variables...

The setuptools-rust SETUP_TYPE is meant to be used with packages using
the setuptools-rust extension(https://github.com/PyO3/setuptools-rust), it's
not something generic that would make sense for non-python packages or
even python packages using a different type of rust integration as some of
the env variables are specific to the setuptools-rust extension(although
there may be some common env variables that can be shared in that case).

Other python based build systems like meson have some rust support as
well but they would not make use of this as setuptools-rust is not how they
implement their rust integrations

>
> Until we have more such examples, then it is hard to be sure that a new
> type of python packages is ther good approach or not.

Let me see if there's any other packages we have that may be migrating
to setuptools-rust.

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/pkg-python.mk | 46 ++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index b86e12423f..a9bb12550c 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -110,6 +110,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
> >       --root=/ \
> >       --single-version-externally-managed
> >
> > +# Target setuptools-rust-based packages
> > +PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> > +     $(PKG_PYTHON_SETUPTOOLS_ENV) \
> > +     $(PKG_CARGO_ENV) \
> > +     PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> > +
> > +PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
> > +     $(PKG_CARGO_ENV)
> > +
> > +# Host setuptools-rust-based packages
> > +HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> > +     $(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> > +     $(HOST_PKG_CARGO_ENV) \
> > +     PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> > +
> > +HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
> > +     $(HOST_PKG_CARGO_ENV)
> > +
> >  # Target pep517-based packages
> >  PKG_PYTHON_PEP517_ENV = \
> >       $(PKG_PYTHON_ENV)
> > @@ -177,14 +195,30 @@ $(2)_BASE_BUILD_CMD   = setup.py build
> >  $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
> >  endif
> >  # Setuptools
> > -else ifeq ($$($(2)_SETUP_TYPE),setuptools)
> > +else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
> >  ifeq ($(4),target)
> > +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> > +$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
> > +$(2)_DL_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
> > +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
> > +else
> >  $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
> > +endif
> >  $(2)_BASE_BUILD_CMD = setup.py build
> >  $(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> >  $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
> >  else
> > +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> > +$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
> > +$(2)_DL_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
> > +ifndef $(2)_CARGO_MANIFEST_PATH
> > +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
> > +else
> > +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
> > +endif
> > +else
> >  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> > +endif
> >  $(2)_BASE_BUILD_CMD = setup.py build
> >  $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
> >  endif
> > @@ -208,7 +242,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
> >  $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
> >  endif
> >  else
> > -$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> > +$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
> >  endif
> >
> >  # Target packages need both the python interpreter on the target (for
> > @@ -225,8 +259,14 @@ endif # ($(4),target)
> >  # Setuptools based packages will need setuptools for the host Python
> >  # interpreter (both host and target).
> >  #
> > -ifeq ($$($(2)_SETUP_TYPE),setuptools)
> > +ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
> >  $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> > +ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> > +$(2)_DEPENDENCIES += host-python-setuptools-rust host-rustc
> > +# We need to vendor the Cargo crates at download time
> > +$(2)_DOWNLOAD_POST_PROCESS = cargo
> > +$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
> > +endif
> >  else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> >  $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> >  ifeq ($$($(2)_SETUP_TYPE),flit)
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
