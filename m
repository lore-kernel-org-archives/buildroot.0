Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C856C7EE24
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 20:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B402C415C5;
	Mon, 15 May 2023 20:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B402C415C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2M2QZW_0ZXpK; Mon, 15 May 2023 20:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BD9404DD;
	Mon, 15 May 2023 20:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BD9404DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 131111BF59B
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509B084049
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509B084049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvJe964K5s1B for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 20:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249A88404E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 249A88404E
 for <buildroot@buildroot.org>; Mon, 15 May 2023 20:57:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a7a1:441c:4e0f:17e6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 20CEA78050E;
 Mon, 15 May 2023 22:57:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 May 2023 22:57:05 +0200
Date: Mon, 15 May 2023 22:57:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230515205705.GO2582048@scaer>
References: <20230418213241.28635-1-ps.report@gmx.net>
 <20230515195731.GM2582048@scaer> <20230515224952.7b89d204@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515224952.7b89d204@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684184230;
 bh=p3wrGVNLSpCFgoDvNi+I8C8hbvOfFN3bfUSti9LOPwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIFYECGG/3SgfsGkhhaa7w5cJX0MdOBI5O/4lKtg0Wdotai2KybP7+v8WbegXUNtH
 EufBN8azq6cXTnA2zvjwFzIwwLbG/Brp3fgPV/nBsSDKBgj4vQbSMYj9oPItZCggsx
 CvGP4bhEFgJ9vCQyN2Ub00gnOmNjRaXf23MGV8aQOgaIeCYBtD5ZB2u2TkMDXv1Knr
 xDkshTFfSprPUFj4XfD8XvB4dMfXr0PzzUw4ZeyrEqxKZ/frcOGz1dDxCnM6uPsPGD
 zfXT0Zp5NYeO3Z83WPWkxiDKsRy0Ul9E2Pr3flPAgl5iEArbjOI4VlbKxqr4Dt/Pa2
 CiiXS7QO4ts4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GIFYECGG
Subject: Re: [Buildroot] [RFC v1] package/python-babel: add purge locale
 data support
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-15 22:49 +0200, Peter Seiderer spake thusly:
> On Mon, 15 May 2023 21:57:31 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2023-04-18 23:32 +0200, Peter Seiderer spake thusly:
> > > Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
> > > handling in Makefile) to reduce target space allocation by the
> > > python-babel package, e.g. from 32MB to 24K for
> > > target/usr/lib/python3.11/site-packages/babel/locale-data with
> > > BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".
[--SNIP--]
> > > +		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
> > Why do you force keeping the en_US_POSIX locale specifically?
> Because it is the python-babel default, see [1]...

OK, Thanks! Say so explicitly in the commit log when you respin.

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
