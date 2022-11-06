Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21F3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6776060A;
	Sun,  6 Nov 2022 16:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6776060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgaJ-FYRPYAU; Sun,  6 Nov 2022 16:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 647AA60888;
	Sun,  6 Nov 2022 16:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 647AA60888
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B69481BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910FD400E7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910FD400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-lIAOFDPOgA for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:49:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCDC8400B8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCDC8400B8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:49:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5d5:e5fb:6135:6c0c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 47682B0051B;
 Sun,  6 Nov 2022 17:49:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 17:49:41 +0100
Date: Sun, 6 Nov 2022 17:49:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20221106164940.GC3918838@scaer>
References: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
 <CADYdroO7gJybDDV+oBqwOEHyHptKcdqnetBKTQ-tVHQkHUAUuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroO7gJybDDV+oBqwOEHyHptKcdqnetBKTQ-tVHQkHUAUuQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667753387;
 bh=LzHWbRzV1FedHzcBT16iXPVF5aEX9ml7VxLRAjOgFQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGaTTNil0GvMqX2hoxCwmAgJFOOZNZ7gMAywijUtATKdboKsdcl1grHje9cwHMsjH
 jtd0gRH4cCEkLIux/pJXLmRlXGMB2AnTbrT08UhUX3s1R5oJCEa5PAUyzF+i8OoDAm
 oWtiMzDIkXcb2nQ4zstpPQHErrWTnJsHGq16O4te/0AZ8/KNdOv5XRup+CwZI2S29d
 8cLD4SnXPioF+8VFE5ISqQjbRaDt6mg1umwD6ZNfZIUNQ+eE4Kh8NfYYcG/3m3dnLO
 5U9j1lpvttjiBdeh6swxhnRUOx/zj+V6r1/xnRUjwPxW0Vw0XDY6KwQCN50gqy0KN/
 oXZHmBsMCeolg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGaTTNil
Subject: Re: [Buildroot] [PATCH 0/6 v3] systemd: sort out the conflict
 between var factory and tmpfiles
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
Cc: =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, yann.morin@orange.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-11-06 17:21 +0100, Norbert Lange spake thusly:
> Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
[--SNIP--]
> > ----------------------------------------------------------------
> > Yann E. MORIN (6):
> >       package/skeleton-systemd: move /var factory tmpfiles out of /etc
> >       package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
> >       package/skeleton-systemd: host the tmpfiles preparation script
> >       system: add options for /var factory and tmpfiles pre-seed
> >       system: introduce a choice for /var management
> >       system: add option to use an overlayfs on /var on a r/o root w/ systemd
> 
> you did not cc me for
> [PATCH 5/6 v3] system: introduce a choice for /var management

Woops, that is definitely an oversight, as I did plan on having you in
cc of all changes for you to review. Sorry for the mishap.

> I would choose the world NONE instead of CUSTOM,
> as that is what buildroot does with /var.

I am not too strongly set on using CUSTOM, so NONE is OKish...

> Later we could offer CUSTOM by for ex. only providing a var.mount
> file, that expects a user-specific mount or similar.

I am not sure I can see how that would work...

Were you thinking of something like:

    [Mount]
    EnvironmentFile=-/etc/default/fs.var
    Where=/var
    What=$VAR_DEVICE
    Type=$VAR_TYPE
    Options=$VAR_OPTIONS

But then, would it not be easier to just provide a drop-in to override
those? What would be the advantage for us to provide a template to begin
with, leaving users to provide thei full var.mount?

And that also leaves the question of how that /var would get populated.

> +config BR2_INIT_SYSTEMD_VAR_NONE
> + bool "do nothing"
> + help
> +  Choose this if you have custom dispositions (like a
> +  post-build, fakeroot script, systemd units, or initramfs)
> +  that prepare /var to be writable on a read-only rootfs.

Actually, "do nothing" is a bit misleading, as users with custom setups
actualyl *do* something, it's just something else that is not listed in
the prompt.

But you are right, that the choice for the init system has a "None"
entry with a _NONE suffixed option, so for consistency, that is probably
good to use _NONE here too.

> but take my
> 
> Acked-by: Norbert Lange <nolange79@gmail.com>

Great! :-)

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
