Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A109C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290BF410C6;
	Sun, 23 Jul 2023 15:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290BF410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uj92kSgo08sx; Sun, 23 Jul 2023 15:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA783410C8;
	Sun, 23 Jul 2023 15:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA783410C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 709E81BF28A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55BEF410C8
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55BEF410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4Iq_pnarepz for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 15:41:40 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03D4D4098E
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 15:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D4D4098E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 329645FF33;
 Sun, 23 Jul 2023 17:41:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 17:41:34 +0200
Date: Sun, 23 Jul 2023 17:41:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723154134.GI2503916@scaer>
References: <20230721212545.2371188-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721212545.2371188-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690126897;
 bh=Mqz+XGr/JPvHKHA1CHdfDvMP7wXn+Ld6qvA8MZxDiYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=amGe0n65eFekptuD1KhSsVxd+sUzrdvJa0ef04mHql4hI1F00evjNAV6HSjQ4vs+5
 lDxQ5DX4BWoE38dVygovWZWCfuuqtek/HROYz+qzRNAFC8/Ap4rIbVozFfsLuFd/hB
 lFhk4I8ParCMrqGhFXuFFlodOeq/qQmQ/IP8IpinUbsn7BY+BNovwzcKLV3Uis2E/F
 91ZfFXhK7hdhFFIXnCYX8AGEHj7W32MWQEWM7b6vFxgtrC30ZFfsrJyJ81WUzosXHr
 Y8vbYgcavduR43kuG7JSz//yqBC/aWsEA3ZGMnTtKnSj+zmLtnYp1g26y3dyUiWfHp
 fSNuq2DG2PEPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=amGe0n65
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mariadb: needs fmt
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

Bernd, All,

On 2023-07-21 23:25 +0200, Bernd Kuhls spake thusly:
> Buildroot commit 88c7359f65381d49fa497f9e33bf54bb31a14e6c bumped mariadb
> from version 10.3.36 to 10.11.4.
> 
> Upstream added fmt as dependency in version 10.7.1 with commit
> https://github.com/MariaDB/server/commit/e214e60201216b2e6330f86a84fec8ae14aa2887

So not present in any of the branches in Buildroot but master, so no
need to backport.

> Fixes:
> http://autobuild.buildroot.net/results/ce1/ce140a3923bc2f85b176fafcc38c6f68b177d33a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: added note about buildroot commit (Thomas)
> 
>  package/mariadb/mariadb.mk | 4 ++++
>  package/mysql/Config.in    | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index a743d020c0..a9cd9c9516 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -18,12 +18,16 @@ MARIADB_CONFIG_SCRIPTS = mysql_config
>  
>  MARIADB_DEPENDENCIES = \
>  	host-mariadb \
> +	fmt \
>  	ncurses \
>  	openssl \
>  	zlib \
>  	libaio \
>  	libxml2
>  
> +MARIADB_CONF_OPTS += \
> +	-DWITH_FMT=system
> +
>  # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
>  MARIADB_CONF_OPTS += -DWITH_READLINE=ON
>  
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index ef4a9531a7..8212d0fd3f 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -16,10 +16,13 @@ choice
>  
>  config BR2_PACKAGE_MARIADB
>  	bool "mariadb"
> +	depends on BR2_INSTALL_LIBSTDCPP # fmt
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
> +	depends on BR2_USE_WCHAR # fmt
>  	select BR2_PACKAGE_LIBAIO
>  	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_FMT
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_HAS_MYSQL
> @@ -30,8 +33,9 @@ config BR2_PACKAGE_MARIADB
>  
>  	  http://www.mariadb.org/
>  
> -comment "mariadb needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "mariadb needs a toolchain w/ dynamic library, C++, wchar"
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
>  
>  config BR2_PACKAGE_ORACLE_MYSQL
> -- 
> 2.39.2
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
