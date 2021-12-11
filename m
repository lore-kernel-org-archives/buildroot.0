Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32829C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA13F60768;
	Sat, 11 Dec 2021 20:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozpaax6OiOpC; Sat, 11 Dec 2021 20:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CEB60D73;
	Sat, 11 Dec 2021 20:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 921E31BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78E7C60D73
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3Q1l8lcQsMA for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC80760768
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:51:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so39469422eda.12
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=I/Jd8Tb7uJVxbF9qokg3KjPnX3jmOFEE5LH1Y6W1QsM=;
 b=d++WZTIK8nujs0xnmBTDePBcSiUtWLZeNscGaco3BJQBNqniSN+Zbog/68XtRyYpS6
 /Eu0b9afnvjoeiqBK/oxxE8HKGGE4oGHyXkm943IjMFX6t6uHvjxWkkvbD+hRpjxJUrs
 N246mrgNSIzJLAg1eb40cBFbciHdE0d5LKUzS6XSrUag2EL3Yve58fgtlOpndBm2GUW3
 wHbyXIsMJ2opsxjdLwN8osnTDLKpxxm5apTckb1gIeie0RnkqVIPEZ/Zw487obYO/5qT
 fEzerXa9hsgmWuVwgEKQSyaL+bg4QOLTryO9l3em5Fvna9x8evPV5T9IqlDUt4kBSuBG
 4H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I/Jd8Tb7uJVxbF9qokg3KjPnX3jmOFEE5LH1Y6W1QsM=;
 b=obMDdZ5Y3OYZbNSOmCf8k2vr4OH9oXZtGYOSR/LWULrIBERe3hVliZ4hBKfUKM2wPk
 jdrwEejTnE88DoQkzhARBTZsJYaK5gMaoNXbEt47MJxqhRR7NJjo/OfbF8Gf8/mo++ks
 w/hlGfwnAjOlT40Vu+liAuWFq4mFOoDYVEoggorGMYAaMaG/mkFKYjDkSeYrl0mg2i2w
 VGnESj/hWfNfwJBnYrrrRuKhhCZaA0rwObjkRn8cgnvgi4Qm888+56oA3ju04gk5TruT
 g+Rrn+Ep1H4R/2PpuxND9MBj/p7IRZIZdGjReq0iV+tUq9OvNJFqfy1wzWnV+gl8XL1Q
 quJw==
X-Gm-Message-State: AOAM532bHz6HNoRsEf3n5ev05r41MAAFFEeWWV1kxSRkYX6shUcaotUU
 TUY5U44AbKzpxfrMQIL84V+8Drbga1qKFg6VSbc=
X-Google-Smtp-Source: ABdhPJyrRkvJAICW/NQGQcqxaQLRz/wwr7URl/M0hF57IxNaJOet8Hd+2brHzIJfUP2Pn+yoxRsJxg==
X-Received: by 2002:a05:6402:3589:: with SMTP id
 y9mr51616783edc.44.1639255915079; 
 Sat, 11 Dec 2021 12:51:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cq19sm3552925edb.33.2021.12.11.12.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:51:54 -0800 (PST)
Message-ID: <d1b08aba-fd00-9681-76d7-45b6248be1ab@mind.be>
Date: Sat, 11 Dec 2021 21:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20211124212101.3037723-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124212101.3037723-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cog: bump to verion 0.12.0
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



On 24/11/2021 22:21, Adrian Perez de Castro wrote:
> This new release includes a number of improvements. Release notes:
> 
>    https://wpewebkit.org/release/cog-0.12.0.html
> 
> Small tweaks were needed due to the "fdo" platform backend being renamed
> as "wl"; the symbol is kept as BR2_PACKAGE_COG_PLATFORM_FDO to avoid
> breaking existing configurations. Also the new version supports building
> with libsoup3, which is not yet packaged in Buildroot, so -DUSE_SOUP2=ON
> is always passed to CMake.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cog/Config.in | 4 ++--
>   package/cog/cog.hash  | 8 ++++----
>   package/cog/cog.mk    | 9 +++++----
>   3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index 5f00c5a2dd..d4238750f9 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -28,12 +28,12 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>   	  must be always specified in the command line.
>   
>   config BR2_PACKAGE_COG_PLATFORM_FDO
> -	bool "FreeDesktop.org backend"
> +	bool "Wayland backend"
>   	default y
>   	select BR2_PACKAGE_LIBXKBCOMMON
>   	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>   	help
> -	  Enable the FreeDesktop.org backend. Cog will interface with
> +	  Enable the Wayland backend. Cog will interface with
>   	  a compositor over the Wayland protocol.
>   
>   config BR2_PACKAGE_COG_PLATFORM_DRM
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 3abc5f2c83..6a9af1845d 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
> -md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
> -sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
> -sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.12.0.tar.xz.sums
> +md5  30d6f68914af0ba5c32ac14df504215a  cog-0.12.0.tar.xz
> +sha1  de367b33fb45a1bca9e443ca5c1d6cae3833d759  cog-0.12.0.tar.xz
> +sha256  aad413a8aaf15d400d70f9c909a28b92b138f7b0c0d825978de8788d0d75208a  cog-0.12.0.tar.xz
>   
>   # Hashes for license files:
>   sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 07b8e245ef..606374d9c3 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -COG_VERSION = 0.10.1
> +COG_VERSION = 0.12.0
>   COG_SITE = https://wpewebkit.org/releases
>   COG_SOURCE = cog-$(COG_VERSION).tar.xz
>   COG_INSTALL_STAGING = YES
> @@ -16,13 +16,14 @@ COG_CONF_OPTS = \
>   	-DCOG_PLATFORM_HEADLESS=ON \
>   	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
>   	-DINSTALL_MAN_PAGES=OFF \
> -	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
> +	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
> +	-DUSE_SOUP2=ON
>   
>   ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
> -COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
> +COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
>   COG_DEPENDENCIES += libxkbcommon wayland-protocols
>   else
> -COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
> +COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
>   endif
>   
>   ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
