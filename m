Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CE6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC3C60B87;
	Sun,  9 Jan 2022 22:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOeMDg-t9fBZ; Sun,  9 Jan 2022 22:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C451660B74;
	Sun,  9 Jan 2022 22:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92C3D1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E9CE40385
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20LF1_9h55de for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:41:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9134B400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:41:08 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 h5-20020a9d6a45000000b005908066fa64so12488222otn.7
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f7G7j9P7apQDZGZdCefVWSamWUgCH7KlWRVl8nzHz0U=;
 b=bmpI4Bp5ZPwFWazr1knyv8us9TThh9ng/q5iM5eMpuWAqQxRiQ4z8K0iK3tM78v+8X
 YfqU9QYMK5uO/YKZPrERANHIMFowk3ztbgzyn1UsCtPxB88DCspGLday0S9I4L3QCCbx
 6aqfM4JVLcpSMsz2EjcuD2AxsoJjUZm/60yIMMHaJx09oI8W7BNrF+xQf92Fjde4ZVkg
 LK72PR7WrszrGZ+yR6SV3rE+kuTsiMYYoJApVQJB7x1uYEyPC+NwgFYEt0GPeLgFBpQp
 42sY9HI252XB5Jv+5MFPvPRhMft+H2GtaLBVHLYkIuk7pburB+qGjfO7/NugQbrzTOMM
 UgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f7G7j9P7apQDZGZdCefVWSamWUgCH7KlWRVl8nzHz0U=;
 b=shXlT/AKCubONtaWtnTO5ZiyqqJryP7oTeq7wndyqy+VjTf0NLYYU3Mk5SVBqCnqb3
 uC8FEEE97ZnVGW1SdB4gj2HWn0x1Ugbk4VmAsBd9QSuGP04ixnCE8H5slNDzKpolmJNX
 1/62MZD1TmGt6lWDWZlLe+5ggFSxqY3M6CVNShY6/QuCKpAvJV7LBWm85vFSbUYd2qWW
 QkhPz3YYiFBGOxeRdxRmert/yhy6ukoLkH5nvavvAUQ7epiC0CH6PR39AFWoAsXU+p/K
 rgSKFHvdmYAvMvLHGrJTuhMhKVrBRJkOfllEZaT94mxDkq8Vr/2soWGXsoIbJ+sVp1T0
 xIOQ==
X-Gm-Message-State: AOAM5306R39b9zaOHkHXfMvvqiYpXMKjy+S2DiWwdS/85T7nInF1Xm1S
 5xgBWwCYYYSNw+0xgDOhzZK5yhl6TMfiC4/I+5E=
X-Google-Smtp-Source: ABdhPJy/BS7LPhw3hwNYqN1twP/lDOExeF04yiqs//xPb7t5bpe0txA5B540wOmbB46uksxCZNBEGY6MIJQFQv81OLE=
X-Received: by 2002:a9d:6f91:: with SMTP id h17mr4800822otq.151.1641768067455; 
 Sun, 09 Jan 2022 14:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
 <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
In-Reply-To: <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Jan 2022 15:40:56 -0700
Message-ID: <CADvTj4q4bR++z4YevSfa35Xxu7AUVMmS2o4mEtfP4WK3-cGx2A@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 8, 2022 at 2:31 PM Norbert Lange <nolange79@gmail.com> wrote:
>
> Am Sa., 8. Jan. 2022 um 20:04 Uhr schrieb James Hilliard
> <james.hilliard1@gmail.com>:
> >
> > On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange <nolange79@gmail.com> wrote:
> > >
> > > Systemd has very many options, adding a way for the user
> > > to set custom options can help customizations
> > > without changing buildroot files.
> >
> > I'm not sure this is a good idea, if a configuration option needs
> > customizability it
> > probably needs a specific kconfig option. Systemd config options tend to require
> > dependency selection and special handling so this seems likely to cause
> > spurious errors due to improper usage. Seems to be a pretty big footgun IMO.
>
> Sure, you are aware that many of my buildroot patches are stuck in limbo
> since early 2020?

Different issue IMO.

> Just doesnt seem feasible to timely fix everything and version bumps often leave
> more untapped options. Some part of the necessity would be just being pragmatic.

I generally try to add any new options when bumping but I sometimes miss some.

>
> One example would be using the unified cgroups hierarchy
> (-Ddefault-hierarchy=unified), hybrid is pretty much deprecated,
> and some systemd features that buildroot allows to enable (OOMD for example)
> wont work without it.

I mean, this sounds like something that needs to be fixed in upstream buildroot.

>
> >
> > What systemd configure option would you want to be using that isn't
> > currently able to be enabled?
>
> FYI those are the ones I currently use:
>
> -Ddefault-hierarchy=unified \
> -Dutmp=false \
> -Ddefault-dnssec=no \
> -Didn=false \
> -Denvironment-d=false \
> -Dxdg-autostart=false \
> -Ddns-over-tls=false \
> -Ddefault-llmnr=no \
> -Ddns-over-tls=false \
> -Ddefault-mdns=no \
> -Dlz4=false

I'm seeing a lot of these added though(I remember adding some of them
myself), are you
trying to use a newer systemd than the version supported by the
buildroot version you are
building from?

Note that systemd defaults can generally be overridden via configs in
the overlay as well.

>
> Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
