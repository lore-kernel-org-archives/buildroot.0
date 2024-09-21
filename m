Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B63DCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76A54025D;
	Sat, 21 Sep 2024 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGH4_a_Osg4s; Sat, 21 Sep 2024 19:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B7E5400DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B7E5400DD;
	Sat, 21 Sep 2024 19:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 637D01BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 602B480C8A
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkhQek_-cBlY for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 19:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22F8880C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F8880C4D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22F8880C4D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:56:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5E65E6012D;
 Sat, 21 Sep 2024 21:56:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 21:56:19 +0200
Date: Sat, 21 Sep 2024 21:56:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zu8k4wciAmdBm4Ej@landeda>
References: <20240708170856.803984-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708170856.803984-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726948582;
 bh=+yIou+Z+bR5b6dVanbOhSmTqy9/JaydJruhTQD07pVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NAiXUvELvNKSZnHhX576F36PwCxPUWs/xBRg1+bAfxdokdRndbeguYoZNxFgcmTWO
 UTQrcs4+AgvD+JZL4dRSCnH3nI1/JMR59Q5bN8j84D2Kj1UxHBSo6rVAbeqg81wc9d
 eVQ9AqGCdrheSFXaZeCb4KXQk2MN82C7AlrnY0aOv2DPvz3e9TnqUfx3tFrxJEYGDO
 HU4/oDbExFpVJD98LraBph5UXltPeusiyDsexY3mHLRUSeNBRUsCDob7oXK8ThV6c6
 UJYU8AkSL3M3IQoqpEKPjHKnZeIw8mrrFSNJH7rp2JPvT9EpIM166uURUQTWHFhkZC
 1cZ6G43yNgjmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NAiXUvEL
Subject: Re: [Buildroot] [PATCH v2] package/libopenssl: add new
 configuration options
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-07-08 19:08 +0200, Dario Binacchi spake thusly:
> The transition from version 1.1 to 3.0.9, and subsequently to 3.3.1,
> added new compilation options. This led to a significant increase in the
> size of the library. These options allow user to disable these features
> to obtain a smaller library size.
> 
> To ensure backward compatibility, all items are selected by default.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Drop BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL and use a
>    single option (i. e. BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL)
>    that enables the default thread-pool.
> 
>  package/libopenssl/Config.in     | 96 ++++++++++++++++++++++++++++++++
>  package/libopenssl/libopenssl.mk | 13 +++++
>  2 files changed, 109 insertions(+)
> 
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index 0c8db52e2e1d..03d3def802ff 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -133,4 +133,100 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
>  	bool "enable compression"
>  	default y
>  
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2
> +	bool "enable ARGON2"
> +	default y
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH
> +	bool "enable cached fetch"
> +	default y
> +	help
> +	  Cache algorithms when they are fetched from a provider.
> +	  Normally, a provider indicates if the algorithms it supplies
> +	  can be cached or not. Using this option will reduce run-time
> +	  memory usage but it also introduces a significant performance
> +	  penalty. This option is primarily designed to help with
> +	  detecting incorrect reference counting.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP
> +	bool "enable CMP"
> +	default y
> +	help
> +	  Build support for Certificate Management Protocol (CMP) and
> +	  Certificate Request Message Format (CRMF).
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
> +	bool "enable thread pool"
> +	default y
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Build with thread pool functionality. If enabled, OpenSSL
> +	  algorithms may use the thread pool to perform parallel
> +	  computation. This option in itself does not enable OpenSSL
> +	  to spawn new threads. Currently the only supported thread
> +	  pool mechanism is the default thread pool.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX
> +	bool "enable ECX"
> +	default y
> +	help
> +	  Build with ECX support. Disabling this option can be used
> +	  to disable support for X25519, X448, and EdDSA.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE
> +	bool "enable 'loader_attic' engine"
> +	default y
> +	depends on BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
> +	help
> +	  Build with 'loader_attic' engine support, which is meant
> +	  just for internal OpenSSL testing purposes and supports
> +	  loading keys, parameters, certificates, and CRLs from files.
> +	  When this engine is used, files with such credentials are
> +	  read via this engine.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE
> +	bool "enable padlock engine"
> +	default y
> +	help
> +	  Build the padlock engine.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE
> +	bool "enable modules"
> +	default y
> +	help
> +	  Build modules.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC
> +	bool "enable QUIC"
> +	default y
> +	help
> +	  Build with QUIC support.
> +
> +config BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY
> +	bool "enable secure memory"
> +	default y
> +	help
> +	  Build with secure memory support.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV
> +	bool "enable SIV"
> +	default y
> +	help
> +	  Build with RFC5297 AES-SIV support.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE
> +	bool "enable SM2 precomputed table"
> +	default y
> +	depends on BR2_aarch64
> +	help
> +	  Enable using the SM2 precomputed table. Disabling this option
> +	  makes the library smaller.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
> +	bool "enable SSL trace"
> +	default y
> +	help
> +	  Build with SSL Trace support. Disabling this option may
> +	  provide a small reduction in libssl binary size.
> +
>  endif # BR2_PACKAGE_LIBOPENSSL
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 89a9189bb851..601afb6a7d79 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -107,6 +107,19 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2),,no-argon2) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH),,no-cached-fetch) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP),,no-cmp) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool no-default-thread-pool) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX),,no-ecx) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE),,no-loadereng) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE),,no-padlockeng) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE),,no-module) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC),,no-quic) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY),,no-secure-memory) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV),,no-siv) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE),,no-sm2-precomp) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE),,no-ssl-trace) \
>  			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
>  			$(if $(BR2_STATIC_LIBS),no-dso)
>  endef
> -- 
> 2.43.0
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
