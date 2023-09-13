Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064CEEDEC4D
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 13:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A8182335;
	Wed, 13 Sep 2023 13:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A8182335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhB3AHpAJH7Y; Wed, 13 Sep 2023 13:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EDD82331;
	Wed, 13 Sep 2023 13:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EDD82331
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBE951BF5F8
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C284482331
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C284482331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R06ff-0qd4Fp for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 13:30:25 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69A5A82330
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 13:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A5A82330
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:169:c1d8:428a:7cc3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 336A778051F;
 Wed, 13 Sep 2023 15:30:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 15:30:16 +0200
Date: Wed, 13 Sep 2023 15:30:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230913133016.GD2693@scaer>
References: <CAEVrM6T=5vb98vVUr4AxNWf7xV6VSLyuNME1HpxW=KVJR1vvQw@mail.gmail.com>
 <CAEVrM6QhnK8kbQDtjzx8_rNLTq4s96EK=vUQz-vf1QVZUpt64g@mail.gmail.com>
 <20230913114508.70a1ea44@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913114508.70a1ea44@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694611822;
 bh=+b7vQsGs2r3cfgJy5/U9b2tK4/yb771SutKIo2ZhVb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRJHo5NzoM4ygOxjmtUbIkZ7FIgCrHV9nWxFYPqFZlCy4RmllrfVIdL/vnjyHCSjF
 tyZPvwcTgadBnWMuPFNjZ/twzUCM4jWCPHCR7dW4mXg1bEuwyq5gRLVXqixaIEe6+q
 xOyAnkTdi3uLs7x4qdtbQJypNhfRRcDg7if6vJefeNx5/bxeLnmqA47HeiYaFN4iuF
 zUbwZzdpLI8Xk+r0c3r2eTqbQRhab+Ak77T7xecbfIasmrWswLFKdA2eRlw8ZDBnb2
 2rMw43W8dmdEsJofP1G4CYPvHYLq3xN+LdNeHODii8ORMFHsumbm83KGPKUUWYiawA
 D5/4J6j4UKX2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GRJHo5Nz
Subject: Re: [Buildroot] Fwd: [PATCH] fs/user-initrd: add new method for
 building customizable INITRD
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
Cc: buildroot@buildroot.org, Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, Wit <linuxcdeveloper@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Witold, All,

+Adam +Thierry for dracut

On 2023-09-13 11:45 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 13 Sep 2023 06:41:48 +0200
> Wit <linuxcdeveloper@gmail.com> wrote:
> > As for now user has not much influence on creation of contents of an
> > INITRD image I've made some proof of concept of some wider idea of
> > creating customizable INITRD image.
> > This patch adds possibility of creating customizable INITRD image by
> > selecting some of packages to install. At the moment it supports only
> > glibc builds but I planned to add support for musl and uClibc as well.
> > I've got also some other plans regarding this patch.
> > This patch adds new submenu in "Filesystem images" main menu.
> > 
> > I'm sending this patch for evaluation. If the idea of this patch is ok
> > for you I could take care of developing it.
> > 
> > Signed-off-by: Witold Kowolik <linuxcdeveloper@gmail.com>
> 
> Thanks for your proposal. A couple of comments:
> 
> (1) Your patch is line-wrapped, so difficult to review. Could you use
>     git send-email to send your patches?

While at the formatting:
  - commit author (i.e. email sender) must match the SoB line
  - commit title should be:  fs/user-initrd: new filesystem   (but see
    below)
  - commit log should motivat the patch, and provide explanations on how
    the patch is "designed" (don't describe, but expalain); also, no
    personal message (no "I am ..." "I do..." etc...)

> (2) Have you looked at Dracut and its integration in Buildroot? Because
>     to me it does pretty much the same as what you're doing. We know
>     Dracut's integration in Buildroot has some shortcomings, but I'd
>     rather see them being resolved rather than introduce another new
>     mechanism.

Exactly. We have an implementation of dracut, even if rickety, so I too
believe that, if anything, that should be fixed where it is broken,
rather than add a new tool with only a (very limited) subset of the
features that dracut already provides.

> (3) I see you're using a Perl script. We generally try to have most of
>     the Buildroot plumbing implemented either in shell or in Python.
>     However, it's true that having a Python interpreter on the host is
>     no longer required, while having a Perl interpreter is (which would
>     go in favor of keeping a Perl script).

We do require perl because some packages need perl as part of their
buildsystem:
  - libxml-parser-perl, intltool (496078a0a053 dependencies: add perl as
    a mandatory dependency)
  - the linux kernel

In Buildroot, nothing requires perl: we have no tooling written in perl,
and I would prefer that stays that way. We however have a lot of python
tooling, so if at all, I'd rather we add python as a requirement (or at
least tht we check for it and disable whatever needs it, or that it
depends on host-python3).

So, let's try and keep perl out of Buildroot, and keep writing python
scripts. At the worst, shell scripts, but not perl.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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
