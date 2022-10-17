Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB923C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E9F40918;
	Mon, 17 Oct 2022 14:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E9F40918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMD7lQooOy8b; Mon, 17 Oct 2022 14:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16E8414E4;
	Mon, 17 Oct 2022 14:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16E8414E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB7301BF2F2
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E9640275
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E9640275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0QxDbt1l67b for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 14:50:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87CA2400EF
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87CA2400EF
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 14:50:46 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id o22so6744123qkl.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtqbTpQVoBy31N+BJ69e9Yk4i9narvNYR745q4VEvpY=;
 b=xslADfXtCV8C7b7SW4v54hO6RWbBxi9Qnu44mhjGOmUhjHERfqbkstcmecGrZOmP5r
 8E7h3cPrkTyFeQBzWAR2a0mI2A1jw7dDQu5zfoJVcvA4Tq9z9APXqK0W4EeWzgOZi+D2
 VRD07JWs0JJwiPaTsq4aJ38+ViqaQF6np8a5qiNYBg9O6RKgEG7HDizQQS58dom74Pe5
 TYnrh4hLUePRje0r33IqIntIXVFjizB4jwLTyYOfstajQUSdhlXAOIfv5uIE8U7rs5lN
 ZevW/M+uQN9nhtTDDbTgZPH3KnLkx6u3yyxosqR/Kcp3qd0HwwRIuPUuHdCwGS+mQynt
 YOVw==
X-Gm-Message-State: ACrzQf00l14cZgXfcuttxu1rZQ2L8+Orw3sTwQSK0StUYcYBPmyux/0i
 4ZitTXVeXXkcBULZG07UvqQ8DWVXHA8N34t2MV4=
X-Google-Smtp-Source: AMsMyM6GrxfinLS3Pm7idCfA0/JJMe7WBKNJpsSOOxa1e2L9TMIye5raJ+q0WRIW9PvOl/PcBABjEQkI3kDTxgv7GRE=
X-Received: by 2002:a05:620a:410b:b0:6ee:b331:2e34 with SMTP id
 j11-20020a05620a410b00b006eeb3312e34mr7936292qko.639.1666018245284; Mon, 17
 Oct 2022 07:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
 <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
In-Reply-To: <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 17 Oct 2022 16:50:34 +0200
Message-ID: <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtqbTpQVoBy31N+BJ69e9Yk4i9narvNYR745q4VEvpY=;
 b=CRXHXuYVJ6ZHh131YF5SPji90YCA1DmWwXKLT/hl47D0Wm/R+aQW3ZAPshEvstC17s
 8h+uqD6zEB9PDxV+afWKGOMEJVw99nJrRzmX/RslAF41OXt7LHN9UQ7ImNnFp/se9eFv
 54oAoCZGkmKTjg57VQMKmFk3J/1lerEpGm62vRixCr2dkkcw1t4iWHby7gR7mF3jFi2k
 RoXQXZ2e58b18T610uOfF+iUubAnseAQeL5LCJQ6A1PIgcyMyYOkHRWAU11mGupwBByl
 ZWhEG3M4lfBevrs+SIDXTOb2nT6wX1ZdIRQ698FGNpeHyng8weljzrp2zIxXyKrCitLw
 GYyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CRXHXuYV
Subject: Re: [Buildroot] [PATCH 0/4] systemd: sort out the conflict between
 var factory and tmpfiles (branch systemdify-var)
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mo., 17. Okt. 2022 um 16:11 Uhr schrieb <yann.morin@orange.com>:
>
> Norbert, All,
>
> On 2022-10-17 14:12 +0200, Norbert Lange spake thusly:
> > Am Sa., 15. Okt. 2022 um 23:23 Uhr schrieb Yann E. MORIN
> > <yann.morin.1998@free.fr>:
> [--SNIP--]
> > > The solution we implemented in Buildroot is to generate a factory for
> > > /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> > > the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> > > on boot. Having a tmpfs means /var is repopulated from a clean state at
> > > each boot, and people who want a persistent /var have to provide their
> > > own mechanism to mount their actual filesystem instead.
> >
> > Here the issue is, that the logic will never be complete, I will
> > have to dig up old threads, but it fails with various combinations
> > of symlinks.
>
> Then we should fix it up and make the procedure more robust, when you
> can point to actual issues so that we know how it is broken and how to
> fix it. I (see the post-scriptum) would be happy to help look into that.
>
> > Its an inherently fragile approach, and I would question the solution as whole.
>
> The thing is, out of the box, Buildroot needs a working situation.

Yes, my argument would be a technical better solution.

