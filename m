Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA05CC7EE22
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 08:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB9741EB3;
	Sun,  7 May 2023 08:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB9741EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txTCGZAxO2u3; Sun,  7 May 2023 08:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430FE41F0E;
	Sun,  7 May 2023 08:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430FE41F0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F991BF31D
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD30441EC1
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 08:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD30441EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8x-hJ-Ux2qG for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 08:52:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB21B41EB3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB21B41EB3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 08:52:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 29E1419F73D;
 Sun,  7 May 2023 10:52:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 10:52:32 +0200
Date: Sun, 7 May 2023 10:52:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507085232.GA252090@scaer>
References: <20230105191813.3533745-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105191813.3533745-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683449555;
 bh=M1v5sJ/WKlai9drgZjm7XUwsDwnoldApamLrRi//yfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6XhooFy54Mu1fMwM7xnzIhnWO0/ObabB72PUWPDJbMx+9FeZ/AHUmhE0l81ZaCNE
 gzNWHUfeliBNuoANlvhOtRMcV36C/ioXMAivhcfuonzyVx8i32TkqR59cFxUL6cq8c
 4qjwnDJ4mebLR66DzjGyJFdqR6juongL3E0f69slyx2/Xn+9vBPd6XgYL+qJFdN4RP
 GFsXHDIY8mQ0pEUKouG3s9QUi2WAQieDKHfzIuiiA3AgDJyuiPhystdY24kDbYjtDu
 W0qBAXzovqT7qwo6gs/M1MYfi5HeA0SNQ0M3pM66wrO/AbwYx4cT1kIGE+Uy1ytFcu
 z06zAYnbJRwPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m6XhooFy
Subject: Re: [Buildroot] [PATCH 1/2] package/freeswitch: ffmpeg's
 libavresample is an optional dependency
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

On 2023-01-05 20:18 +0100, Bernd Kuhls spake thusly:
> See upstream commit from 2019:
> https://github.com/signalwire/freeswitch/commit/e9c58084db249845af88011a1e3c5d7b9ec05a76#diff-2cd3a5516ad0fc3cba6d14d0ea3e72da43a2c2fc3c21eb7ade6c49d52136bbd2R43
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freeswitch/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> index bad101486c..1ab624c33c 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_FREESWITCH
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # apr, included in freeswitch source
>  	depends on BR2_USE_WCHAR # uses wchar_t
> -	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_JPEG
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
