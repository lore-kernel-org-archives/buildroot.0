Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F540C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1728600B6;
	Mon,  1 Jan 2024 20:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1728600B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zri3zcNNSJ7h; Mon,  1 Jan 2024 20:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20B0606FF;
	Mon,  1 Jan 2024 20:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F20B0606FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCD01BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 746104011D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 746104011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15S-JKMukJGl for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:18:35 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F01040104
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F01040104
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CD586B00535;
 Mon,  1 Jan 2024 21:18:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jan 2024 21:18:26 +0100
Date: Mon, 1 Jan 2024 21:18:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Message-ID: <ZZMeEjKs7cVLRZwb@landeda>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-5-wbx@openadk.org>
 <ZZHOxLRXJ9U8apJA@landeda> <ZZHjRSzIb7WUnhUo@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZHjRSzIb7WUnhUo@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704140313;
 bh=nCIP36dtcLtZeuicVz+VyUNg4sU/Tu4bPC01cs0ABYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uimH6wO3jtoefvMOaeYjJzisSFmL5bJ0DSJo73yvSXJITD6EZzwn5VDDVIfUpqxZx
 ZeteAggAldbcvFmkU4TnqvGmrfy08OOImcS/j8mk1SFE/DsuwJbSKg9xDDD/hXvDC7
 bZv2wTeAvVujCDCbDAdlq6/Z1xvxckRmGb/NVlnUR76pZ8UiMBR+oeQc2ZoUacynFw
 dM5pX3KGK2PUt5LREZM+OabhPK2efZSwEGfmmSvL/I6MyADyeRtNL8I1se3chWnDsA
 MjMYMq5hBc2denOCZCO8i6zj5atl8OL6GCjgY4LmgtqQcfPaX40fOCepV4tgT+xSsi
 2wIxDTilNhhvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uimH6wO3
Subject: Re: [Buildroot] [PATCH 4/6] configs/qemu: add qemu_arc_defconfig
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
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2023-12-31 22:55 +0100, Waldemar Brodkorb spake thusly:
> Yann E. MORIN wrote,
> > On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> > > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[--SNIP--]
> > > +You need Qemu fork from here:
> > > +https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
> > So, we are dropping all the arc specific versions for the toolchain
> > components, but we eventually introduce a defconfig that relies on an
> > arc specific version of qemu, that we do not even package in Buildroot,
> > so that users can't even enable host-qemu in Buildroot.
> > That is a bit sad...
> > What is the rationale for introducing this defconfig, then?
> Qemu is more widely known then the nsimdrv.

OK, fair enough.

Still, Qemu with ARC support is not sidely available (e.h .it's not ins
distros), and we do not have a way to easily build it from source,
leaving to the user the duty to find how to do get such a Qemu.

And since you point to the source tree (which is nice), it implies one
has to build from source on their own, which we know is a bit tedious...

> And I think when ARCv3
> support is added to Buildroot

*When* is the key word here. I know Alexey has said he was looking into
it, but IIRC the topic has been pending since last August, so I would
like to decorelate the two topics.

> it can be used to test it, too.

That does not change the fact that it is a forked version, not readily
available, that we do not build in Buildroot, and that the user has to
manually build from source on their own, which is still problematic.

> I thought it would be nice to have instead of only rely on the nsim
> defconfig we have now.

That I agree on, but I don;t think it is a good-enough reason to be
using a non-upstream Qemu.

> Can we keep it? What others say?

"Mom, dad, it's a cute doggy/kitten/duck/poney/hedghog! Can we keep it?"

Let's see what other maintainers think, of course.

And in any case, that does not diminish the fact that the commit log
should contain a proper rationale.

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
