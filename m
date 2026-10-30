Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A70606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XHU5pNFe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C9A040E5B;
	Fri, 30 Oct 2026 15:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQaBs71Z0Ajv; Fri, 30 Oct 2026 15:29:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B5C0F40D7A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374184;
	b=PEDHJ4Z5LdpmPbTxay23s2NomIirs2R8I7iWSFTWgzwgSgtqa6+M5yKtquAzn80q7/Qm
	 4TWSTckkoQ6J9H/AcQo5yNUPxG7+yEiJAsNzqm0eZWIhKuWlnMAVwnS1gCcKZdNY9YQSj
	 WsQZa/4IDGeLFIHblWl0DtYVl1UBQtiQiqMtPCH1UAUa0dAmnx1aBx6U4BzlbLuPVAkt+
	 WxRLKurvtsMSOORqC/UOvLguyuIH0qAUaWw2yyyypl/3ElpOppINTPZ8F637GxGypMj1x
	 Ztja9T5bsNEFOwHacV3UCjONDMUEs1N3C1529AVhwoXahVpDXH8/b86HeHVSZxsx7cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374184;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UShou21nnL/GmtsJdhZEGo2Sm9F+qjpUAk/1TE8dWEw=;
	b=BIOy/V1cuORmZgbzuF7QLLqUWq8jM+eIQuqKJdHiDp63uq+5euLMQCw8BWHZzKMKy1Ik
	 NcRn6sFsH+yynHqpWQEChuEm8gC3n8cTZD5X5umFBbld8mhdFsxvVDWzgcIn12kvcqakq
	 TrjpBy6TskSxc5LTuPcUrZKDLhDdvN6mpSmxPYv8o2H7NZjdVrEaMxXzeb7If4TW3ZgXN
	 ZInscs5+cMqNwwe1ONztMGF23L0Os+qiPAkAHNre00vAVc3/gfeAhfls71t4/NHXVGKSk
	 XQVfyY8PvMakQxbuUM6pEVV8MstwUj0BpvIJrJWtAij9v2IZ55WEQgsT8vCMugeQlag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374184;
	bh=UShou21nnL/GmtsJdhZEGo2Sm9F+qjpUAk/1TE8dWEw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XHU5pNFeHMVBIaH+P63un1AdUzHI3VmAb+LOkBydkzvygrLxBtHM7AA0w+JXk12ET
	 EmYFXOwNwqukuNfFrw+gKNV2aJJ0UR4EwcnFUerzxQNovFgih2Tls11GKTB+tD0v4o
	 Xzyl7XCdUeBtNvPaBRcfo14VNATLfzzZhEXvIU50yYTH268sSq03il2v1W+Af3eje+
	 DjypOMJy77WEqO6yT4gHIT7s/XaKpww8e1o9mcxe06/QueQnLthDP8nCAx7zzSDhxA
	 6oEvgpr2Ce1zAoN9YIb4JwrkBgFKwGLB81BOhSBMk1F3kq5asCHEnQ8SMZX3+rbQZV
	 M14hQwg7T3AGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C0F40D7A;
	Fri, 30 Oct 2026 15:29:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7A1D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309C960B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoaU1_KkhFXM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34CED60B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374150;
 b=GuMKrHYxSzbOku8f8bzwskGg5uH9McvmB2BURVzzVR2bdwRsOviCKsmgRKTrF4xKRnex
 WTu9WTGtn9GUt+4aYn8ZH3CNVkdcZHCkVUbJ2fw+OTfAFJJGS/UjNS/2ChIBp1Ij7j68j
 xhawYVLi+E6UDnmWcsB39MTQTn4DT7KEG2spMljsrM+FBVmr4kKPmyjq9EL9wFNSwVIvW
 hLKu1P0FqBtCisnaZ4GgCX0R9V8OdjUtY31pWkjF+Q/snppc9zaoxZH33PfV0+KBvwany
 qkZF5yGcpdglR6/lsMdB8ncZjpTbGzDo31azCW99xSX3FHSDAZItJB4MpuLJjY9S5BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374150;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nKHfOQ0S+u/HRtpmtkzX3SNZZR50y+nrMXHO+T+dsm0=;
 b=ktUpPbfTbKod662cJGZVUH4pWH53Uf2QYwQhLb6LYE+866KZpmAvUc0rlXgtjzhBni8I
 g8mjNZ4hb8ZwPwnP1l6D5sKzmjPEkBR4M7HX6KoZEJ+OxKPomEr6eQCD1e6qGXar7iaiG
 izyj/TXNvzCfvE2tdpYtHj3SRwPOpSr6RKg9MTuEdp6fMJGN69vHg/oB8mQIGix6ZHPsC
 l99x99FPW68Cl8WegDFL8gOpm9ucYDvLD9SzTNRcVMvgGOL7SPYxHtE8EGaqeQn2fxv2s
 /L3v6yGN023VLiEyoZvm0wYMlZQ3kPxxuErYpAHxPoJupDPoXpOojmWMf1Ya/q/Bp7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gr8QvRUy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34CED60B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7963045e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374148; x=1793978948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nKHfOQ0S+u/HRtpmtkzX3SNZZR50y+nrMXHO+T+dsm0=;
 b=M9fG4/AgvObrbTXgvV6Kg9lkB92psdi7ZfR3s78rd1uzpP4Tpg+gBrR60PHzdz/0u8
 yc3GWyAfQds4Ca6+z5KKwdJgbEbQWAR1RXebrjIjuij/iH6V1umbARUOvH7uiBpRz3J+
 xQzqajPwd+q2fIUxzTbhatnUvUWDjus7QJoU6hz3jWdtYBvE3fF3OJSI5Mstaet6uG5Z
 VkX7+4pDIjLG6eVXocby82nRPkrRmvrVS4cwa7XFIvfdjxo2P1bdYbncwsxvCbARUn6e
 GnNusK1TNSm8IhT/62r3it9yrhJh04uASmPJOJw/RvJrmfPxA3f2l4XhlQF+zikDbJkd
 QX9w==
