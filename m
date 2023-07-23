Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53376C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 15:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE912408EC;
	Sun, 23 Jul 2023 15:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE912408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVFTi7a7ZSgY; Sun, 23 Jul 2023 15:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92F2408AA;
	Sun, 23 Jul 2023 15:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92F2408AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4894D1BF28A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 219BC60B6A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 219BC60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtvylYJFqzGh for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 15:43:12 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 297C060B2F
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 15:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 297C060B2F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7DA9B5FF9A;
 Sun, 23 Jul 2023 17:43:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 17:43:08 +0200
Date: Sun, 23 Jul 2023 17:43:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723154308.GJ2503916@scaer>
References: <20230721212545.2371188-1-bernd@kuhls.net>
 <20230721212545.2371188-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721212545.2371188-2-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690126990;
 bh=NkYmzuWbWCKqSYMT7ULeQRQ4/f/VC0JO4PikTvBjndA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MoDwUgjMElZqGeh7EO/y0OmlF5GjiB7SpN0+Go32QWjUx3itmVq1UoFw2hpb5Yo9g
 2yqVzLtSrx5IytfaGQxg9o3noG6VS7TgKGUkKJEpWeUPYGGfYJIbFitj98jrHu9m/M
 eSCXkP2KBLBWDCty/pxmCBByYWQoH5/2o+JZ/eBBbykO7u6LHOzTn0g8qB2Jx6S98i
 PfkiMKvtJIpuvf00jEtuzzIoqkLA5WB6DwYKLawaOCxAO96YqoHfrjuWormOiyg1YI
 vGfv/D+s00dRWETdM5KFgxffh9MiXXbr1mqVL6sJcC4Np5QqKBKGVF2qF6yH2glQYk
 i+uVNpKWGzUWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MoDwUgjM
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mariadb: needs pcre2
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

+Peter K. for backports.

On 2023-07-21 23:25 +0200, Bernd Kuhls spake thusly:
> Upstream added the possibility to build with system-provided pcre2
> https://github.com/MariaDB/server/commit/016bd4fc5fff311dc4091b3b7329cd980dbaa14b

This commit dates back to 2014, and we introduced mariadb in Buildroot
in 2016, so the possibility to use a system-provided pcre2 was already
present in Buildroot.

Peter:
    So, this commit should be backported to stable branches.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: no changes
> 
>  package/mariadb/mariadb.mk | 4 +++-
>  package/mysql/Config.in    | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index a9cd9c9516..a2701643e1 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -21,12 +21,14 @@ MARIADB_DEPENDENCIES = \
>  	fmt \
>  	ncurses \
>  	openssl \
> +	pcre2 \
>  	zlib \
>  	libaio \
>  	libxml2
>  
>  MARIADB_CONF_OPTS += \
> -	-DWITH_FMT=system
> +	-DWITH_FMT=system \
> +	-DWITH_PCRE=system
>  
>  # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
>  MARIADB_CONF_OPTS += -DWITH_READLINE=ON
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index 8212d0fd3f..8942e55a45 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_MARIADB
>  	select BR2_PACKAGE_FMT
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCRE2
>  	select BR2_PACKAGE_HAS_MYSQL
>  	help
>  	  MariaDB is one of the most popular database servers in the
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
