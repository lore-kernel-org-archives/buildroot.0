Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4035C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3AE61264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C3AE61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5858403F3;
	Thu, 11 Nov 2021 20:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RD388YMYhFIJ; Thu, 11 Nov 2021 20:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB31940471;
	Thu, 11 Nov 2021 20:38:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 052A21BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021B340565
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Pi1lgnWgfHE for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:38:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C9A40413
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:38:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E715F19F58D;
 Thu, 11 Nov 2021 21:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636663100;
 bh=oAL1BR4QEosCyeUs/gQ0EVycTrCsGd3vncF1IRDGFEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MSzgQKOLf5ASg+N5DPKndMKXqegxBOXBLBCm0x+PnZ52R4wQRgUHKUJqbZWWoZMMY
 G5DsYtQ0ssw9eoi/BauLIzoppmHgALK7uBLI2JHnt/v/pvNDrhwsHCE17PklCdCn+d
 C8OyVbKT6QOZouqKf6Ona/tuQMsrjuG1OUeJ17G+fF+3YQyNBEQn2IODp7Bo3oCzAs
 CovUP4ORTrJ7xlDn5YrMQNO6qFTA6/hvCcqJl81N4UiLWUGBG/pUbu9UCPktKoaqY3
 6NDmoSrCZaRve1CfhS3l+5KXfevYQR2m88IRtal9A1QrGAGWz+c0y7If60ILFcT4dC
 ZOuzaMTyeU1ug==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 21:38:13 +0100
Date: Thu, 11 Nov 2021 21:38:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211111203813.GB2609@scaer>
References: <20211109202921.2031664-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109202921.2031664-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/glmark2: drm-glesv2 needs libdrm
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-11-09 21:29 +0100, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> re-sent deferred patch
> http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-1-bernd.kuhls@t-online.de/
> 
>  package/glmark2/Config.in  | 3 +++
>  package/glmark2/glmark2.mk | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 40d0adcc8a..96b34f971a 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -7,7 +7,10 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_UDEV
> +	# libpthread-stubs -> libdrm
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
> +	select BR2_PACKAGE_LIBDRM

Oh no no no no!

This means that, even if glmark2 is not enabled, then libdrm will
forcibly be enabled in a configuration with libelg, libegls, and udev.

This is not correct *at all*. And IIRC, we already fixed a similar case
not so long ago... Ah, there it is:

    b80c488d04 package/kodi: fix selection of dependencies

And now, I also notice that there is already such a bug in glmark2,
where wayland protocols will also forcibly be enabled in a configuration
with egl, gles, and wayland, even when glmark2 is not enabled.

Globally, I think glmark2 needs a bit of refactoring: it is very unusual
that the feature-set is before the main symbol. Usually, we have, in order:
  - ARCH_SUPPORTS et al.
  - main symbol
  - if-block with all options.
  - comment(s) about toolchain features et al.

Could you look into that, and respin a full series that fixes all these
issues in glmark2, and adds the missing dependencies, please?

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
>  	bool
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
