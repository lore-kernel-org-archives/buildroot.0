Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E81C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E219841BEB;
	Wed, 27 Dec 2023 22:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E219841BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8pe4GUD3Ut7; Wed, 27 Dec 2023 22:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C176941BF8;
	Wed, 27 Dec 2023 22:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C176941BF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B78D01BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D819610F9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D819610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqtaz85r9mBh for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:16:10 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ECE1610B8
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ECE1610B8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C5B81B0055A;
 Wed, 27 Dec 2023 23:16:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:16:04 +0100
Date: Wed, 27 Dec 2023 23:16:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZYyiJOUePibRgeQq@landeda>
References: <20231109212901.5596-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109212901.5596-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703715369;
 bh=wt8hQo7mh/dqn5HqbKzh/HdCCk89OWFNwzvfLCnxxIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcvxesXqeerVnmdS5ulpkwf5piCslc7JOQdVQ+lmaiFKV8KGNe8qSLtVnU9qGGh1R
 G30UBBp3eAPid9G1OIlUn+YHZgpp64NAa7XTJj6iZZuUF28ZlOhWQMvBw9vDIbP4mP
 eN4DsrzTtN8LnlEl7+he8HmV8P3/VNLn73zPURiDnu1S+3mUM1rQULo29x/L8xrIbl
 X2rc+/P7GqeQsNGKP5Ws4vByuRkFM2phU114ZjmsaYqhY9ht+BU3sR/99E7IvUW/Er
 9Wa7qAX/fN+Rbw/7GGsLkoGdDRgJn6kwJkx1dA0rMmuOkyfobaERjCpPUBWqunn7Hb
 ncnzXFaF5JHug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BcvxesXq
Subject: Re: [Buildroot] [PATCH v1 1/4] package/libcamera: pipeline option
 'raspberrypi' changed to 'rpi/vc4'
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-11-09 22:28 +0100, Peter Seiderer spake thusly:
> With upstram commit [1] (since version v0.1.0) the pipeline option 'raspberrypi'
> was renamed to 'rpi/vc4'.
> 
> Change the buildroot option name from BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> to BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4 (and add Config.in.legacy entry
> accordingly) and move handling in Config.in/libcamer.mk to follow alphabetic
> ordering.
> 
> Fixes:
> 
>   .../build/libcamera-v0.1.0/meson.build:3:0: ERROR: Options "raspberrypi" are not in allowed choices: "all, auto, imx8-isi, ipu3, rkisp1, rpi/vc4, simple, uvcvideo, vimc"
> 
> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=726e9274ea95fa46352556d340c5793a8da51fcd
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy               | 10 ++++++++++
>  package/libcamera/Config.in    | 16 ++++++++--------
>  package/libcamera/libcamera.mk |  6 +++---
>  3 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 6fef2318b0..06a40f0b38 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,16 @@ endif
>  
>  comment "Legacy options removed in 2023.11"
>  
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> +	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
> +	depends on BR2_arm || BR2_aarch64
> +	depends on BR2_USE_WCHAR
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
> +	help
> +	  Since version ... the libcamera pipeline option 'raspberrypi' was
> +	  renamed to 'rpi/vc4'.
> +
>  config BR2_PACKAGE_OPENJDK_VERSION_11
>  	bool "openjdk 11 has been removed"
>  	select BR2_LEGACY
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 63c06173db..65d5fb37f8 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -40,21 +40,21 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
>  	help
>  	  Pipeline for Intel IPU3.
>  
> -config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> -	bool "raspberrypi pipeline"
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
> +	bool "rkisp1 pipeline"
>  	depends on BR2_arm || BR2_aarch64
> -	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
> -	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	help
> -	  Pipeline for Raspberry Pi devices.
> +	  Pipeline for Rockchip ISP1.
>  
> -config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
> -	bool "rkisp1 pipeline"
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
> +	bool "rpi/vc4 pipeline"
>  	depends on BR2_arm || BR2_aarch64
> +	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
> +	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	help
> -	  Pipeline for Rockchip ISP1.
> +	  Pipeline for Raspberry Pi devices.
>  
>  config BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE
>  	bool "simple pipeline"
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8dce67f60f..c1c8bb7b33 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -51,11 +51,11 @@ LIBCAMERA_CONF_OPTS += -Dv4l2=false
>  endif
>  
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
> -ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
> -LIBCAMERA_PIPELINES-y += raspberrypi
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
> +LIBCAMERA_PIPELINES-y += rpi/vc4
>  LIBCAMERA_DEPENDENCIES += boost
>  endif
> -LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
> -- 
> 2.42.1
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
