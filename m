Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08A606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U59fGYAB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0F660AE2;
	Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYt6Wqe0fMTC; Fri, 30 Oct 2026 15:26:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5154A60AC3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374000;
	b=s5f9LoOJ5M/HhgaZ0La51EMoGBBZ/ajCZit9KM8+12PFZxg/yOfNXQvxNVAzHo9cCL/2
	 hMaHUKBKqgU1fEtb1Jx/w31DPGRzIgln6Z6SFxNL2cI3g368czgOZSQCa5nQSKZzTxpcR
	 6epsBtBrMax12WDG8hAg86NE8fpIq0l7xhpQkSXxUsdrNhJQ2Q/GmfMjggTSiZzovfDGb
	 C4PeDcp1C8ZWY/d1VFX3pkRsisaDB0T26QIVOXgz4rZCU3PuP7x6aW6Blzl0zoyiGmNpX
	 TRCCDyEzcYgl+veKRGmZw7bXS5O8Nfg0bGq4XqS3QkI1DbOLO/fzwVXU++TxQOfeQRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374000;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jjAKzWdQyO8daVsPHydBQ2FEnogI5tUati8bfrlGtGE=;
	b=hi46sn5r6xDlZ8zvWZPnwZHjWnWW72VE7Gu5NcYBokaDX4AJxqb5W1p6ZG62XtH/1pc3
	 JDe3EnnZdwxmSzeDyb5uN54EQk+PYpC1UJHHLXgXHlso3k32cgqqE8Wdj1JzsBz749P1J
	 bDU0O7KBhgtFjsPRIwulZtV7AD7d5q9GcS/N7ZaJCdIp58pi7/rf9aBS/jzvxw2Ni2Y6c
	 KfieeMRokyN4qMnXf704f3lamaUlxqywjfP3cJR5fREtHGNC/5WkXwsbMPO2DYsyvbPvY
	 GkZP4Imzf7WPwF4BQapuI8AJMsj2Hnj0igCekO0gBhevexVU1YkaFBDAkQWXv0XKQ5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374000;
	bh=jjAKzWdQyO8daVsPHydBQ2FEnogI5tUati8bfrlGtGE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U59fGYABVYjWttxJB397FP43faLFySGzy3RwOpbOiAuYV7CErHFUnHx5IOJnEGUIy
	 rty653s9AIJt4XA3W/WLEyFMS7Lopr4ZJclqFo4fnQ96ZRnSEZnx41YvwXhzzWdkui
	 x88lI9Vskjsnk7xd86V3lPHyy6hy199298Vo7z2LUbZlZzo6sgijABqKbEIBpC0axZ
	 JSOMieeNByTE9DyzHMnREhLRw/Z+pguymlCMzTWMr8NRTy984oXsrRBSQbxDiZWE9B
	 VRiyjIrcHRfK+AGUkEFy41v+RqL4GPlq4NmgXILiKpduY0x8KIrRjpe5LIqCE7QeWs
	 FGiFv6oh4HjoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5154A60AC3;
	Fri, 30 Oct 2026 15:26:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5544AD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451B340BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WVEjbx60GAr for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1E6D40BD2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373982;
 b=m+EP19Z/UnR3l+2DGiw2i6FhQsrBF2C+bUrSn4CupmOgtCvRBTtpiTzBoeGjstwBUDQO
 0K2uN5QIlfd1t4JL77hfI3kSW7XXMw6DtyROxTr3S62QvdTDUFbiNLLM5YwMwTBquwfkX
 ZRskl8JZnycNmghltoHMMIIauIQXEZ7uJUY1RVDVbIL4KBlNld9EnsWfPg9uI9dPw6Oi5
 xLMyv8o5oYyhKa5UJacnj4xc9UJFqJJYmRBF7ZspEY6VGjO5J4F0W+eURASsXQx1emotZ
 yLGNvlCrd2PlZmyydmPqne/JukQ2it1kyqSjUxz1owrx2puB0j+19iZvuJn30Z+Rswg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373982;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/ff8h2TLXUMftBhgUS3JzYtc1LyiSQZDbhGuLbt0nNk=;
 b=FI7768ezjb58zPXDabK3+MlXu7tFKAKvyIbui4DT2rVEF3ARUWiSq8p+2HkTzt7Il57E
 3ZtdKOJWyvJ8FT+wK4IEjfrUhwLH4doLVk3An4SbAgKtZVglNxKT3OxywwRlVSXtz4B4O
 sZjVZmuOR+X/Jo5AXPlm0/I4RsOi8Y1dWfbeWmmv7LiYs339nepOFCHruK3I0cvEQUqhM
 WKwNDAX1cpQjL2X9WzrpXYFybdvPqE2/LcWsm4ieAyXb1dDMwEKsJ8pUsO9+eb4KYEahV
 4pp2xeuepEbqAXNmVypyBApMKZ0b9EVRNBWpJ5teXr0n1yGUeVmG2l55w73xDONw8zQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AG54reVX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1E6D40BD2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so451161f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373980; x=1793978780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ff8h2TLXUMftBhgUS3JzYtc1LyiSQZDbhGuLbt0nNk=;
 b=jSuQ+6+b+WMlcrz7jJV5uWCJSHjVPjX/dfaJ1gZE3klSOSj9fbTmhijvg0/frjW6fa
 3e9Oc1fVRgc+QA6Ok5Mm7NB4tJ9y7vblTQNBZGLMqNyy0YLsL+A9o4xsf/tl1dj3nbTJ
 87TEs9rlES0uXH8BdKGazXoGxJSpJYniOgxcIME9Y+4OOe04A5WM2gTPxo0xTOdDDQ0N
 1zIjGwOe4QC+kgB9PcOJffyTNqF4Laj+mqHFQfDAlXnV8zdR8Cp43+ABYvmTl3tvZAPa
 +r8Tv9HZE8vnh9f6ExVsAQG1mAKXJqBqmoK0WhV5ixKMF9bru8gPumDtXeysnt5+3LFV
 HEfg==
