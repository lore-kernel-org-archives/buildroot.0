Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09728C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D064090C;
	Mon, 17 Oct 2022 16:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D064090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCXWi7a0NEOr; Mon, 17 Oct 2022 16:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E315408EB;
	Mon, 17 Oct 2022 16:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E315408EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7DEA1BF973
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C3A60B8D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C3A60B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0_m0pcmeOo4 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5FC60864
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B5FC60864
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:00:49 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4MrhYB6vgVz8swj; 
 Mon, 17 Oct 2022 18:00:46 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 18:00:44 +0200
Date: Mon, 17 Oct 2022 18:00:44 +0200
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <14503_1666022446_634D7C2E_14503_9_8_20221017160044.GF2064029@tl-lnx-nyma7486>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
 <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
 <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX302.corporate.adroot.infra.ftgroup
 (10.115.26.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666022447;
 bh=P5j2+dGFBG3YBG4m3dkxy4Fv2vuoPycU3wQW9OIbmmk=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=XLsLcCSMIU2+Of47vJIQ013vxN0qmS2/cOiLm1yzu2+/50IirsvjBru4AzahOe5Ae
 oKWYB//A5KvYiw/dZX19PXBJZ9imXr+El9zzajwFPJ8QWU3Htkm3sJjSiI148Ya7bk
 g3JxCiUp7myJkpKn9JlWYrHHd+NIM8euDg2xpD5Ezh7D6uDZGybRW55pJ5p2xqW5Vx
 6AoilZcfjyapGJ4nWmw6cvD30exFXM677ScToRsItp7dScIVJ7s0idAWqrFq12/0Zg
 CKdqVyuSRlZE2cUkaK6gkx0RK/YOuAK7It7kTS0zzFuaRuBZcrPDND2wNBkZy73WBc
 u5gi/4A/QlMYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=XLsLcCSM
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

Norert, All,

On 2022-10-17 16:50 +0200, Norbert Lange spake thusly:
> Am Mo., 17. Okt. 2022 um 16:11 Uhr schrieb <yann.morin@orange.com>:
> > On 2022-10-17 14:12 +0200, Norbert Lange spake thusly:
> > > Am Sa., 15. Okt. 2022 um 23:23 Uhr schrieb Yann E. MORIN
> > > <yann.morin.1998@free.fr>:
> > [--SNIP--]
> > > > The solution we implemented in Buildroot is to generate a factory for
> > > > /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> > > > the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> > > > on boot. Having a tmpfs means /var is repopulated from a clean state at
> > > > each boot, and people who want a persistent /var have to provide their
> > > > own mechanism to mount their actual filesystem instead.
> > > Here the issue is, that the logic will never be complete, I will
> > > have to dig up old threads, but it fails with various combinations
> > > of symlinks.
> > The thing is, out of the box, Buildroot needs a working situation.
> Yes, my argument would be a technical better solution.

But so far, we do not have that technically better solution, so we need
to fix things that are arctually broken.

[--SNIP--]
[--SNIP--]
> > Now, please understand that some people are very happy with using a /var
> > factory, and some are even happy that /var is being mounted as a tmpfs
> > too.
> Would they be unhappy if everything works as it did before?

By "works as it did before", do you mean "using a var factory that was
not broken for them"? Yes, I am being teasing.

We'd have to evaluate the alternative proposal when we see it, if that
can replace the existing solution.

> > That is assuming that one will use an initramfs. For example, in my
> > systems, I do not use one, and I do not want to use one.
> No, initramfs is optional

Ah, but you had so far only talked about using an initramfs to prepare
an overlay, so I assumed your solution was tied to using an initramfs.
If it's not, then let's see it.

[--SNIP--]
> > However, in my case I expressely do not want to use an initramfs: my
> > rootfs is a squashfs mounted on an initrd. I also have a tmpfs mounted on
> > /var, as I am very happy that /var gets factory value at boot (my
> > resilient data is accessed in some other ways).
> I am not sure if initrd/initramfs means something different here.

initrd is a blockdevice in memory. The filesystem one puts in there can
be any filesystem that could be otherwise stored on another blockdevice.

initramfs is a filesystem in memory, like a tmpfs. The initramfs is
read-write.

> > > The recurring attempts to discuss this ended in [1].
[--SNIP--]
> > And finally, I believe it may even address more complex situations,
> > where people will provide their own fakeroot-script to do the
> > preparatory works.
> 
> My own usecase is that  use the buildroot as pristine rootfs and then
> slice it up as
> necessary. But just to get this out of the way.
> 
> More importantly, I would propose a simpler, yet more robust solution
> than the var factory.
> 
> For this, the files in the attached archive have to end up in
> /lib/systemd/system.

Did you forget to attach something, by chance?

> What this does:
> Before the time /var is supposed to be accessed, an tmpfs will be
> mounted in /run,

We already have that: /run is automatically mounted by systemd, no?

> and the /var folder will be shifted around to end up in an overlayfs
> *below* this tmpfs.

What do you mean by "shifted"?

> The bind-mount is done with a systemd mount unit, means if you have mounts
> *in /var or below* those will be correctly ordered.

Yeah, switching away from the fstab is good.

> -   No initramfs necessary
> -   No duplicate files in the var factory and tmpfs (unless they are
> modified of course). So your suashed files stay compressed.
> -   No tricky autogenerated tmpfiles
> -   Would be possible to do something similar in other init systems
> 
> The only downside would be the reliance on overlayfs - technically you
> could also
> adopt that solution to copy stuff into the tmpfs.
> 
> Besides my obvious biases there are technical arguments to be had.

We all have biases, me ot the last. :-)

My technical arguments for this series are:
  - it is currently kinda-broken
  - var factory works until proven otherwise
  - so we need to fix them

I'll be sure to do as unbiased a review as possible for your proposal
when I see it. ;-)

> > PS. Please note that there are two different Yann in this thread: me at
> > work using Buildroot, and Yann at home, one of the maintainers. Look at
> > the email to be sure who's talking (not that I-at-work talk in the name
> > of my employer either).
> > I try to segregate the two identities as much as I can, but sometime
> > there is some overlap, like here.
> > YEM.
> 
> Not making things much clearer ;)

If it can comfort you, it is not much clearer in my own head either!  ;-)

Regards,
Yann E. MORIN.

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
