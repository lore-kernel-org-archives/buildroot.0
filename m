Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43554C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E9181865;
	Sun,  6 Nov 2022 16:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E9181865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yftymSDIkCQG; Sun,  6 Nov 2022 16:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05D681469;
	Sun,  6 Nov 2022 16:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05D681469
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC95B1BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A430160AAE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A430160AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wxK9MkK4pIB for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB9560888
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BB9560888
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:41:56 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id lf15so6248754qvb.9
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVshJ26rV8FgFj1VieVbgoPz1cFK4EtMWhbgFJOMqXc=;
 b=wIvMudCnidF38r5E4sNH3uIKOMND9Dj3kYPVi44nE54JIfQWhErA2MCP3+aaOt4cPU
 qiwZu1o9BLQIh1twRorUkBz99pTKiQmw5O+mSB+VrL4F275v5V9Ls0zJbrp/NwAf3P8o
 fvwXQed2q/AThR86infU2o1zeKBgoq11a5iVbPRjhC3zjTV0Go+QtbG4ZYK5i8babArO
 ZcPWZZ2FjbnvXTvg+dSqKIwvq+9wpfSlx43fbAqeEixr6zkhNHYNcOEPX2Z37LWF56DM
 KdR0uQUMgrVAvc7zkgbqHMLuVKkxCPRPjftTIcumsW+d+H6q6prbDdpvGmvAOh0rSPz3
 tt/g==
X-Gm-Message-State: ACrzQf0CF/bB33SD69MP/7MTdhleHeOxFABvX6vOcjVtHYJqQOEV3Zl4
 oIPqrfdjHEniZsQ38ha0h4YEyjbcLlv8ALTANqw=
X-Google-Smtp-Source: AMsMyM6bH2nVkLPYLs4Pm6DHnOiLRvcFXW6COZNfh5V6fNH5/e0fmQrLvhX5U3nULvwGk2iq+BswhrBMTG1lnjRaoF8=
X-Received: by 2002:ad4:5c47:0:b0:4c4:9b7d:ddd9 with SMTP id
 a7-20020ad45c47000000b004c49b7dddd9mr6685380qva.43.1667752915135; Sun, 06 Nov
 2022 08:41:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1666122184.git.yann.morin@orange.com>
 <27491_1666122194_634F01D2_27491_495_1_cf89a104edc507c063e6f4716cc859891b489d27.1666122184.git.yann.morin@orange.com>
 <CADYdroNgbAUMPUj9O5g=aq_bzBxm-wYbiQ266ZO3Por=oJU1uw@mail.gmail.com>
 <20221106162647.GB3918838@scaer>
In-Reply-To: <20221106162647.GB3918838@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 6 Nov 2022 17:41:44 +0100
Message-ID: <CADYdroMya2X96K+Rmr4S=npbMX1SVdy_qQrV9JUo380CGuamjw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xVshJ26rV8FgFj1VieVbgoPz1cFK4EtMWhbgFJOMqXc=;
 b=LQGWc1YOpXAqZG4nGfJNlm5IzBDzpjcg7HY5A+4VSaVmGKd9oJ5WfZ+IiglbCA1yyL
 f6ATvXI2+TpHLBJ92dYjZOmEb0V0mVJKDnqciXKg0+svucMsvt09wm44hz9Ihhg+GJ7x
 bRfegtNwt5FoLNAGBj1pNL7p8bS7JqQXyJkk9DRbI9irBbtlv001h4XFCmmCd9XHEoFk
 Sq9a9hq97mzN7S8XZH1BIBSYdfooeJQFk6kU5OqO10QgF/Qkp033yQSlqrhLBKuUyWTo
 EXEjDJQ8frMGm3BQCuAG5GjJvoKpQdlCoXQ2XzHH7gRrtgTrjOzT8cNAT3BY8PxNKBzk
 04cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LQGWc1YO
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
 =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 6. Nov. 2022 um 17:26 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> Thanks for the feedback!
