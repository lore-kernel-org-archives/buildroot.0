Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gy0RDyBI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEC160B6A;
	Fri, 30 Oct 2026 15:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6-SDqYd4B80; Fri, 30 Oct 2026 15:28:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 405E160B58
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374080;
	b=YVGHjzY/QFgmitGeClBQbQQSs2+fquTKaTBML7MNAyb+euOgS9iuBHabEhfW+Tk2N9NH
	 xEAlqo4TC3fNkfNX3PV8Vlv48jCDB/UrVy7h/P6SQtRWRG3iJDXApydXQbMyiWYYRoOzo
	 OaTcG1TGe3w5DzP7uOhlwPtg2eIDP2s09ALIzw9oOWrAw/PoSqSvAzstDk5K8Ql4J/rI3
	 tG5fbzRzq5Bhdcm0hzFkwmoCr6knHcI47k1kUvWNJPuR3xt+VwoVDmtKpqpbGSMA4Z2Tz
	 OyfQHSenBRsOU7H/rA0mMvjM9YWA2s7Xg920heF1n394Pee4qy5IhYNmgUD0w/FAWQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i1yL2X8qr6asLJCONmrJp8J/qRI65FARxlF7C0KqWII=;
	b=hoS2NiT9EwCnXm1T6pxf0OJMeD510XyUWBDoOa/e1/E3FnzCdRreZIz/sBnOU2uLwOrC
	 WeYORv6DydOnZS8Rh3DWQQMQViPUWI5jhyJhbjlcWFTQfxARZHuTTXdf2s3x9RFSophHJ
	 6oqViegfucIdFw/uprznXhtLXgGY0/nRM3hijp/GQjZCZYho3zmUQO31r04NuyG5gVF92
	 FPocEVMvXRWITAL14CeRkcOcQcq7wntu5lTORXfy0BVNXdS05m6M9fGXeW7cfcvsxPNAh
	 X7HAMfW6cUDeZ/XfyDK/6fFF39KSfCsFy8kllRBciEEJBvA9fi9LPWM3iyq3tk88OIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374080;
	bh=i1yL2X8qr6asLJCONmrJp8J/qRI65FARxlF7C0KqWII=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gy0RDyBIO0fmFD+2kwFgNg0UzElD1MDedDwf54vCBfIsGokoM/KiZNsqkZJR8oVx3
	 674luGqlFLgBEr6Bc4MMdUTLeUt0egXcX9CaOr4mMS11/S0QPkYdOf3EU7EDRA0gG3
	 XMDeloasRUjC92EoprpbwEEYmyQrdSXRdDRrAY+2Bl7+yn2jhIa0xHThtNOI5zWWGt
	 U7ajmshmTLUF5djWR5SwJ4RsRbDb3hezV1Ckbh+g2bth9u6EDpYN6Cgglow+R/akS0
	 usmp0lJ8KmL5OOPrH3xVOd68WmwE5H+LXQOUPUUT25AwgbN2byeq15bDqSvxHI/+p7
	 BJcJXWpfl7vBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 405E160B58;
	Fri, 30 Oct 2026 15:28:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11380D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 031F840C68
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJZ5AIvwmz9P for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8CF340C64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374055;
 b=bDweNrxsLzFfyv6sC7fJILHraWqHDzYdGQ3IKZPJl878spJSVbhwZi9VdE0I6t9+xFnt
 okj9y2E1e1uUSMejTTzqVIF7tqF4espR6WKT/VVKC4Siwn/wztIzdd6Y7dQ23PNpPKBAs
 sUp07zhetTqPhPah2p5/xIt1YXil9E7SvQrWavm124vGEu8GLqcblJeXOb+BG1aZSs1rd
 VMFH5SR2ZfaBuJKYBM0BE7/Pkx2nFnlNOeT6bVDqmIy9ntr5Szu8iIUa1tcNH89nBxVdk
 CPmL9wkUv74Dz2DnqzuIJg3JnpLdFPobxDPXVwgDJX8iFxpyhss5yZ6HjQnjeDyxmMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374055;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xVT8duY5Xqtz4mnG4qkZI+M65aA0vu9YYGVJx1ZddgE=;
 b=HfpxAjiJw0yovx/+meb8df6y0T4T/MxYoKUEP7bmdK69UnYPIbwYAO2MeMSdcYDPmEE4
 8RwzL4k76VbPh2/Vgu5UJ4rdFSm9hPd8zH7riuRTvtIyP6yl5FGGXgGh6YuIazL7fQGLu
 V1mLB8lc1yRtwstBsJeurRwa1OSR3HwFY8YSS/7e/rb9HuWCHPzlEICEYXCLFzA3WOTS4
 pg5NcbuI7F7J+r9CxANKbTiGKIoVTjY3jAOzRjr+Czv6lr4mG7bNNWMCQyP8lSYLErnJj
 kjcYT4SwayanpwUTijAaAvBE7kkWwcdMFPfrp/qhJM99ZtgA4EJgfTsO8rud51/C4bQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NW1sBPlA; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8CF340C64
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso7519825e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374052; x=1793978852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xVT8duY5Xqtz4mnG4qkZI+M65aA0vu9YYGVJx1ZddgE=;
 b=rfhQuHbOLSfR0UFf9ew39bHlcuMPoBzsQWvnR+PFnXYgMn0I6/jEgDUtSBQnrwKPgR
 URgd9jOVIRDr+xrcEdptGOd3hXo28sNtbFbwzlJoAMJSJl8siqACR0cSeAmOqYybhmpl
 5iiAlCrG0BQQNr/dkTsKIka2FVl96a3oDdabtQD/J2BPHrQimvgssGUrZGJSmOkExLFN
 q/UdTmTzEplAFxyXNPaYM+fJBO2ktTnQzgomOOtfXm/ybKFxWMV1+8t7XdcPMkVQJeiL
 /ruFu4XBDSUYLMkrAGX1x+4l/nXb6XhI/CKsRyuGEZj6Y+f8KqcVc+pmbc9tvE4WD/TJ
 9RnA==
