Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA93C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 15:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C9D83F17;
	Fri,  5 Aug 2022 15:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C9D83F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSUp7hX4UMgw; Fri,  5 Aug 2022 15:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F7AB83F15;
	Fri,  5 Aug 2022 15:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F7AB83F15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A02D1BF867
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9AE041CB6
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9AE041CB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXZWAFHznE_X for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 15:46:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84125409F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84125409F8
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 15:46:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8565B19F749;
 Fri,  5 Aug 2022 17:46:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 17:46:38 +0200
Date: Fri, 5 Aug 2022 17:46:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220805154638.GA3621445@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-2-joel@jms.id.au>
 <20220729211755.GE1554632@scaer> <20220803232221.691911fe@windsurf>
 <CACPK8Xf9E5L6iUqdPwiHzkWYTdnB2DWSzRuFTQyBwAyWAXyuAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xf9E5L6iUqdPwiHzkWYTdnB2DWSzRuFTQyBwAyWAXyuAA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659714406;
 bh=HxiR9g2PhrnOQ9JS9zOSmvzaLZTKyqDo0kE+NxawHPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jts5M3hfPnbwnPiAzEjUD8CwRupZIXaULbXRTLjNsScNrWG4D//RjKTYD5AoHoFeF
 6iEZcdyr4KfX2xzSw9vZr+ULmE8+7/LMZg4KVdIhnBIvjO1fz0uGo5S4fV1MV1bpaw
 rE9WuLaOGH+TuX5EmagwXJU8BArtFCOZwZrog1kgfggNoZDtyhd5dagNsBiFJFtxjG
 ckeJzuIl/KpX7U8m5JOraVofnswlwxHYp/5xoqdn4B56xzBzJEZyaC9wGgLYzQXTEc
 2UOfvYWmJWuKFUUWprQGaISlobRzCFAqsOdjwz+tu8yk+OKpl3egn7Hsp11eVufgWM
 jksU6Yntp6lcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jts5M3hf
Subject: Re: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU
 type
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-08-05 06:05 +0000, Joel Stanley spake thusly:
> On Wed, 3 Aug 2022 at 21:22, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Fri, 29 Jul 2022 23:17:55 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > So we should just drop the choice altogether, and use the SPE ABI when
> > > the CPu has SPE.
[--SNIP--]
> > and SPE is no longer supported by upstream GCC. For now, we have kept
> > GCC 8.x around just to support this SPE ABI, but it is clearly not a
> > future proof solution.
> > Can we drop support for SPE entirely?
> I vote for dropping support. Given the lack of GCC support it's only a
> matter of time before our hand would be forced.

That's totally fine by me, too, with a commit log that summarises this
discussion of course! ;-)

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
