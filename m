Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C281CCA479
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA23140600;
	Mon,  4 Jul 2022 15:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA23140600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8hQwV0SprGF; Mon,  4 Jul 2022 15:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785AC40320;
	Mon,  4 Jul 2022 15:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785AC40320
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1E51BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A243B814BB
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A243B814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e32_yPXIAR-s for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4E6814AB
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A4E6814AB
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:57:39 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a4so16553810lfm.0
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 08:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ufO9Cn42KCFU5Zow+euYLxkry8qeXNZcDaP+gR3efPU=;
 b=wwlVPFAYs9IB4zwanB1PLseoOcqPeInbvd9KIu5HA1sgDvSoqKCtA1OrOw1UhZKeZA
 o0bIDM51luO93NPFqNQ/ftw666WII4lj5ZRXxg6nggkVzKFBtTR1PKREHAfoBxhubw9B
 QkSQVEKXtxILmWVIEitNtg8rKvPNPj2DRA+Mxu9Hah+Op0GX8KcJz32z8CzB0zohjdze
 eRFYFVK0XYP4c6vM3r+2AcecvQaNidjKPJhj5RNHQh0Tg+y5VjS+SIq2GBfuAQ0wNAHa
 L3PhwCWI2LJUDagZMMRao7tBuxAVVDz6zZzZ/ArnTit2s2BSMxePpZY6fI05bUKnUIzk
 jaqQ==
X-Gm-Message-State: AJIora+tFlp3q/bOWjPqxtqFON21zwJaeVuuBqcMToceBu+ED0Bx+5bV
 f/VKcIfPE6A9pLVdlW550AmY4LS+2/FjvnMDH0o=
X-Google-Smtp-Source: AGRyM1uRRKz28VeKQ0PgApQV0ZwQFEkisD8E4pFGMpEg1RL3jDBo3Rdn0+huDXqI5HJMy9TVcnfIaW98b6wh2FfTD+M=
X-Received: by 2002:ac2:51a5:0:b0:47f:79a1:5c02 with SMTP id
 f5-20020ac251a5000000b0047f79a15c02mr18960917lfk.575.1656950257749; Mon, 04
 Jul 2022 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220109110736.3963-1-nolange79@gmail.com>
 <20220704064121.GA2889@tl-lnx-nyma7486>
 <5037_1656917160_62C28CA8_5037_313_1_20220704064557.GB2889@tl-lnx-nyma7486>
 <CADYdroPEbds5DXt=Ez9y33nuV4KnBYkg4pOiVBUSTQuhLNS=fg@mail.gmail.com>
 <32605_1656936469_62C2D815_32605_488_1_20220704120747.GA4115093@tl-lnx-nyma7486>
In-Reply-To: <32605_1656936469_62C2D815_32605_488_1_20220704120747.GA4115093@tl-lnx-nyma7486>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 4 Jul 2022 17:57:26 +0200
Message-ID: <CADYdroOwtdAZqvAi0G4OX9Ffq29hDSqnwVgOXea-JzsYp6iKbg@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ufO9Cn42KCFU5Zow+euYLxkry8qeXNZcDaP+gR3efPU=;
 b=aOLyVaO8XVsJYIbMni+w/JV2anwoC7i9u+f/UffP9UJhc7hoPnk9UnJ862R974vqgg
 jrimmVDj2JSf+/uGHIDQqNk9N+F3LbATH7CSiRsb6tI3JT0lOeRtI4XFnxxgsXcEKwSR
 CMqSVR9V2CcQ6PTTypbZ3Pna8QJT9XIn/67QujYBdJR4uCU15RrCaXM+LzFBGF3ZMuPQ
 J6w80ORVvKTyjvbsHAwaujWyGo3Xtk5wA35tfoyepzHY73UvWfeIMCaJ+yIoMywqDd/A
 aSqxAQ8iYAQ6+zHZiN6F2UJuvrUcIy3uLcWfFu9FcY+bkCxacQEM19iBx32TVRcFfn+o
 rq2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aOLyVaO8
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
 =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mo., 4. Juli 2022 um 14:07 Uhr schrieb <yann.morin@orange.com>:
