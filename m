Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE617606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CHgpYYDr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B96340E4B;
	Fri, 30 Oct 2026 15:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfJVvrZP8wUl; Fri, 30 Oct 2026 15:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70BA540E23
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374183;
	b=Tc7Q+PEGyoLjwJSLAIz3ejTvPxLracOhkFluTOriO4eQJb7+41Bx2qfi+l8As+f29bQS
	 oXVwnsBZUDpIBcLzVNgc/gpOI2vJytylT8265OMIfZ0zR1XwoWWahZUwJnzYXspe3ah7S
	 /ZsotUr4XxRUDHKPZFwE9UiBhO1proRpZovkcnusG5eKdyj+RNHmQe24JsKOjBcf+SNs+
	 5hyCcz0SIodaUPrWx0LqRsJN8xjtntRSGyJXB0hjtTGp/xkPOQibRuHvpjmacKLAnVfSV
	 qmecp6Zs5eCmZ0uer0mj7YBZx8cFV1rkGs6WgUmNlLz1qjNVJq4SgYncgH0GYfjJixA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AFjusSTFX5WMnlzipW1uHhHQEVdCDHB2jkMqxbwq0zk=;
	b=lL2DgkMJ/qI+AtCxB2z00dO2FDUEGwk7FxOlfV/RUvyCCaWN6pZ45XvJQyIyV9VRxK5K
	 +4B6cuHuu9qwYKWaRRSxCBwk2yEG7wGRuXuC+R9BOzm0wvxD8JOPzVJakUgdOaE2WBi9y
	 8cojEYePlRYbRKwus5cd36Y1lxAU9tpE1dDh4Ppl9hZ+8cyWvksPuBWnl6VuFSI1CWdFV
	 nxlgL4AZRgU6J6VJzOKVfuXC4FhsiZAr5Jx29TH52hehDKb2R/Cl6pD8T3CAQYJOU9vTg
	 bFaSCh2aKdtTNubNcxgZ3DGboSDClm/cd7V1Y4lnVEz/UiLoxq4znwqgZSImcSeiwfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374183;
	bh=AFjusSTFX5WMnlzipW1uHhHQEVdCDHB2jkMqxbwq0zk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CHgpYYDrSvcGZkA+GcloURsU4kw0YyeSrf/Vxe93Lwp+AVp/tSPJcy8aDzL1LjByP
	 1+ymccc8l/BBhdO2Hz/KRPMWo8u+kIx1noH30/wA/gE/9sDwlO8FAD1jW7Gw+fA2R0
	 fl/GkCjhx6/PVyuOWL54dx8QcH3OrBWsaFqhkLuIhi6hOw8Hqwoaz3378XFWVK/Ep8
	 fknVKAV4syVPdhouZhJki1Ot0c9Yu0KdYIkIOrtrodkCr7X5xdPoB8MQ/edqRZC5uQ
	 +3Z0jp74fshD2pch02O6L744D4Z97d+BFy/UY2LYc80Qe6OZ3u3glecTzFuwS9w7YM
	 Ywm1xUoMyae5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BA540E23;
	Fri, 30 Oct 2026 15:29:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D922E235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAB5960B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeqEhqFspb1e for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9168660B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374147;
 b=Plr7AXuzymAzj0MmxesG1n+lFypBYegpV0h/F9P+LFWi71366j8xh8APmjiKocEMMuyl
 FFHDflOu0Rz3Ho1nSJ1TH98thZTUC/2rNvVX0jDmYzL2tIl2qoChRmV1RdchMXYTEgXbi
 riD+pQF8xGtJHl6hmlgSLtmDFw18r1PZLq6niErVDSELS9WrJtBeF5acyofl3IxOyrDlF
 OKNxslYUVNeFSABc/7PRcpgNBKGh07WR3a9G5nkyapTz07Mzj25pkEfWWqtKZ9bUq/iR7
 RwMYJhcjAvdwf4wnlk0EFYEkKDqXrXGzl260qTqlbXILc6lR7+rzwMml3EWZUANinKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374147;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Pi8t3ax6r1BJ+lrrqDlPqCMSeiNB7voEnE8PDhn/2iI=;
 b=pl4EgH03v+FSRIEEeBSsu3vBNvnnVa1bw8ZYIn5gXF6Zb9WVg+y5xswp6gZzwE22veHV
 gBz954biTr88tx68JNGgmvTiSuswxcep/fbofDCBb2hOwB2YW/s7LAgQvc/FUq2xm5l30
 VkEK118i1Sz41+W8Sm+Pt3FjUlYWypwRXWSzHQxPxtHTFg5F2/nucXHe0GSRw8Pwo6f9w
 ZibVOfiIx2fNScw3aX9CXbVIxJJFMqK47HxVsm2UfIU1bxwGWQqDWotKjpp+6mOwZxu5C
 xLx3c6WZ1w1qoYthc69KPRJbAYbePnRNgCfUkAS7KLQdv3CkPgVEN6tkeKP7R6hJT1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LbKGO6dj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9168660B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so4923235e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374146; x=1793978946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pi8t3ax6r1BJ+lrrqDlPqCMSeiNB7voEnE8PDhn/2iI=;
 b=U8b0W/ozbnLuEvcaoFenuT77cltz70qE1q+zAi8jrCiJUA35V68v6488Vw3dnsA1/S
 tkHJOH064i1KPDQ/e9LaxCJeUPAThuFu2+7QTg9hFPkfNk1odcJXmKkSWHi0RCuaWVUY
 ClLq7lfGCMXQMiJBcxKpsJNulPdObDXisv9OAWdLIFY6dVEv3/p1TylkXRzhLkaY8nhz
 JgXdGsIcYsxUqNJC/U07jEPtIu/4TvD5dubd8JNkW6twLCc7MkloiquBWDkNvrLjh1rJ
 F0auk6TkP9VfkV//0aCNn+jehbSgij2Vvmhd71LcP511tcO2VXzKEvvLu6GIAatsi3PT
 SIcQ==
