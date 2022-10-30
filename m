Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0165AFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AED8125B;
	Sun, 30 Oct 2022 11:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80AED8125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFPNlXQDwV5i; Sun, 30 Oct 2022 11:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866858124B;
	Sun, 30 Oct 2022 11:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866858124B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 688E41BF5DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42FFD40334
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FFD40334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_gIgCW73BhB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:45:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B29F040320
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B29F040320
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:45:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C92DE13F846;
 Sun, 30 Oct 2022 12:45:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 12:45:19 +0100
Date: Sun, 30 Oct 2022 12:45:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221030114519.GE1058960@scaer>
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
 <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667130325;
 bh=UU1eYyHUdnIvf4Aumgz/IfIVf8Yp7VO4V6SFRWBe988=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=daHM+94v0ZICwKC0pQdiSesK7TUElc8EsvT2aXQOVPU974RTN5eUrr6zBrsBb8LyV
 LZE+Nb+0PPlD7eA1pTPAH2Fmof82xBbyh1W4lOpPbFio/AzRPEmOcnW91/uYtdafLn
 hVyPvG+TJ02oT5dr/xpjflH3+fW3HSyt80qWnPGXcLfDmkrccy6u4Sg3Vrl8WSCVlJ
 DZuilTeO31FleETb1EoNMCwHBLhOu4sHjG5758qYbcY4Acgl+ue2FA1fC/mMWQSQOP
 yBYgvs9DYLNSqiNCUNsRERcUjMv3k70NdRyb7QDu3FwqanZU2hTCt3Ye8CWdeKdRx0
 2EcM3fHDjshqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=daHM+94v
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: headers >= 5.4 needed on
 RISC-V 32-bit
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-26 20:34 +0200, Thomas Petazzoni via buildroot spake thusly:
> Since glibc 2.33 (upstream commit
> 7a55dd3fb6d2c307a002a16776be84310b9c8989), headers >= 5.4.0 are needed
> to build glibc for RISC-V 32-bit. Indeed
> sysdeps/unix/sysv/linux/riscv/configure.ac contains:
> 
> if test $libc_cv_riscv_int_abi = ilp32; then
>   arch_minimum_kernel=5.4.0
> fi
> 
> In order to take into account this dependency, we add the appropriate
> logic in package/glibc/Config.in and
> toolchain/toolchain-buildroot/Config.in.
> 
> This change means that if headers < 5.4.0 are selected, then no C
> library at all will be available for RISC-V 32-bit, as glibc is the
> only C library supporting RISC-V 32-bit currently. However, thanks to
> the recent addition of BR2_TOOLCHAIN_BUILDROOT_NONE, the
> choice...endchoice for the C library selection will not be empty,
> allowing the user to see the Config.in comment explaining why glibc
> can't be selected.
> 
> Therefore, technically this commit does prevent from creating a
> configuration with RISC-V 32-bit and headers < 5.4.0, but it will have
> BR2_TOOLCHAIN_BUILDROOT_NONE=y, which is catched by
> package/Makefile.in, which aborts the build early on pointing out that
> the configuration is invalid.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/Config.in                 | 1 +
>  toolchain/toolchain-buildroot/Config.in | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index b63f99b0b4..71c50504ac 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -34,6 +34,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 26d731d976..64f7892f98 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -62,6 +62,10 @@ comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
>  	depends on BR2_RISCV_64
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
>  
> +comment "glibc on RISC-V 32-bit needs a toolchain w/ headers >= 5.4"
> +	depends on BR2_RISCV_32
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +
>  comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
>  	depends on BR2_arc
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> -- 
> 2.37.3
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