X-Gm-Message-State: AFq9FYI7tBk9+11OuhuLIkz8x2h9jUUgIcvDClZ0IZwQL0GML4vJ8T2q
 E88gnQhfMtISpPMR2c5TOphJJhZ8gCPzH69Tr+oD7XxO87bgIF0AJRkClJEjHhQ92mol/0t7AV6
 0ZZnA9gE=
X-Gm-Gg: AYBFou2VR07Mb4T5Z/t6dr0Ftafp8Aw1JaGyk1uCxX5WtY7TwY4OW/EGJ3vdGmilQay
 p6gWmdad8DF+t/reANLO1/2GS0zCRbfSjUSoLCp3wqJN8QnP8CLhCFXoOfwytpAVZDHq7BXyc6G
 yKaMv6mHmWmJ/VabYeAdH1Dc+pEmCRgBRDEgV3fwrIa9A6ot6J15LhgsfcKGbW4JnT9wOq3/xy2
 3D1agCyNAm9uYB7AF8WrR7lqXxFeU+Mnggc17bZZZ29rxPEpzsvoy6Js8e3LIQk3Ti3ZqNAtTfU
 GDa0GZyxTmVDgda+D8Vm0bn6ruuJ2fqJTkU0oXIUgTee8ldekhK7rOwDu2+YTqijgkaKplI2hJN
 2D52jDraq3hTUKR9K9EpygsypiFWU53p/vKjTvNXymRStnSl1vqA83Pgr+IoQwRFT6qRKnHUWpH
 N8CmLvwPIiKvsaAGjzxaKiMC2AdVi9O2YNm16dq+uO5MPpwpBy9tVyMgTGDkcedxX+kifpQdSGi
 CUq9jom61tOOavdSFe05hCrtZeX+SAlzxZCaY0YhL0f3UpJzxmVq9MVPVQG/yrN0ARktt0doQxB
 VNIrE1np2L+dDcyUx7lNpapgfamCfQO7SpQFKu7/vcNKHHXAH3zoXPkPWRe7bQBa7W1CGdjY