>
> On 2022-11-06 16:56 +0100, Norbert Lange spake thusly:
> > Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
> [--SNIP--]
> > > diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/var.mount
> > > new file mode 100644
> > > index 0000000000..6b165dff6d
> > > --- /dev/null
> > > +++ b/package/skeleton-init-systemd/var.mount
> > > @@ -0,0 +1,18 @@
> > > +# SPDX-License-Identifier: LGPL-2.1-or-later
> > > +# Modelled after systemd's tmp.mount
> > > +
> > > +[Unit]
> > > +Description=Buildroot /var tmpfs
> > > +DefaultDependencies=no
> > > +Conflicts=umount.target
> > > +Before=basic.target local-fs.target umount.target systemd-tmpfiles-setup.service
> >
> > Change it to
> > Before=local-fs.target umount.target
> >
> > All other dependencies are implicit
>
> I looked at bootup(7) (thanks for the pointer!), and it seems that
> tmpfiles is on a different synchronisation path (elided for brevity):
>
>             (various low-level  (various mounts and
>              services: udevd,    fsck services...)
>              tmpfiles, random            |
>     .    .   seed, sysctl, ...)          v           .
>     .    .      |                 local-fs.target    .
>     |    |      |                        |           |
>     \____|______|_______________   ______|___________/
>                                 \ /
>                                  v
>                           sysinit.target
>
> So, if we want tmpfiles to populate /var, we need to mount /var before
> tmpfiles are run, so we need it in the Before section.

you should keep the dependency lists as short as possible

var.mount is ordered before local-fs.target which is ordered before
systemd-tmpfiles-setup.service.
(that makes it transitive, not implicit, by bad)

(its also sorted before basic.target, see below)

>
> I suspect that this should also consistent with the other unit about the
> overlayfs; we probably want the same Before for both, no?
>
> > > +After=swap.target
> > > +
> > > +[Mount]
> > > +What=tmpfs
> > > +Where=/var
> > > +Type=tmpfs
> > > +Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
> > > +
> > > +[Install]
> > > +WantedBy=basic.target
> >
> > Drop the install section.
>
> Then, how do we ensure the unit is enabled and active?
>
> I guess however that this should be consistent between this unit and the
> one about the overlayfs.
>
> > While testing some other overlay solutions I found out that
> > a /var mount cant be reasonably disabled.
>
> Do you meant that the following preset:
>
>     disable var.mount
>
> would not be enough to prevent our unit from being acted on?

Yes

>
> Also, see below...
>
> > What happens is that basic.target will pull in var.mount,
>
> Ah, so it is implicit that basic.target pulls in mount units? Or is
> var.mount somehow special?

basic.target is special, enabled and orders var.mount before itself with:

RequiresMountsFor=/var /var/tmp

>
> Also, why "basic.target", when bootup(7) shows that the first sync point
> by which filesystems are supposed to be mounted, is sysinit.target?

there is order and there is enablement. basic.target enables var.mount,
but if enabled earlier services might be ordered around var.mount.

>
> > the only option to disable it would be masking var.mount
>
> In this case, people who would mask var.mount would rather need to
> override it to mount an actual device arther than a tmpfs, no?

Depends on what they want to do with it, hope they know.
(there are valid reasons for it)

>
> Also, since mount units must be named after their mount point, users who
> want to mount their own device would have to provide a unit named
> var.mount, so they can't disable it.

yes, or add an override. But are we still here in the
"buildroot should care about that" category?

As you might know, I do that kinda stuff within an initramfs.

>
> Finally, usetrs who have custom dispositions (like an initramfs that
> mounts /var) can just remove the unit with a post-build script.

then why enable it in buildroot in the first place?

>
> > Guess i cant ack it conditionally, so far:
> >
> > Reviewed-by: Norbert Lange <nolange79@gmail.com>
>
> Thanks! I'll add it when I respin with your suggestions.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