X-Gm-Message-State: AFq9FYJU2PD4//c9Zeo1aY/fwUzcwmRpH+PH8DMcnxy/Wd0jf1UTPlKh
 3g3TawUim9b2Sj9tCsUS/3z9GJsPN1XlYBZZE4dZN4xsKheBLBe8sC3orVOjOGbEoRFiwkKUHlV
 ClTSejvU=
X-Gm-Gg: AYBFou3M8vhaChOlvqJ+N2LAstvmznBZFuD1kNtWGq2Ypa3gxtGZWmuwKimu0INjufp
 Mk+H/p8T9UTrTaZyNuLr0M47x7k+icuflsJaxKxXH6O3GoeiZLmM0MAwdEodgcE9kKbV8Cg1zKL
 Zn0DlokBNSWe3kRJpvU2FRNEfs2kZvkyYr3AJreQv//nu4P5LMrafrKZnabMopYBz+57fif0ima
 qe+qNVrKWsfMcZojvvADNyiBLMSH6N2JqzujqaQQ8plwGFEcdLLRDPh9gTM1HpvAEDMpjZ8DpLB
 pOzjQ1W4OgBYcGemAsly/5Myx17X7VqTgCxuRi7rDVyaK7kI96Ur7Vg+JibX0dkKTRlGYx8o6tu
 KPBV9UwmdtAlNWE/kLSmzkY4xV4J1iwnAk+tShvh+i+hYJjr8qbl1Q8PIVYAoRs16ZtYebZJKpZ
 hBGKx1mSyAFUf7ml9lR0t+wEkjH/GsDysRcE5S/v9dk+SQLkH+1WG1HqgHQJ4APQwARRjgSL9hV
 6FpKZhIEbPN1GCqCLvXzJgvni0mH9QB0Pw4ODnDtIACDiJuDCTPQZZvRGLqPneY6lcRh9wFYu8X
 4T/MimAdAgsXJaSAprLEv6h3ebp0KGWimuPiLOUbuHKgvbGvypHHlK8g0VR7ngnYDUrKbvCZe95
 ZAqRkSxOZ0w8D52NHJQ==
X-Received: by 2002:a05:600c:630d:b0:4a7:a309:6b73 with SMTP id
 5b1f17b1804b1-4ac150b2896mr57702385e9.1.1793374052421; 
 Fri, 30 Oct 2026 08:27:32 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf5b286a0sm55563715e9.4.2026.10.30.08.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:29 +0100
Message-ID: <20261030152731.1906801-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020202639.1094960-2-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] Revert "arch: mark a set of target
 configurations as secondary"
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The initial attempt to make secondary configurations to be selected
> less frequently by autobuilders is not working as expected. It was
> observed that the i686 architecture was selected most of the time,
> because it is currently the default choice. We revert this
> implementation to propose a new one.
> 
> This reverts commit ddce0814a794b27a6449b144f85c90fa53e92ac6.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.08.x. Thanks

