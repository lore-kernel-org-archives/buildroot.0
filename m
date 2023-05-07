Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A63CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B8C60C33;
	Sun,  7 May 2023 16:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B8C60C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zr-LaEjsfn1e; Sun,  7 May 2023 16:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EDE7600B9;
	Sun,  7 May 2023 16:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDE7600B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF1F1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A0D6822EE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0D6822EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hr5MgQjnDLvs for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02038821E6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02038821E6
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 334C019F747;
 Sun,  7 May 2023 18:53:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 18:53:13 +0200
Date: Sun, 7 May 2023 18:53:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20230507165313.GB252090@scaer>
References: <20230503114855.1155359-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503114855.1155359-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683478396;
 bh=IjsRc9Z92vk1YtH829kcQWHmHjHSrARZ57uZcHdiMvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qID+X7uH5qE+L/3rwxYpLGrBTzq5KAKsNJJF2CRwOqC7nO5uuLDd0oLjrl4Do+35u
 +3sMQMvrq6M5UsNZyO4VKmFCVc/r/71fhbi+EuB0lidysBKG9rjLyKsnC5H/jiWtqG
 f4ngED3uFwzBpfOw11v+VGVtTitb0J3T+XKHEmEqIYnyz4g4J9dnk9Fqa5h+bkoNTa
 fPfv7udoxtT+P3XlpVW6z4VOr3dQy5jDNRRKM96TpxPDtmYY5C3natXIxqIx4Jb2vO
 MlW06iWShdiDSn8g/AdJdfhsOncnhwVtTtEEi4qbBDAYz7fvourNhK/HAxSeZYB6YS
 HZ9qu1ezxKiZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qID+X7uH
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.82.0
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

Michael, All,

On 2023-05-03 13:48 +0200, Michael Nosthoff via buildroot spake thusly:
> - add option for new library "url"
> - drop upstreamed patch
> - Math now requires C++14/gcc5
[--SNIP--]
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index b99b01f22e..1357b10288 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -219,6 +219,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
>  
>  config BR2_PACKAGE_BOOST_MATH
>  	bool "boost-math"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

You forgot to propagate this new dependency to the package that select
BR2_PACKAGE_BOOST_MATH, i.e. uhd. I've had to do it when applying.

>  	help
>  	  Boost.Math includes several contributions in the domain of
>  	  mathematics:
> @@ -341,6 +342,19 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
>  comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  
> +config BR2_PACKAGE_BOOST_URL
> +	bool "boost-url"
> +	help
> +		Boost.URL is a portable C++ library which provides containers
> +		and algorithms which model a "URL," more formally described
> +		using the Uniform Resource Identifier (URI) specification.
> +
> +		This library understands the grammars related to URLs and
> +		provides functionality to validate, parse, examine, and
> +		modify urls, and apply normalization or resolution algorithms.
> +
> +		To use the library "header-only" this option is not needed.

    $ ./utils/docker-run make check-package
    package/boost/Config.in:348: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:349: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:350: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:352: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:353: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:354: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/boost/Config.in:356: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I've fixed that too.

Applied to master, with the two above changes, thanks.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_BOOST_WAVE
>  	bool "boost-wave"
>  	# limitation of assembler for coldfire
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index ab54a4b2fc..36de2b9b06 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,5 +1,5 @@
> -# From https://www.boost.org/users/history/version_1_80_0.html
> -sha256  1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0  boost_1_80_0.tar.bz2
> +# From https://www.boost.org/users/history/version_1_82_0.html
> +sha256  a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6  boost_1_82_0.tar.bz2
>  
>  # Locally computed
>  sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index bd1d329982..d432ab48cc 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOOST_VERSION = 1.80.0
> +BOOST_VERSION = 1.82.0
>  BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
>  BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
>  BOOST_INSTALL_STAGING = YES
> @@ -18,7 +18,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
>  	contract container coroutine date_time exception fiber filesystem graph \
>  	graph_parallel iostreams json locale log math mpi nowide program_options \
>  	python random serialization stacktrace test thread timer \
> -	type_erasure wave)
> +	type_erasure url wave)
>  
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
> @@ -50,6 +50,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
>  
>  BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
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
