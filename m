Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D0606A33B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ih/4pLkz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C043381886;
	Fri,  6 Nov 2026 16:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OH6pkIhkJuPB; Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B4CD8188A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981376;
	b=OnVJvLQGcwL7QZ620j1MoBBlZHePDM7JoE+axM2VUkgmD6THMBhCOsyCwGWWDM87uWjz
	 rUmR65yCIWN0O0pTKONESm1+P6r48Udy1olSyrKo9EDp20VYp7xIqndZWloOZM8kG9s/J
	 vB1R8v4FVY8m1h3q6mNXw9eZgjL5vsZTra8I6vTF/q/f/os6UnO6DSgtpS0IN+Rejxp+9
	 cyXxnuFi29UDjeWr/WKGYzcOMoWH29SX2kowXGgJsIpWoKBD+Vb+JuxymAzLkFxpvOp55
	 27+hy4dj++C3iZkbyhhfedCfXE3pMALYkhsvto8eg3bGs0P9OVmWPEG7FH72o236Kvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eLjPiMNrDmsYRXpwlBqR/2fcmrDFsmzUm4V7Jh6PMB4=;
	b=FziBxkPYLMtYxP9xqxWsOf0UcC43Yfq/qtqaa2GZ5Y8XzxhYtlgQNvTHxWaxKwOUJfL4
	 jrGPd3DonTZSwr5guUTuReKWPZe1Optulgrxt5v3KF4KzMpitA+4o1l+zoG3wo+TPRukA
	 5kfpTTMwXpZs14Rh8cYUINjDMIy0a6D+CddIYlfPcEzeIRkQpOGCtE/8iejfNHd/Ubau/
	 S2AC0dbzSdDi/wHl3f7Sda4M3mWGT4FNlyCCS1Rx4tn4v8wL7br6bR34CJYXTTb9ZNyBr
	 68e86zHnBFUQ6SiBPYQKTTsMPnnKiDIn48luhG9+o4I21pRsunJ4Gf8WRLBmdlqxqCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981376;
	bh=eLjPiMNrDmsYRXpwlBqR/2fcmrDFsmzUm4V7Jh6PMB4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ih/4pLkzSF7IqaFD8Gwi9OZlnQhC9dLRSFXHqjpztpH1T1wOKJYQLuL0OtbV7O80w
	 8cCwDI9+fezSoHoZBNI3+48FT15gnZOju9ot6ewAdnoWYzV5v8m552ho5fjT4dS3Ys
	 fuzp17obvDlgp6VYBqj8NbJJPfN2nrdje4wZrBo9qiyRIFt1erkghfCBP7r/p7B4M9
	 1aWvpaMIa3Lni4VW2VuqBTzDqlSbJApXwaJZ2+dgU/erF2bGO4YND75KU8FvLn22Qt
	 mGrWGGq6NQUg0hhlK3rBqn1y2T9tjPK6Rq9QUYaHLAa2l28ApurDibFlXu+14/J9S7
	 ea31RY/r0KkBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B4CD8188A;
	Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAFA2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8D160A44
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiUWDr77Oarz for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD62E60904
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD62E60904
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-49318428d98so401818f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981331; x=1794586131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dLB/sJO3ELowX20esi4bvW3UdSkQeiwrlhgAdzonOww=;
 b=UmUPFoPtuqs6EhD/jxj9XEAsgtJjPN/ZR/2L9S3zNTl4kjUTi4m1fC2iPzYFhwqqer
 tpIeZsxZoYCuJmjdMdVSNv+Ms1JERATtE3uFxO7MQH+CTd70Gci3OLjiKZOf6vg8kHY7
 Mn3Y6Z9pid7wSKTylARL913dLZp9U5tFGJTZeu67lFquC3XKI+nTHiTscx6yORFZDdAp
 3o4zgToXwtyEJBkn0GrNQE9BkyH/TOysfsPf2ZNVlGZ/Ejw+RYi8z5CQztWfjm2BfB1j
 nR1Yyz6aFN8S7zuvM42WBL9n792GgxnXBpFzuPdXI08mNB8WhcXDpoIF43/mkFWbYGv+
 f2aQ==
X-Gm-Message-State: APuU4Z8CuXUF9PTtb80vzG1hQEF6MWsuRK5L1/jFmStG9P8koFF+CFhQ
 jI2AntKeIzHDcNPmo7kd5gQ1k3ix42sb7hzR1v5l+80bAwwJXnTs5Y6M0vfQ85Wrz3Ly9Xholit
 5nNWx/7E=
