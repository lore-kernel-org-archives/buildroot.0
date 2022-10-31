Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31512C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8CF5403E2;
	Mon, 31 Oct 2022 10:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8CF5403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHU7Cc43VnjY; Mon, 31 Oct 2022 10:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DC4E4038E;
	Mon, 31 Oct 2022 10:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DC4E4038E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AF031BF20F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04871404F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04871404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcaDgcIksfnc for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA25E401DE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA25E401DE
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:59:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B9D75B0053F;
 Mon, 31 Oct 2022 10:59:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:59:31 +0100
Date: Mon, 31 Oct 2022 10:59:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221031095931.GS1058960@scaer>
References: <20221030213743.943645-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030213743.943645-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210374;
 bh=qBNTabQxtdzQEUS/p3mijLaAs4QRPd2jkMwI2DEkjxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mpoWXEcNvXk6ANFjP/FEcICuw44ljFyfrdTbASodp/l7jowjBmAvTUouS6x3e8max
 s95xtIXJXZ7PkbnzFVG5UsinkMYyHOmnCKnfCRik6mnk4VHEyU4zTyoLY/dkZ/7PHY
 RJ9yKpsMlaL3oX1vVG7GpYx1RMyIF7QyEv7uDqHao4+d4cBuhlfDvofSa2/K3MEm4j
 h7YYQS7OwYcImyrLltYKhkJHnE4r0548TqU/KX9FI3tv5MM8RchbQxZC/YIsg+PuVK
 kfzizSR4nNDqnGbCwzTH6MgxpvXxtcZppWecYwPppD7HhhtZxZ2sDhYaBEVEzItesS
 3+vsmNCiRfNCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mpoWXEcN
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.44.2, 2.12.1_libuv_v1.44
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-10-30 22:37 +0100, Bernd Kuhls spake thusly:
> - libuv
>   Release notes:
>   https://github.com/libuv/libuv/issues/3452
>   https://github.com/libuv/libuv/issues/3522
>   https://github.com/libuv/libuv/issues/3586
> 
>   Updated license hash due to various commits regarding Android/Windows.
> 
> - uvw:
>   Updated license hash due to copyright year bump:
>   https://github.com/skypjack/uvw/commit/cca65db1f4a6ba74cb51f77754cd1f8ce64d9d63
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libuv/libuv.hash | 4 ++--
>  package/libuv/libuv.mk   | 2 +-
>  package/uvw/uvw.hash     | 4 ++--
>  package/uvw/uvw.mk       | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 1874aa344c..b0fa0ff5be 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9e27825a55279de69a7c43e42d509fd1337c9bece2547c761e91a1592e91cc4d  libuv-1.43.0.tar.gz
> -sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
> +sha256  e6e2ba8b4c349a4182a33370bb9be5e23c51b32efb9b9e209d0e8556b73a48da  libuv-1.44.2.tar.gz
> +sha256  95b8b163c60d17cfce3cef61a2d8a9cf70137502c8fb5f3d93cd2fc529fa98c8  LICENSE
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index ed51fc92f9..c169b76a6a 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping libuv, check if a new version of uvw is available
>  # and bump it too.
> -LIBUV_VERSION = 1.43.0
> +LIBUV_VERSION = 1.44.2
>  LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
>  LIBUV_DEPENDENCIES = host-pkgconf
>  LIBUV_INSTALL_STAGING = YES
> diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
> index 564c0980f3..a0c74bbe05 100644
> --- a/package/uvw/uvw.hash
> +++ b/package/uvw/uvw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3af4efa2842299490ec764f2148f85f4426dfb4f8d8aa436cc2d049db2b7b514  uvw-2.11.0_libuv_v1.43.tar.gz
> -sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
> +sha256  3460842778e91e7d2fae4201e49e4521e9d94fbbf3891ae6c52d3c9fc0673598  uvw-2.12.1_libuv_v1.44.tar.gz
> +sha256  1e3b8fb895c0396aaa2138ff82c02968524e220645b21b0a4ac765858a898732  LICENSE
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 161c40849d..b6c2135d6f 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UVW_VERSION = 2.11.0_libuv_v1.43
> +UVW_VERSION = 2.12.1_libuv_v1.44
>  UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
>  UVW_INSTALL_STAGING = YES
>  UVW_INSTALL_TARGET = NO
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
