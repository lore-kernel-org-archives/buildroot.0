Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB485C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C44383CB5;
	Sat, 31 May 2025 16:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laSERF1yC_s7; Sat, 31 May 2025 16:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B150383B95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B150383B95;
	Sat, 31 May 2025 16:57:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3057235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93A26072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnpjjVSkYNTw for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18056607FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18056607FA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18056607FA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F70E1C0D69; Sat, 31 May 2025 18:57:45 +0200 (CEST)
Message-ID: <a48d9389-f3a2-4f2f-818b-c23cefbaf0ad@rnout.be>
Date: Sat, 31 May 2025 18:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
 <20250516210452.342275-3-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516210452.342275-3-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ie6NeYzxp5rflGfUFwjqx8dJ9TatcN4yPq541VsOtQs=;
 b=H3efgquwlCWwosd423/hABDwavyZ8+Ixxadk+dQQadP3AT7/jDPWcQNsT+yQv0npLCaZyn
 5XM93rEf83S/8diMZRHIkzxDfME/DJU+cRhHMQKd2hHY52+9/+gIqOG9U9xTftwlyuZqE6
 Eiv0euaLOP8Y0uP2zrj4naiZL/3NRunQQuee7bOKvkAewokd4M983DVvGtZ/lpBHOcmw3K
 m3dzHPFDqiWnIz8CoTU/wW8/j7h74KjDBRI32EtBGNiHR6o6uHDeKqYxiG8wyW0ZUQVqrp
 bjMuTXfz4bIsE9QOFKTuPy6DVyatZ3EBIofQl9JqqZCAbxPm10hx5r4tBrrLxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=H3efgquw
Subject: Re: [Buildroot] [PATCH 2/4] package/qt6/qt6multimedia: fix ffmpeg
 plugin build for x11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 23:04, Thomas Petazzoni via buildroot wrote:
> From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> 
> The following defconfig:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6BASE_XCB=y
> BR2_PACKAGE_QT6MULTIMEDIA=y
> BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
> BR2_PACKAGE_XORG7=y
> 
> would fail to build, due to <X11/extensions/Xext.h> being not found,
> and then <X11/extensions/Xrandr.h> being not found. Fix that up by
> introducing the necessary dependencies.
> 
> There are no build failures reported for qt6multimedia in the
> autobuilders, so there is no reference to a build failure.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/qt6/qt6multimedia/Config.in        | 5 +++++
>   package/qt6/qt6multimedia/qt6multimedia.mk | 6 ++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
> index ae555f98ea..3107caa597 100644
> --- a/package/qt6/qt6multimedia/Config.in
> +++ b/package/qt6/qt6multimedia/Config.in
> @@ -38,6 +38,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
>   	select BR2_PACKAGE_FFMPEG_SWSCALE
>   	select BR2_PACKAGE_QT6BASE_CONCURRENT
>   	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
> +	# libxext/libxrandr are needed for ffmpeg plugin to build with
> +	# X11 support:
> +	# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
>   	help
>   	  This option enables ffmpeg media backend.
>   
> diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
> index 98ab2ec4be..c2a9d250cf 100644
> --- a/package/qt6/qt6multimedia/qt6multimedia.mk
> +++ b/package/qt6/qt6multimedia/qt6multimedia.mk
> @@ -66,6 +66,12 @@ endif
>   ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
>   QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
>   QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
> +# libxext/libxrandr are needed for ffmpeg plugin to build with X11
> +# support:
> +# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
> +endif
>   else
>   QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=OFF
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