>
> Norbert, All,
>
> On 2022-07-04 13:05 +0200, Norbert Lange spake thusly:
> > Am Mo., 4. Juli 2022 um 08:46 Uhr schrieb <yann.morin@orange.com>:
> > > On 2022-07-04 08:41 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > > On 2022-01-09 12:07 +0100, Norbert Lange spake thusly:
> > > > > Especially for read-only filesystems it is helpfull to
> > > > > pre-create all folders for non-volatile paths.
> > > > I'm revisiting this old change of yours, and I have some issues
> > > > understanding the original issue this is supposed to fix...
> > Often if a directory is readonly, the service will still start (and
> > have limited functionality),
> > but if its missing it wont be even attempted or fails early, taking
> > down more services that depend on it.
>
> But again, what exactly is broken?

With this change you can boot into a filesystem even without mounting
a tmpfs on /var.

>
> Our var factory is supposed to make that working, so if it is broken,
> I'd rather that it is fixed (somehow), rather than some orthogonal
> change be implemented. Can you provide an actual defconfig that exhibits
> the issue, that the factory does not solve?

Your factory is not a good solution. I can easily cook up a package with
tmpfiles.d that break it.
Your factory interferes with the solution above to just leave /var alone,
pre-create a few directories and have the system boot (albeit in a
reduced state).

>
> And as I explained: with the factory, the entries added in /var are
> anyway totally useless because we anyway mount a tmpfs on there. So, in
> a sense, this change conflicts with the var factory.

Yeah... but I consider the var factory the problem. Other than "been that way",
is there any argument for this solution?

>
> And from http://0pointer.de/blog/projects/stateless.html, I understand
> that it it is totally expected that one may want to mount a filesystem,
> like a tmpfs, on /var, so what we are doing is perfectly legit.

Yes, but that should haven in the initramfs, there is even code for that in
systemd which mounts an overlayfs on /. Again, your factory runs opposite to
the usually approach to use an overlay.

Besides the argument in the article above would be that you *should not*
have to copy stuff in tmpfiles.d to make it work, but the services
take care of that.

>
> And as I (my non-work alterego) explained in 26085bbbd500 (system: make
> systemd work on a read-only rootfs), people who want persistent /var can
> change the fstab (but see below) to something else, to have /var an
> actual filesystem.
>
> So, I still do no tunderstand the initial issue your change was trying
> to fix...

Well, I thought

"Buildroot is all about providing a working base system, that user can
extend and customise at will."

then I wanted Buildroot to create me the rootfs I can build an erofs from,
mount that and an overlayfs in the initramfs.
Even if the partition holding the overlay would be corrupt I could boot and
ssh into a system. That means having the directories in /var existing,
cause services might bail if not.

So there is no issue  other than finding it more versatile if

-   work is done upfront
-   the rootfs is usable in more context

Note that I have to *enable* REMOUNT_ROOTFS_RW to build a
read-only rootfs.

>
> > > > Indeed, for read-only filesystems, we do generate a factory for /var.
> > > > This code is guarded by a condition on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
> > > > so indeed, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we do not
> > > > create the factory. But if it is set, then we do create the factory:
> > > *if it is _unset_, then we do create the factory.
> > Yeah, and this is an insanely fragile method, which I brought up
> > multiple times (see [1]),
> > and prevents other solutions that work above or below your initsystem.
>
> I agree that BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is fragile. However,
> we do not have a bette rsolution to know whether /var is on a r/w
> filesystem, or if we need to explicitly mount one there.

Nope, I meant your specific lets move all stuff into tmpfiles.d
is fragile. Not having an option for that.
I would expect REMOUNT_ROOTFS_RW to *only* effect writing the
/etc/fstab file.

Then have *another* option to mess with buildroots tmpfiles.

>
> We should also expand the help entry for BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> and add some explanations in the manual, probably.
>
> > Some versions I personally cooked up:
> > -   precreate the directories, or add some symlinks to /tmp.
> >     (I got a debian USB Setup/Rescue stick with Gnome running that way)
> > -   deal with the issue in the initramfs (mount tmpf/ overlayfs)
> > -   add a systemd unit + mount creating the overlayfs.
> >
> > Any of these are just as viable and more robust than that weird
> > tmpfiles solution,
> > why is that one forced down to be the only one?
>
> First it is not the only one. But we need something, and that is
> something minimalist. It is not covering 100% cases, but that is not
> possible in a generic way.
>
> Buildroto is all about providing a working base system, that user can
> extend and customise at will. But the premises is that it shold work out
> of the box.

Yeah, the pain is purely at the guys trying to extend buildroot
without causing a mess with that solution ;)

>
> > Look for example on the BR2_PACKAGE_SYSTEMD_CATALOGDB config
> > which depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW to
> > avoid a huge mess.
>
> Sorry, but I do not understand what the issue here is. If there are
> conflicts with tmpfiles.d entries, we need to find a solution, rather
> than hide them under the rug...

