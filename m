Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67545C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CC9C4013E;
	Sun,  6 Nov 2022 16:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC9C4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVjxhn2BUEWu; Sun,  6 Nov 2022 16:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F651400E7;
	Sun,  6 Nov 2022 16:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F651400E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA5E1BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E4A817AD
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E4A817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyaK7xCzzRsF for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2177E817AB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2177E817AB
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:26:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E91005FFA0;
 Sun,  6 Nov 2022 17:26:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 17:26:47 +0100
Date: Sun, 6 Nov 2022 17:26:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20221106162647.GB3918838@scaer>
References: <cover.1666122184.git.yann.morin@orange.com>
 <27491_1666122194_634F01D2_27491_495_1_cf89a104edc507c063e6f4716cc859891b489d27.1666122184.git.yann.morin@orange.com>
 <CADYdroNgbAUMPUj9O5g=aq_bzBxm-wYbiQ266ZO3Por=oJU1uw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroNgbAUMPUj9O5g=aq_bzBxm-wYbiQ266ZO3Por=oJU1uw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667752013;
 bh=C36esGgAgWk5i0IHPhcgF9Us8lhQFNXR8a/iq0dujWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGD8B5G86aFB+C6CVH4Smqw42HaotpWpudgR4PI1RrsfDvbBIoWeuGpusGE0zi6Cc
 Agezz7eTthyb12OkZNdU4M8HA0lFPYoYo+n+9jt0HcNwYJfTiDMYRltHX3ueV7XV9/
 iDI4PCzUH3KV0zLaacADZF9EkyZN7L1IeBRmaCrjpwZRg++mvQTtmP3CDAGDS/FDye
 fJ1FYlbOX8O9JWSFgN6ryIFzCc4bNlxbtpLUoe73iS8T59FJpbtVzP7Rj8MXSS8ANr
 3RRktKe1EFfiYEDJtbIrNFI8kK34H71Ar6yliwYi1PlXQcq34dJlL9G1KspoFZrDmj
 luGcHD3jVcr/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OGD8B5G8
Subject: Re: [Buildroot] [PATCH 2/6 v3] package/skeleton-systemd:
 systemd-ify mounting /var tmpfs with ro rootfs
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

Thanks for the feedback!

On 2022-11-06 16:56 +0100, Norbert Lange spake thusly:
> Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
[--SNIP--]
> > diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/var.mount
> > new file mode 100644
> > index 0000000000..6b165dff6d
> > --- /dev/null
> > +++ b/package/skeleton-init-systemd/var.mount
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: LGPL-2.1-or-later
> > +# Modelled after systemd's tmp.mount
> > +
> > +[Unit]
> > +Description=Buildroot /var tmpfs
> > +DefaultDependencies=no
> > +Conflicts=umount.target
> > +Before=basic.target local-fs.target umount.target systemd-tmpfiles-setup.service
> 
> Change it to
> Before=local-fs.target umount.target
> 
> All other dependencies are implicit

I looked at bootup(7) (thanks for the pointer!), and it seems that
tmpfiles is on a different synchronisation path (elided for brevity):

            (various low-level  (various mounts and
             services: udevd,    fsck services...)
             tmpfiles, random            |
    .    .   seed, sysctl, ...)          v           .
    .    .      |                 local-fs.target    .
    |    |      |                        |           |
    \____|______|_______________   ______|___________/
                                \ /
                                 v
                          sysinit.target

So, if we want tmpfiles to populate /var, we need to mount /var before
tmpfiles are run, so we need it in the Before section.

I suspect that this should also consistent with the other unit about the
overlayfs; we probably want the same Before for both, no?

> > +After=swap.target
> > +
> > +[Mount]
> > +What=tmpfs
> > +Where=/var
> > +Type=tmpfs
> > +Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
> > +
> > +[Install]
> > +WantedBy=basic.target
> 
> Drop the install section.

Then, how do we ensure the unit is enabled and active?

I guess however that this should be consistent between this unit and the
one about the overlayfs.

> While testing some other overlay solutions I found out that
> a /var mount cant be reasonably disabled.

Do you meant that the following preset:

    disable var.mount

would not be enough to prevent our unit from being acted on?

Also, see below...

> What happens is that basic.target will pull in var.mount,

Ah, so it is implicit that basic.target pulls in mount units? Or is
var.mount somehow special?

Also, why "basic.target", when bootup(7) shows that the first sync point
by which filesystems are supposed to be mounted, is sysinit.target?

> the only option to disable it would be masking var.mount

In this case, people who would mask var.mount would rather need to
override it to mount an actual device arther than a tmpfs, no?

Also, since mount units must be named after their mount point, users who
want to mount their own device would have to provide a unit named
var.mount, so they can't disable it.

Finally, usetrs who have custom dispositions (like an initramfs that
mounts /var) can just remove the unit with a post-build script.

> Guess i cant ack it conditionally, so far:
> 
> Reviewed-by: Norbert Lange <nolange79@gmail.com>

Thanks! I'll add it when I respin with your suggestions.

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
