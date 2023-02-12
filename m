Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C595BC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D038176B;
	Sun, 12 Feb 2023 21:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D038176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISX4XlsuCDGn; Sun, 12 Feb 2023 21:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED3481767;
	Sun, 12 Feb 2023 21:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED3481767
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6814B1BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4243D40897
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 21:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4243D40897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCavk03GfrPJ for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 21:08:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013B24088E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013B24088E
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 21:08:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 439145FF9E;
 Sun, 12 Feb 2023 22:08:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 22:08:05 +0100
Date: Sun, 12 Feb 2023 22:08:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230212210804.GZ2796@scaer>
References: <20230211182838.272469-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211182838.272469-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676236087;
 bh=xLViAdyLgnIzvB45ZM31Uhp0S13GIiTtB/KtI5M+TFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcOV4xejT8jUQo9w6YkoSdXL/norOxYlAUg9OXNUADPwSulPNgtTaxrnLSieiSj1Q
 qKWjXHjy1veWRHTm/DDy1dENbYmdMgTszz6O4jw2KkfogH60cSFDN4Jgd1uldkea/b
 WDj4XewJ4XGA7cyYJ5QmD/AvudeQxyMAqb7FxCsNFuwQEWFDUQa+NgT90xLONyglns
 LII4xs/Ct58UO5y+t9J4j00tfo6IiC6qj4jzdbQTT40MuynEUUhLdLAtu51MvbzPXs
 FZRnlRAsvEJPYjvZgFAgWSfXgoPsELVaVxK4mz4vJR2X/3AK+Cq5cjYfzX1a6rj+Ty
 XoyP8Sne+HDuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BcOV4xej
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xvidtune: bump
 version to 1.0.4
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

On 2023-02-11 19:28 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-February/003319.html
> 
> Switched tarball to xz, updated _SITE.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xapp_xvidtune/xapp_xvidtune.hash | 5 +++--
>  package/x11r7/xapp_xvidtune/xapp_xvidtune.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
> index ecf7d0330b..0e7e231383 100644
> --- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
> +++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
> @@ -1,4 +1,5 @@
> -# From http://lists.x.org/archives/xorg-announce/2013-January/002129.html
> -sha256  24e5e103933a04bfb2e1d18562619ed74031ab515e7343eb546bacdbcbeecf01  xvidtune-1.0.3.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2023-February/003319.html
> +sha256  0d4eecd54e440cc11f1bdaaa23180fcf890f003444343f533f639086b05b2cc5  xvidtune-1.0.4.tar.xz
> +sha512  747d5358f4f7d3d7db508c3f034711ce4b9dd278160d35312e9c4d1604623e84a2438d039b536546fd2df7db8c5ea1907e8a6101985fad2932b6dee5a62c7b80  xvidtune-1.0.4.tar.xz
>  # Locally computed
>  sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
> diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
> index d7c4d5bf56..cc40d39098 100644
> --- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
> +++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XAPP_XVIDTUNE_VERSION = 1.0.3
> -XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
> -XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
> +XAPP_XVIDTUNE_VERSION = 1.0.4
> +XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.xz
> +XAPP_XVIDTUNE_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_XVIDTUNE_LICENSE = MIT
>  XAPP_XVIDTUNE_LICENSE_FILES = COPYING
>  XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
> -- 
> 2.39.1
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
