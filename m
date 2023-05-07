Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C13C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F2283B38;
	Sun,  7 May 2023 21:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F2283B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ridRLXv82az8; Sun,  7 May 2023 21:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FC283B6C;
	Sun,  7 May 2023 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FC283B6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 045171BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1C45408A5
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C45408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sryVxzL11aIW for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:55:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B51FA40642
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B51FA40642
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:55:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 018E52003A4;
 Sun,  7 May 2023 23:55:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:55:53 +0200
Date: Sun, 7 May 2023 23:55:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230507215553.GW252090@scaer>
References: <20230507201636.52947-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507201636.52947-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683496557;
 bh=Emm82rDMjZ55ha3PN9+6/V8Dk1Yn6hi/CY3GMFeQFaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4OAisTSZNFzC7uPQkeiVh0mqFSOto+nJfNMCnOot7tkKQUeDc5PIY+XQmBZBuBCH
 GgwuUGuu3J6l36KHT0sm2WOpAb0K947bogRBGJyJyXbQ5yYCqjXULv7TxiYTRRpZso
 GnuXZTnEqLTN2D0L8kp5lZXxxK76yEilzlDClXLOgR3iKNG3ZIXNo70+NZgmDscX1s
 O+SuFRUV5wwxIiCG4dFw3kJvXj8sNutlwuV/2aWartHLimVFc0fCkHW5NwHTEEFDri
 8Rb8Yiar6p7LkGiNeDcT4nVGp0QEKC4Dog1TtE5RU0xKiZMOuts0YeJiJuSrcsdOe4
 43WESfu9VZ5MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f4OAisTS
Subject: Re: [Buildroot] [PATCH] package/cairomm1_14: use official website
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
Cc: Daniel Lang <d.lang@abatec.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-07 22:16 +0200, Daniel Lang spake thusly:
> The website [1] states that the released version can be downloaded from
> the cairo release area [2], which also features a sha1 hash.
> 
> [1]: https://www.cairographics.org/cairomm/
> [2]: https://www.cairographics.org/releases/
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
> - split patch from unrelated cairomm patches
> ---
>  package/cairomm1_14/Config.in        | 2 +-
>  package/cairomm1_14/cairomm1_14.hash | 5 ++++-
>  package/cairomm1_14/cairomm1_14.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
> index 6e767d2428..e369aa6f4a 100644
> --- a/package/cairomm1_14/Config.in
> +++ b/package/cairomm1_14/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_CAIROMM1_14
>  	  This is the last version before the API and ABI change
>  	  introduced in 1.16.0 which requires C++17.
>  
> -	  http://www.gtkmm.org/
> +	  https://www.cairographics.org/cairomm/
>  
>  comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
>  	depends on BR2_USE_MMU
> diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
> index 521e7cc546..6d58de360a 100644
> --- a/package/cairomm1_14/cairomm1_14.hash
> +++ b/package/cairomm1_14/cairomm1_14.hash
> @@ -1,3 +1,6 @@
> +# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
> +sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
> +
>  # Locally computed
> -sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
> +sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
>  sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
> diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
> index 5d076ddf0a..6502d34c5a 100644
> --- a/package/cairomm1_14/cairomm1_14.mk
> +++ b/package/cairomm1_14/cairomm1_14.mk
> @@ -7,8 +7,8 @@
>  CAIROMM1_14_VERSION = 1.14.4
>  CAIROMM1_14_LICENSE = LGPL-2.0+
>  CAIROMM1_14_LICENSE_FILES = COPYING
> -CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
> -CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
> +CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
> +CAIROMM1_14_SITE = https://cairographics.org/releases
>  CAIROMM1_14_INSTALL_STAGING = YES
>  CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
>  CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
> -- 
> 2.40.1
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
