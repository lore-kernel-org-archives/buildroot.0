Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D962C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DE160B02;
	Tue, 15 Mar 2022 21:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mda3XEiu9Wy; Tue, 15 Mar 2022 21:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B41360AFB;
	Tue, 15 Mar 2022 21:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FF71BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 617B3416F5
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJnZj5Vo2Bpa for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:20:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58B8241607
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:20:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b15so448619edn.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZS0JdiRtfeHGCwrx4BZ1f6asbUN/uNcnEa1MMUYXqKM=;
 b=FUhyCQ8Ua6daNxqK4BJKjx4b8prTaP/0A2zSaGBP4Mys2T4KTCye28ka1A3GiGOMsM
 dXevLYhP+dIP2BuYzVVSFYMf+dLcbBW2dGOSeOVaScAJZDeAa0b/8WUSpZwXgtwXOHtk
 6burrGELDoU991yT1N0Vbr1BANkgzslzNMCUKHM3AHMFHL4Y2J/NkzKq3odRdhWu3u6i
 F/87Sopnu6fG/CKDgvbm1X65N8mAtzZ4MSgBRK68iGfu/GQSRRhgPto6jW74hMDm3hZx
 7SxAE9uaB/+36FjeA1Zlg0HBoZeijgLVQM52JbC36NvcYmQ5jVUcfnUHDzkek2vNxymp
 Crgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZS0JdiRtfeHGCwrx4BZ1f6asbUN/uNcnEa1MMUYXqKM=;
 b=HOLsclzF1+15VXuA4YtYasLNauYfvRRbsA1Q5vC6iJY7AoaSjmOuG9utXmvvQVzNnv
 LnYr2S5SmvXTjTtdkqQH6sPQMSrBSJPsLh94uGWE4gGVVtNGYr8N65WtxUMWWMNrcSas
 DIBG7qV0gNQywlCorkOvoljUg+EP5hU6w7xAq/YxkOP2SUGSmca3cnVn89Onc/FfnH2N
 3MibhJWVywKlYMFA8qPV4fUxrBDeA1NIn1gHW5s4gpqx9kvncNQqdop9BjVDfi4aSTKh
 K4cfD59EQE6FO4jwWrHFDPvovhP5pD24B1UYL68+gA/r2XOZN1YDAwPQBre5cR+4ITna
 6BtA==
X-Gm-Message-State: AOAM533GjPbEOXFRJpVlC15rew6ua4t+U/ewvR6Q2qBdCchvpZJZx6g4
 i8O/0LZl0UktRaDzfhDVWz6NJOvYr8dxcA==
X-Google-Smtp-Source: ABdhPJyxXupzeKe2DX+/m9f/Z1RCVkCk6s9PhaGTmEnwFM9y2/Mw+8C/feG9waNP1Y4D09f3edMGjg==
X-Received: by 2002:a05:6402:150f:b0:416:175d:3f5d with SMTP id
 f15-20020a056402150f00b00416175d3f5dmr27110625edw.184.1647379204504; 
 Tue, 15 Mar 2022 14:20:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a1709062a0700b006bc28a6b8f1sm55358eje.222.2022.03.15.14.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:20:04 -0700 (PDT)
Message-ID: <2a12dfa3-9ca9-193f-bdd8-690e489df42e@mind.be>
Date: Tue, 15 Mar 2022 22:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220303174121.55867-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220303174121.55867-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next v3 1/1] package/kodi: bump version to
 19.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/03/2022 18:41, Bernd Kuhls wrote:
> Add dependencies to giflib, libjpeg and libpng due to
> https://github.com/xbmc/xbmc/pull/20462
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v3: removed remnants from internal patch, sorry for the noise
> v2: added dependencies to giflib, libjpeg and libpng
> 
>   package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>   package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>   package/kodi/Config.in                                   | 3 +++
>   package/kodi/kodi.hash                                   | 2 +-
>   package/kodi/kodi.mk                                     | 5 ++++-
>   5 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> index 81fc2bb9f1..8cc2297bdb 100644
> --- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> @@ -6,7 +6,7 @@
>   
>   # Not possible to directly refer to kodi variables, because of
>   # first/second expansion trickery...
> -KODI_JSONSCHEMABUILDER_VERSION = 19.3-Matrix
> +KODI_JSONSCHEMABUILDER_VERSION = 19.4-Matrix
>   KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
>   KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
>   KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
> diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
> index 2ebcd7d8de..4733399edc 100644
> --- a/package/kodi-texturepacker/kodi-texturepacker.mk
> +++ b/package/kodi-texturepacker/kodi-texturepacker.mk
> @@ -6,7 +6,7 @@
>   
>   # Not possible to directly refer to kodi variables, because of
>   # first/second expansion trickery...
> -KODI_TEXTUREPACKER_VERSION = 19.3-Matrix
> +KODI_TEXTUREPACKER_VERSION = 19.4-Matrix
>   KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
>   KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
>   KODI_TEXTUREPACKER_DL_SUBDIR = kodi
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index f31bf19b99..ebc95343a9 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -72,6 +72,8 @@ menuconfig BR2_PACKAGE_KODI
>   	select BR2_PACKAGE_FONTCONFIG # needed for libass
>   	select BR2_PACKAGE_FREETYPE
>   	select BR2_PACKAGE_FSTRCMP
> +	select BR2_PACKAGE_GIFLIB
> +	select BR2_PACKAGE_JPEG
>   	select BR2_PACKAGE_LIBASS
>   	select BR2_PACKAGE_LIBCDIO
>   	select BR2_PACKAGE_LIBCROSSGUID
> @@ -81,6 +83,7 @@ menuconfig BR2_PACKAGE_KODI
>   	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>   	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
>   	select BR2_PACKAGE_LIBPLIST
> +	select BR2_PACKAGE_LIBPNG
>   	select BR2_PACKAGE_LZO
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_PCRE
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 7f96af385a..a17e0fb29f 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  440f47e475dd8a48e0a6d41349e83b74890f3fbe8275d3e401d3c50f5b9ea09b  kodi-19.3-Matrix.tar.gz
> +sha256  cc026f59fd6e37ae90f3449df50810f1cefa37da9444e1188302d910518710da  kodi-19.4-Matrix.tar.gz
>   sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
>   sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
>   sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 56e901fa17..7326cd536d 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please also update kodi-jsonschemabuilder
>   # and kodi-texturepacker
> -KODI_VERSION_MAJOR = 19.3
> +KODI_VERSION_MAJOR = 19.4
>   KODI_VERSION_NAME = Matrix
>   KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
>   KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
> @@ -25,6 +25,7 @@ KODI_DEPENDENCIES = \
>   	fontconfig \
>   	freetype \
>   	fstrcmp \
> +	giflib \
>   	host-flatbuffers \
>   	host-gawk \
>   	host-gettext \
> @@ -34,6 +35,7 @@ KODI_DEPENDENCIES = \
>   	host-nasm \
>   	host-swig \
>   	host-xmlstarlet \
> +	jpeg \
>   	libass \
>   	libcdio \
>   	libcrossguid \
> @@ -42,6 +44,7 @@ KODI_DEPENDENCIES = \
>   	libegl \
>   	libfribidi \
>   	libplist \
> +	libpng \
>   	lzo \
>   	openssl \
>   	pcre \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
