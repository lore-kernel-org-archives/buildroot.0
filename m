Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A35C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCAFF84069;
	Thu,  5 May 2022 19:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZFftVywWiax; Thu,  5 May 2022 19:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC44783323;
	Thu,  5 May 2022 19:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 180081BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2B2E4049E
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWIF-HuC0oqm for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 19:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A78AA4011F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 19:55:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84ac:7ff9:ae63:5126])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4CC6C7802B2;
 Thu,  5 May 2022 21:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651780537;
 bh=l3z+hxrfhoTnWCosfU5DnOKaLdjOMlWsgzLjAR7EtdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VOnKkdnyuWvxUwNOqGDMEoF83/AaDU/7kMAJP+nuLWHFz1bOtvvmu26e0KNZpMgln
 khpbFk+ErpZ0hbzpgcef9hkRqp2urSEOsHbZkqEQxpJO9xQX21/VnC8Bh/F8UsunBm
 vKSjbmomLcBtQqYLh7QnF59bg1gqAlTX57qZMEszuIJTFtDSGLDT5wxXRYnL70DTdu
 1tZ1O84GEKNvjDalFW9dkc2JWHNUrG/+82bMiQMWzeZACiwF21DHUU0GN2chIifT3S
 QEFMl3urBkLQuDGrm7qk07+/Xdp9bODznJZWgLr96Wxya1PloLlO7mJ5dNtFWAnvFB
 nIyRIQDufnBGw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 May 2022 21:55:31 +0200
Date: Thu, 5 May 2022 21:55:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220505195531.GA2547@scaer>
References: <20220505100956.155737-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505100956.155737-1-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gcc: Disable uclibc for powerpc64
 and powerpc64le
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-05-05 19:39 +0930, Joel Stanley spake thusly:
> uClibc-ng does not (and has never) supported the 64 bit powerpc
> architecture.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> I'm a bit confused as to why uclibc was ever an option. Perhaps I missed
> something! I did a search of the mailing list archive and the best I
> found was this post from Thomas:
> 
>  https://lore.kernel.org/buildroot/20160817193721.0cc1466d@free-electrons.com/
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/gcc/Config.in.host | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index a1fe192d3a24..3364860ec7a4 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))

This is not the proper place to put this limitation. Instead, it should
be added to toolchain/toolchain-buildroot/Config.in so that uClibc is
not ever selectable for powerpc64.

Except this is already the case:

   28 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
   29     bool "uClibc-ng"
   30     depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
   31            BR2_arm     || BR2_armeb    || \
   32            BR2_i386    || BR2_m68k   || BR2_microblaze || \
   33            BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
   34            BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
   35            BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
   36            BR2_x86_64

And indeed, when I enable either BR2_powerpc64 or BR2_powerpc64le, then
uclibc-ng is not selectable in the C library choice...

So now I am confused. Could you explain why you had to hide away the gcc
versions when uclibc-ng is selected? And how you even managed to select
uClibc-ng with powerpc64 to begine with? Can you share a defconfig that
exhibits the issue?

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  
>  config BR2_GCC_VERSION_10_X
> @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  config BR2_GCC_VERSION_11_X
> @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
>  	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
>  	depends on !BR2_sparc
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  
>  endchoice
> -- 
> 2.35.1
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