X-Gm-Message-State: AFq9FYLPSZ+LtRp9slxEAmwauZmLK75NI1//IXuHnh6mGPYNoS4zDYXA
 RZHRJGPUhBiinvEeJ80PKVOXBJ85hrC4Lz+qyphJuvij/wVFFV7ccdXd5HHvd5ZBD2vWFviuGpR
 zjMdQ3vI=
X-Gm-Gg: AYBFou0Tl3wsH/es7KZ2UW2fuH/J+PaEIO9nV0pwlcEakUwy9QfveAEuDjBvnXGXEw9
 2xrsDyT5OwZfDzlzvVZ6XiAvOU3mEMBT0/BOOk2bdh1bjXrutbI9+X/1Isp9nj1xprMJtqNbX+9
 /PF2HT62Lp85/FBR1x8kepCv7NY0QgUmOK4II8eu41iAl6iatC2XGUErdgE0SaJEtbVkykkdTGk
 2id+tn5qKzOKh/GmgTqJQ/oEvD2bk7LedzB/ihHvqjG5OMD0/yxV274C0+iECTUHWJaHyVZAKSW
 Epn19MsBvEGd+wD36TiDOyq6ZkybYt5Qchq9k8gIk4vWfLW0iEd0x0XzYMR+WFFc5e0MHCuJDf3
 E7vXmKqDwE9MUf31STF7WIbOdwda5io79jY5tfLMVgsJMyA2D9kusLVXcI7fiv9hGM9b/zlD8Ty
 0/eWftZawsWlPKUDErQbCOLzWyoPzhxI59zo6ze0IJqcrqq/xcgdAYPQYO3NbpmVULo0D1JxmYh
 WUg34iiYct+0THa562nLI+OfwAOuZTrd0Ir/HoFvvSdNEayV00tUIbtYvPq2xRN0VCqXc4SzHZf
 FgICTT1+1xzQmj3rYsZbQdSOLbGy6R5agOrjXCFjucXg8uKLJ+O0bgKWbYt7NYxU28ANw//+zNl
 cPMLQFz1eo7MgQc3OoQ==
