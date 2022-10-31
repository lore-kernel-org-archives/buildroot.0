Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF53C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D2D40476;
	Mon, 31 Oct 2022 10:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D2D40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lV6ff0sZetO2; Mon, 31 Oct 2022 10:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F1E04057F;
	Mon, 31 Oct 2022 10:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F1E04057F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 441E71BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CFFB60B3D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFFB60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24lSCcsxiA8B for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:02:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139C260B2E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 139C260B2E
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:02:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 513FCB0055E;
 Mon, 31 Oct 2022 11:02:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:02:13 +0100
Date: Mon, 31 Oct 2022 11:02:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221031100213.GY1058960@scaer>
References: <20221030194423.1208535-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030194423.1208535-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210536;
 bh=qii4BU4/m6eVfIFewFjgYnSPakO5+yb1DTAJzxIiDJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t6qQiYZiQDXhsQf+KPXN5dA8bTV4E679LqbIp1KqUA35f8DIt1oaLtUCKVljCFMrS
 nsvPpBthnKpLbZw93xGMd0Pu2eyHxuphFs90Pyrh062Yzk7LMRvYw79tg3TqZJmYcE
 imrup/34SEq+x7f/36SoDVXHWXL5yiVnyYNRQWZ6uQL332Cc5Qg+NNOr0YTm2ZP08b
 DJm6hdIk6sH5omNGjQXZwZLbDe2CWG63RWJPbtcQttrzceFCEhueyJ+4AxKB/pvKr0
 50F+PiomZsWx3iHljV0MBEVghQMC6X6I5svLxvyJy+KPwU5KhvhHIJeDls3Qxoof2s
 UxCSs7FmJvuvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t6qQiYZi
Subject: Re: [Buildroot] [PATCH 1/1] package/flac: bump version to 1.4.2
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

On 2022-10-30 20:44 +0100, Bernd Kuhls spake thusly:
> Changelog: https://xiph.org/flac/changelog.html
> 
> Switched _SITE to https and update project URL.
> 
> Upstream removed the dependency to host-nasm:
> https://github.com/xiph/flac/commit/75ef7958df603ca6de29fa00e82615e0da017903#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810L474
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flac/Config.in |  2 +-
>  package/flac/flac.hash |  4 ++--
>  package/flac/flac.mk   | 11 ++---------
>  3 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/package/flac/Config.in b/package/flac/Config.in
> index 267acb7f34..62aca290fe 100644
> --- a/package/flac/Config.in
> +++ b/package/flac/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_FLAC
>  	help
>  	  FLAC is an Open Source lossless audio codec.
>  
> -	  http://flac.sourceforge.net/
> +	  https://xiph.org/flac/
>  
>  comment "flac needs a toolchain w/ wchar"
>  	depends on !BR2_USE_WCHAR
> diff --git a/package/flac/flac.hash b/package/flac/flac.hash
> index 1f7763fd6e..b993ebd759 100644
> --- a/package/flac/flac.hash
> +++ b/package/flac/flac.hash
> @@ -1,5 +1,5 @@
> -# From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
> -sha256  af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506  flac-1.4.0.tar.xz
> +# From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
> +sha256  e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4  flac-1.4.2.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
> diff --git a/package/flac/flac.mk b/package/flac/flac.mk
> index 91d5840d72..ebb4778521 100644
> --- a/package/flac/flac.mk
> +++ b/package/flac/flac.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -FLAC_VERSION = 1.4.0
> -FLAC_SITE = http://downloads.xiph.org/releases/flac
> +FLAC_VERSION = 1.4.2
> +FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
>  FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
>  FLAC_INSTALL_STAGING = YES
>  FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> @@ -27,11 +27,4 @@ else
>  FLAC_CONF_OPTS += --disable-ogg
>  endif
>  
> -ifeq ($(BR2_X86_CPU_HAS_SSE),y)
> -FLAC_DEPENDENCIES += host-nasm
> -FLAC_CONF_OPTS += --enable-sse
> -else
> -FLAC_CONF_OPTS += --disable-sse
> -endif
> -
>  $(eval $(autotools-package))
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
