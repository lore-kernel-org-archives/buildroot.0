Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13113C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABA38122B;
	Sun, 23 Jun 2024 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_7bO9h6L5JR; Sun, 23 Jun 2024 20:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A87AE8123C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A87AE8123C;
	Sun, 23 Jun 2024 20:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3F271BF20F
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90C02402F2
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgxP6fR0u4w0 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1E02401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E02401CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1E02401CA
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:59:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 427B313F88D;
 Sun, 23 Jun 2024 22:59:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jun 2024 22:59:24 +0200
Date: Sun, 23 Jun 2024 22:59:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZniMrEilTBNB_RvT@landeda>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
 <20240621161049.4085310-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621161049.4085310-6-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719176367;
 bh=Lh2JmBVMaCVQf8PcUUMMNKea1uLrhKyaDzgwU/CIIJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UvkUWfjeXaMBtGbku9Ju39tmro72iD6daPl5feTvr1FfhasiYIDqWMUtCGb2Z/z7R
 h3e9H6DGst9bB75ZgQ2WV/pOfZsUnBFPE10VJF82DCYVaAoLFfqVNvVWBbemympUKN
 r93HOuodkyRoh22l+RdL37+hxUOxBXpvweV0Sf44iLdYSdNnBShsMM4KaelZutB+yc
 a+WrF/a8sApZYk72P+mectwqr3H4sMADnftA3ntdmhVFwjmqUjSa/FqJ6wsvAI8xoH
 7pKJdEFhpHUKXZZP1jw54q2JTcnLKAx+j4IZH2kQVizGuYkFOAeQb9DC4pkMNNs1S1
 iR7lp0Lcvx5DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UvkUWfje
Subject: Re: [Buildroot] [PATCH 6/6] package/libopenssl: add new
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

On 2024-06-21 18:10 +0200, Dario Binacchi spake thusly:
> The transition from version 1.1 to 3.0.9, and subsequently to 3.3.1,
> added new compilation options. This led to a significant increase in the
> size of the library. These options allow user to disable these features
> to obtain a smaller library size.
> 
> To ensure backward compatibility, all items are selected by default.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[--SNIP--]
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
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL
> +	bool "enable default thread pool"
> +	default y
> +	depends on BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
> +	help
> +	  Build with default thread pool functionality. If enabled,
> +	  OpenSSL may create and manage threads up to a maximum number
> +	  of threads authorized by the application. Supported on POSIX
> +	  compliant platforms.

I'm not sure I understand how those two play together...

If I understand correctly, BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
only adds support for using a thread-pool, but ativates not such
thread-pool.

When thread-pool support is enabled, we then can also enable
BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL, to actually add a
thread-pool implementation.

If only the first is enabled, I don;t see how that would be useful in
practice: the code has support for thread-pools but none is available,
and I doubt they might be added at runtime..

So, can't we have a single option enables the default thread-pool?

    config BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
        bool "enabled thread-pool"
        default y
        depends on BR2_TOOLCHAIN_HAS_THREADS
        help
          Build with thread pool functionality. If enabled, OpenSSL
          algorithms may use the thread pool to perform parallel
          computation. This option in itself does not enable OpenSSL
          to spawn new threads. Currently the only supported thread
          pool mechanism is the default thread pool.

And then in the .mk:

    $(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool no-default-thread-pool)

Uness I missed something, in which case a bit more information might be
needed in the commit log; it may even warrant being in its own change,
separated from the other, uncontroversial, options.

Regards,
Yann E. MORIN.

>  endif # BR2_PACKAGE_LIBOPENSSL
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 89a9189bb851..ab8454657ebf 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -107,6 +107,20 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2),,no-argon2) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH),,no-cached-fetch) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP),,no-cmp) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool) \
> +			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL),,no-default-thread-pool) \
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
