Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4878FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E1860F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11E1860F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79606077E;
	Sat, 13 Nov 2021 09:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcLH95ZqYvRW; Sat, 13 Nov 2021 09:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF9060685;
	Sat, 13 Nov 2021 09:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E821F1BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7DE6405C4
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWFaIiU161eV for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:53:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00247405B5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:53:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6823019F574;
 Sat, 13 Nov 2021 10:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636797221;
 bh=0n9YF9oOsg3NoN2JGcAthfMEudFO1i5HPFj2RRFmeiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=svOl+kbWY8GjtnlPZ2eJ8mRH1JwlAehwG1EfGbQafZ2xlYjWoU774NOckp5gwHxsl
 S9a7XNdUz9AzEj7qgPA9bQdQCgjay2k9lggg0aV5iJ5hBZILaMpe3flPM989Q+Fldp
 wtRv5Bp7gKXsW/Cm/cApc3ysKyXh/iwpgmVFDKCpsNbKLAsB+wtrd1QU8NIzfEGHi/
 X+FC7pDpx1V2TLElXvFu8cx0/RbImXlwfqJw6e51Ibp6T6pwo5caB5BAkAY4Z9PDco
 EY83gheTUtqLIay/7zAXyCBmIKLVktjXA+Z8uDMrvvAt7oq+4ZZRdlOrtFn/b4eRUG
 Fe6MWh/yDilkg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 10:53:37 +0100
Date: Sat, 13 Nov 2021 10:53:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211113095337.GQ247986@scaer>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
 <20211113093009.6915-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113093009.6915-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/3] package/glmark2: drm-glesv2 needs
 libgbm
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

On 2021-11-13 10:30 +0100, Bernd Kuhls spake thusly:
> Fixes build error with defconfig from:
> http://autobuild.buildroot.net/results/e393dbfba7c2989fe983df47ea0638c3ba62ae7a/
> 
>   Checking for 'libdrm': yes
>   Checking for 'gbm'   : not found
> 
> after http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-1-bernd.kuhls@t-online.de/
> was applied. Both patches are needed to fix the build error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: no changes
> 
>  package/glmark2/Config.in  | 1 +
>  package/glmark2/glmark2.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 3ef3a0e8e3..6761397d3f 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
>  	bool
>  	default y
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGBM
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	# libpthread-stubs -> libdrm
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index 5ad3ea2cb4..e8d6f71dad 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
>  GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
>  
>  ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
> -GLMARK2_DEPENDENCIES += libdrm libgles udev
> +GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
>  GLMARK2_FLAVORS += drm-glesv2
>  endif
>  
> -- 
> 2.30.2
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
