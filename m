Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A297C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E808C81882;
	Mon, 18 Dec 2023 17:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E808C81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxI8Tw_UscEV; Mon, 18 Dec 2023 17:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CAA81E2B;
	Mon, 18 Dec 2023 17:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CAA81E2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2F91BF3E8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E885C41587
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E885C41587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6LcWKcnCsv8 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:00:09 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2DC940894
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DC940894
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 39212B0055A;
 Mon, 18 Dec 2023 18:00:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 18:00:03 +0100
Date: Mon, 18 Dec 2023 18:00:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZYB6k7q06aHaKSRP@landeda>
References: <20231218131117.152328-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218131117.152328-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702918806;
 bh=wY1bAQurkIT4TUCuMusrzE5oEu3RVpbtQiLmu/g65H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U2UtQCOQq70oGsDi33xaZzTSainGq75IKfwFv4cDsxinTIr6YnC4FT0a5u0oKvtVf
 1gEBwtq6/o86uLPblRB86YA5+s7ZacXWE2GZa8opjHROnesDPkviCq14pTzC8WaEjl
 wFJ8fDieSQ96UbgxhOeuFRKcu/4+7Lvdb3LjfnmKqiDYWd9CVKCQHymxKNV5m3mN0i
 sD0H0BaQee8+i4T75MmOn2imOVI41nPIY5fuRVvygcdhiXwZpHSaYP7QRi66eXxvB8
 HK0geUpp2XOlGR7qP2qCIYnbudc716P7rMcNjrzS1KmO4RYSJtLGtTHzJvNbzjqH+f
 DAKTDT5LTS6Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U2UtQCOQ
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump version to 2023.12
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

Giulio, All,

On 2023-12-18 14:11 +0100, Giulio Benetti spake thusly:
> * make json-c mandatory according to [0]
> * make libubootenv mandatory according to [1]
> * drop local patch that has been upstreamed [2]
> 
> [0]: https://github.com/sbabic/swupdate/commit/82e75322443e021d119a026a3476c410f4705d67
> [1]: https://github.com/sbabic/swupdate/commit/75838874e2575f822ed85d89532f47e9adf781b6
> [2]: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 7d9fc90e10..b5a567fa8f 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -3,9 +3,10 @@ config BR2_PACKAGE_SWUPDATE
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_JSON_C

Json-C depends on SYNC_4, so you must propagate the depndency.

> +	select BR2_PACKAGE_LIBUBOOTENV
>  	# swupdate requires a parser and uses libconfig as default
> -	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
> -		!BR2_PACKAGE_HAS_LUAINTERPRETER
> +	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_HAS_LUAINTERPRETER

Previously, when json-C was enabled, libconfig was not necessary. Now,
json-c is always enabled (it is selected), so is it still needed to
force libconfig even without a lua-interpreter?

Regards,
Yann E. MORIN.

>  	help
>  	  swupdate provides a reliable way to update the software on
>  	  an embedded system.
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index 72b71ce12d..c19a82304f 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  888df5050035e4fbe14e3a964885646fa3163e727f78c423c3d24c28f7a50b66  swupdate-2023.05.tar.gz
> +sha256  ce24032300e2b6a6faa3d22e49f981fd90f04ac6f5d7e802166824b0cd5ca669  swupdate-2023.12.tar.gz
>  sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
>  sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
>  sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index ea4a5a62e5..ca8c140886 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWUPDATE_VERSION = 2023.05
> +SWUPDATE_VERSION = 2023.12
>  SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>  SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
> @@ -18,6 +18,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>  	LICENSES/MIT.txt \
>  	LICENSES/OFL-1.1.txt
>  SWUPDATE_INSTALL_STAGING = YES
> +SWUPDATE_DEPENDENCIES = json-c libubootenv
>  
>  # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>  # available in all external toolchains, and use CC for linking. Ensure
> @@ -36,13 +37,6 @@ else
>  SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
>  endif
>  
> -ifeq ($(BR2_PACKAGE_JSON_C),y)
> -SWUPDATE_DEPENDENCIES += json-c
> -SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
> -else
> -SWUPDATE_MAKE_ENV += HAVE_JSON_C=n
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
>  SWUPDATE_DEPENDENCIES += libarchive
>  SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=y
> @@ -85,13 +79,6 @@ else
>  SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
> -SWUPDATE_DEPENDENCIES += libubootenv
> -SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
> -else
> -SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
>  SWUPDATE_DEPENDENCIES += liburiparser
>  SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
> -- 
> 2.34.1
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
