Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C99C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0CA81D3D;
	Mon,  4 Apr 2022 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hZ0eh6h07-n; Mon,  4 Apr 2022 20:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC6181BC2;
	Mon,  4 Apr 2022 20:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6476A1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 616C260803
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pGnmCeJ9Nkt for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19781607F9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:13:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r13so22333601ejd.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yDEpxOHkdAFBY6nL2bOk/NTI+yTF3XGDbGYa5bDbzHc=;
 b=SUy/DQxKZPlJa3zclvGcvYAgDoM0E40uU7wvxOOf/rQHSfdk70KvPD5Tu4vnkQX815
 wBqkvJHjGwmufypFOgfc3nK7Sd7tEP+JbxwMYjIua5lkpyYiWU5il8TOEdXCIMJbRtex
 kZxrMXGlDgYDqmb6kUA4JY6oQcJrySyinvb0jPelHGba/LbxN8l49R9+7MciS16UpUsT
 iy1kY1WWJtp8nUZCSHAf6ghVgoqUcRdGiUmZn25BQjiSWP0qrMjcIa+tLGRKzlgGl0l6
 2PmhyOEyU5W0QfohGEe9+zXBYMhxEf9YFsCR9F2pnMBohfpzqoPfeWDmpgaJCLs5eubW
 japw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yDEpxOHkdAFBY6nL2bOk/NTI+yTF3XGDbGYa5bDbzHc=;
 b=kcW125TkcQM7PEXFq+0LmHzRIXJuHT51aWU4WoBlF9GRD2VvhRTthyihD4jWhMVmOT
 Gf/fiDWUAczqhWc75PRwdrQLW8pmrHmrNjHaTWXACiWOaTp7oiXWCoP/zzmp15u57BY0
 gAo/EuuhcK0482cFlWd4t/D/DRmOXFSgbRAug401DVHOYa3xggh8usuAov0RsKStxSYw
 03BdjqOEVdzEe3dbVBe/N9mx7JClKO97fB7q4uJvkzZj9wrFMo783X6ihuxNKMkjpmW9
 J18WufokDZ4Vb9TSnwCEHuLPoBx1xBzs1do9Lb4lis2kHsQEcWqKtusLOSQ5tG+1JX89
 ATzQ==
X-Gm-Message-State: AOAM532tjr4ubEgmCWf57ausGjBbq3LETDmXOwozlwHUHWNlQ8U7JWyp
 l5tT46fn0JHsP5tJibAFxWEozg/nyev6tQ==
X-Google-Smtp-Source: ABdhPJyiunrBZbZYVA7dySAC35akart57w03p/ZHhFRwLzed4ijKkZFNWQM7n74M6D73oyiPnmT7Ug==
X-Received: by 2002:a17:907:3f91:b0:6d7:16c0:ae1b with SMTP id
 hr17-20020a1709073f9100b006d716c0ae1bmr1828502ejc.74.1649103237210; 
 Mon, 04 Apr 2022 13:13:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7dc11000000b00412ae7fda95sm5727586edu.44.2022.04.04.13.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:13:56 -0700 (PDT)
Message-ID: <018d65ff-6857-ec13-1f14-bb99a0b86371@mind.be>
Date: Mon, 4 Apr 2022 22:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220404014252.566711-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404014252.566711-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/protobuf: add additional
 supported host architectures
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
Cc: Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 03:42, James Hilliard wrote:
> Move supported host architectures under
> BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS and propagate the reverse
> dependency.
> 
> Add additional supported host architectures based on current
> src/google/protobuf/stubs/platform_macros.h
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/collectd/Config.in         |  6 +++---
>   package/kismet/Config.in           |  4 ++--
>   package/protobuf-c/Config.in       |  4 ++--
>   package/protobuf/Config.in         | 16 +++++++++++++++-
>   package/python-protobuf/Config.in  |  2 +-
>   package/riemann-c-client/Config.in |  4 ++--
>   6 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 67413ffde0..43eef3bf66 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -725,7 +725,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
>   	bool "riemann"
>   	# riemann-c-client -> protobuf-c
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   	select BR2_PACKAGE_RIEMANN_C_CLIENT
>   	select BR2_PACKAGE_LIBTOOL
>   	help
> @@ -759,7 +759,7 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
>   config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
>   	bool "write_prometheus"
>   	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
>   	select BR2_PACKAGE_LIBMICROHTTPD
>   	select BR2_PACKAGE_PROTOBUF_C
>   	help
> @@ -768,7 +768,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
>   
>   comment "write_prometheus needs a toolchain w/ C++"
>   	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   
>   config BR2_PACKAGE_COLLECTD_WRITEREDIS
>   	bool "write_redis"
> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 961d5f230e..7bde6c92af 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -3,14 +3,14 @@ comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
>   	depends on !BR2_INSTALL_LIBSTDCPP || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   
>   config BR2_PACKAGE_KISMET
>   	bool "kismet"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_USE_MMU # fork()
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
>   	select BR2_PACKAGE_LIBPCAP
>   	select BR2_PACKAGE_PROTOBUF_C
> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
> index a32e6cd9e8..d96cd7b382 100644
> --- a/package/protobuf-c/Config.in
> +++ b/package/protobuf-c/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PROTOBUF_C
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	# host-protobuf only builds on certain architectures
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   	help
>   	  Code generator and runtime libraries to use Protocol Buffers
>   	  from pure C (not C++).
> @@ -12,4 +12,4 @@ config BR2_PACKAGE_PROTOBUF_C
>   
>   comment "protobuf-c needs a toolchain w/ C++, threads"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index 46c820b9cf..47e987fa2b 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -14,6 +14,20 @@
>   # and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
>   #
>   # host-protobuf only builds on certain architectures
> +config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_HOSTARCH = "aarch64"
> +	default y if BR2_HOSTARCH = "arm"
> +	default y if BR2_HOSTARCH = "mips"
> +	default y if BR2_HOSTARCH = "mipsel"
> +	default y if BR2_HOSTARCH = "powerpc"
> +	default y if BR2_HOSTARCH = "powerpc64"
> +	default y if BR2_HOSTARCH = "powerpc64le"
> +	default y if BR2_HOSTARCH = "sparc"
> +	default y if BR2_HOSTARCH = "sparc64"
> +	default y if BR2_HOSTARCH = "x86"
> +	default y if BR2_HOSTARCH = "x86_64"
> +
>   config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>   	bool
>   	default y if BR2_arm
> @@ -22,7 +36,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>   	default y if BR2_x86_64
>   	default y if BR2_sparc64
>   	default y if BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU # fork()
>   
>   config BR2_PACKAGE_PROTOBUF
> diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
> index 1af82112b4..7de463520d 100644
> --- a/package/python-protobuf/Config.in
> +++ b/package/python-protobuf/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_PYTHON_PROTOBUF
>   	bool "python-protobuf"
>   	# host-protobuf only builds on certain architectures
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>   	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  Python implementation of the Google Protocol Buffers.
> diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
> index e9982b2fb0..6c3c35caf8 100644
> --- a/package/riemann-c-client/Config.in
> +++ b/package/riemann-c-client/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
>   	bool "riemann-c-client"
>   	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
>   	select BR2_PACKAGE_PROTOBUF_C
>   	help
>   	  Riemann-c-client is a C client library for the Riemann
> @@ -14,4 +14,4 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
>   
>   comment "riemann-c-client needs a toolchain w/ C++, threads"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