X-Gm-Message-State: AFq9FYKjdlT2EvWY/EZ9L1JogQTXaTDd5Lc2VA25pgNqGlGvGGoD9u2N
 I8pGXST3FyzExV0SpuqiJKfSUHOG6bm6ZAGSgiocLDYvyhFkieXfrtkX/uI9AmSKJnVNDbgZB0l
 6xlYYIGg=
X-Gm-Gg: AYBFou1sPn36GhJ5kl6XlprlkVMwC+1hWaagXWZEZ3A7bwHPJAwvYsRBORIvWCfgRNZ
 nSdcN51JImLwKBi3nGOSCflAA8nfQi3F6WTS5BOpdKggxkutgh8Ut4/KjvJIDXLOrMFOBKc2Yny
 wTG2H7OxuSQnsaR2UptDTdN+Ndk6iuekxF96oxnuWr42ot6NCGGLTaQ/rl1v9XJUzj5NGILSu8y
 Wvkv9gNB+9zOqau1OxRQA5yjCfecEHPNP9a+Cm2It5JZy1bCs1BO5hcBuQNB+X1gWy5cddjdxeG
 SY/Hx9XcDH4+jeRgru7U/b+u/idx34qsEKPlaOkeG1Vfs5z079xgZfcTI10swGfKoR6bU1XZR64
 q2frtu98ilgPqQoQhoZL0/Z7iJXwixmOFeh9OYFENO7L92oEUpxrorPUPfDVbK6M5ddU1pAgkD9
 kQZjnnM2wxVRIuiu+7H8N1ZtV1m23MfgoFAjjXeiJWP7J6pcptOVZhCG6t6tDKf7mo4aqr53vJ+
 33btPgFZAv71QDTs2EEz7Zl0AEL5v4KIFwYuXIY5umEjhIL0IeIRKzJ9schiG873+Feo4ugi2Kw
 ev56CIy3RlnM67aIarqgg8Q7RCZQmPaM4xOa6bzBbO1HEDVArQRB+zC0YK6DxLEmGBcNJWAXMLa
 LMXvf8M+cdiFzB9Mtpw==
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id
 5b1f17b1804b1-4ac150b2136mr56791535e9.4.1793374145282; 
 Fri, 30 Oct 2026 08:29:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf7146621sm69817095e9.13.2026.10.30.08.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:04 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:02 +0100