> ---
>  arch/Config.in       | 19 -------------------
>  arch/Config.in.arm   |  5 -----
>  arch/Config.in.riscv |  2 --
>  arch/Config.in.x86   |  3 ---
>  4 files changed, 29 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 863a1eed34..7bfa174b5f 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -23,7 +23,6 @@ choice
>  
>  config BR2_arcle
>  	bool "ARC (little endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  Synopsys' DesignWare ARC Processor Cores are a family of
> @@ -42,7 +41,6 @@ config BR2_arm
>  
>  config BR2_armeb
>  	bool "ARM (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  ARM is a 32-bit reduced instruction set computer (RISC)
> @@ -61,7 +59,6 @@ config BR2_aarch64
>  
>  config BR2_aarch64_be
>  	bool "AArch64 (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARCH_IS_64
>  	help
>  	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
> @@ -70,7 +67,6 @@ config BR2_aarch64_be
>  
>  config BR2_hppa
>  	bool "HPPA"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
> @@ -86,7 +82,6 @@ config BR2_i386
>  
>  config BR2_loongarch64
>  	bool "LoongArch64"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	select BR2_ARCH_IS_64
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
> @@ -97,7 +92,6 @@ config BR2_loongarch64
>  
>  config BR2_m68k
>  	bool "m68k"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
>  	help
>  	  Motorola 68000 family microprocessor
> @@ -105,7 +99,6 @@ config BR2_m68k
>  
>  config BR2_microblazeel
>  	bool "Microblaze AXI (little endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
> @@ -115,7 +108,6 @@ config BR2_microblazeel
>  
>  config BR2_microblazebe
>  	bool "Microblaze non-AXI (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
> @@ -125,7 +117,6 @@ config BR2_microblazebe
>  
>  config BR2_mips
>  	bool "MIPS (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  MIPS is a RISC microprocessor from MIPS Technologies. Big
> @@ -135,7 +126,6 @@ config BR2_mips
>  
>  config BR2_mipsel
>  	bool "MIPS (little endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  MIPS is a RISC microprocessor from MIPS Technologies. Little
> @@ -145,7 +135,6 @@ config BR2_mipsel
>  
>  config BR2_mips64
>  	bool "MIPS64 (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARCH_IS_64
>  	select BR2_USE_MMU
>  	help
> @@ -166,7 +155,6 @@ config BR2_mips64el
>  
>  config BR2_or1k
>  	bool "OpenRISC"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  OpenRISC is a free and open processor for embedded system.
> @@ -174,7 +162,6 @@ config BR2_or1k
>  
>  config BR2_powerpc
>  	bool "PowerPC"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
> @@ -184,7 +171,6 @@ config BR2_powerpc
>  
>  config BR2_powerpc64
>  	bool "PowerPC64 (big endian)"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARCH_IS_64
>  	select BR2_USE_MMU
>  	help
> @@ -215,7 +201,6 @@ config BR2_riscv
>  
>  config BR2_s390x
>  	bool "s390x"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARCH_IS_64
>  	select BR2_USE_MMU
>  	help
> @@ -225,7 +210,6 @@ config BR2_s390x
>  
>  config BR2_sh
>  	bool "SuperH"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  SuperH (or SH) is a 32-bit reduced instruction set computer
> @@ -236,7 +220,6 @@ config BR2_sh
>  
>  config BR2_sparc
>  	bool "SPARC"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_USE_MMU
>  	help
>  	  SPARC (from Scalable Processor Architecture) is a RISC
> @@ -247,7 +230,6 @@ config BR2_sparc
>  
>  config BR2_sparc64
>  	bool "SPARC64"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARCH_IS_64
>  	select BR2_USE_MMU
>  	help
> @@ -268,7 +250,6 @@ config BR2_x86_64
>  
>  config BR2_xtensa
>  	bool "Xtensa"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
>  	help
>  	  Xtensa is a Tensilica processor IP architecture.
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 5c9037c959..eb5babe29b 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -112,27 +112,22 @@ choice
>  
>  if !BR2_ARCH_IS_64
>  comment "armv4 cores"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  config BR2_arm920t
>  	bool "arm920t"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARM_CPU_HAS_ARM
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_ARMV4
>  config BR2_arm922t
>  	bool "arm922t"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARM_CPU_HAS_ARM
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_ARMV4
>  config BR2_fa526
>  	bool "fa526/626"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARM_CPU_HAS_ARM
>  	select BR2_ARM_CPU_ARMV4
>  config BR2_strongarm
>  	bool "strongarm sa110/sa1100"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	select BR2_ARM_CPU_HAS_ARM
>  	select BR2_ARM_CPU_ARMV4
>  
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index 8801590d80..299190f364 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -58,12 +58,10 @@ choice
>  
>  config BR2_RISCV_32
>  	bool "32-bit"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  
>  config BR2_RISCV_64
>  	bool "64-bit"
>  	select BR2_ARCH_IS_64
> -	select BR2_RISCV_USE_MMU if BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  
>  endchoice
>  
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 51b157409f..0a6d80bf03 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -50,15 +50,12 @@ choice
>  
>  config BR2_x86_i486
>  	bool "i486"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	depends on !BR2_x86_64
>  config BR2_x86_i586
>  	bool "i586"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	depends on !BR2_x86_64
>  config BR2_x86_x1000
>  	bool "x1000"
> -	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
>  	depends on !BR2_x86_64
>  	help
>  	  The Intel X1000 is a Pentium class microprocessor in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
