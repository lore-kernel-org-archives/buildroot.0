Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D45334013E;
	Sun,  6 Nov 2022 15:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D45334013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTstmvTICyDT; Sun,  6 Nov 2022 15:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B63400E7;
	Sun,  6 Nov 2022 15:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B63400E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C4D1BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBC5400E7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBBC5400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A299Nwc8gt3M for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF4B4400B8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF4B4400B8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:58:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2F1745FF9D;
 Sun,  6 Nov 2022 16:58:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 16:58:04 +0100
Date: Sun, 6 Nov 2022 16:58:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20221106155804.GA3918838@scaer>
References: <cover.1666122184.git.yann.morin@orange.com>
 <18712_1666122192_634F01D0_18712_304_1_aadcab6f9e8f71b5581c8a15b2773a431bb29ca0.1666122184.git.yann.morin@orange.com>
 <CADYdroOC6mUR-Hiv8Jqri4-_wO7Grwvgm0C5BjifrtxG6LEb9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroOC6mUR-Hiv8Jqri4-_wO7Grwvgm0C5BjifrtxG6LEb9w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667750290;
 bh=CBYObwLyENppaL7/ChMykmRqVJceOJJBcHqcS73nuT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMO2mHIDwxDuKBvkq4KBugkxBTeHQ9EvySYVUJiSIe3P6f6EFCyqSV4eZX6Hkchfd
 o4hWMVebMtDHp7T0RR5GF+VT7ugzM85CcHR/Um5XQaShYeA9cc6u2EMaMk4d5KTgXz
 NJt+AyKcuHjNH1a162I84/zC0ZKIrqHHgwWQN4rwIbOF6PWALcukZLRPb+MTdlcBbE
 yF8Mmeif7U2sWRwd65qPG+vkz4bqwiWNEmjuox9e89aZUkYUdDZSP3IUSdjAPjAZK8
 fHj1Dl7Z08vFIXubAL4Knj0GmXwalsLHTfX8fLijtm1W1IRMI7nbXpStj1kBWX3xHk
 dFMdD4/qECckA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rMO2mHID
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
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-11-06 16:40 +0100, Norbert Lange spake thusly:
> Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
[--SNIP--]
> > diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > index 795a171809..7b66732ef4 100644
> > --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > @@ -29,7 +29,6 @@ else
> >  # a real (but empty) directory, and the "factory files" will be copied
> >  # back there by the tmpfiles.d mechanism.
> >  define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
> > -       mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
> >         echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
> >         echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
> >  endef
> > @@ -38,6 +37,7 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
> >         rm -rf $(TARGET_DIR)/usr/share/factory/var
> >         mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
> >         mkdir -p $(TARGET_DIR)/var
> > +       mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
> >         for i in $(TARGET_DIR)/usr/share/factory/var/* \
> >                  $(TARGET_DIR)/usr/share/factory/var/lib/* \
> >                  $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do \
> > @@ -51,7 +51,7 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
> >                         printf "C! %s - - - -\n" "$${j}" \
> >                         || exit 1; \
> >                 fi; \
> 
> From tmpfiles.d docs: "C ... Recursively copy a file or directory, if
> the destination files or directories do not
>   exist yet or the destination directory is empty. Note that this
> command will not descend into subdirectories
>   if the destination directory already exists and is not empty.
> Instead, the entire copy operation is skipped."
> 
> So all the drama could be just replaced with "C! /var - - - -\n" imho.
> 
> (non standard permissions/owner are probably gone either way)

I do remember that I had to explicitly register individual entries
rather than the directory alone, as that did not work. That was 5+
years ago (commit 26085bbbd500), and I did not write it down in the
commit log...

However, it looks like we hit this issue, as hinted in commit
7e811708f31c (package/skeleton-init-systemd: work around for /var/lib
not populating), which states:

    It turns out /var/lib will exist, because some part of systemd creates
    /var/lib/systemd/catalog on boot before tmpfiles runs.

So, we do have a chicken-n-eggs issue, that registering /var as a whole
does not work.

I'll try to investigate further, and see if that's still the case.

> > -       done >$(TARGET_DIR)/etc/tmpfiles.d/var-factory.conf
> > +       done >$(TARGET_DIR)/usr/lib/tmpfiles.d/buildroot-factory.conf
> 
> How about naming this something like 00-buildroot-var.conf, so hopefully any
> *.conf that might expect something in /var existing is executed later.

I am totally OK for 00-buildroot-var.conf.

[--SNIP--]
> Regardless, the changes are an improvement, buildroot is the "distro"
> and its special sauce
> should reside inside /usr as much as possible.

Yes, that was my reasoning as well.

> Id highly recommend atleast changing the name to
> 00-buildroot-var.conf, other than that:

Agreed.

> Acked-by: Norbert Lange <nolange79@gmail.com>

Thanks!

Regards,
Yann E. MORIN.

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
