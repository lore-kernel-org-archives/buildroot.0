Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B63FCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 07:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08949606C5;
	Wed, 10 Apr 2024 07:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzkYa3_13W_O; Wed, 10 Apr 2024 07:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F014D606CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F014D606CE;
	Wed, 10 Apr 2024 07:59:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 141C51BF25B
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 07:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 011E9606C5
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 07:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4paxSqXzxzY for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 07:59:38 +0000 (UTC)
X-Greylist: delayed 502 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Apr 2024 07:59:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28B10606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B10606CE
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28B10606CE
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 07:59:36 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 53E48BDE52BC;
 Wed, 10 Apr 2024 09:51:11 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 07:51:11 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <mailman.4868.1712490480.13795.buildroot@buildroot.org>
References: <mailman.4868.1712490480.13795.buildroot@buildroot.org>
Message-ID: <e94e1cf25bad718a716f54695ff69791@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1712735471; bh=DgYd1jzkkd7No4yy7++H72cTprNNXHm7n/h6uGO+TkU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=wLmgv6S2sRPf3eN7XUXZBId0ohq5I4mEKJ4MvPRPHzk6DnH/pRrmmimp1nheS/L0s
 7lNW2OetBcu4fL5ocbVY6A+wildmahCO77TRQbQgsgLmg5TIychMkYc9vwl/VZrIMP
 7e0DkNRbNKaTuI9R546yrGwymQgbdg7OGyGrBtdI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=wLmgv6S2
Subject: Re: [Buildroot] [PATCH v2 04/20] package/ffmpeg: bump version to
 6.1.1
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

I would like to suggest some enhancements to your patch.

On 2024-04-07 13:44, Bernd Kuhls wrote:
> 
...
>  package/ffmpeg/Config.in                      |  9 +-
>  package/ffmpeg/ffmpeg.hash                    |  2 +-
>  package/ffmpeg/ffmpeg.mk                      | 12 +--
...
> diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
> index 52029c2ade..599e1ddfc7 100644
> --- a/package/ffmpeg/Config.in
> +++ b/package/ffmpeg/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  menuconfig BR2_PACKAGE_FFMPEG
>  	bool "ffmpeg"
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  FFmpeg is a complete, cross-platform solution to record,
>  	  convert and stream audio and video.
> @@ -74,11 +75,6 @@ config BR2_PACKAGE_FFMPEG_XCBGRAB
>  	help
>  	  X11 screen grabbing using libxcb.
> 
> -config BR2_PACKAGE_FFMPEG_AVRESAMPLE
> -	bool "Build libavresample"
> -	help
> -	  Avresample is a audio conversion library for compatibility.
> -

Since libswresample is the replacement for libavresample, it would be 
convenient to retain this config option:

config BR2_PACKAGE_FFMPEG_SWRESAMPLE
	bool "Build libswresample"
	help
	  The libswresample library performs highly optimized audio re-
	  sampling, rematrixing and sample format conversion operations.

>  config BR2_PACKAGE_FFMPEG_POSTPROC
>  	bool "Build libpostproc"
>  	depends on BR2_PACKAGE_FFMPEG_GPL
> @@ -186,3 +182,6 @@ config BR2_PACKAGE_FFMPEG_EXTRACONF
>  	  ./configure commandline.
> 
>  endif
> +
> +comment "ffmpeg needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
...
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index ce285bcc60..acd5a7d8b2 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -FFMPEG_VERSION = 4.4.4
> +FFMPEG_VERSION = 6.1.1
>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = https://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> @@ -32,10 +32,6 @@ FFMPEG_CONF_OPTS = \
>  	--disable-gray \
>  	--enable-swscale-alpha \
>  	--disable-small \
> -	--enable-dct \
> -	--enable-fft \
> -	--enable-mdct \
> -	--enable-rdft \

avfilter and avdevice are enabled by default and might also be removed.

>  	--disable-crystalhd \
>  	--disable-dxva2 \
>  	--enable-runtime-cpudetect \
> @@ -93,12 +89,6 @@ else
>  FFMPEG_CONF_OPTS += --disable-libv4l2
>  endif
> 
> -ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
> -FFMPEG_CONF_OPTS += --enable-avresample
> -else
> -FFMPEG_CONF_OPTS += --disable-avresample
> -endif
> -

This would become:

ifeq ($(BR2_PACKAGE_FFMPEG_SWRESAMPLE),y)
FFMPEG_CONF_OPTS += --enable-swresample
else
FFMPEG_CONF_OPTS += --disable-swresample
endif

>  ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
>  FFMPEG_CONF_OPTS += --enable-ffprobe
>  else

...

Searching for additional space-saving options, I found that libavfilter 
/libavdevice may be omitted, if no filters /no devices are specified:

# libavfilter is unnecessary if no filters are configured
ifeq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_FILTERS)),)
	FFMPEG_CONF_OPTS += --disable-avfilter
endif

# libavdevice is unnecessary if no devices are selected
ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS)$(BR2_PACKAGE_FFMPEG_OUTDEVS),)
	FFMPEG_CONF_OPTS += --disable-avdevice
endif

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
