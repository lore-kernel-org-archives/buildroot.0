Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75577C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3D182EBA;
	Sun, 21 May 2023 15:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3D182EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIFe87JMdf5j; Sun, 21 May 2023 15:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB9482893;
	Sun, 21 May 2023 15:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB9482893
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9BA51BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C335B82893
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C335B82893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Yb2Y80WfXX0 for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B508882333
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B508882333
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:12:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AF59AB0053D;
 Sun, 21 May 2023 17:12:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:12:52 +0200
Date: Sun, 21 May 2023 17:12:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230521151252.GB171618@scaer>
References: <SN4P221MB068245BFD104BAC32E86F520A07D9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB068245BFD104BAC32E86F520A07D9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684681974;
 bh=MMQV8Yz/WIaQR01cdkozj1sq7mtT0ChUG9H/Q6zNdoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QJb+4Dtbn6QXZsc36E3C4oRnSIXfeNv1xYGOp40dPvggbPUsz0/P3ewUlrfwbRhb4
 X0wgYQyRVcAVbIC3elT2d3GunoqVx+bBIS+enkYX5fzz6D1eFsuNxIiTizU6E5cg0W
 j0ItAMk6Eh1Qyn7+80aTCQmHqysXfplyolI2ryR67XjGAHCW8MmQFvZAnzxD4PkK4L
 NAWSwprivFPgJVP8UB0ceS3hM2gD/gzx/4ktHBHxtw8eREVtKEVJd5QD1CDuB3dbdz
 orJMe1cEjilSKPzhFE3vVX+xPCIWSZl3js/7us6kQWWi5Wo3w41gnWCxlh32XMn7yk
 gUaq/Aud8YSVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QJb+4Dtb
Subject: Re: [Buildroot] [PATCH] package/libpqxx: needs C++17
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

James, All,

On 2023-05-20 13:58 -0400, James Knight spake thusly:
> libpqxx's v7.x series requires C++17 support. Adjust the configuration
> selection to require a newer toolchain, as well as force a C++17
> standard to ensure libpqxx's custom C++ standard check [1] passes.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a79cb93aec74acc8e32809530c09e26bebaf16e4/
>  - http://autobuild.buildroot.net/results/ae1a02b5238b650cdc79edb298c398b078882cfc/
> 
> [1]: https://github.com/jtv/libpqxx/blob/7.7.5/configure.ac#L106-L124
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpqxx/Config.in  | 6 +++---
>  package/libpqxx/libpqxx.mk | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
> index d06451d7928ec9adf21bbfc8535f0787899343d4..f5fe2b38079fb3c619710e387c4676d7744a2416 100644
> --- a/package/libpqxx/Config.in
> +++ b/package/libpqxx/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
>  	bool "libpqxx"
>  	depends on BR2_PACKAGE_POSTGRESQL
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  libpqxx is the official C++ client API for PostgreSQL, the
> @@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
>  
>  	  http://pqxx.org/development/libpqxx/
>  
> -comment "libpqxx needs toolchain w/ C++, gcc >= 4.9, threads"
> +comment "libpqxx needs toolchain w/ C++, gcc >= 7, threads"
>  	depends on BR2_PACKAGE_POSTGRESQL
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
> index b280f5a52a15b7c60d3da16ad326dbedac123137..434cefd06950e1a467fa31d23f9155764e8e12e8 100644
> --- a/package/libpqxx/libpqxx.mk
> +++ b/package/libpqxx/libpqxx.mk
> @@ -11,6 +11,8 @@ LIBPQXX_DEPENDENCIES = postgresql
>  LIBPQXX_LICENSE = BSD-3-Clause
>  LIBPQXX_LICENSE_FILES = COPYING
>  
> -LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
> +LIBPQXX_CONF_ENV = \
> +	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
>  
>  $(eval $(autotools-package))
> -- 
> 2.40.1.windows.1
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
