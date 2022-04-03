Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C6BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 23:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4D360BD1;
	Sun,  3 Apr 2022 23:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQX_dUca7qwg; Sun,  3 Apr 2022 23:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6639660B94;
	Sun,  3 Apr 2022 23:13:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9661BF25F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 23:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7218560B94
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 23:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iA_ogwNHRV95 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 23:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C2A160B04
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 23:13:19 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id j83so8480633oih.6
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvQJZjPXZ0H/xX+Kht+HzKI+O4YI9N2eChJcS38uhm4=;
 b=HzilkeDfun8cd+93g9i7BuzX66ZhX6dqSDTJEMTxqZOH8NH5/hP1oRziPZoc+lriMR
 OVsCruVTf8CdLWnJSp6/Evo8tgqZ7G5jpntH4F/uu9fIrVdJiOse4hUhbfuC+EU1Wzow
 KFJCsw/KBHM30n2BYRpDl8/2o27cY+AlfBvbYTBGWdTFNHGEqNw0k3oo1RXHxkMYmimg
 fdVInWLR9fZmOx88plrBidBHaRUy3kQon188ddeATMU9O2PLJYOSXERLjUORC5do1PoX
 k/8O9QF9vhLYpKaSWQRFTBN4OtpsuHOVWkNLOYbEgZ5L/0PvXt8v68lKxyo2Dn71IMQJ
 qIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvQJZjPXZ0H/xX+Kht+HzKI+O4YI9N2eChJcS38uhm4=;
 b=PpMXlzF9eFpfiswGKs4XnY7mj/SyT9ReN738hNuZsttCV40lNgebYovrBIH5mddXtr
 Zq1EwkqFUKRDbw3wldI7kLBin5zq7I32kSRvwTQttILMOwmlHlmbEXGbqPOWt/fMqBxV
 GUQIyqwfGoTghEcRCb2/crAORTH0uB1qEEU0R4rMqpOQYxpJrloP5Pj8+Gq4hYEnLkdR
 jprMRZyB07RLmNPvetC4vM9Rjk2J9izE36CB3yzGCGlg+WA29EESE+S0az6TUS4NFW5N
 HO8mHv9L4w+U6OVQmm8I99LVHrXgw/4+qNYwwB5uiiF9YjXZeD3so/UjkQB2emwTg4Jq
 MmXA==
X-Gm-Message-State: AOAM530qW9CTb4JMKeB1Ep4UTqWTuXUlWhq6Yt1B1qbq8T43oZjj1s0d
 1vZQX3bhQwqBOuY2b9o4NQYQFY1AGVD9aaVzoOU=
X-Google-Smtp-Source: ABdhPJyaL6EFfr7HHkS5m2LBT2I3JnjAU9PFdz7XO9fO+U6/gWWewqXM5cPvjeTWSv/XSAvxLdAtQZcUo0Nt0cL/xsM=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr8378724oic.200.1649027598439; Sun, 03
 Apr 2022 16:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
 <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
 <20220403094236.GF1811301@scaer>
In-Reply-To: <20220403094236.GF1811301@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Apr 2022 17:13:06 -0600
Message-ID: <CADvTj4pxMsrUmzx3VRMXHnJ1sFV-d7=q7sLVvTxvRoRosKEsCg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Laight <David.Laight@aculab.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Apr 3, 2022 at 3:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> All,
>
> On 2022-04-02 19:08 +0200, Arnout Vandecappelle spake thusly:
> > On 01/04/2022 13:34, David Laight wrote:
> > >From: Jason A. Donenfeld
> > >>Sent: 01 April 2022 12:05
> > >>On 4/1/22, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >>>I should add that I do also think this should be upstreamed to busybox,
> > >>>which
> > >>>will also reduce the amount of duplicate work as busybox is commonly used
> > >>>across many distros.
> > >>I'll work on that.
> >  +1 to have it in busybox.
>
> I still fail to understand why this can't be a standalone project.
>
> The reasoning offered by Jason is that the code should be included
> and duplicated into all and each init systems out there.
>
> However, this increases the maintenance burden, as each implementation
> has to be actively tracked (FTR: Jason said he would actively maintain
> the implementation in Buildroot, which is very nice of him, so I
> understand that he would also do so for all other projects where he'd
> have seedrng included).
>
> Instead of having one implementation suitable for every init systems
> that use shell scripts, we'd end up with many different and diverging
> implementations that each have their own warts and fixes (or worse,
> counter-productive fixes that actually decrease the robustness of that
> implementation).
>
> On the other hand, having a common project would alow to centralise the
> fixes. It would also allow to ensure that changes do not actually break
> security. Finally, any evolution, be it fixes or features, would be
> easily available to every init systems using the common project.
>
> Furthermore, the level of customisation is very low. All that we can
> expect to be customisable is the location where the seeds are stored.
> This is already accounted for in the existing seedrng git tree. Using
> another hash implementation could be another thing, but there's not
> much point here, Blake2 being already pretty strong and known. So there
> is probably not much more customisation left to do.
>
> Moving it into busybox might seem a good idea at first, but this would
> still make for an n-th implementation to track, and since busybox has a
> focus on code size, the implementation there would probably diverge
> substantially from the canonical code we saw so far, further increasing
> the maintenance burden.
>
> That would also not address distributions that do not use busybox (and
> do not use systemd either). Buildroot can even be configured in such a
> way, using a sys-v init system with coreutils et al,. and no busybox, in
> which case having seedrng only in busybox would still not solve the
> problem in such a case. And init systems are not limited to what we can
> see publicly; there are maybe hundreds or thousands of such custom init
> systems behind private doors. Buildroot even has an option to configure
> for such an init system (BR2_INIT_NONE, which really means 'custom').

Maybe it should also be upstreamed to util-linux?

>
> On a final note: systemd has native support for this feature, and thus
> one may argue that the feature is indeed already duplicated there.
> However, this is different in two ways: first, systemd needs random
> numbers for itself already, very early in the boot, possibly in an
> initramfs, so it can't easily rely on an external tool to do that;
> second, systemd is already C, so it does not make sense for the feature
> to be implemented as an external tool either.
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
