Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FABC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 13:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4966405EC;
	Mon,  7 Nov 2022 13:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4966405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsiN-0EsOL_A; Mon,  7 Nov 2022 13:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DABAB4016A;
	Mon,  7 Nov 2022 13:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABAB4016A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C77E1BF29F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 13:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84B6560A68
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 13:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B6560A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSEjW_rTzmHj for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 13:32:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A315D6063B
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A315D6063B
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 13:32:39 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id x15so6815343qtv.9
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 05:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wql2raBj5qK5/kQSOaA8OgB7zPHMULw0lz9FWRBc4VY=;
 b=yWe1pdjfUH4T1DNyzQ9nSgK7xlx+SXWircn/9LkHDa5KQQ/7/iQbohtS8Zb7aqOTmA
 Vcs7FGHlfgC7j/ccOXJQ6GV3YjTK4YsRvfAJzRpE2hTfaDVrT0F1k/dkr6HpEvBuDM6v
 w5k/eQEasP1Bvld6TNSvamvo9KUOPQCO86uU0Bnw1fGFUDcEd91eiJSQ8xH2l35HE5M8
 tD+AOp22QGM1W5ZwQYyYx4Tnm+d5TOTApVBwMGBuyXMjTVPRpzWvSrAZz+12etsKXJ2h
 A31c0OgwmAFTooJxy1XqFNksn5w0el+OxFPfp1RVl7kSeh2Jn4dgZdfbJGDdRd83AF6b
 CbiQ==
X-Gm-Message-State: ANoB5pnmZeSkb/SpCqIJnAc3Q+3j3aRUUhGX/le2Nc0RjqxcGsnoGTnF
 7qXFhos/e1xud0iK964JRVQ/lFz5S/NcsGVYeqA=
X-Google-Smtp-Source: AA0mqf77MNKSkrgRtUkwobHY0OuZVY/xkbIT/q4iHJjNGkWi+cjQaD9O3KTKgxs8+PUafUHnef9pCfQwFlBmxOjymAE=
X-Received: by 2002:a05:622a:147:b0:3a5:8416:6960 with SMTP id
 v7-20020a05622a014700b003a584166960mr5161737qtw.30.1667827958427; Mon, 07 Nov
 2022 05:32:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1666122184.git.yann.morin@orange.com>
 <18712_1666122192_634F01D0_18712_304_1_aadcab6f9e8f71b5581c8a15b2773a431bb29ca0.1666122184.git.yann.morin@orange.com>
 <CADYdroOC6mUR-Hiv8Jqri4-_wO7Grwvgm0C5BjifrtxG6LEb9w@mail.gmail.com>
 <20221106155804.GA3918838@scaer>
In-Reply-To: <20221106155804.GA3918838@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 7 Nov 2022 14:32:27 +0100
Message-ID: <CADYdroNGempUmG14naZDsLC+bmSVHB+NVWDWou8TjB+4yxGoBQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wql2raBj5qK5/kQSOaA8OgB7zPHMULw0lz9FWRBc4VY=;
 b=TfYR0oDVhqvPGXMwML9vq24qGIUIChKyoKKtOEpmHc/MsjhAuR0WK+i63586YyFkAD
 kyEh7P4fW7ojKA5BsRTJgwcHwQq35+ZZOKkjsx/ytM2A1k1EYhYX6EAxtQBmidrXEu0A
 U2Ls4O4iOM0/gKMVTK7lLmnZfMhVe/3cZBqhE76enork7WRgOfCMtQbUxyAErBtbMluz
 PH4C17bdKBTUuPwZJcm2XgPhnlWVd5un86M5PQa++ZpSLRV5qIDLoHfRDPOrlP5P5cwI
 tTWfHpwQLMpMmVs/JTuxDlRsjE6XC9t25Om+4P+mJF3JvsJPS+OrlIms9m8Ys2VQ3QjK
 VNcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TfYR0oDV
Subject: Re: [Buildroot] [PATCH 1/6 v3] package/skeleton-systemd: move /var
 factory tmpfiles out of /etc
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

Am So., 6. Nov. 2022 um 16:58 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2022-11-06 16:40 +0100, Norbert Lange spake thusly:
> > Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
> [--SNIP--]
> > > diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > > index 795a171809..7b66732ef4 100644
> > > --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > > +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > > @@ -29,7 +29,6 @@ else
> > >  # a real (but empty) directory, and the "factory files" will be copied
> > >  # back there by the tmpfiles.d mechanism.
> > >  define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
> > > -       mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
> > >         echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
> > >         echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
> > >  endef
> > > @@ -38,6 +37,7 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
> > >         rm -rf $(TARGET_DIR)/usr/share/factory/var
> > >         mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
> > >         mkdir -p $(TARGET_DIR)/var
> > > +       mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
> > >         for i in $(TARGET_DIR)/usr/share/factory/var/* \
> > >                  $(TARGET_DIR)/usr/share/factory/var/lib/* \
> > >                  $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do \
> > > @@ -51,7 +51,7 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
> > >                         printf "C! %s - - - -\n" "$${j}" \
> > >                         || exit 1; \
> > >                 fi; \
> >
> > From tmpfiles.d docs: "C ... Recursively copy a file or directory, if
> > the destination files or directories do not
> >   exist yet or the destination directory is empty. Note that this
> > command will not descend into subdirectories
> >   if the destination directory already exists and is not empty.
> > Instead, the entire copy operation is skipped."
> >
> > So all the drama could be just replaced with "C! /var - - - -\n" imho.
> >
> > (non standard permissions/owner are probably gone either way)
>
> I do remember that I had to explicitly register individual entries
> rather than the directory alone, as that did not work. That was 5+
> years ago (commit 26085bbbd500), and I did not write it down in the
> commit log...
>
> However, it looks like we hit this issue, as hinted in commit
> 7e811708f31c (package/skeleton-init-systemd: work around for /var/lib
> not populating), which states:
>
>     It turns out /var/lib will exist, because some part of systemd creates
>     /var/lib/systemd/catalog on boot before tmpfiles runs.
>
> So, we do have a chicken-n-eggs issue, that registering /var as a whole
> does not work.

I guess thats the logging service, systemd-tmpfiles-setup.service already
requires some stuff running and other stuff is able to run and freely access
/var aswell.

The clean way would be to be done with "migrating" /var before local-fs.target
is reached.

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
