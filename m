Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4EDC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070DF417B9;
	Mon, 17 Oct 2022 18:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070DF417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AW0KNqxP2Enc; Mon, 17 Oct 2022 18:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B104340214;
	Mon, 17 Oct 2022 18:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B104340214
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20A8E1BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 097F240142
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097F240142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfrwH7O5wsqd for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FCC400F6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0FCC400F6
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:45:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:388f:ffd7:682:9f45])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4B710B00571;
 Mon, 17 Oct 2022 20:44:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 20:44:42 +0200
Date: Mon, 17 Oct 2022 20:44:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20221017184442.GD3666@scaer>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
 <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666032298;
 bh=yMnbj19xX3rSr2a+NrIcLY+yLecaZHj1nXo93Rq+BCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9i46n/bHy67uyLpCeX/MBhewSNa77qSg2/Cyv2H5KclYoyjp2taTaTKe1TE8+xrq
 sIolB2iNQ4keajlXC2y9nptUl6XBzDD6W+AUTfkqM/e7yA9mBT4hDAV4H4lMPerKwj
 kN2dHKTRwFK4gkJxWhFfQIvqf2/hFnRXTyBJ+AlN+me7lfpM3pZGNsebyCM6ZJWnwe
 CcLgcSIJjZ6zW+MnhDSgcGGN7IxM5HYfh7RU4/+sophFSFDxxFF8Tkkgeyo4sbz12D
 S5sL84RVA15d3v2P727i9a6qGlWF6s9HVGOzczbZ3mIP+df3RHc7F2hrcmGYcPaTBg
 kklseD8K+EP8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t9i46n/b
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-10-17 11:10 -0700, Christian Stewart spake thusly:
> On Mon, Oct 17, 2022 at 10:55 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-10-17 09:06 -0700, Christian Stewart spake thusly:
> > > On Mon, Oct 17, 2022, 7:29 AM Thomas Perale < [1]thomas.perale@essensium.com> wrote:
> > >   This virtual package implement the already existing go compiler compiled
> > >   from source and shows it on the host package menu.
> > >   The usage of a virtual package on top of the go compiler enable the
> > >   supports of for multiple providers for the Go compiler.
> > > Is it not possible to continue using the existing host-go target and
> > > simply add a parameter which enables downloading the precompiled
> > > version instead?
> > > Rather than add a new package.
> > In fact, we want to have a similar implementation for rust, go, nodejs,
> > so (without looking at the details of this series), I guess Thomas
> > Perale took the same approach as the existing rust situation, like
> > Thomas Petazzoni did in the recent host-nodejs series:
> >
> >     https://patchwork.ozlabs.org/project/buildroot/list/?series=319967
> 
> Thomas changed host-nodejs to be a metapackage:
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20220925204030.1661583-3-thomas.petazzoni@bootlin.com/

That patch does:
  - move the current host-nodejs package to host-nodejs-src as a
    host-generic-pacakge,
  - changes the existing host-nodejs from a host-generic-package to a
    host-virtual-package

(there is no such notion as a meta-package in Buildroot)

> This is not what this series does, which is to add a new host-goc
> package and refactor all Go packages to point to this new one.

I had a quick look, and it is indeed not what I expected it to be.

> Sidenote: having a rust-bin and nodejs-bin makes sense, as those take
> a /very long/ time to compile. Having a go-bin on the other hand does
> not make as much sense, because compiling the Go compiler is fast
> (about 1 minute vs. Rust's 1 hour).

It takes a bit longer here, as host-go-bootstrap depends on the
toolchain. So, running "make foo-legal-info" to check a go package,
does take ages.

> In my opinion:
>  - Do not add a new host-goc package.
>  - Add parameter to host-go to select which compiler to use:
>    - bin
>    - src

I am not sure I follow what you are saying. If you are sayng that it
should be as rust currently is, and as the nodejs proposal is, then
I agree. ;-)

>    - host go compiler (see patch linked below)

If we have a pre-built host-go in the tree, thetre is then no reason to
be able to use the host system go compiler, is there?

>  - If src is buildable: default to it
>  - If src is not buildable: default to host Go compiler
>  - Or if the parameter is set: use bin download
> 
> This patch already solves the issue of selecting when to use the host
> go compiler or not:
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/
> 
> ... it would be straightforward to add the Config parameter + binary
> download to host-go after applying that commit.
> 
> My reasoning for why:
> 
>  - Avoid refactoring all Go packages across the tree.

Agreed. This should be transparent to packages.

>  - Avoid confusing "goc" name (not used in Go ecosystem)

Agreed.

>  - Backwards compatible with existing configs.

If that is possible, then agreed; if it is not, then use sensible
defaults (like build from source by default).

>  - Fewer packages to maintain,

Not too much of a headache...

>   easier to understand structure.

I am afraid I have to agree on that part, as the existing host-rust
strucutre bit me not too long ago...

> I'll have a look at submitting a RFC series adjusting this one to the
> above structure.

I would emphasize that we do want to have an similar implementation for
go that we have for rust, and as was proposed for node.

Regards,
Yann E. MORIN.

> Thanks,
> Christian Stewart

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