The issue was that symlinks arent handled correctly, some years ago I
knew more about the problem.
hiding under the rug is the move to tmpfiles.d solution that
causes those problems. And the only sane solution would
be to replace it with something more robust IMHO

>
> > > >   - move /var away to /usr/share/factory/var
> > > >   - register its content as a tmpfiles.d:
> > > >     https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L37
> > >
> > > Note: this tmpfiles.d is currently stored in /etc/tmpfiles.d, but it
> > > really belong to /usr/lib/tmpfiles.d (to later allow for an empty /etc
> > > too).
> > The whole feature belongs behind its own option, or even better: own package.
>
> Sorry, but we need a way to provide a r/w /var by default, for those
> packages that expect it to be, and that are not systemd-aware, but do
> install stuff in /var at build-time. I don't see how that can be done if
> the factory is moved to its own package...
>
> I also don't see why it should be a separate option either. Indeed, on
> aread-only rootfs (either by design, like squashfs, or by configuration,
> like passing 'ro' on the kernel command line), we still need a r/w /var.

It should be an option to to allow for example - mounting an overlayfs -
without all the fallout that moving files around entails.

Do you expect users to be happy if things suddenly break when they
are using their own tmpfiles.d that happen to have unlucky sideeffects,
showing up only after disabling REMOUNT_ROOTFS_RW.

Again you are moving around stuff, copying back in random order
interleaved with operations from buildroot packages and user configs.

>
> So the best option is to correlate it to BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> even if it feels a bit kludgy...

Heck no. The best option would be to use an overlay, and also have an option
to disable everything outside adding an entry in /etc/fstab.

Unless you want to artificially restrict how Buildroot's can be used,
initramfs and container services can perfectly fine make an read-only
image usable.

>
> > I attached an archive implementing the systemd unit + mount. Some
> > equivalent would be possible
> > for other init systems. You wont need ANY complicated trickery that way,
> > just unpack that into /usr/lib/systemd/system
>
> Ah, I see that you switched to var.mout. This is *exactly* the change I
> am doing right now, and it is working very nice. Here's my var.mount:

its important to do it that way, so mounts are correctly ordered.

>
>     # SPDX-License-Identifier: LGPL-2.1-or-later
>     # Modelled after systemd's tmp.mount
>
>     [Unit]
>     Description=Buildroot /var tmpfs
>     DefaultDependencies=no
>     Conflicts=umount.target
>     Before=basic.target local-fs.target umount.target systemd-tmpfiles-setup.service
>     After=swap.target
>
>     [Mount]
>     What=tmpfs
>     Where=/var
>     Type=tmpfs
>     Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
>
>     [Install]
>     WantedBy=basic.target
>
> I can see a few lines that yours has that could be interesting to add
> in there, like (but why is that latter one commented out?):
>   - ConditionPathIsSymbolicLink=!/var and
>   - ConditionPathIsReadWrite=!/var

Cause the check doesn't do what I want, it seems to go only
on inode permissions. Means if you mount the image read-only
(or use squashfs/erofs) and have the directory "writable" the service wont run

>
> (we could also maybe use ConditionPathIsMountPoint=!/var)
>
> (also note that systemd will complain that /var is not empty, but will
> still proceed to mount a tmpfs on /var anyway).

All trickery and pain can be avoided by using an overlay.
(Wish I could Jedi-mind-trick you)

>
> Thus, people that want to moun tsomething else can ovide a drop-in to
> complement our var.mount, or even provide their own that overrides ours.
>
> With my var.mount, and with this change reverted, I validate that all
> the processes running on my system do have /var mounted:
>
>     # for i in /proc/*/mountinfo; do grep -q ' /var ' ${i} || echo ${i}; done
>
> The only such process is the one running [kdevtmpfs], but that is a
> kernel thread that is running for the /dev devtmpfs mount, and thus is
> started before the init process is, and the factory is workign nicely.
>
> I'd be interested to see how the systemd catalogs are broken, though,
> and see how we can unbreak them.

you shouldn't move the files to the factory, cause the service has its
own tmpfiles.d to create them.

Here lies your crux:

-  You have services that can't deal with an empty /var
-  You have services that can deal with an empty /var and chances are
good that your tmpfiles trickery breaks them now or in the future.
-  You have users that can drop in both, so even if you manage to
if-but your script to fix the packages in buildroot, you cant if-but
all usages

You real want to use overlays *Waves hand*

Regards,
Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
