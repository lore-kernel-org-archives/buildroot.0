Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF342C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5554D404B5;
	Sat,  1 Oct 2022 19:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5554D404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zo7XTZ3jDghX; Sat,  1 Oct 2022 19:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50625403FF;
	Sat,  1 Oct 2022 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50625403FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C858B1BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F2940176
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F2940176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zQ17_Qqqgdz for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:05:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F4D4023F
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84F4D4023F
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:05:49 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id f14so1145505qvo.3
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 12:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HNeBvSl5qILhbcIFRBXAN7KTWFpaMlW5w0vOBJfjsBc=;
 b=OVZGgRkB9WrkZp7wXK2diwOOv0Ti+aipeyCxVfBYOunea42PZWV6NAvHTu7qTM/SyY
 3fYL+R0HCdy6OjY3wSXwODOn3CCfb/UKKuCoCRfT+zCgK/BfQIcOcv9gbRDzjX1VVsfp
 tS5cEi0+wg6Jxpob/thQbHPBh+3Kw0VBwjP+bu8TChz2cInC5nFKx/XAgVzPLGJvU67M
 ZaQO0kklnsFZrdgrEFJYnmlbrjZ43bmsEEPyAGnp64fOeNh87leo//HXkIz1Y7mXsF7s
 8WtDYqSePeGAF6cXrPY97iQjtmfPjj8q81XCwVszTHQmgUymyYvuSldCSMtza6Rtzvy4
 YjgQ==
X-Gm-Message-State: ACrzQf2NsdxcodqOmksmJ+4h/vZ9jeWjmF/SJgGpHmyWHWPVUR+u+qBc
 PZmjfoVXn09SQBtFV6VViSr/9AKqZIOv42WoG+s=
X-Google-Smtp-Source: AMsMyM48TPOLBJKP0BG9PQemlfyoFsd9gZHrvfSE2A+TEHetl5p2gWcuwM2uBHdDRkOtGOqxx39IP+AMEoKtTMSZ+j4=
X-Received: by 2002:a0c:9c4a:0:b0:4ad:2fe7:ae60 with SMTP id
 w10-20020a0c9c4a000000b004ad2fe7ae60mr11506623qve.50.1664651147455; Sat, 01
 Oct 2022 12:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220928192324.1279960-1-robimarko@gmail.com>
 <20221001185147.GP30794@scaer>
In-Reply-To: <20221001185147.GP30794@scaer>
From: Robert Marko <robimarko@gmail.com>
Date: Sat, 1 Oct 2022 21:05:36 +0200
Message-ID: <CAOX2RU4ufFjKONuVpe3CTcshXpM=P3M+fRVnDN+v0nch=FAURQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HNeBvSl5qILhbcIFRBXAN7KTWFpaMlW5w0vOBJfjsBc=;
 b=JGdXA2fZU47MuItcBGwbPSWVTpVgNdJ/VBalWxtxRChnpxhy1/CXOUPoxR/9CqsVZM
 qxcyzaOiOOAXfbyikQwfiVmEHc7UXThF30goFG2eFGJiu2L+t2w/Vl77Z0nVpfVlJkY5
 uDECJvRn8fXw3w/dz485ntPZ1CEvghghky1IBlOzTvY9XITAx/nfPduHTqYdAcB7LsXC
 0+PSZsgmjtEQZlCVrDYb1c9KHUUtRPsaoYTyB9C4825kvqsNxUb+i+g7vUmc4Epp/Prr
 Tu+sD70B3f10riLRzJHutEdLgB+V1+23I+3gCgC4qCz9aI6MbB7GQyTVQKlwb+rYeXdu
 eaFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JGdXA2fZ
Subject: Re: [Buildroot] [PATCH] package/mdio-tools: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 1 Oct 2022 at 20:51, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Robert, All,
>
> On 2022-09-28 21:23 +0200, Robert Marko spake thusly:
> > mdio-tools are kernel module and accompanying tools for low-level
> > debugging of devices attached on MDIO bus like PHY-s, switches etc.
> >
> > Userspace tools provide C22 or C45 reads and writes, benchmarking
> > and even dedicated Marvell Link Street tools via the included
> > kernel module.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
> > new file mode 100644
> > index 0000000000..e4ea6f8224
> > --- /dev/null
> > +++ b/package/mdio-tools/mdio-tools.mk
> > @@ -0,0 +1,16 @@
> > +################################################################################
> > +#
> > +# mdio-tools
> > +#
> > +################################################################################
> > +
> > +MDIO_TOOLS_VERSION = 1.2.0
> > +MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
> > +MDIO_TOOLS_LICENSE = GPL-2.0-only
>
> We do not strictly follow the SPDX nomenclature (because we somewhat
> predate it), so for consistency, this should be just 'GPL-2.0'.

Hi,
I will change it, wasn't really sure what was appropriate so I went with SPDX.

>
> > +MDIO_TOOLS_LICENSE_FILES = COPYING
> > +MDIO_TOOLS_DEPENDENCIES = libmnl
>
> mdio-tools uses pkg-config to look for libmnl, so you also need to add
> host-pkgconf to the _DEPENDENCES.

Will fixup in v2.

>
> > +MDIO_TOOLS_MODULE_SUBDIRS = kernel
>
> I did not have a thorough look, but doesn't mdio-tools need some kernel
> options to always be enabled? IF so, you can do so with:
>
>     define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
>         $(call KCONFIG_ENABLE_OPT,CONFIG_MDIO)
>     endef
>
> (given the package name, it should at least require that, I'd guess, but
> adapt as needed.)

Thanks for reminding me of this, haven't really though of that, but as far as
I can tell it basically needs generic netlink which gets compiled if CONFIG_NET
is set, that is minimum.

CONFIG_MDIO_DEVICE is then required so that mdio buses actually can
be used.

>
> If there had been only the license and host-pkgconf issues, I'd have
> fixed those when applying. But the kernel options are a bit more
> involved, and requie someone who actually knows and uses mdio-tools, to
> come up with the required options. Can you look into that, please?

Will fix this up v2, thanks for the review.
Regards,
Robert
>
> Regards,
> Yann E. MORIN.
>
> > +$(eval $(kernel-module))
> > +$(eval $(autotools-package))
> > --
> > 2.37.3
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