Message-ID: <20261030152904.1907693-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/5] package/mesa3d: rework OpenCL
 handling
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
> Mesa3D removed the old Clover OpenCL implementation in version 25.2.0
> and kept only RustiCL:
> 
> https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
> "[...] the Clover OpenCL implementation has been deleted. RustiCL is now
>  the only OpenCL implementation available [...]"
> 
> Since then the option BR2_PACKAGE_MESA3D_OPENCL served no other purpose
> than allowing access to the RustiCL sub-option. This commit merges both
> options and their dependencies.
> 
> Fixes https://gitlab.com/buildroot.org/buildroot/-/work_items/180#note_3501740032
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> v3: rebased
> v2: removed code left-over (Romain)
> 
>  Config.in.legacy                             |  9 ++++++
>  package/mesa3d/Config.in                     | 32 +++++---------------
>  package/mesa3d/mesa3d.mk                     |  8 ++---
>  support/testing/tests/package/test_mesa3d.py |  1 -
>  4 files changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d94041edd4..29c9b7f9e7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,15 @@ endif
>  
>  comment "Legacy options removed in 2026.11"
>  
> +config BR2_PACKAGE_MESA3D_OPENCL
> +	bool "Mesa3D OpenCL support is now provided by RustiCL"
> +	select BR2_LEGACY
> +	help
> +	  Mesa3D removed the old Clover OpenCL implementation and
> +	  replaced it by RustiCL. This option served no other purpose
> +	  than allowing access to the RustiCL sub-option which was moved
> +	  to the main options section.
> +
>  config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
>  	bool "EDK2 platform ARM SGI-575 has been removed"
>  	select BR2_LEGACY
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e184039150..cb86e6a2a4 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -23,7 +23,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>  
>  config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	bool
> -	select BR2_PACKAGE_MESA3D_OPENCL
>  	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
>  	select BR2_PACKAGE_SPIRV_TOOLS
>  
> @@ -56,35 +55,20 @@ config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
>  	help
>  	  Legacy Wayland EGL_WL_bind_wayland_display support.
>  
> -menuconfig BR2_PACKAGE_MESA3D_OPENCL
> -	bool "OpenCL support"
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> -	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
> -		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
> -		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
> -		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
> -		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
> -		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
> -		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
> -		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
> -		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
> -		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
> -	select BR2_PACKAGE_LLVM_RTTI
> -	select BR2_PACKAGE_CLANG
> -	select BR2_PACKAGE_LIBCLC
> -	select BR2_PACKAGE_HAS_LIBOPENCL
> -if BR2_PACKAGE_MESA3D_OPENCL
> -# libclc dependency is satisfied by
> -# BR2_PACKAGE_MESA3D_LLVM
>  config BR2_PACKAGE_MESA3D_RUSTICL
> -	bool "RustiCL"
> +	bool "RustiCL OpenCL support"
> +	depends on BR2_PACKAGE_MESA3D_LLVM
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>  	select BR2_PACKAGE_HOST_RUSTC
>  	select BR2_PACKAGE_LLVM_DUMP
> +	select BR2_PACKAGE_LLVM_RTTI
> +	select BR2_PACKAGE_CLANG
> +	select BR2_PACKAGE_LIBCLC
>  	select BR2_PACKAGE_SPIRV_TOOLS
>  	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
>  	select BR2_PACKAGE_OPENCL_ICD_LOADER
> +	select BR2_PACKAGE_HAS_LIBOPENCL
>  	help
>  	  RustiCL is an OpenCL implementation written in Rust.
>  	  By default, devices are disabled in RustiCL. If you want
> @@ -93,8 +77,6 @@ config BR2_PACKAGE_MESA3D_RUSTICL
>  
>  	  https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE
>  
> -endif # BR2_PACKAGE_MESA3D_OPENCL
> -
>  config BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>  	bool
>  
> @@ -554,7 +536,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
>  	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
>  
>  config BR2_PACKAGE_PROVIDES_LIBOPENCL
> -	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
> +	default "mesa3d" if BR2_PACKAGE_MESA3D_RUSTICL
>  
>  endif # BR2_PACKAGE_MESA3D
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 87c7f427e4..c103345e86 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -50,13 +50,11 @@ else
>  MESA3D_CONF_OPTS += -Dllvm=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
> -MESA3D_PROVIDES += libopencl
> -MESA3D_DEPENDENCIES += clang libclc
> -endif
> -
>  ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
> +MESA3D_PROVIDES += libopencl
>  MESA3D_DEPENDENCIES += \
> +	clang \
> +	libclc \
>  	host-rustc \
>  	host-rust-bindgen \
>  	spirv-tools \
> diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
> index 24fc6df59e..193aa7a373 100644
> --- a/support/testing/tests/package/test_mesa3d.py
> +++ b/support/testing/tests/package/test_mesa3d.py
> @@ -17,7 +17,6 @@ class TestMesa3DRusticl(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_PACKAGE_MESA3D=y
>          BR2_PACKAGE_MESA3D_LLVM=y
> -        BR2_PACKAGE_MESA3D_OPENCL=y
>          BR2_PACKAGE_MESA3D_RUSTICL=y
>          BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
>          BR2_PACKAGE_CLINFO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
