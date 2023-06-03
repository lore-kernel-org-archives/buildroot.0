Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A44C7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C80F402A0;
	Sat,  3 Jun 2023 19:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C80F402A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRiNE_BJck-e; Sat,  3 Jun 2023 19:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A36E404CA;
	Sat,  3 Jun 2023 19:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A36E404CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02C601BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A1F60F0F
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A1F60F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRgFUJErkP2a for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:26:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B175E60EF6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B175E60EF6
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:26:50 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9700219be87so493532566b.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685820409; x=1688412409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSczKcRrcE82yIO1nKoOHa6fTVRMjrFud237f8Q7kJI=;
 b=DMkpR1ooqFLS29apJJoyYLe6QhWDIv8oVa56wfrUgD4BauofCjWo+szTczci9GaEsH
 uuxwDKXviGruRh1k1M94p6KFqQ0g5bRy61ohu8T3vMYst0P9StR1xQ8g8IqH+d+y/I7n
 t87OgTUWOZi4kdVrx5VXomLhySeFMxjddN/5Tmd2J5HOSHLv+HAtQpU1JFM9jqurLDrZ
 oDadRhVODjRlvL8b1LFtah3dhyTM6sQyjHMwid6BCN8MdTgBLp0BpxwWJAslVGeLALHT
 DQPSdXzC393iO3olWNiL5yAgUfXc6MmPlkwdOj3CCR0G2paRfhkweQDhIWJSEC3vFKc/
 ZEDg==
X-Gm-Message-State: AC+VfDzVjcPg2X30kXE9xDQ8KWT9/l0VbpgnJhJrGImrRmTKCJxIsNSh
 6K/22IWqeSWdz825Q4wPSe8Z3A==
X-Google-Smtp-Source: ACHHUZ5DQrMRwLYJuzElRwe/NDb9e/Ls2U4jLZ5TcCgcMoLwzm1M46BE0YJXes9OijJbC/EGVE2LGw==
X-Received: by 2002:a17:906:fd81:b0:968:c3b5:8b92 with SMTP id
 xa1-20020a170906fd8100b00968c3b58b92mr2045130ejb.57.1685820408853; 
 Sat, 03 Jun 2023 12:26:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a1709062c0200b0094e7d196aa4sm2224522ejh.160.2023.06.03.12.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:26:48 -0700 (PDT)
Message-ID: <a260f6c0-727c-f37e-497b-e6958b07a643@mind.be>
Date: Sat, 3 Jun 2023 21:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <20230523153347.419295-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230523153347.419295-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685820409; x=1688412409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSczKcRrcE82yIO1nKoOHa6fTVRMjrFud237f8Q7kJI=;
 b=Vn+iGHj2DPNRlYdbxH5W9RB2+2xlUauRFxPdseK/h08uFOC+cuRBcglqhPaQJCNVRo
 eMVjtvNOUJogW8zwpw7rT5AKHmCAYuciZv+LhjHyMecfCZvTM9Xurtm+M5HRo/GEHjwm
 sxGN3OFeH9f2mYHYgOowQib/U0DK7rm1u67CGT9tOJ91mtVCqT/JJI9wqD4qWQNivoD5
 wq5+Pt0RzN9LUW/cPO3BYk35CeVhmXMafze7ytk1XfMlQXugkmNZd+tO0n32GD/2pUqb
 qJbMo5rVQWQzI1NycVuloBhSqcIlPMydfsnD47u9VUciLG9Yb/8r9HJ94yu8aSK35VUZ
 2M8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vn+iGHj2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mesa3d: needs gcc >= 8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/05/2023 17:33, Bernd Kuhls wrote:
> Needed since upstream commit
> https://github.com/Mesa3D/mesa/commit/f9057cea517e01e05f08f00a741aad5bae154d62
> which was first released with mesa3d-22.3.0, added to buildroot with
> commit e4a1183d8f7d8422dbc23432248b984745a428b7.
> 
> Fixes:
> http://autobuild.buildroot.net/results/011/01109560288f933019eea726a91c4109fbcca794/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Peter, this one is for 2023.02.x.

  Regards,
  Arnout

> ---
> v2: fixed typo
> 
>   package/intel-mediadriver/Config.in |  5 +++--
>   package/mesa3d/Config.in            | 16 +++++-----------
>   2 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
> index 537e4abd2f..c59437ec73 100644
> --- a/package/intel-mediadriver/Config.in
> +++ b/package/intel-mediadriver/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
>   	depends on BR2_x86_64
>   	depends on !BR2_STATIC_LIBS # mesa3d, libva
>   	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # mesa3d
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-gmmlib, libva
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
> @@ -28,7 +29,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
>   
>   endif # BR2_PACKAGE_INTEL_MEDIADRIVER
>   
> -comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
> +comment "intel-mediadriver needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
>   	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
>   	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index b01aeb391b..df500f0491 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -4,7 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_1
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	select BR2_PACKAGE_EXPAT
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
> @@ -24,7 +24,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>   config BR2_PACKAGE_MESA3D_LLVM
>   	bool "llvm support"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> @@ -33,10 +32,9 @@ config BR2_PACKAGE_MESA3D_LLVM
>   	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
>   	select BR2_PACKAGE_LLVM
>   
> -comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
> +comment "llvm support needs a toolchain w/ wchar, threads, C++, dynamic library, host gcc >= 5"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
>   		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
>   		|| !BR2_HOST_GCC_AT_LEAST_5
>   
> @@ -392,11 +390,7 @@ config BR2_PACKAGE_PROVIDES_LIBOPENCL
>   
>   endif # BR2_PACKAGE_MESA3D
>   
> -comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
> +comment "mesa3d needs a toolchain w/ gcc >=8, C++, NPTL, dynamic library"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		BR2_STATIC_LIBS
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_1
> -
> -comment "mesa3d needs a toolchain w/ gcc >= 7"
> -	depends on BR2_m68k
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
