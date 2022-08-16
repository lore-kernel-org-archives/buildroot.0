Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18CFC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A8681401;
	Tue, 16 Aug 2022 21:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A8681401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tWBERBN_euZ; Tue, 16 Aug 2022 21:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AEF81411;
	Tue, 16 Aug 2022 21:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AEF81411
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7619D1BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59F89408E5
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F89408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzRbTgr180Jl for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:03:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 545224059B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 545224059B
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 21:03:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e933:8a8a:6743:9483])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 22FC9780505;
 Tue, 16 Aug 2022 23:03:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 23:03:34 +0200
Date: Tue, 16 Aug 2022 23:03:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220816210334.GP2854108@scaer>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660683822;
 bh=fGOicHbQtRjWyleWz3KipWwk6O+BaIfVPbbdb7iAIYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TDNn0Qdm2gIvjzoTKoL6eeYf0dU8m/PCwIDP9v5nTCJ6WS/uHZzMP+d/xlcHbmYmR
 cjsqa1aWl3KnllbbdFvLRT9JMq/eHiFNIun0mlSCLNjnBqXvyCdbb9qtrjIbKq0VUL
 km732HhFrskUrP6KERFO5BuSWf+5faM8ZPHNRF+jZgx5wIGhX3YIVOEzZ4kyJEArGb
 I2Nxt1cCPMP0Oeo0kmgXavnrdw0yUgVisZE5npcmHpgAqdieY87rvrTVMu6JZXEsPJ
 FgC+ECptk4Jbqwjtt7hsk1md0vedwTDWhcR8Oe92JY0KozUrXTHwt+7xcvjJwSLzb0
 Yscr1lAnvMp6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TDNn0Qdm
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Buildroot List <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-15 22:29 +0200, Thomas Petazzoni via buildroot spake thusly:
> This is perhaps the most controversial change for Buildroot that can
> be written in a two-liner.
> 
> Historically, we have used uClibc as our default C library, as
> Buildroot was created initially as a test-bed for uClibc, and also
> because uClibc made a lot of sense for embedded Linux systems, due to
> its smaller size and fine-grained configurability.
> 
> Since then, the landscape of embedded Linux systems has changed. Even
> though Buildroot happily supports really low-end devices, the vast
> majority of Buildroot users are quite certainly running the resulting
> system on a reasonably powerful platform, with significant amount of
> RAM and storage. In this context, the benefits of uClibc are no longer
> that much relevant, and glibc causes less "troubles". Therefore, this
> patch proposes to use glibc as our default C library when using the
> internal toolchain backend instead of uClibc.
> 
> Of course, we will keep the support for uClibc, which remains an
> important C library choice, for space-constrained systems, or simply
> for architectures that are not supported by glibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Yes, I will be a bit sad that we demote uClibc-ng, but let's face it:
the word moves on, let's move along.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-buildroot/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 836af3b22a..9956dc4383 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -22,8 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>  
>  choice
>  	prompt "C library"
> -	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> -	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
> +	default BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc-ng"
> -- 
> 2.37.2
> 
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
