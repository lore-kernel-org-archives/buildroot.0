Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A64082BC4;
	Mon, 17 Oct 2022 20:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A64082BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOVNJIc4WbAZ; Mon, 17 Oct 2022 20:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4B281831;
	Mon, 17 Oct 2022 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D4B281831
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34DC1BF313
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B90F60776
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B90F60776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGiSzS8R3OIz for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34DD60615
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F34DD60615
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:14:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:811a:a2d5:652a:487e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A6D762003B4;
 Mon, 17 Oct 2022 22:14:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 22:14:44 +0200
Date: Mon, 17 Oct 2022 22:14:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20221017201444.GE3666@scaer>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
 <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
 <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
 <14503_1666022446_634D7C2E_14503_9_8_20221017160044.GF2064029@tl-lnx-nyma7486>
 <CADYdroOjp1duBTiNsdv=C1afgahQVmiDTg49-z_=hdqQJfVxqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroOjp1duBTiNsdv=C1afgahQVmiDTg49-z_=hdqQJfVxqw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666037690;
 bh=vTToL1RDVFUjSKqd0/4jbXes6ul7a1wr5IxOx4El2oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DI1AAHmEF1DnXpIJjGELwSntNmqw5wp16ShEc89zKjYU0qnXQwYk0Qua+i7b5rWCv
 pumJl8oNwf1vWHwaPb67SHGy2f7uaBnlz6x++za33KHVQuQ7GvjLhBwkeqsQAYt+RO
 WB/RJP6abdblh4DyK4+dy/hu0lbG6TR3gpB6oKGBbEAhDNNWsNWSz8O9vhCv4GQomk
 kDiHI712Vr6h/YLznusdt99lwebsJVZYI886tsMg0F0f0WNaQegdQCxWvNOayme5k4
 FqUvkOz+T5fDF7RLNsmrU+N+zjbL/h55HpZAYqRixdG9UhSI6tiQ0F0NfQmwoECY1Q
 iffrHnMcGkfRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DI1AAHmE
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
Cc: Romain Naour <romain.naour@smile.fr>, yann.morin@orange.com,
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-10-17 18:49 +0200, Norbert Lange spake thusly:
> Am Mo., 17. Okt. 2022 um 18:00 Uhr schrieb <yann.morin@orange.com>:
> > But so far, we do not have that technically better solution, so we need
> > to fix things that are arctually broken.
> I tried to bring that in for ages. Probably just have cooked up a patch instead.

Indeed, with a patch to look at, it is easier to discuss. I've seen the
files now, and indeed I remember I already saw something like that some
time ago...

I'll test it in our use-case @work tomorrow.

Ultimately, I wonder if your solution could be an alternative to the var
factory, rather than replace it.

> I consider managing patch-series time consuming, so I'd like to discuss
> the way this should be structured before.
> This could be one completely separate package for example, allowing
> different solutions.

I am not sure separate packages in the way to go.

If we were to do those various solutions in different pacakges, then
we'd have to make it easy for users to use a package from their
br2-external trees, which is not so nice.

Also, see below: we already have a package where it is interesting to
implement the systemd integration in Buildroot: skeleton-init-systemd.

> > initrd is a blockdevice in memory. The filesystem one puts in there can
> > be any filesystem that could be otherwise stored on another blockdevice.
> > initramfs is a filesystem in memory, like a tmpfs. The initramfs is
> > read-write.
> Ok, I am using those pretty much interchangeable,
> just some block you tell the bootloader to load, either cpio or filesystem.

They are not the same thing at all, and they are not interchangeable;
the underlying code is totally different.

[--SNIP--]
> > I'll be sure to do as unbiased a review as possible for your proposal
> > when I see it. ;-)
> Gonna take me few days. should be easy to test tough with the provided files,
> just throw them into the buildroot filesystem overlay.
> Helps if you make some assessment where they should fit. the
> systemd package is already bloated enough.

Yes, our systemd.mk is a bit bloated.

What I'd like to do, is that the systemd integration at the package
level is done in package/systemd/, while the choices we do in Buildroot,
like using a var factory, calling systemd-tmpfiles, or using an
overlayfs, etc... be done somewhere else.

We have the merged-usr at the init level, and that is handled in the
skeleton-init-systemd package, and the var factory is also handled
there, so I started moving more stuff in there, like the systemd-tmpfiles
call, because I don't see a better place.

So, if you don't have a better idea, skeleton-init-systemd would be
where we handle that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