X-Received: by 2002:a05:6000:2c0f:b0:48d:faf4:54a8 with SMTP id
 ffacd0b85a97d-48e6e2eb434mr5963536f8f.11.1793373979615; 
 Fri, 30 Oct 2026 08:26:19 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba4ac6sm3961399f8f.52.2026.10.30.08.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:18 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:16 +0100
Message-ID: <20261030152618.1906055-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014195542.257729-2-buildroot@heine.tech>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/libabseil-cpp: require wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> with wchar support is required.
> 
> This was introduced to abseil in [0] and landed in buildroot with the
> bump to 20240722.0.
> 
> [0] https://github.com/abseil/abseil-cpp/commit/5dc2cc1a6a992e09d9cf930cdce7984640e2b7e0
> 
> Fixes:
> https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
> 
> Fixes: 0d40b47866 ("package/libabseil-cpp: bump to version 20240722.0")
> Assisted-by: Github Copilot:GPT-6 Luna
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
> V3: add Fixes with commit that introduced the issue to buildroot.
> 
> V2: - moved the depends from ARCH_SUPPORT directly on the symbol.
>  - propagate that dependency to packages
>  - update comment
> ---
>  package/collectd/Config.in                    | 6 ++++--
>  package/falcosecurity-libs/Config.in          | 1 +
>  package/grpc/Config.in                        | 6 ++++--
>  package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
>  package/kismet/Config.in                      | 5 +++--
>  package/libabseil-cpp/Config.in               | 5 +++--
>  package/netdata/Config.in                     | 5 +++--
>  package/protobuf/Config.in                    | 5 +++--
>  package/re2/Config.in                         | 5 +++--
>  package/sysdig/Config.in                      | 6 ++++--
>  package/tensorflow-lite/Config.in             | 5 +++--
>  package/usbguard/Config.in                    | 5 +++--
>  package/webrtc-audio-processing/Config.in     | 6 ++++--
>  13 files changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 8df1f5fa9b..0b210c66a1 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -694,13 +694,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
> +	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
>  	select BR2_PACKAGE_GRPC
>  	help
>  	  Send/receive values using the gRPC protocol.
>  
> -comment "grpc needs a toolchain w/ C++, gcc >= 8"
> +comment "grpc needs a toolchain w/ C++, wchar, gcc >= 8"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
> +		!BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
>  
> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index 9d9cbd12aa..66ee55f101 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_FALCOSECURITY_LIBS
>  	bool
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
> +	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> index bdb31fc899..754ae16fea 100644
> --- a/package/grpc/Config.in
> +++ b/package/grpc/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_GRPC
>  	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_LIBABSEIL_CPP
>  	select BR2_PACKAGE_OPENSSL
> @@ -19,9 +20,10 @@ config BR2_PACKAGE_GRPC
>  
>  	  http://github.com/grpc/grpc
>  
> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "grpc needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 0586b7f327..fd518c228d 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -673,6 +673,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
>  	# All depends from webrtc-audio-processing
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> @@ -681,11 +682,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
>  	help
>  	  WebRTC echo-cancellation, gain control and noise suppression
>  
> -comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
> +comment "webrtcdsp needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
>  	bool "wpe"
> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 65c17baeaf..d03bf199f4 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -34,6 +34,7 @@ if BR2_PACKAGE_KISMET
>  config BR2_PACKAGE_KISMET_PYTHON_TOOLS
>  	bool "Install python tools"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
>  	depends on BR2_PACKAGE_PYTHON3
> @@ -52,12 +53,12 @@ comment "python tools needs python3"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  
> -comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 8"
> +comment "python tools needs a glibc or musl toolchain w/ wchar, dynamic library, gcc >= 8"
>  	depends on BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_KISMET_SERVER
>  	bool "Install server"
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index feb4963042..aba065fca7 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # uses dlfcn.h
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR
>  	help
>  	  Abseil is an open-source collection of C++ library code
>  	  designed to augment the C++ standard library. The Abseil
> @@ -35,7 +36,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
>  
>  	  https://github.com/abseil/abseil-cpp
>  
> -comment "libabseil-cpp needs a toolchain w/ gcc >= 10, C++, threads, dynamic library"
> +comment "libabseil-cpp needs a toolchain w/ wchar, gcc >= 10, C++, threads, dynamic library"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> index 2c7d456528..65eba65ac0 100644
> --- a/package/netdata/Config.in
> +++ b/package/netdata/Config.in
> @@ -23,14 +23,15 @@ if BR2_PACKAGE_NETDATA
>  config BR2_PACKAGE_NETDATA_PROMETHEUS
>  	bool "prometheus remote write backend"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_SNAPPY
>  	help
>  	  Enable prometheus remote write backend
>  
> -comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +comment "prometheus remote write backend needs a toolchain w/ wchar, gcc >= 10"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  endif
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index ae4044ea32..1f30314c3f 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -45,6 +45,7 @@ config BR2_PACKAGE_PROTOBUF
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_LIBABSEIL_CPP
> @@ -55,7 +56,7 @@ config BR2_PACKAGE_PROTOBUF
>  
>  	  https://developers.google.com/protocol-buffers
>  
> -comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "protobuf needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/re2/Config.in b/package/re2/Config.in
> index b2de476bad..4e90423865 100644
> --- a/package/re2/Config.in
> +++ b/package/re2/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_RE2
>  	bool "re2"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++17, libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -14,8 +15,8 @@ config BR2_PACKAGE_RE2
>  
>  	  https://github.com/google/re2
>  
> -comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "re2 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index a6e6809d82..73ac03e240 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SYSDIG
>  	bool "sysdig"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
> +	depends on BR2_USE_WCHAR # falcosecurity-libs -> libabseil-cpp
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
>  	depends on BR2_LINUX_KERNEL # falcosecurity-libs
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -23,12 +24,13 @@ config BR2_PACKAGE_SYSDIG
>  
>  	  https://github.com/draios/sysdig/wiki
>  
> -comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
> +comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR \
> +		|| BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_USES_GLIBC \
>  		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
> index 2536112f99..6d2db7b2c2 100644
> --- a/package/tensorflow-lite/Config.in
> +++ b/package/tensorflow-lite/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE
>  	bool "tensorflow-lite"
>  	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> @@ -31,8 +32,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
>  
>  	  https://www.tensorflow.org/
>  
> -comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
> +comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, wchar, dynamic libraries"
>  	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
>  			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
> -			BR2_STATIC_LIBS
> +			BR2_STATIC_LIBS || !BR2_USE_WCHAR
> diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
> index b71333aed9..7f9a95ad3c 100644
> --- a/package/usbguard/Config.in
> +++ b/package/usbguard/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_USBGUARD
>  	bool "usbguard"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
> @@ -18,9 +19,9 @@ config BR2_PACKAGE_USBGUARD
>  
>  	  https://usbguard.github.io/
>  
> -comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "usbguard needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  comment "usbguard needs a toolchain not affected by GCC bug 64735"
> diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
> index 051985f5e3..f6cc4b6801 100644
> --- a/package/webrtc-audio-processing/Config.in
> +++ b/package/webrtc-audio-processing/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
>  	bool "webrtc-audio-processing"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	# pthread_condattr_setclock
> @@ -18,8 +19,9 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
>  
>  	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
>  
> -comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
> +comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