X-Received: by 2002:a05:600c:1d23:b0:4a2:167a:c946 with SMTP id
 5b1f17b1804b1-4ac185bccfbmr60667015e9.13.1793374148035; 
 Fri, 30 Oct 2026 08:29:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aa704sm64423085e9.8.2026.10.30.08.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:07 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:05 +0100
Message-ID: <20261030152907.1907719-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023211622.2096562-2-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/5] package/mesa3d: precomp-compiler
 does not need target llvm
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Inspired by and fixes
> https://gitlab.com/buildroot.org/buildroot/-/work_items/180
> 
> To build binaries provided by the host-mesa3d package we do not need to
> build llvm packages for the target arch.
> 
> Added configure options for rtti support to fix build error when
> BR2_PACKAGE_LLVM_RTTI is not enabled:
> 
> output/build/host-mesa3d-26.2.3/meson.build:2042:8: ERROR: Problem
>  encountered: LLVM was built without RTTI, so Mesa must also disable
>  RTTI. Use an LLVM built with LLVM_ENABLE_RTTI or add cpp_rtti=false.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> v3: no changes
> v2: added note about new rtti configure options (Romain)
> 
>  package/mesa3d/Config.in | 46 +++++++++++++++++++++++-----------------
>  package/mesa3d/mesa3d.mk |  8 ++++++-
>  2 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index cb86e6a2a4..feed6b68fe 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -23,8 +23,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>  
>  config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	bool
> -	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
> -	select BR2_PACKAGE_SPIRV_TOOLS
> +	select BR2_HOST_CMAKE_AT_LEAST_3_20 # host-llvm
>  
>  config BR2_PACKAGE_MESA3D_LLVM
>  	bool "llvm support"
> @@ -147,15 +146,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	bool "Gallium iris driver"
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>  	help
>  	  Mesa driver for iris-based Intel GPUs.
>  
> -comment "iris driver needs llvm"
> -	depends on !BR2_PACKAGE_MESA3D_LLVM
> +comment "iris driver needs host gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>  	bool "Gallium lima driver"
> @@ -189,15 +190,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
>  	bool "Gallium panfrost driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>  	help
>  	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
>  
> -comment "panfrost driver needs llvm"
> -	depends on !BR2_PACKAGE_MESA3D_LLVM
> +comment "panfrost driver needs host gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
>  	bool "Gallium Radeon R300 driver"
> @@ -360,46 +363,49 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
>  	bool "Vulkan imagination driver"
>  	depends on BR2_arm || BR2_aarch64
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	help
>  	  Vulkan imagination driver.
>  
> -comment "imagination vulkan needs llvm"
> -	depends on !BR2_PACKAGE_MESA3D_LLVM
> +comment "imagination vulkan driver needs host gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>  	bool "Vulkan Intel driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	help
>  	  Vulkan driver for Intel hardware from Ivy Bridge onward.
>  
> -comment "intel vulkan needs llvm"
> -	depends on !BR2_PACKAGE_MESA3D_LLVM
> -
> -comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
> +comment "intel vulkan driver needs a glibc toolchain w/ headers >= 3.17, host gcc >= 7"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
> -		!BR2_TOOLCHAIN_USES_GLIBC
> +		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
>  	bool "Vulkan panfrost driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> -	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	help
>  	  Vulkan panfrost driver.
>  
> -comment "panfrost vulkan needs llvm"
> -	depends on !BR2_PACKAGE_MESA3D_LLVM
> +comment "panfrost vulkan driver needs host gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
>  	bool "Vulkan swrast driver"
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index c103345e86..04112eea8e 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -178,7 +178,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
>  MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
> -MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
> +MESA3D_DEPENDENCIES += host-mesa3d
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
> @@ -347,6 +347,12 @@ HOST_MESA3D_CONF_OPTS = \
>  	-Dglx=disabled \
>  	-Dvulkan-drivers=""
>  
> +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
> +HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=true
> +else
> +HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=false
> +endif
> +
>  HOST_MESA3D_DEPENDENCIES = \
>  	host-libclc \
>  	host-libdrm \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
