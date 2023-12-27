Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DFFC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760AB808AC;
	Wed, 27 Dec 2023 21:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 760AB808AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdTM-eIWKqsC; Wed, 27 Dec 2023 21:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F5682D14;
	Wed, 27 Dec 2023 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F5682D14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A65B1BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AB7D82D14
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB7D82D14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ffe3jHdtDdS5 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:13:10 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDF9983A9B
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF9983A9B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B3CDB00535;
 Wed, 27 Dec 2023 22:13:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 22:13:04 +0100
Date: Wed, 27 Dec 2023 22:13:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYyTYDN_OZVXrrYn@landeda>
References: <20231225225420.2531967-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231225225420.2531967-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703711586;
 bh=n0RUQ2oFLajFsmqZEEYj1duH2zhCgF6Lyqml+GyjGgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kROPae6Pra4HgrZjYnqhTLKrfNKXaD8AORKaC1K+rVaKmz9NbG7mjxL2fna5TVk1p
 ve1GsOc0zS1XvaYpw8c5LfkYUH5J954J4w0AdgeS4bQ2RwjYa+siyYG29oDAj84qy/
 uLpZze9t1HsYCbRxGfegRQUHjeo00Il6QjUWQmc14mjMhqTBnUuW5geQLjwuy5S33c
 KbuWKaQDgb4S82EwJY/ZB6s7SQuniTLF70DLbljveAGAKyRYZrqazcbDcH9SUkLQon
 QuCr6YwuT4rZBw1G9tpo30sbbZcsPqo4JKFZPBFxwM6zoRufI4IfXrxzan6T7ODdEQ
 COVZxqwvW90Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kROPae6P
Subject: Re: [Buildroot] [PATCH] package/gdb: build and link libbfd and
 libopcodes as static libraries
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

Thomas, All,

On 2023-12-25 23:54 +0100, Thomas Petazzoni via buildroot spake thusly:
> Since GDB 13.x and upstream commit
> b686ecb5b10be9a33ab8f1bfdcff22eef920d1a5 ("gdb: link executables with
> libtool"), gdb will be linked against the shared variants of libbfd
> and libopcodes if they exist. However, this causes host gdb and target
> gdb to not work, because our gdb package does not install libbfd and
> libopcodes (to not clash with the ones potentially installed by
> binutils).
> 
> In order to get around this, this commit proposes to get back to the
> situation we had before GDB 13.x: libbfd and libopcodes are only
> compiled as static libraries, so that they are linked directly inside
> the gdb binary, avoiding the problem entirely.
> 
> This resolves:
> 
>  # gdb --version
>  gdb: error while loading shared libraries: libopcodes-2.39.50.so: cannot open shared object file: No such file or directory
> 
> for target gdb, and:
> 
>  $ ./host/bin/arm-linux-gdb --version
>  ./host/bin/arm-linux-gdb: error while loading shared libraries: libopcodes-2.39.50.so: cannot open shared object file: No such file or directory
> 
> for host gdb.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/gdb.mk | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 070598b385..ea710f0c1f 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -121,8 +121,10 @@ GDB_MAKE_ENV += \
>  GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
>  GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
>  
> -# The shared only build is not supported by gdb, so enable static build for
> -# build-in libraries with --enable-static.
> +# We want the built-in libraries of gdb (libbfd, libopcodes) to be
> +# built and linked statically, as we do not install them on the
> +# target, to not clash with the ones potentially installed by
> +# binutils. This is why we pass --enable-static --disable-shared.
>  GDB_CONF_OPTS = \
>  	--without-uiout \
>  	--disable-gdbtk \
> @@ -132,6 +134,7 @@ GDB_CONF_OPTS = \
>  	--without-included-gettext \
>  	--disable-werror \
>  	--enable-static \
> +	--disable-shared \
>  	--without-mpfr \
>  	--disable-source-highlight
>  
> @@ -248,10 +251,14 @@ endif
>  # A few notes:
>  #  * --target, because we're doing a cross build rather than a real
>  #    host build.
> -#  * --enable-static because gdb really wants to use libbfd.a
> +#  * --enable-static --disable-shared because we want host gdb to
> +#    build and link against a static version of libbfd and
> +#    libopcodes, because we don't install the shared variants of
> +#    those libraries in $(HOST_DIR), as it might clash with binutils
>  HOST_GDB_CONF_OPTS = \
>  	--target=$(GNU_TARGET_NAME) \
>  	--enable-static \
> +	--disable-shared \
>  	--without-uiout \
>  	--disable-gdbtk \
>  	--without-x \
> -- 
> 2.43.0
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
