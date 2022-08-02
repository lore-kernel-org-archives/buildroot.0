Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A116C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C8E81249;
	Tue,  2 Aug 2022 07:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C8E81249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Novr_ghq43iL; Tue,  2 Aug 2022 07:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03E580F59;
	Tue,  2 Aug 2022 07:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03E580F59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66BEE1BF263
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 413BA60AE4
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 413BA60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMot_pNsT13j for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 07:55:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5843A6059D
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5843A6059D
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 07:55:45 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id k129so13745820vsk.2
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 00:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ks82LzedMUgyy1RD4CDyYnLslrmUTqgW4MiN/nCsBhE=;
 b=Uud6uAqTyyMGJ7k1KUnWGEIQi1Ic97ISC1TFuEnO04ssHj3ngBxyDy5V+m//1EvWcc
 Fx6P4FutJ+NnXHXD/uEoLiSMXXNkoUBFX6mk64iFjTuxE7db67VRECSLFvCaTirIJB2J
 gbU7R770I4b6GTp5oPUxO95R85pru4A/j4NgqXna9W6GQ/QiYtCRTq4koID6a9XbWjPY
 ieu4EFA4QKS2wOsRB3ayI8yL2Qxsatf/JC1a3LNO+bJlFtbFRE1roiUfIuHzvBzOPf9H
 W9egdVnVENlVh+7jIS8bpE65XU/UFsOaYJCsW+el/6qOtCOu0FQA0ealGRNg/U4qfsY9
 Zn4Q==
X-Gm-Message-State: ACgBeo3SxX2LRJcfN6G9EW7VdrmsHzRIEWXoIkaUR6nYUrktbZ+lhPaw
 Yek2g7tjn72cdQoxZH1YizbFyQ8TTSnurhUdkPCF/X3pe+A=
X-Google-Smtp-Source: AA6agR4K3Rd0XBXnbbTOzlMGYghs84HuiskqCv8TKwh+/dSz+wwkguq4hf3ljxET3J+F2H4Qr+O+9mze0KvCnP7i3sM=
X-Received: by 2002:a67:e11c:0:b0:386:f61:b6ba with SMTP id
 d28-20020a67e11c000000b003860f61b6bamr2702294vsl.27.1659426944063; Tue, 02
 Aug 2022 00:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
In-Reply-To: <20220801185444.0f41358e@windsurf>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 2 Aug 2022 09:55:33 +0200
Message-ID: <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ks82LzedMUgyy1RD4CDyYnLslrmUTqgW4MiN/nCsBhE=;
 b=RXUyHJwEwzM1G2B+KJH4ko2BrggbUq6lS/YhRja8gRlP7ekBjHXNFAKIPUr4yEjkBi
 HJDCOicJU5tFIRhpn2n5zm7E5ZoBisKodR1Bndor+1AuDeURE7dPueXRwgsMUyb6X/b7
 UBdSjCHa4JIj+9TiqgdmA8FUoOy6VxjrX93h5qM7a/t5Mg6WOMc6ZbMTNI9bTu/kdXGn
 rTt42gID3G9FrceV1mFP4/fK1lCa2O9N/qa28abG8Mrnno+jBNj7qz1aguWQUjFbB2m8
 oAUZ8JyVWNmkZupgggE41a1JUhplOuLOxThnBQEy4ARgVVHaBA7OUBMwgKRiLE3KqQa/
 ZCSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RXUyHJwE
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mo., 1. Aug. 2022 um 18:54 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Fri, 29 Jul 2022 17:46:37 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> > index 548f69cbb8..b6224b349d 100644
> > --- a/package/pkg-autotools.mk
> > +++ b/package/pkg-autotools.mk
> > @@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
> >               --exec-prefix=/usr \
> >               --sysconfdir=/etc \
> >               --localstatedir=/var \
> > -             --runstatedir=/run \
> > +             runstatedir=/run \
>
> I am afraid this is causing some other problems:
>
>   http://autobuild.buildroot.net/results/c6f/c6fa72802a3d74fe95720eeff836514a5863b3f2/build-end.log
>
> configure: warning: runstatedir=/run: invalid host type
> loading site script /dev/null
> creating cache ./config.cache
> configure: error: can only configure for one host and one target at a time
>
> So I believe we will have to revert this patch, and pass --runstatedir
> individually to those packages that understand this option.

Sorry for raising autohell, "runstatedir=/run" was somehow supposed to
set the default.
Arguably the package is at fault, but thats not helping much.

So far this solution seems to cover all problems:

--localstatedir=/var \
`grep -q -e '--runstatedir\b' configure && echo --runstatedir=/run` \
--program-prefix="" \

You want to revert first?

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
