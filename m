Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 14:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F9C605EA;
	Mon, 17 Oct 2022 14:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F9C605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2_QzL2hsKhT; Mon, 17 Oct 2022 14:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FE5606DC;
	Mon, 17 Oct 2022 14:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FE5606DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86E781BF2F2
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6023741769
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6023741769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ggamlijoohm for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 14:11:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880F941765
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 880F941765
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 14:11:59 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar25.francetelecom.fr (ESMTP service) with ESMTPS id 4Mrf7d0rTvz8sZm; 
 Mon, 17 Oct 2022 16:11:57 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 16:11:54 +0200
Date: Mon, 17 Oct 2022 16:11:54 +0200
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666015917;
 bh=hcOAJqbdQu+dKvc4Q9qx31RECD/AeG1puMMcsjTifb4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=G7U7q4uXKSj7WN4xR/gVYZ+vCLUl6wmEmX+KLgUv0rkgiAoJ7m7fQLhghZlriv3uM
 IW7Wh7ycf+2zZEXk8KLh8OND/pcfoSs0y5Q5/V2FbblQE7lD5QPr9btphCH2wHsnC+
 E7IUJZB1cvFqTOUVLGrnSx9F1R0oOxxHv4A1brTb9fnExiYdUa34m+h2KbDFhJnzNZ
 UAaW/zgSjt5rKdiTLIQPgl/PaYbSA89nTpEmvl2QkAy19uRCYM0dRef2CRviRTWJO/
 wOMlOzrbyuYREukf5/T8Qp22lzpglUbZbv4dj1UjbJK3gNoRqsjoUy0louKaaKhTvg
 OLvZ3/+6pOyrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=G7U7q4uX
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
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-10-17 14:12 +0200, Norbert Lange spake thusly:
> Am Sa., 15. Okt. 2022 um 23:23 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
[--SNIP--]
> > The solution we implemented in Buildroot is to generate a factory for
> > /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> > the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> > on boot. Having a tmpfs means /var is repopulated from a clean state at
> > each boot, and people who want a persistent /var have to provide their
> > own mechanism to mount their actual filesystem instead.
> 
> Here the issue is, that the logic will never be complete, I will
> have to dig up old threads, but it fails with various combinations
> of symlinks.

Then we should fix it up and make the procedure more robust, when you
can point to actual issues so that we know how it is broken and how to
fix it. I (see the post-scriptum) would be happy to help look into that.

> Its an inherently fragile approach, and I would question the solution as whole.

The thing is, out of the box, Buildroot needs a working situation.

Providing an overlay (see below) requires a setup by the user, setup
That is highly dependent on the actual target: does it need to be
partitioned and formatted on first boot? If so, how? Should it be
mounted on the whole of / or just /var?

Those are not something that falls in the scope of Buildroot. Providing
a var factory and a tmpfs on /var is the only solution that can be
(rather easily) implemented.

> > However, for some people, this does not seem to work as expected, so we
> > introduced a call to systemd-tmpfiles at build time, to pre-populate the
> > rootfs from all the tmpfiles, of which our var factory, at build time.
> 
> There are several usecases where this is atleast non-optimal,
> and for a default to mess with the filesystem in such a way is
> not a good foundation.
> 
> I am not sure if I am up-to-date, but the original call during
> the fakeroot stage you just do the work that wouldve been
> done on first boot.
> 
> >
> > These two mechanism clash with each others, and are mostly incompatible,
> > and causes files to be duplicated.
> 
> One of them doesn't do anything than a regular system start,
> the other is likely to cause trouble, trying to fix packages
> that wont work with an empty var in an automatic way.

Look, I do understand that you do not want to be using the var factory,
and I do appreciate your arguments.

Now, please understand that some people are very happy with using a /var
factory, and some are even happy that /var is being mounted as a tmpfs
too.

All this series does, is make the two mechanisms optional, so that people
with different expectations can still have a functional systm in either
case, without an overshoot in the filesystem size due to the duplication
of files caused by unconditionally calling systemd-tmpfiles at build
time.

It even keeps the curent behaviour by default.

> > To solve the issue, this series introduces new options, so the user can
> > elect to use either, none, or both mechanisms, as they see fit.
[--SNIP--]
> I would prefer a  robust solution that provides a filesystem image
> that is compatible with further tinkering, particularly mounting /var
> in the initramfs.

That is assuming that one will use an initramfs. For example, in my
systems, I do not use one, and I do not want to use one.

> I attacked a drop-in solution, that has none of the drawbacks,
> correctly works with mounting stuff in /var,
> and only requires overlayfs to be available in the kernel.

That is assuming two things:
  - that an initramfs be used
  - that an overlay be mounted

However, in my case I expressely do not want to use an initramfs: my
rootfs is a squashfs mounted on an initrd. I also have a tmpfs mounted on
/var, as I am very happy that /var gets factory value at boot (my
resilient data is accessed in some other ways).

> Funny detail: together with the upfront creation
> of some directories in /var via the systemd-tmpfiles build-time call,
> a basic usable system is available even if the overlay fails.

That is not true. Anything that expects /var to be writable will fail to
start.

> The recurring attempts to discuss this ended in [1].

And this series addresses the fact that, for some people, the var
factory is not a good solution, so that they can disable it.

It also addresses the case of those people for whom the var factory
actually works, and want to keep using it, can disable the
systemd-tmpfiles buildtime call.

And finally, I believe it may even address more complex situations,
where people will provide their own fakeroot-script to do the
preparatory works.

Regards,
Yann E. MORIN.

PS. Please note that there are two different Yann in this thread: me at
work using Buildroot, and Yann at home, one of the maintainers. Look at
the email to be sure who's talking (not that I-at-work talk in the name
of my employer either).
I try to segregate the two identities as much as I can, but sometime
there is some overlap, like here.
YEM.

> Short on time nowadays so I can hardly pull together all relevant parts again.
> 
> regards, Norbert
> 
> >
> > Regards,
> > Yann E. MORIN.
> >
> >
> > ----------------------------------------------------------------
> > Yann E. MORIN (4):
> >       package/skeleton-systemd: move /var factory out of /etc
> >       package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
> >       package/skeleton-systemd: host the tmpfiles preparation script
> >       system: add options for var factory and tmpfiles pre-seed
> >
> >  .../fakeroot_tmpfiles.sh                           |  0
> >  .../skeleton-init-systemd/skeleton-init-systemd.mk | 18 +++++++---
> >  package/skeleton-init-systemd/var.mount            | 18 ++++++++++
> >  package/systemd/systemd.mk                         |  6 ----
> >  system/Config.in                                   | 38 +++++++++++++++++++++-
> >  5 files changed, 69 insertions(+), 11 deletions(-)
> >  rename package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh (100%)
> >  create mode 100644 package/skeleton-init-systemd/var.mount
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> 
> [1] - https://lists.buildroot.org/pipermail/buildroot/2022-July/645680.html


> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
