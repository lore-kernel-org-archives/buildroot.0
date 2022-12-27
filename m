Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF86C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58BAB40386;
	Tue, 27 Dec 2022 20:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BAB40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRBsu64VmMDD; Tue, 27 Dec 2022 20:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C55840260;
	Tue, 27 Dec 2022 20:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C55840260
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD641BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054D740331
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054D740331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuvX3O95C1w5 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:55:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6C54031F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B6C54031F
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:55:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.54])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0757B2003EF;
 Tue, 27 Dec 2022 21:55:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Dec 2022 21:55:26 +0100
Date: Tue, 27 Dec 2022 21:55:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221227205526.GB2498764@scaer>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
 <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
 <20221227214538.56ca7609@windsurf> <20221227205330.GA2498764@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227205330.GA2498764@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672174529;
 bh=VNSSzKoftbFQa2uk681gMkgNysHehxYfhIJJerq2acw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFgEgbJgLWTthM/jxnby4B7pNvyiYGEVbO0acPlwsTWxHabql3lHQgDXRai4FXIwE
 wPELLrQPFZNMttLCgIkUedJDqB97yThMuc/B6M6YwGhifemOrhuTPhhVrgYnFlxc82
 1GrTQhTqCGK7re++All9IEsZ411HXZjQ/BP++BPQQgRkghGIItzrZpW4UtqFi1hRRK
 tqlePX7JKQRlzFdOhfCa1GKIn1b0XtcWYCpKcm/mMYMMGBvBhMc4uSRdHXX07pTZoq
 a2kJrnALs2SrBQSgpvOe55h3jsv0sSK6TuvszsOhY3aNGkOsFeBI25Hk76+FLniCpe
 JCiiX62hPDgzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VFgEgbJg
Subject: Re: [Buildroot] [PATCH 2/3] support/tests: allow top-level parallel
 builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-12-27 21:53 +0100, Yann E. MORIN spake thusly:
> On 2022-12-27 21:45 +0100, Thomas Petazzoni via buildroot spake thusly:
> > On Sat, 24 Dec 2022 10:18:12 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Running tests with top-level parallel builds can speed up running some
> > > tests, expecially those that have a lot of packages like the systemd
> > > init tests.
> > > 
> > > Trigger TLPB when the configuration enables per-package directories.
> > > 
> > > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > 
> > I certainly support the idea of running some tests with TLPB. However,
> > this implementation makes a confusion between two different settings:
> > 
> > - The existing BRConfigTest.jlevel, which is set by run-tests -j, and
> >   used to define BR2_JLEVEL in the Buildroot configuration of each test
> >   case. This determines the number of parallel jobs used to build each
> >   independent package.
> > 
> > - Your new work, which uses "make -j" to do TLPB... but relies on the
> >   same above value, even though it's a completely different setting.
> > 
> > Is this expected?
> 
> Yes, this is the intended behaviour, which I was explicitly seeking.
> 
> So, if one runs with PPD and TLPB (outside the run-time infra), one
> would do something like:
> 
>     $ make -jN
> 
> This spawns a top-level make process that is parallel. In turn, in
> rules, when we call $(MAKE), this is the magic that tells make that
> it is recursive, but that it should use the jobserver from the calling
> process.
> 
> So, in this case, the BR2_JLEVEL is unused by whatever uses the make
> jobserver; only the number of jobs in the top-level jobserver is
> meaningful, i.e. whatever we pass as -jN.

Slight correction: BR2_JLEVEL does have an actual effect, but only if its
value is lower than the one we pass as -jN.

So, in practice, we want to have BR2_JLEVEL equal to the top-level -jN.

Regards,
Yann E. MORIN.

> The exception, of course, is whatever uses BR2_JLEVEL but does not talk
> to the jobserver, but this is mostly a few packages (scons, waf et al.).
> Even ninja packages do talk to the top-level jobserver, now that we use
> the ninja fork that knows to talk to it.
> 
> So, yes, using top-level -jN with the same value as BR2_JLEVEL is
> exactly what I intended to do.
> 
> Unless I totally missed something...
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
