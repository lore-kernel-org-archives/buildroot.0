Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB2CEE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95F581F80;
	Fri, 18 Aug 2023 21:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95F581F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aD_C_9Ka31wC; Fri, 18 Aug 2023 21:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D447381F85;
	Fri, 18 Aug 2023 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D447381F85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF9C1BF2AA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F4A81F85
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F4A81F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXD4-GbxgKRN for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 21:18:55 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C30A81F80
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 21:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C30A81F80
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DB04C200406;
 Fri, 18 Aug 2023 23:18:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Aug 2023 23:18:48 +0200
Date: Fri, 18 Aug 2023 23:18:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230818211848.GB1134940@scaer>
References: <20230818151608.988723-1-bernd@kuhls.net>
 <20230818220314.3178c964@windsurf> <20230818202434.GA1134940@scaer>
 <20230818224429.618b7dd1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818224429.618b7dd1@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692393532;
 bh=DBhqkhEr5Np0cF72+UB0Ufs2uSgCXh1kZBrt8YhGK2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMRAdcEOteuJw327tq88qHvrDfabUMUfkLs0bCRCGIUuiYV4RUnTiY4cnsBWagB04
 8rZFrAWr0HVyYDGjvdK+MaUSOJDX0kkVjJL9yL2/gZAC/xTUwcYtpYWHsrW/r8o82j
 mhdHb/XKJ9N4W39Yh29Wik7ipJ0OonfitU4Fd5YZCQ4p+mlaC95w4X9fJGugnlcvhb
 KhRNa87zzAoSCGprf7gkLVF2qnPZ9dZPSg1JVlVAJLTn9TEMbAV+UBOQiXSxSf0u8y
 9x/9MrCvyQVGP3Pcp5viGBZiT4Gwz/FnwL0LSBftZoItx8k+SxldDFQOtIUuVVGADX
 uhtrH1+h9kzxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YMRAdcEO
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-18 22:44 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 18 Aug 2023 22:24:34 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2023-08-18 22:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> > > On Fri, 18 Aug 2023 17:16:08 +0200
> > > Bernd Kuhls <bernd@kuhls.net> wrote:
> > >   
> > > > This fix can be backported because the offending line was added in 2009.  
> > What is actualy broken?
> > As you noticed, the does has been there for moer than 14 years now, so
> > if something obvious was broken, we'd have notriced by now.
> > So, if this is broken, it is not obvious, and we need to udnerstand how
> > it is broken and why the fix is correct.
> 
> I don't think Bernd claimed anywhere that something is broken.

Right. But if that had just been a typo, then that would have been
invalid Makefile syntax, which it obviously is not, as this code does
not trigger an error from make.

So it is not a typo (so, see below).

> He
> claims there is a typo. I've also seen this double colon several times,
> and it isn't consistent across the other similar make targets, and I
> always wondered if it was needed or not. If it is not needed, we should
> remove it to make this rule consistent with others. If it's needed, it
> should be explained in a comment above it because it's not obvious
> what's going on.

Exactly.

You expressed the same reasoning I was trying to convey, but which I
failed to express properly.

But I agree that either wway, needed or not, the explanations are going
to be... difficult to come up with, too.

As an aside, we use that :: construct in one other place:

    support/kconfig/Makefile.br:42:$(obj)/%:: $(src)/%_shipped 

which is something we inherited from the 2.6.21.5 kernel in
a665ed34960bf1423cba303276161bf44a9851f4... No need to fix that one.

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
