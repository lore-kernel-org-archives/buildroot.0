Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF26C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B98D4056C;
	Sun, 13 Mar 2022 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBSb7hxeVCat; Sun, 13 Mar 2022 09:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04EEF403B8;
	Sun, 13 Mar 2022 09:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142711BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D644403B8
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxsIimwCEHV3 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:43:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B00B401E1
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:43:01 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so9660012otl.12
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpNmCzPqWHGAAOHPYHCfuXg3DXetzzySegRwOAyBzR8=;
 b=X7rCa0/N9RTtwcuW+gDNq6FVULaZT8oy1eEI/V5ITdXlGEDFnQtXFp2YgDGbT/HlsR
 3PcPE1cKukOMRtqPTj9dlVbG2BTsu73rt63N2rvHgaToCLqojvg7+fJs+d9Wr6EUYGtQ
 U6242N/7/XV1HUwg+QxdDQ1vDIrzGRNulgZ/P/830gyzb7FJ3phr6/lx7kMxkTWjc3pF
 jQv82jna3uGGeziF6645xIEIxDry11zYOfsAvWyTHmkfs6p1UWf1GEKUjY3tcQ21BgKl
 KPUdfovlHDITPLloVmUwgqrszT7pxexqtq/G2ECz6Oc/d7V+DRc9wCV3ysT4Ikun+8am
 nkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpNmCzPqWHGAAOHPYHCfuXg3DXetzzySegRwOAyBzR8=;
 b=aEaq2OCeaCqOzELzKYdwoI9vHNJhLTMSYXmb4zGCaRljNAvTOu4R8t8dUeBGqUwwz0
 i42ypqpsd8mXPVo9SbcBji7eTpPhntMKLRKzwNtBubtVO3/DZiYrRyn4Wpq5YPz3uyOS
 XbrbcUR68wUt6xPuS2takNyVWxVU91V6CK5GtULm/gWiSOcySE/CCVbYp4UWyW6ug7qc
 8RgEYxY5jcoXu0TOKqs66aaVRe5Y7HnLx9hkfxAS/kj/79jDYf56wYEBQm5nemzfUbF5
 lLZYhhzI+BBvlixtsMqmT5PLf8avsDENHgAa8FzsoUZFC8JezU70po2lmNu2edYJb3Se
 Rg3g==
X-Gm-Message-State: AOAM53044xtNdL0Cq2Wj1XSNf9mGD8jY/7B47KiE/t7EHj74hlAxghdQ
 NUR/C69IFSypt9cWoXREPN+/EBwNahmzl0frFBZ4VRdO8JI=
X-Google-Smtp-Source: ABdhPJylcsS/etsjs/Uw6XlsVNZWI14zpOvwSKaVl20+Qfl9O/W1xNzIjRbiusUSTqguxSOT6pmhBeI26TT1YowdceQ=
X-Received: by 2002:a05:6830:165a:b0:5af:12dc:65e5 with SMTP id
 h26-20020a056830165a00b005af12dc65e5mr8787315otr.30.1647164580141; Sun, 13
 Mar 2022 01:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20220311194446.3952944-1-james.hilliard1@gmail.com>
 <20220313091116.GS283544@scaer>
In-Reply-To: <20220313091116.GS283544@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Mar 2022 03:42:49 -0600
Message-ID: <CADvTj4rP0kpO1HtJn7bG3wE4BWBdoeiTHzb0OJjLGQ+MOCd5Dg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to
 version 21.3.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 13, 2022 at 3:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-03-11 12:44 -0700, James Hilliard spake thusly:
> > Migrate to new flit based build.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-argon2-cffi/Config.in               |  8 +++-----
> >  package/python-argon2-cffi/python-argon2-cffi.hash |  4 ++--
> >  package/python-argon2-cffi/python-argon2-cffi.mk   | 14 +++-----------
> >  3 files changed, 8 insertions(+), 18 deletions(-)
> >
> > diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
> > index 5cddb3314e..5940d1c910 100644
> > --- a/package/python-argon2-cffi/Config.in
> > +++ b/package/python-argon2-cffi/Config.in
> > @@ -1,10 +1,8 @@
> >  config BR2_PACKAGE_PYTHON_ARGON2_CFFI
> >       bool "python-argon2-cffi"
> > -     depends on BR2_USE_MMU # libargon2
> > -     depends on !BR2_STATIC_LIBS # libargon2
> > -     select BR2_PACKAGE_PYTHON_CFFI # runtime
> > -     select BR2_PACKAGE_PYTHON_SIX # runtime
> > -     select BR2_PACKAGE_LIBARGON2
> > +     depends on BR2_USE_MMU # python-argon2-cffi-bindings -> libargon2
> > +     depends on !BR2_STATIC_LIBS # python-argon2-cffi-bindings -> libargon2
>
> So, here, you are referencing libargon2, but you do not depend on it,
> neither do you select it. If your dependency is just on
> python-argon2-cffi-bindings, then that's all you need to document, not
> why it needs it.

Yeah, thought I was supposed to indicate the source of those dependencies
using the "# python-argon2-cffi-bindings -> libargon2" comment style in these
cases.

>
> And so, why is the dependency to libargon2 dropped? Given the name of
> the two packages, python-argon2-cffi and libargon2, they really look
> like they are related, so dropping the dependency on libargon2 would
> really need a little explanation, maybe just to state that since
> upstream commit cb0248d29ab2 (Extract CFFI bindings into
> argon2-cffi-bindings), the dependency is carried by argon2-cffi-bindings
> which is already enforced in Buildroot.

Yep, libargon2 dep was moved to a separate bindings package that is now
transient to python-argon2-cffi instead of direct.

>
> Applied with a blurb added to that effect.
>
> Regards,
> Yann E. MORIN.
>
> > +     select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS # runtime
> >       help
> >         The secure Argon2 password hashing algorithm.
> >
> > diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
> > index 6c416ffd88..09da5855a3 100644
> > --- a/package/python-argon2-cffi/python-argon2-cffi.hash
> > +++ b/package/python-argon2-cffi/python-argon2-cffi.hash
> > @@ -1,5 +1,5 @@
> >  # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
> > -md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
> > -sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
> > +md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
> > +sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
> >  # Locally computed sha256 checksums
> >  sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
> > diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
> > index f01c940589..0fb3e50ff3 100644
> > --- a/package/python-argon2-cffi/python-argon2-cffi.mk
> > +++ b/package/python-argon2-cffi/python-argon2-cffi.mk
> > @@ -4,19 +4,11 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_ARGON2_CFFI_VERSION = 21.1.0
> > +PYTHON_ARGON2_CFFI_VERSION = 21.3.0
> >  PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
> > -PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
> > -PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
> > +PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
> > +PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
> >  PYTHON_ARGON2_CFFI_LICENSE = MIT
> >  PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
> > -PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi libargon2
> > -PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SYSTEM=1
> > -
> > -ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> > -PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=1
> > -else
> > -PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=0
> > -endif
> >
> >  $(eval $(python-package))
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
