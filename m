Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F34CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 16:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CCD428BA;
	Sun, 22 Oct 2023 16:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CCD428BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sxg4_Oswrzuh; Sun, 22 Oct 2023 16:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCD442224;
	Sun, 22 Oct 2023 16:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCD442224
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 346341BF298
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 16:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DDF1854B4
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 16:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DDF1854B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRRdUhpPVz7v for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 16:11:58 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2603854B3
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 16:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2603854B3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 66F43B0053E;
 Sun, 22 Oct 2023 18:11:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 18:11:47 +0200
Date: Sun, 22 Oct 2023 18:11:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231022161147.GP2607@scaer>
References: <20231022154133.1619344-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231022154133.1619344-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697991114;
 bh=7d2TXJ1uAOXxR4hilDjOBPRSJc42w00UEhs77j8gZRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPkKEnpjGlEX77uuLwgDHKvSLHWt+esNUWfO8SKCd01mPcsyibE7h6ru2GAwVLUqm
 Bec4QIuw7ciHCD+ZW8HcRJhUftySZT/WtvKV7k6cYLheZJsMDrpC6HJPXYWsmYJyCm
 1lCbomnmYKTvUzw12oqaHyNSyj7YJG/r34TyJzhTDm9sFp8M0MEFqvenwZukHnbM9P
 T5qzpV39j1Paq4nfT+cnfC3sNW2hA6mAfr+uZ85oEnfi7yAWrq9a8OPB6qzbOa6wNk
 1plO/Q7TQBLekVT+mvdFIXt78bsfzdKbzzYQW8Z6nRSf9z9rrapHZL8uiYkbQpmwDI
 DqI+M5qX/a3Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pPkKEnpj
Subject: Re: [Buildroot] [PATCH v2 1/1] package/elfutils: enable on musl
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-10-22 17:41 +0200, Bernd Kuhls spake thusly:
> Buildroot commit eb60820c0a9b3f938f32516f24df2eee9aac1e26 disabled
> elfutils for musl toolchains in 2015. Current code builds fine with musl
> so remove the exceptions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[--SNIP--]
> diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> index 5f45de14ab..c355048c6d 100644
> --- a/package/elfutils/Config.in
> +++ b/package/elfutils/Config.in
> @@ -1,17 +1,14 @@
> -comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
> +comment "elfutils needs a toolchain w/ wchar, dynamic library, threads"
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> +		|| !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_ELFUTILS
>  	bool "elfutils"
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	# Only glibc and uClibc implement the myriad of required GNUisms
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC

I'm not a fan of this negative condition; I'd much prefer we use
positive logic. i.e. it is musl that needs argp-sa, so select it for
musl. uclibc needs it too, select it for uclibc.

But...

>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC

... this negativity is already what we use for fts, so meh, let's keep
it for arg-sa.

See below for a bit more...

>  	help
>  	  Libraries/utilities to handle ELF objects (drop in
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 0757851b72..28fcb52eb3 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -61,8 +61,11 @@ HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
>  ELFUTILS_CONF_ENV += \
>  	LDFLAGS="$(ELFUTILS_LDFLAGS)"
>  
> -ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)

We already had a conditional block about !glibc, a bit above in the
file, so I moved all the libc-related conditions together.

Applied to master, thanks.

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
