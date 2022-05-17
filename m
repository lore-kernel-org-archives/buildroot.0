Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F35C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CD34092B;
	Tue, 17 May 2022 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzKCd0KJZTbU; Tue, 17 May 2022 20:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36560404CC;
	Tue, 17 May 2022 20:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0714B1BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA59E60B6A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wTnzfFekIbw for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:00:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FFDE60B20
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:00:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:38de:5f35:431:927e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BD0B913F8A7;
 Tue, 17 May 2022 22:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652817648;
 bh=p36I2ErOJE+1IuoWZ2znPGSKtORLP1P9YlQkB9KrdY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TPYzxqdmVx6OtEYYVvrx8Doh4bNaPaCVBBOWD2lP5tyCIvQottiKDkj387DvAEs0M
 9ofBAtPZzwW5S5RE3X5qgJbfc6q5O4Cx2/LCfGVT4DsjtlUdatv9Vu/5FQzVrHywFn
 Omp7qfdgqBN7z8B2YG+Pcr1SQ52ht8w3DrLIt5Gg83KQyNzrsnR5HMpwIIWRt5l6T5
 Y6nd0jVunNafaolpj0IPZk7eZDMvYAdS7IWJcU6rURLT35C/jHHWoL3ixei53/qYx3
 v4fWRnFfIuqBC3nl3sO6UcljxbgHZDqV2/P56X0ABhET03lPmQfd1d44OEf9vhuo5D
 mAplPsRpRyW8Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 22:00:44 +0200
Date: Tue, 17 May 2022 22:00:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220517200044.GR1597494@scaer>
References: <20220515193633.180221-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220515193633.180221-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc
 fork
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-15 21:36 +0200, Romain Naour spake thusly:
> ARC hs4x_rel31 cpu is not supported by upstream gcc version.
> Only the generic HS48 processor (BR2_archs4x) is supported
> by upstream gcc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5
> http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>

Applied to master, after rewording the commit log as we discussed on
IRC. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/gcc/Config.in.host | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index f6b9b4fa9d..2b12035c4b 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  
>  config BR2_GCC_VERSION_10_X
> @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  config BR2_GCC_VERSION_11_X
> @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
>  	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
>  	depends on !BR2_sparc
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  
>  endchoice
> -- 
> 2.35.3
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