>
> Providing an overlay (see below) requires a setup by the user, setup
> That is highly dependent on the actual target: does it need to be
> partitioned and formatted on first boot? If so, how? Should it be
> mounted on the whole of / or just /var?
>
> Those are not something that falls in the scope of Buildroot. Providing
> a var factory and a tmpfs on /var is the only solution that can be
> (rather easily) implemented.

Not sure you understand my appoach, more below.

>
> > > However, for some people, this does not seem to work as expected, so we
> > > introduced a call to systemd-tmpfiles at build time, to pre-populate the
> > > rootfs from all the tmpfiles, of which our var factory, at build time.
> >
> > There are several usecases where this is atleast non-optimal,
> > and for a default to mess with the filesystem in such a way is
> > not a good foundation.
> >
> > I am not sure if I am up-to-date, but the original call during
> > the fakeroot stage you just do the work that wouldve been
> > done on first boot.
> >
> > >
> > > These two mechanism clash with each others, and are mostly incompatible,
> > > and causes files to be duplicated.
> >
> > One of them doesn't do anything than a regular system start,
> > the other is likely to cause trouble, trying to fix packages
> > that wont work with an empty var in an automatic way.
>
> Look, I do understand that you do not want to be using the var factory,
> and I do appreciate your arguments.
>
> Now, please understand that some people are very happy with using a /var
> factory, and some are even happy that /var is being mounted as a tmpfs
> too.

Would they be unhappy if everything works as it did before?

>
> All this series does, is make the two mechanisms optional, so that people
> with different expectations can still have a functional systm in either
> case, without an overshoot in the filesystem size due to the duplication
> of files caused by unconditionally calling systemd-tmpfiles at build
> time.
>
> It even keeps the curent behaviour by default.

I understand that, yes.


>
> > > To solve the issue, this series introduces new options, so the user can
> > > elect to use either, none, or both mechanisms, as they see fit.
> [--SNIP--]
> > I would prefer a  robust solution that provides a filesystem image
> > that is compatible with further tinkering, particularly mounting /var
> > in the initramfs.
>
> That is assuming that one will use an initramfs. For example, in my
> systems, I do not use one, and I do not want to use one.

No, initramfs is optional

>
> > I attacked a drop-in solution, that has none of the drawbacks,
> > correctly works with mounting stuff in /var,
> > and only requires overlayfs to be available in the kernel.
>
> That is assuming two things:
>   - that an initramfs be used
>   - that an overlay be mounted
>
> However, in my case I expressely do not want to use an initramfs: my
> rootfs is a squashfs mounted on an initrd. I also have a tmpfs mounted on
> /var, as I am very happy that /var gets factory value at boot (my
> resilient data is accessed in some other ways).

I am not sure if initrd/initramfs means something different here.

>
> > Funny detail: together with the upfront creation
> > of some directories in /var via the systemd-tmpfiles build-time call,
> > a basic usable system is available even if the overlay fails.
>
> That is not true. Anything that expects /var to be writable will fail to
> start.

That's why I said basic usable system, more concrete:
the services with systemd will work, and stuff like networking + openssh.

>
> > The recurring attempts to discuss this ended in [1].
>
> And this series addresses the fact that, for some people, the var
> factory is not a good solution, so that they can disable it.
>
> It also addresses the case of those people for whom the var factory
> actually works, and want to keep using it, can disable the
> systemd-tmpfiles buildtime call.
>
> And finally, I believe it may even address more complex situations,
> where people will provide their own fakeroot-script to do the
> preparatory works.

My own usecase is that  use the buildroot as pristine rootfs and then
slice it up as
necessary. But just to get this out of the way.

More importantly, I would propose a simpler, yet more robust solution
than the var factory.

For this, the files in the attached archive have to end up in
/lib/systemd/system.

What this does:
Before the time /var is supposed to be accessed, an tmpfs will be
mounted in /run,
and the /var folder will be shifted around to end up in an overlayfs
*below* this tmpfs.
The bind-mount is done with a systemd mount unit, means if you have mounts
*in /var or below* those will be correctly ordered.

-   No initramfs necessary
-   No duplicate files in the var factory and tmpfs (unless they are
modified of course). So your suashed files stay compressed.
-   No tricky autogenerated tmpfiles
-   Would be possible to do something similar in other init systems

The only downside would be the reliance on overlayfs - technically you
could also
adopt that solution to copy stuff into the tmpfs.

Besides my obvious biases there are technical arguments to be had.

>
> Regards,
> Yann E. MORIN.
>
> PS. Please note that there are two different Yann in this thread: me at
> work using Buildroot, and Yann at home, one of the maintainers. Look at
> the email to be sure who's talking (not that I-at-work talk in the name
> of my employer either).
> I try to segregate the two identities as much as I can, but sometime
> there is some overlap, like here.
> YEM.

Not making things much clearer ;)

regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
