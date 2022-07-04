Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D204DC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 12:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0CC40860;
	Mon,  4 Jul 2022 12:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0CC40860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzsj_6AfaYWE; Mon,  4 Jul 2022 12:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 676D840861;
	Mon,  4 Jul 2022 12:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 676D840861
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA9A1BF368
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 12:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42D5560E11
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 12:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D5560E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEIGF62Qo6sL for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 12:07:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F4660C2C
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F4660C2C
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 12:07:51 +0000 (UTC)
Received: from opfednr03.francetelecom.fr (unknown [xx.xx.xx.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4Lc4Ls5r4Pz4wv5; 
 Mon,  4 Jul 2022 14:07:49 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 14:07:47 +0200
Date: Mon, 4 Jul 2022 14:07:47 +0200
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <32605_1656936469_62C2D815_32605_488_1_20220704120747.GA4115093@tl-lnx-nyma7486>
References: <20220109110736.3963-1-nolange79@gmail.com>
 <20220704064121.GA2889@tl-lnx-nyma7486>
 <5037_1656917160_62C28CA8_5037_313_1_20220704064557.GB2889@tl-lnx-nyma7486>
 <CADYdroPEbds5DXt=Ez9y33nuV4KnBYkg4pOiVBUSTQuhLNS=fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroPEbds5DXt=Ez9y33nuV4KnBYkg4pOiVBUSTQuhLNS=fg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1656936469;
 bh=MzWsiyyAJJK6dZEruwsaSyc+0uV5u+SKhk2GFxTnVJI=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=ewky2+A9SwQXMz9OaQpIKZsaiwU5RPmR1jxoMppD+2gFWvz5dnGESC9QkXLRfnMJs
 uIl4MPTkLGMeDd+HaEERkwc6y2cMf4HvHejQrvJHcOkJuQb4Hzh7lmZ74Ol/yQdljf
 ple2IMq70bBo1uNsV0H1qo+ViSFOOLXhYldmy9SxwPdq1j9Eb+/yiDnX+OHyDzDUKx
 HYy61AORlNw653YZVuNz/mwgZcMIeLfEDHF8jVWeWoj3VLcjWHMnuPOVLWFZ/xuzBB
 3wUerOE4c0W+OxkwUNcaVYQTuqbrlw36e5ElP1/ZdUqq6chBNexH2rp3SOM4Nt3wqi
 Vj3rObLk5xCqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=ewky2+A9
Subject: Re: [Buildroot] [PATCH v3] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?utf-8?B?SsOpcsOpbXk=?= ROSEN <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-07-04 13:05 +0200, Norbert Lange spake thusly:
> Am Mo., 4. Juli 2022 um 08:46 Uhr schrieb <yann.morin@orange.com>:
> > On 2022-07-04 08:41 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > On 2022-01-09 12:07 +0100, Norbert Lange spake thusly:
> > > > Especially for read-only filesystems it is helpfull to
> > > > pre-create all folders for non-volatile paths.
> > > I'm revisiting this old change of yours, and I have some issues
> > > understanding the original issue this is supposed to fix...
> Often if a directory is readonly, the service will still start (and
> have limited functionality),
> but if its missing it wont be even attempted or fails early, taking
> down more services that depend on it.

But again, what exactly is broken?

Our var factory is supposed to make that working, so if it is broken,
I'd rather that it is fixed (somehow), rather than some orthogonal
change be implemented. Can you provide an actual defconfig that exhibits
the issue, that the factory does not solve?

And as I explained: with the factory, the entries added in /var are
anyway totally useless because we anyway mount a tmpfs on there. So, in
a sense, this change conflicts with the var factory.

And from http://0pointer.de/blog/projects/stateless.html, I understand
that it it is totally expected that one may want to mount a filesystem,
like a tmpfs, on /var, so what we are doing is perfectly legit.

And as I (my non-work alterego) explained in 26085bbbd500 (system: make
systemd work on a read-only rootfs), people who want persistent /var can
change the fstab (but see below) to something else, to have /var an
actual filesystem.

So, I still do no tunderstand the initial issue your change was trying
to fix...

> > > Indeed, for read-only filesystems, we do generate a factory for /var.
> > > This code is guarded by a condition on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
> > > so indeed, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we do not
> > > create the factory. But if it is set, then we do create the factory:
> > *if it is _unset_, then we do create the factory.
> Yeah, and this is an insanely fragile method, which I brought up
> multiple times (see [1]),
> and prevents other solutions that work above or below your initsystem.

I agree that BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is fragile. However,
we do not have a bette rsolution to know whether /var is on a r/w
filesystem, or if we need to explicitly mount one there.

We should also expand the help entry for BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
and add some explanations in the manual, probably.

> Some versions I personally cooked up:
> -   precreate the directories, or add some symlinks to /tmp.
>     (I got a debian USB Setup/Rescue stick with Gnome running that way)
> -   deal with the issue in the initramfs (mount tmpf/ overlayfs)
> -   add a systemd unit + mount creating the overlayfs.
> 
> Any of these are just as viable and more robust than that weird
> tmpfiles solution,
> why is that one forced down to be the only one?

First it is not the only one. But we need something, and that is
something minimalist. It is not covering 100% cases, but that is not
possible in a generic way.

Buildroto is all about providing a working base system, that user can
extend and customise at will. But the premises is that it shold work out
of the box.

> Look for example on the BR2_PACKAGE_SYSTEMD_CATALOGDB config
> which depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW to
> avoid a huge mess.

Sorry, but I do not understand what the issue here is. If there are
conflicts with tmpfiles.d entries, we need to find a solution, rather
than hide them under the rug...

> > >   - move /var away to /usr/share/factory/var
> > >   - register its content as a tmpfiles.d:
> > >     https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L37
> >
> > Note: this tmpfiles.d is currently stored in /etc/tmpfiles.d, but it
> > really belong to /usr/lib/tmpfiles.d (to later allow for an empty /etc
> > too).
> The whole feature belongs behind its own option, or even better: own package.

Sorry, but we need a way to provide a r/w /var by default, for those
packages that expect it to be, and that are not systemd-aware, but do
install stuff in /var at build-time. I don't see how that can be done if
the factory is moved to its own package...

I also don't see why it should be a separate option either. Indeed, on
aread-only rootfs (either by design, like squashfs, or by configuration,
like passing 'ro' on the kernel command line), we still need a r/w /var.

So the best option is to correlate it to BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
even if it feels a bit kludgy...

> I attached an archive implementing the systemd unit + mount. Some
> equivalent would be possible
> for other init systems. You wont need ANY complicated trickery that way,
> just unpack that into /usr/lib/systemd/system

Ah, I see that you switched to var.mout. This is *exactly* the change I
am doing right now, and it is working very nice. Here's my var.mount:

    # SPDX-License-Identifier: LGPL-2.1-or-later
    # Modelled after systemd's tmp.mount

    [Unit]
    Description=Buildroot /var tmpfs
    DefaultDependencies=no
    Conflicts=umount.target
    Before=basic.target local-fs.target umount.target systemd-tmpfiles-setup.service
    After=swap.target

    [Mount]
    What=tmpfs
    Where=/var
    Type=tmpfs
    Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m

    [Install]
    WantedBy=basic.target

I can see a few lines that yours has that could be interesting to add
in there, like (but why is that latter one commented out?):
  - ConditionPathIsSymbolicLink=!/var and
  - ConditionPathIsReadWrite=!/var

(we could also maybe use ConditionPathIsMountPoint=!/var)

(also note that systemd will complain that /var is not empty, but will
still proceed to mount a tmpfs on /var anyway).

Thus, people that want to moun tsomething else can ovide a drop-in to
complement our var.mount, or even provide their own that overrides ours.

With my var.mount, and with this change reverted, I validate that all
the processes running on my system do have /var mounted:

    # for i in /proc/*/mountinfo; do grep -q ' /var ' ${i} || echo ${i}; done

The only such process is the one running [kdevtmpfs], but that is a
kernel thread that is running for the /dev devtmpfs mount, and thus is
started before the init process is, and the factory is workign nicely.

I'd be interested to see how the systemd catalogs are broken, though,
and see how we can unbreak them.

Regards,
Yann E. MORIN.

> Regards, Norbert
> 
> [1] - http://lists.busybox.net/pipermail/buildroot/2020-July/287016.html

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
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
