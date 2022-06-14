Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30478C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B2641677;
	Tue, 14 Jun 2022 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9QG5JMMQLfK; Tue, 14 Jun 2022 16:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F15840A06;
	Tue, 14 Jun 2022 16:55:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7305D1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F684093D
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1zinxektHZu for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0036D40935
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:55:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v1so18298339ejg.13
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7cmmTZnbEkh59n9srTPrdEZ7pDjxR4/R2gH0ppg2bBU=;
 b=SxD5BQa5txM4BK7zKAa6QDvXz/PpBy0YkBU7cO/B6PX4nvbo5xyV2FVCwlKxh0O1m0
 25UJRNFMIuAp2nOhAtZ7okVrV9C8kIIoHNawHm24TkPsIRDs6/BuQVHQj+yr/Cw/s9L+
 xPGsQqGWVZr0WOKKWJ9RB0hK57uSC6s48KeGyfRJQG83bjzIDCCSrLjanMrreWUlXrBi
 vOTw+3lUl5yUPUaLK6FJwAFeC3gSJf3Azw1U+RY6SpU3cNuvUbam3cwx+INshac5CCMb
 pXkst33WOT9bh7qUE2abCGq3dgwI5fb3h+htt/iFQxYuPakTr+f5EY+k0jWiLu6WHrns
 sTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7cmmTZnbEkh59n9srTPrdEZ7pDjxR4/R2gH0ppg2bBU=;
 b=HRHEzUE9+encc5lleUhSAmg2+Tqk9GRFYm5WNMYvqDiSsu4Ob3WLWZOowxqrypSAzV
 DOxHYQ5/T+Q9AosfxfD7goVbZkhVY5/mzPUTxmFWzDMJaw8iJalhmIzLPcyiA3V/RImu
 J6LnpxUQfRzKT4f/xKTQm5xnBeewsTSwO7ltRtEbG26/oxZL6fvitGMvKfv6PnBq/7bE
 yjGHyFpLA8BIkC5FHs8kpqtQeiCv6aDTsenx9BAgzq/r6ypUaNtH+nq2rvyI8Wswf7n8
 IlI3FUA+DwMlPtfbk5OFwNAzk9hMpYDMrFFAhrFgeUYgKD4EvPzhMSUJiw54gJc6sOVS
 Qvuw==
X-Gm-Message-State: AOAM530ckjpjD6XA9r6y3ooNunsUBpuMxGz4HmSxS4z3gsSTWS7fzww4
 THvjO2LkMKigbNovs5NbFieL1g==
X-Google-Smtp-Source: ABdhPJwRXy09QkS2IYKssM87nr0V1EOoET3vZKwf5QVTG1SSIbQlxhPeyP6W3rUvH0pCqt4IqzShhg==
X-Received: by 2002:a17:906:1084:b0:712:2989:b630 with SMTP id
 u4-20020a170906108400b007122989b630mr5096788eju.344.1655225715171; 
 Tue, 14 Jun 2022 09:55:15 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056402424300b0042bd75c53casm7525941edb.83.2022.06.14.09.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:14 -0700 (PDT)
Message-ID: <5161d863-a484-297c-8b46-bb2a7b59d162@mind.be>
Date: Tue, 14 Jun 2022 18:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220610165412.3605141-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165412.3605141-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: needs gcc >= 5
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Stephan Hoffmann <sho@relinux.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2022 18:54, Fabrice Fontaine wrote:
> Commit be38432532b23275869a3a914c0ad0031323259c wrongly assumed that
> is_trivially_copy_constructible was available since gcc 4.9 but it
> wasn't fully available until gcc 5.1 and
> https://github.com/gcc-mirror/gcc/commit/f5e523b76d1bdaf0df15f6bfdee602a3e153be68
> resulting in the following build failure with gcc 4.9.1:
> 
> In file included from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest.h:64,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/src/gtest-all.cc:38:
> /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
> /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
>              std::is_trivially_copy_constructible<M>::value &&
>              ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1723705cb7aea5f6fcc7e6722d866ed3bd098115
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/falcosecurity-libs/Config.in |  2 +-
>   package/gtest/Config.in              | 13 ++++++-------
>   package/libcamera/Config.in          |  7 +++----
>   3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index 157bc8ef6d..f101883384 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>   	depends on BR2_LINUX_KERNEL
>   	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
>   	depends on !BR2_STATIC_LIBS # protobuf, tbb
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> index 35fc9fea7b..4355e9c9c5 100644
> --- a/package/gtest/Config.in
> +++ b/package/gtest/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_GTEST
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
>   	depends on BR2_USE_MMU # fork()
>   	help
>   	  Google's framework for writing C++ tests on a variety of
> @@ -26,7 +26,7 @@ if BR2_PACKAGE_GTEST
>   
>   config BR2_PACKAGE_GTEST_GMOCK
>   	bool "gmock"
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
>   	help
>   	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
>   	  C++'s specifics in mind, Google C++ Mocking Framework (or
> @@ -48,13 +48,12 @@ config BR2_PACKAGE_GTEST_GMOCK
>   	  libraries required to link/run them. The host package installs
>   	  gmock_gen, a Python script used to generate code mocks.
>   
> -comment "gmock needs host gcc >= 4.9"
> -	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> +comment "gmock needs host gcc >= 5"
> +	depends on !BR2_HOST_GCC_AT_LEAST_5
>   
>   endif # BR2_PACKAGE_GTEST
>   
> -comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 23a0040abf..fd7b3c92c4 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -77,18 +77,17 @@ config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
>   	depends on BR2_USE_WCHAR # gtest
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
>   	depends on BR2_INSTALL_LIBSTDCPP # gtest
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # gtest
>   	depends on BR2_USE_MMU # gtest
>   	select BR2_PACKAGE_GTEST
>   	select BR2_PACKAGE_LIBEVENT
>   	help
>   	  lc-compliance test application
>   
> -comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 5"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   
>   endif # BR2_PACKAGE_LIBCAMERA
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
