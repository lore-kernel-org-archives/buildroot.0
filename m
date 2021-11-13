Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8965C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5450D6108E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5450D6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8D780890;
	Sat, 13 Nov 2021 09:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWxZGQAu3HVM; Sat, 13 Nov 2021 09:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48681825DC;
	Sat, 13 Nov 2021 09:53:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 451861BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34797405C4
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ca-PXbfbNpxi for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE91405B5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:53:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B7FB419F5A5;
 Sat, 13 Nov 2021 10:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636797200;
 bh=3Q2XPInbg0DJKUqbICp+0SQyPVQI2JWfqP6TVmj3KUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vy11l35xeiK3NBS0N+kv5GWD/kQufHlX+aurWF8yoOlS8mrKtV1FgSFEtSRCHKhK/
 sbqaPzC0P4tEsn6D8Y19+LvlG16JKTKnfn6qtbTIh1SH9mgXJKvlAksRpBfIiO8ECt
 HioExEwdz+UT/7L7QaEhOYtDwJQYuzNB51xTEx85S1aUXldPEP+o/jxUBgbbze/xLB
 4Nrz9JW4wRlktw7lNen6IQWB7wXYK51VzIf4otwGGTYwSYJt7yFk9gFEN8Ftf7p8VI
 awgMZCHDq3ij4g0YwSP0qNfA5pYlljbOUnP2gU90BFvgDmCZl8IVCjyT1FLjprCWp4
 FR9zCOV4Vp8zg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 10:53:16 +0100
Date: Sat, 13 Nov 2021 10:53:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211113095316.GP247986@scaer>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113093009.6915-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/3] package/glmark2: drm-glesv2 needs
 libdrm
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
> Fixes:
> http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: moved libdrm select to main symbol (Yann)
> 
>  package/glmark2/Config.in  | 3 +++
>  package/glmark2/glmark2.mk | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 40d0adcc8a..3ef3a0e8e3 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -7,6 +7,8 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_UDEV
> +	# libpthread-stubs -> libdrm
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

The comment to explain the dependency goes on the same line as the
dependency.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
>  
>  config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
> @@ -63,6 +65,7 @@ config BR2_PACKAGE_GLMARK2
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>  	depends on BR2_PACKAGE_GLMARK2_FLAVOR_ANY
>  	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
>  	select BR2_PACKAGE_LIBPNG
>  	help
>  	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index 5c2dd06362..5ad3ea2cb4 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
>  GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
>  
>  ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
> -GLMARK2_DEPENDENCIES += libgles udev
> +GLMARK2_DEPENDENCIES += libdrm libgles udev
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
