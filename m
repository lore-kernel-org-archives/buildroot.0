Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 01:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2202408C7;
	Tue, 26 Apr 2022 01:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03qT70QOBtY4; Tue, 26 Apr 2022 01:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7790140878;
	Tue, 26 Apr 2022 01:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF501BF37A
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 01:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BB5160FB6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 01:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OgPJ04ei3-a for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 01:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4057560E8C
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 01:35:21 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e189so19147518oia.8
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zr3UpgKRjgD6fkgeVexQ0HzmNXQvdc9MqIiS3qB9uSQ=;
 b=K8c0OFHA3Gr0qya+bLzobjpS1ym8aYcInAlzCwNYOgCN6bG3eIcUk2ViLvhXtWQnn/
 8WP5YhFg2d9jcIYszqq9grqrc0sf5kUm9L12ndkKefBvG71lsT16rhS9Eoqd8kRxeMTa
 D6+pZSDyUvAhmVUATFQyBPiogETsYog9tEIDVxGizs515fJgF9+T5UMsLd/jH3mBB4Yu
 7bGJauV344HXSopcBUPny7A4bLRHjsiYXiW60KHuef8mhJS1/7P60qSPWrxK5BnlzVHr
 Uh+E1JzdGN1FPb6yYupWe+NmZER8ZBCvyd69c9HMFp/Q0Cj0/B/UBzvuFHgpQzN/6NjC
 /Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zr3UpgKRjgD6fkgeVexQ0HzmNXQvdc9MqIiS3qB9uSQ=;
 b=vjqhOZpXm0nd/Ws6jPR9P2TzdkjCYzzwNGep9LH8QYUVV1bas6rEUU8nClyh5CzDTh
 FTwmDYLwn0G/FH5eyQjwDG4wcpNjW9sLe1fR4t07pwNBnyB7bpEIpkDtyrAJRq2BFU7/
 05eLEGtDWqdmyEpEEWK8gT2cn91Ut1LFZHsE/6zc7Blc0/yr/+z+YwCdGrc3c4iQlILq
 lqppIgsw7IOmEj/cxDWzw6L8V1aZwL9+pz2vOJ1hYl/rGIEhkT/BN6rkKWGh3hVyl3yZ
 ZCcFp1ES4m4ocfj8GpOIX/L77Ye/scsIbPRXwMOTmHrDShlJIRyhhuZ5Qs/XDZyjD6i9
 C36A==
X-Gm-Message-State: AOAM531CXS2WjMB9alOh8WWmUBXIiEs4x2zNLrQ9HA1wmwJbEtw6sHRV
 q5W9kkD4Gi0WDJKStP5kwmyJJBgYY2DNC20YeH4=
X-Google-Smtp-Source: ABdhPJwJDJtj4BDsPCnWPVCTXYx04LrCjfw4fk5fM7CSu742GQfEsNCMF1W+87QrLAePp38ksXetkU9LLMCB+yD3ZiE=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr13205913oia.200.1650936919381; Mon, 25
 Apr 2022 18:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-4-james.hilliard1@gmail.com>
 <f2289739-57a7-268c-ebc1-1ba41d8c2d41@mind.be>
In-Reply-To: <f2289739-57a7-268c-ebc1-1ba41d8c2d41@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Apr 2022 20:35:08 -0500
Message-ID: <CADvTj4qJwS=qwt=ce0JX0UHEeZ04BJoSsuV=2kvqxAiA+2OvYw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v7 4/5] package/python-tomli: bump to
 version 2.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 25, 2022 at 4:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/04/2022 23:39, James Hilliard wrote:
> > This package now requires flit and must use the flit-bootstrap setup
> > type for the host build since it is a dependency of
> > host-python-pypa-build.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
>
>   Applied to master, thanks.
>
>   While testing this series, I noticed that the following gives an error (this
> was already the case in the original series; I haven't checked how it was before
> your series was applied - for tomli, it certainly wouldn't happen because it
> would still be using setuptools, but maybe for other flit packages, I don't know).
>
> make python-tomli
> make python-tomli-dirclean
> make python-tomli
> ...
> FileExistsError: File already exists:
> /home/arnout/src/buildroot/output/target/usr/lib/python3.10/site-packages/tomli/__init__.py

I think it happens only when building across version bumps, probably a bug
with installer(https://github.com/pypa/installer) upstream.

>
>   Would be nice to get that fixed...

Yeah, I'll see if I can track that issue down.

>
>   Regards,
>   Arnout
>
> > ---
> > Changes v6 -> v7:
> >    - only use flit-boostrap for host-python-tomli
> > ---
> >   package/python-tomli/python-tomli.hash | 4 ++--
> >   package/python-tomli/python-tomli.mk   | 7 ++++---
> >   2 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
> > index 1a274c8a40..8368f9ee13 100644
> > --- a/package/python-tomli/python-tomli.hash
> > +++ b/package/python-tomli/python-tomli.hash
> > @@ -1,5 +1,5 @@
> >   # md5, sha256 from https://pypi.org/pypi/tomli/json
> > -md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
> > -sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
> > +md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
> > +sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
> >   # Locally computed sha256 checksums
> >   sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
> > diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> > index b8c20ca736..b803d67466 100644
> > --- a/package/python-tomli/python-tomli.mk
> > +++ b/package/python-tomli/python-tomli.mk
> > @@ -4,12 +4,13 @@
> >   #
> >   ################################################################################
> >
> > -PYTHON_TOMLI_VERSION = 1.2.0
> > +PYTHON_TOMLI_VERSION = 2.0.1
> >   PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
> > -PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> > -PYTHON_TOMLI_SETUP_TYPE = distutils
> > +PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
> >   PYTHON_TOMLI_LICENSE = MIT
> >   PYTHON_TOMLI_LICENSE_FILES = LICENSE
> > +PYTHON_TOMLI_SETUP_TYPE = flit
> > +HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
> >
> >   $(eval $(python-package))
> >   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
