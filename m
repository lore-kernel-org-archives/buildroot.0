Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8677ECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 15:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37ED240256;
	Thu,  1 Sep 2022 15:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37ED240256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeMD-ifgTy5c; Thu,  1 Sep 2022 15:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4283C40126;
	Thu,  1 Sep 2022 15:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4283C40126
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C93021BF3C4
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 15:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C5740126
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 15:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C5740126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xd_21OhEIS2h for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 15:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA43E400BF
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA43E400BF
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 15:43:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q63so16732176pga.9
 for <buildroot@buildroot.org>; Thu, 01 Sep 2022 08:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YOv6UAhbwVXScqy6BliujNKAl70WBqrZR6/tDicc9Vk=;
 b=1FIHfmkoCdIA9NAA3uSKFnzTUbCH/vusmYFJvrzQId0t4U+kkn8J4iDm1Aed05OxIW
 96rRgF0B9W44f2gC7QFugrrRGl80Dcqk5hIOB/1QGdgxEWrhElSpTNaPZ2qO/fd4qzAy
 yEXWOOcBv/i0DZpXIfQCy0w4J2hMNsnSWQQ+Xs8pIaylzj40tJyS0zq9pkqmk2C6kDjk
 3CYHB9xVF6BL29pL1UPueh4t+kyDwWxB+CG8N47cPZua/blAI62ZLnIv2FUfuiLDb+2V
 3+VdxDaM4O0JwMBgVtCIk1TSP5V1anrTwWyGarEr7lFcA73umW/wYvqYyCD+KnbFANZ+
 BNuQ==
X-Gm-Message-State: ACgBeo1v5+bTARmqUyZ14NpZ9/7ipBb6hd67HUdBoYro7wwLbP3MHGAt
 v+n3H0k6PuiEvHvSYMLfVC4Dm3UNbe9+0Cea4uBvU2Ug
X-Google-Smtp-Source: AA6agR7BnCXC6trNzU0LPmuM323Tkm79LMbyLw0fvJ2/Q5AYXSkGooDWeLsQRar1rfMAf+glmFRbtlZZchdJAfsY+NE=
X-Received: by 2002:a63:5a41:0:b0:430:673e:1e13 with SMTP id
 k1-20020a635a41000000b00430673e1e13mr4483250pgm.435.1662047023082; Thu, 01
 Sep 2022 08:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220826130843.264607-1-johan.oudinet@gmail.com>
 <20220827084732.GR37358@scaer> <20220828100605.509b1ead@windsurf>
 <20220828083526.GF37358@scaer>
In-Reply-To: <20220828083526.GF37358@scaer>
From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 1 Sep 2022 17:43:31 +0200
Message-ID: <CAJtjsKY806+igied9tjUAPJXrknXddSAFYaYS6ViC-EMigSWaQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=YOv6UAhbwVXScqy6BliujNKAl70WBqrZR6/tDicc9Vk=;
 b=oIdxAeA71S82tcL+WENPoXyKsvaAa2te9uqu5ipNAyfxY2XfDu4RHH1ay3BfCdoFVJ
 NtKYh/xPMBgeNflhDrrkS8dA69t/EsJQD6P8ou9sd3EoYPlWUtv7ylZXuHdvbEiyYLPO
 mMUJhyXkkLaOGZpu+R+/uLviiM9bDHI11C39q7MKTxdzAkMDUrgSMuQ+nTdff1KoJl1J
 L26F5s1RIjX+J4JmV2DnRbnFu5CUi3gSiKkKK4VFVuFvuMYmdEU7P1gPf4na1OfvanyA
 mZH0VRtzTLal0Hjf5ySQw63vqllg2U2tjdXZQ4OQLi3i4e6l8GcprJ1/8yXLtNpM/sWF
 Go5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oIdxAeA7
Subject: Re: [Buildroot] [PATCH v2] package/forge: new package
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

Yann, Thomas, All,

On Sun, Aug 28, 2022 at 10:35 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2022-08-28 10:06 +0200, Thomas Petazzoni spake thusly:
> > On Sat, 27 Aug 2022 10:47:32 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > > +define FORGE_BUILD_CMDS
> > > > + cd $(@D) && $(NPM) install && $(NPM) run build
> [--SNIP--]
> > And side questions are:
> >  - Does this $(NPM) install step downloads stuff? If it does, then it's
> >    wrong, because it works around Buildroot's download infrastructure.
>
> Yes, as far as I understand, that's where the vendoring step happens.
> Unless we have a download post-process step like we have for go and
> cargo, there is not much we can do about that. See also my further reply
> on the previous iteration [0].
>
> Also that install-then-build sequence seems to be canon, see [1].
>
> But before we introduce either a download prost-process and/or an
> npm-package infrastructure, it would be better [2] to have more than
> two data-points.
>
> [0] https://lore.kernel.org/buildroot/20220826210712.GE37358@scaer/
> [1] https://lore.kernel.org/buildroot/20220827093603.GT37358@scaer/
> [2] I said "better", not "nice", on purpose. ;-]

This is exactly that.

> >  - Does this $(NPM) install step installs extra stuff? If it does, are
> >    these extra things accounted for from a legal information
> >    perspective?
>
> Yeah, it does install the vendored stuff. And of course it is not
> accounted for, what did you hope? ;-)
>
> So, yes, FORGE_LICENSE should include something like:
>
>     , vendored dependencies licenses probably not listed
>

Ok, do I propose a v3 with the suggested sentence to FORGE_LICENSE or
should I do something else?
-- 
Johan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
