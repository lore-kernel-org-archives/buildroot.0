Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF05EB64DC
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DEE41B94;
	Thu, 22 Jun 2023 16:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DEE41B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhI2fimQaR_I; Thu, 22 Jun 2023 16:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3D54204C;
	Thu, 22 Jun 2023 16:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3D54204C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 571801BF484
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30ECB83C22
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30ECB83C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOiMktthC1UI for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:46:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9604983BE0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9604983BE0
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:46:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1pscY52tnk-00xdfl; Thu, 22
 Jun 2023 18:46:25 +0200
Date: Thu, 22 Jun 2023 18:46:24 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230622184624.71efcb4b@gmx.net>
In-Reply-To: <20230622140945.3717948-1-dario.binacchi@amarulasolutions.com>
References: <20230622140945.3717948-1-dario.binacchi@amarulasolutions.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:eJhSfD3CozE9XahTypk2aapDMxh2+BnP3spWP4pTSH/piK1/5C6
 RHghp7eakak8Lya98Z26nmDVxyPV9AT4Wiy4MeJ2llQ7iaRS3A7GeQ+8VcoW4v5SJD18B8S
 toJPda6sscrTtuNFXyUis6saV4+6qKcNDfeWdG/MUIk3wl95x4fkyv+SqRSmyY8cjoSXoGH
 hMycD6J1pBaEAA3isbq4A==
UI-OutboundReport: notjunk:1;M01:P0:fqQnlSMUx8o=;YATyL1qveS1zz+7WAaVIqxsFALd
 IZqWeGfNrZqc184fe7tXyzuCU6zetaDVp24uW0VMv4NV5liyiNvVyVf365sp0qUoPgA6fULds
 KxO01CCejJ6YHh0K88ZeIGP4gdvWFzFyE8YtpZ6tF1XEO7VTd4lJEOxtEC3TzqDiJRlJhDQiK
 WerIidlRd38eSBlLGK1aWqhpdLRyDQQEKRtBznFPBYnkRqPOI6KF7p7Kegt4JhrT4ZchztGHM
 df8NM2cZoQX1VdSoaUxuWM1ys1om6o2QwMdAp7nLpyV/+0RzkbTtHB5/u7By7SprTZpU5MLs8
 6Nj/ODak11vGE0qiv1QIExgY0+r/Om2tV7rdzJLhXz0WMU4UaMBzkwku7M8P6TFX1en3ACEa6
 MOHaNxSAr0pvdvSqpKIw7E9TovLoM0BsAWhLUbpfyos7pJ+I/b5PDqMIvix8Rdxq8WGvIlWlH
 VvBUHx2UNub1Nq53xP75AqRfB+g2BweJNWQJrKgUN47/ups/6UZhLlMZz0HNMHhiZuhQLq5xz
 6aCK9XAKP/JyLCipdbvgJ049vdKIiWTuiualE9mk5d8Na+wH4VnYFR8kb35V3j5fhH/sO8MyN
 Y/CsIQIyzk6JWNhCX6dcVlEgLQjDa1rl0POKg35R3VK5kCPkoY74hT9cFxqOBCfYv0ws3QgRF
 RbjhB74/cHx7FkwpuWoqOodpwoBBAWXsiiOsz1ulLlp0wwTFzTuDbLKeuK8wobLx/m3b583kb
 XYP6xkxaCvyN4+Pjz4KPwr7GVKM32tHw5HVIFFPzg29lzpY4Puf3tng/Dd8ahFwINuOpJcK0n
 nMaoQIESIv6KHHAOjAxerpcO8safRmhZFxpk//2EjhxMIpMqekQffXvM4vBv6JOCcvLSTOE+t
 6Sr6VcvfFFZByBiyY86t1J7EiRtmH/Ce4AnBla8fnCWEFFacAcmMUU278l+Z7OtJ4PZEw0FgS
 kTevUT3+wrfN5PG5TaqOWyYoiG0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1687452385; x=1688057185; i=ps.report@gmx.net;
 bh=+SVKBL+2CBgliQtr0OnK4SFAIgIIHD8jNnRTsWMPa5I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dOGfmrXthlrt+WWVMOyLJ8K9dMGSX5bdDsORM0m+bRC+rJZBh4O4cKAXFHHV6hWGYvFRiHV
 3s+bj8t0RNNTawKdFOndSr/TYQv8BOcbWNa1n6pdCZPJ4CFtEXvw8qLRbyvcjoXHd/kgx9C2f
 +T277ajLPR6Ach+G1K8HigPxGDSL/eGikmV2jM3K/cwlhQpuhRSF4/mdgxHGhoU7fnkfDoQIk
 82Ug6nKuvdYFVM8kB0STe4s4XFEg0C1ZLoKXcYIeSxd3CdlfRVCGqMOGvHYW6PMfeE3wEn/2f
 tDTAUSfU5eu/0YPSNDiFmVlQgyiYhaFioYc1liEeQO8l1aHbzYMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dOGfmrXt
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good:
 add adaptivedemux2 plugin option
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Thu, 22 Jun 2023 16:09:45 +0200, Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Currently there is no explicit way to enable/disable the adaptivedemux2
> plugin. Create a menu entry allowing users to disable or enable the plugin,
> like we have for other features.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in            | 7 +++++++
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 6 ++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index d7ec16e80014..3e849307831b 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -32,6 +32,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2
>  	  Enable bz2 support for the following plugins:
>  	  matroska
>
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
> +	bool "Adaptive Streaming 2 support"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBSOUP
> +	help
> +	  Adaptive Streaming 2 plugin
> +

Please move this somewhere below the 'comment "plugins with external dependencies"' line...

>  comment "dependency-less plugins"
>
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index bbcd3aecabd1..c26e32a1841e 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -58,6 +58,12 @@ GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
>  GST1_PLUGINS_GOOD_DEPENDENCIES += orc
>  endif
>
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled

Missing:

	GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2

Regards,
Peter

> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
>  else

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