X-Gm-Gg: AYBFou16RZNFlM+llCgfrlk1TJFqmEont5PSf2qNn8fWm1gOWHfC4vIzJJjP6kyp+/g
 qXXIPdheZjXkeinesuJbRssmTorjXe2ZyWpH/nxEf0pD6Wp8GSMEOhcQQVjVGpSL56jnVlR+bj+
 PWeX1q1t6IYx6itLp3qfOY0YVh/cp9mPoXx2GgLK6CLWlLfeXa2pgQU/oLhVBABCe8vuWxmvxeG
 3zTeo5oEZgXHcqQvRvMfGU8l/UigE8AhsgJuqiLgMg3cx+v4E9sTL4y3m3v48w8TOceOc8ekVrr
 SWyvgsVnLd+juOzrS3w5L93WVKJ/VOrrdEbVSuRPYFT+o4b0egtNu5l4rU8KvI1H/P21bGLZvR8
 yinpWGSc2xKU1aC/JHgQMS40mGJ2IIk9y3hYnZU+TDHNxdjK4Q0Xg2uWzz1LmQ4JGy82GbyWBNE
 Kz5bHiK4OrqT34W12Kq17Q5QkFep9Z8/Z6WEARFEkJ7NshaPUO8aRQGUF0vhVMZH8HoIZAU9k+O
 CDkfYuU6Z6o1IMymYxvrCs8YuWs2oKkk/FL/HRFVuBBqZ4Ve5vYoYHIUUZ3WB3cYuTwbB1N80bd
 cAyHBhG3e1pkRmJI1jFiFLAqc0fYyWc=
X-Received: by 2002:a05:6000:4908:b0:48e:68d5:818d with SMTP id
 ffacd0b85a97d-49274bc8392mr5180133f8f.16.1793981331586; 
 Fri, 06 Nov 2026 08:08:51 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d809df2dsm4551116f8f.51.2026.11.06.08.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:08:50 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:08:47 +0100
Message-ID: <20261106160849.606822-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913095115.1622920-2-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RE-RESEND 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 ARMv7 EABIhf toolchain fix
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The gen-bootlin-toolchains script has been fixed to generate more
> correct conditions for the ARMv7 EABIhf toolchains (both little and
> big endian). This change will make sure the toolchain cannot be
> selected in a BR2_arm=y, BR2_ARM_CPU_ARMV8A=y, BR2_ARM_EABI=y
> configuration.
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .../Config.in.options                         | 40 ++++++++++++-------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> index 86d951e8a6..81cb3f0a05 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> @@ -8,8 +8,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
>  	default y if BR2_arcle && BR2_archs38
>  	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
>  	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
> -	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> -	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	default y if BR2_arm && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
> +	default y if BR2_armeb && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
>  	default y if BR2_m68k_m68k && BR2_USE_MMU
>  	default y if BR2_m68k_cf
> @@ -770,7 +770,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	bool "armv7-eabihf glibc bleeding-edge 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
> @@ -794,7 +795,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
>  	bool "armv7-eabihf glibc stable 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
> @@ -817,7 +819,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
>  	bool "armv7-eabihf musl bleeding-edge 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
> @@ -841,7 +844,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
>  	bool "armv7-eabihf musl stable 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
> @@ -864,7 +868,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  	bool "armv7-eabihf uclibc bleeding-edge 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
> @@ -889,7 +894,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
>  	bool "armv7-eabihf uclibc stable 2026.08-1"
>  	depends on BR2_arm
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> @@ -913,7 +919,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	bool "armebv7-eabihf glibc bleeding-edge 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
> @@ -937,7 +944,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
>  	bool "armebv7-eabihf glibc stable 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
> @@ -960,7 +968,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
>  	bool "armebv7-eabihf musl bleeding-edge 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
> @@ -984,7 +993,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
>  	bool "armebv7-eabihf musl stable 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
> @@ -1007,7 +1017,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  	bool "armebv7-eabihf uclibc bleeding-edge 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
> @@ -1032,7 +1043,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
>  	bool "armebv7-eabihf uclibc stable 2026.08-1"
>  	depends on BR2_armeb
> -	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
> +	depends on BR2_ARM_EABIHF
> +	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
