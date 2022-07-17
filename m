Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C277C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 06:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FD884636;
	Sun, 17 Jul 2022 06:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FD884636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg6UjT_S7Id2; Sun, 17 Jul 2022 06:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9689884618;
	Sun, 17 Jul 2022 06:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9689884618
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEC891BF2A6
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 06:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 874C984618
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 06:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874C984618
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48GSGmlH59yo for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 06:56:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF198415A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EF198415A
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 06:56:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 421B3780510;
 Sun, 17 Jul 2022 08:56:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 08:56:15 +0200
Date: Sun, 17 Jul 2022 08:56:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220717065615.GT2543@scaer>
References: <cover.1658007000.git.yann.morin.1998@free.fr>
 <e2f23070c85c1d2fcf5ad74c88eae23723d18916.1658007000.git.yann.morin.1998@free.fr>
 <87a698fmnf.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a698fmnf.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658040979;
 bh=KBuE4HjtgNqU44OvsGZLuE7+7E/6gxvw5PV0jNsQniI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3cv3rT62KDdnTBxWCrB9lJjth9Lplegw2zCEH+7MOxtnk+sgiWbF/iMrjDwrs/LP
 Ae32yit5NTUTez+8765TEv7ihg4J+O31ka49SQldRsGVahGnfrwnf7WFpRItq8XzL7
 GaH5mjD66wk23BdKtQLw5m74hYQDg/M3mI3Ol0IzUDvyd1nG+j23JkYDio8z+ULOFC
 Fut7SUruSk4jJSRmQGrELu75VRrwjJb3vHLSeay5KuQxczNB5LPn2/jN9GHkngzaDJ
 vjhXNhmeT3pbSOQHOay22VoGbg9Lj0USR/4iH+LJJ+KhbPU73NbqGBRqx0vh53/UhP
 GC1nHRuPwYLVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b3cv3rT6
Subject: Re: [Buildroot] [PATCH 1/2] package/rustc: fix target names for
 i586 and i686
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2022-07-17 06:21 +0300, Baruch Siach via buildroot spake thusly:
> On Sat, Jul 16 2022, Yann E. MORIN wrote:
> > Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
> > platforms) misspelled the config options for i586 and i686.
> >
> > They are BR2_i386_i586 and BR2_i386_i686, not BR2_i586 or BR2_i686.
> 
> You mean BR2_x86_i586 and BR2_x86_i686, right? Because that's what the
> patch does.

Aha, good catch, thanks! :-)

"Why would I copy-paste the options names, they are simple enough, it's
gonna be faster to type them..." did I think while fixing typoes in
simple variable names. Doh...

So, I double-checked, and the options really arenamed BR2_x86_i586 and
BR2_x86_i686. And this time, I did copy-pate them:-)

Regards,
Yann E. MORIN.

> baruch
> 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/rustc/Config.in.host | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> > index 27c3a3cdeb..fec8726aee 100644
> > --- a/package/rustc/Config.in.host
> > +++ b/package/rustc/Config.in.host
> > @@ -25,7 +25,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
> >  	# aarch64-unknown-linux-gnu
> >  	default y if BR2_aarch64 && BR2_TOOLCHAIN_USES_GLIBC
> >  	# i686-unknown-linux-gnu
> > -	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
> > +	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
> >  	# x86_64-unknown-linux-gnu
> >  	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_GLIBC
> >  
> > @@ -93,11 +93,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> >  	# userspace
> >  	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
> >  	# i586-unknown-linux-gnu
> > -	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
> > +	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_GLIBC
> >  	# i586-unknown-linux-musl
> > -	default y if BR2_i586 && BR2_TOOLCHAIN_USES_MUSL
> > +	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
> >  	# i686-unknown-linux-musl
> > -	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
> > +	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
> >  	# mips-unknown-linux-musl
> >  	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
> >  	# mips64-unknown-linux-muslabi64
> 
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
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
