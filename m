Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332ADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B00AF40641;
	Mon, 10 Jan 2022 22:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TujI79wp-p8; Mon, 10 Jan 2022 22:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF3B540354;
	Mon, 10 Jan 2022 22:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C176A1BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCDC78316A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PYCrGjHrRwm for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15DC1817B3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:55:35 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id w6so16971oiw.3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DWGBVqUHSxc1QmzMBc6XzYNOu+516WNmdsgH5IU+sY=;
 b=FgNNQGqvcN9iQyEg5PhLKJIYY18maV8C2rL7TnHw83iewYNPvMyNrOQ6M1mzg6k+Gn
 Vf0hp6zT/pJU9D2v4bhHB2dws1SLKlhobXibGB69HVzcdegLs2Mc3gNaBztI90bt913A
 UgRSj+DVkh8NkG9khFPJpVapN7LaGUQrgRpSQR7ctdgxxgQUHBKd0YbuA3uv1FVTrdCD
 vNBIYRG+g2Ya69W/OryijI0O92wXGx+YDlKB9WZDfB9kRAauUE1/jgyfu703CBhoymSr
 8Wm5hqYnK1HhO47toEf4aEjWhYfO+yiPZNqMGCiRJu6G6O6HiOyZyU32DA4tZZAU9ca+
 MSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DWGBVqUHSxc1QmzMBc6XzYNOu+516WNmdsgH5IU+sY=;
 b=kgdalag7UXA0fMCnQjkbN865r6BZv5URaAYpphISKfzPPsui/H+kpyL9cyA7sFmhMA
 XvBo6J3QB27DO6i+ld+XpL49jpoVZXSiGxuy4HUpi5Xf4S4D/u0TBKtxS7RUL9MoFnq0
 8jWYlBJObLfWYd6M6FoHI9vfA8kzHfZvlQCrlauTKbmquOBQZ9uDk4tOPVEbl+uI2V1z
 sL4LSyWijUp0pGGbbSlECA/5J5MNcH01NNrfm+IRRynvyPAbhdnDQyfRDw6SmRAsSqVc
 yTzQiXSwGUxtYU8+TzC7NAhPzYedjHhJjotZD5ET9C+nl6r/qJ1dSD6ja+C3xdsucwpE
 tEAQ==
X-Gm-Message-State: AOAM531U5YAByhzUT9Y/qyqISgGro+iKacGPutXaNilJiU4OW7FQHkzw
 zasPFUPnVLLHWVVgBV1ooHK+sIsgAn90mDeIf38=
X-Google-Smtp-Source: ABdhPJyXr2X4qcAoiS8w/9RF/oZtNYLVanP639T1QqubRBME4tdHy3MmVv/UpHFg3EvgrCCcW4c17mxlrGjONsQ+8WM=
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr658oih.67.1641855333943;
 Mon, 10 Jan 2022 14:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
 <20220110221051.GT1477939@scaer>
 <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
 <20220110222808.GU1477939@scaer>
 <CADvTj4ogaTxytpD11-s7EfGOJr=4L8VYGCDr82S4_rsmBEitkw@mail.gmail.com>
 <2846b399-f095-acb3-c086-e44b3b74698e@lucaceresoli.net>
In-Reply-To: <2846b399-f095-acb3-c086-e44b3b74698e@lucaceresoli.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jan 2022 15:55:22 -0700
Message-ID: <CADvTj4otjX+dffwVjypCc-mkyrGWSvzKe-K=-__ou7U+Q=7J8Q@mail.gmail.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/zynq-boot-bin: port to python3
 and move to support/scripts
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
Cc: Julien Olivain <juju@cotds.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 10, 2022 at 3:46 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi James, Yann,
>
> On 10/01/22 23:31, James Hilliard wrote:
> > On Mon, Jan 10, 2022 at 3:28 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>
> >> James, All,
> >>
> >> On 2022-01-10 15:18 -0700, James Hilliard spake thusly:
> >>> On Mon, Jan 10, 2022 at 3:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> [--SNIP--]
> >>>> So I wonder if it even makes sense to keep package/zynq-boot-bin now.
> >>> Well if someone is using an older uboot that doesn't have the
> >>> generation capability
> >>> integrated then it's probably still needed right?
> >>
> >> But then, they would have that tool in their uboot tree, and then
> >> nothing would prevent them from running it as a post-build (or
> >> post-image) script.
> >>
> >> Yes, they would need to have a python2 on their host. But that will be
> >> the case if they stick to such older tools which may break on more
> >> recent systems, not just uboot...
> >
> > Yeah, the advantage here is that it works with python3 as is with older uboot
> > versions. I guess the main issue is that vendor uboot trees are often ancient
> > and rarely updated so this would be mostly useful for those situations.
>
> Is upgrading to python 3 just to simplify potential legacy users the
> only motivation for this patch? Then I would not touch this package at
> all and avoid keeping our own copy of the script.

Well the motivation is that we want to drop python 2 from the
toolchain entirely,
so leaving this package as is would not be an option(since it depends
on the host
python2 interpreter support we want to remove). We either need to
remove it or use
the python3 ported version(which due to the simplicity of the script
should not cause
any significant maintenance issues for us IMO).

>
> --
> Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
