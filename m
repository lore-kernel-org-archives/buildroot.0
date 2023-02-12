Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544DEC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0694081437;
	Sun, 12 Feb 2023 20:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0694081437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzQRyl5xMCsk; Sun, 12 Feb 2023 20:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5AD8142C;
	Sun, 12 Feb 2023 20:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5AD8142C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E33FE1BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE564052B
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE564052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epxJtrAc1epz for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2557400D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2557400D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:55:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CF2AC5FFA0;
 Sun, 12 Feb 2023 21:55:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:55:30 +0100
Date: Sun, 12 Feb 2023 21:55:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230212205530.GX2796@scaer>
References: <20230211183715.432384-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211183715.432384-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676235332;
 bh=swFMaTc14g0wHpK8WvKVzr+CcSX6gykLMvIoprFMFq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLA8m3408V+63Wr1xK51AZTBnjlDovuhyLy46XURvV0/fTUS/5xmSU0YhMnPLZgas
 dpn+KBdDACe8VutLSmgzwEMJ32jIlW+T4KLMvrwuzvpoKzC5WtJKT/GTXhK/4hc36V
 1fEal1IJwPsMi4xDI82eSY/1horpoXqLhJPcQoFOjEwki7hsD+TIp9Nm23LVkVqG68
 sJPHpItdj4xYZouO324OQ4+oZNb8aJnbLODKNiOP7BrHlMVc8hOPkatoHPbI1bPP3Q
 kUgwrNAkouxyUtcf97/PEah65TKWwJv5Blz/M2J0q7HepUHcXq1KhALjab1BttAwN1
 3wxtBjw5bJ6mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FLA8m340
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xapp_beforelight: bump
 version to 1.0.6
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

On 2023-02-11 19:37 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-January/003317.html
> 
> Updated license hash due to upstream commit:
> https://gitlab.freedesktop.org/xorg/app/beforelight/-/commit/fa1e473dd64673a36a73a01a84a8db61eaa425dc

This is not enough to assess the change. We need to know what cahnged,
so I expanded ojn that:

    The license file was previously a stub, but it now contains the proper
    license text since upstream commit:

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Switched tarball to xz, updated _SITE.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_beforelight/xapp_beforelight.hash | 7 ++++---
>  package/x11r7/xapp_beforelight/xapp_beforelight.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.hash b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
> index 00aff75779..f5b0cb21a4 100644
> --- a/package/x11r7/xapp_beforelight/xapp_beforelight.hash
> +++ b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
> @@ -1,4 +1,5 @@
> -# From http://lists.x.org/archives/xorg-announce/2013-January/002131.html
> -sha256  8fcab6f15148ca680c0d3da8de7dcb41f8e6a076f442cf8bdcf272be9e348166  beforelight-1.0.5.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2023-January/003317.html
> +sha256  53f0bf085b7272ebbf626d1b9b0ad320d1a07bc1fe7f3ae260c86a71a857ad28  beforelight-1.0.6.tar.xz
> +sha512  48a165d151676f6d213883bee98b34007403a77e025253c8649f9a0f5ea258b09381ab523a5e906030ac9fc8245fce2c6beaf9ad0f81116e302d51ad4a0fad5a  beforelight-1.0.6.tar.xz
>  # Locally computed
> -sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
> +sha256  3909739fae1ee37c3c7167a91f53d29317965aaf932813e16ef733f033619a7b  COPYING
> diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
> index 7dcb715ef3..6b753833f7 100644
> --- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
> +++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XAPP_BEFORELIGHT_VERSION = 1.0.5
> -XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
> -XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
> +XAPP_BEFORELIGHT_VERSION = 1.0.6
> +XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.xz
> +XAPP_BEFORELIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_BEFORELIGHT_LICENSE = MIT
>  XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
>  XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
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
