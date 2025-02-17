Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D264FC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 22:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDF160AA8;
	Mon, 17 Feb 2025 22:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnCNqQe83_Ag; Mon, 17 Feb 2025 22:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED5E360675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5E360675;
	Mon, 17 Feb 2025 22:24:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 838D2968
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739DC811CC
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OLgI4NGTNTS for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 22:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70C7C811C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C7C811C0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70C7C811C0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439685e14f1so22941895e9.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739831058; x=1740435858;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=skavUWE7eQTL4f/NT9Y8r9wMs9Dpp22438WQh3z3ubE=;
 b=UR/59wwG9ySnlnyMTjuAMUoikGxpu7nK6bm790OD3PUmM7rvXDFMDM6kcLUrpycDRW
 FmQxHLViRJJO5h9g4ENOruYwyvBGFDkSAJPB+Zmkp/dBNcFUQ54nWAYThTxTrB26EzzB
 b9NS8j5zXjA06x46flXSJvosfXNXYHv9edALKNPHk4WC2nHu3jXVpBinlVxZc+rpRNgp
 qRaw6Jtp9tydgu3cCsymldZVp/5+sMTEeCr+WabIpxHiUkJRACAdw9yXM/tK4TiKXBld
 o4Fj8wSpEdCW+ko30hFtBTWWGmprDqLWuoRK5FmMoixbDTiEzswt80+xm2rPziftMmEE
 2Q3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBO178fjb451h1lxYcZWWHVPMuPhik+oYg/6oMOhnHTA/ha0FU6KYI3vSYa6IjQTmWqGnOVscBWGY=@buildroot.org
X-Gm-Message-State: AOJu0Yyg2vaZmLE/MFfuta11OEoR37R1b1kWuJlWoCKyEIzvovOmmDSd
 yMvqU/5mPDkUlDElp7AgITEblcqKUf3F5JWHvlN/nBdEufgQgjF1Xd70rFwZauw=
X-Gm-Gg: ASbGncsGB0IN5p8rUVm9iLDGS8c/fZYUPTM/wXZKiMMdB+9ohXObtgAoLTb0eV7id8T
 B+94HmXIyDmW0L/+DaQJ3VIL+wCW69LUqsLMASb+XsUXM8vByTQf632KgTBfo0pG6dpAp12vOGG
 zqJkdxgsutJCtJJUdzFENYzwUpnQokgK0zQd+z2UWd/w3cAtxN1SJglOJmLp/s7DpMI8R+waHAn
 6kNWloUwRE9lGWsZMdn1DgsP/QjoqwRoAYuM8ZyH3p7UVbdJi+dCdae/77/lprfdvRwzUos5LKl
 I4sMXFqwEY6R8fnYg1pY3DjiHG0TwM1ZcCRzBtG+kBstnSBqd1ctkn8fFABxk6ypTTET+HD1AUT
 48+9ht6rKBAN/D07qwTdeHOZOsJVLL8da5rV6V0uOFkTMrA==
X-Google-Smtp-Source: AGHT+IEGPmJQ1jxKixFe9J3Bnv945YRp3T+LyuXgiwsHmyVmBgCJazqQokWce12FQ5rGI9BL2CiR0Q==
X-Received: by 2002:a5d:584e:0:b0:38d:cdac:fc02 with SMTP id
 ffacd0b85a97d-38f33f117bbmr6445469f8f.4.1739831058352; 
 Mon, 17 Feb 2025 14:24:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d8dd6sm13463212f8f.62.2025.02.17.14.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:24:17 -0800 (PST)
Message-ID: <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
Date: Mon, 17 Feb 2025 23:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250217124932.2653445-4-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739831058; x=1740435858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=skavUWE7eQTL4f/NT9Y8r9wMs9Dpp22438WQh3z3ubE=;
 b=e4ULVKcBXBX1BY+DZMlDgCPT8R5KBOMTNWFfNhNCGaIsde7soogwmrl/+yH/NaEx0E
 P+w+Xv+3vK3hl59RY0q3NgHpBwncnJN9u2Cd6xSenW0rxV3EqiSabCD4bvjTtdQZqDsg
 E2o3wU8R5G+tR149gYT2eebL6rHgOgaeY8FHoLbUVpDNDgneecEpi3QhUxy8c1YmogqV
 FWji9/nNi3la45QFz6lZCnTkDej27k715Dz5fucJDKdpbyfjX5V4Wzw47h887VuzYCvh
 3HOS5rvvn/C4BYMAraVrQMr6I+ad1gAmttjvQdv4mUQGpIM9nw/BeJy016ChzNBsVIYA
 S6sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e4ULVKcB
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2025 13:49, Neal Frager wrote:
> Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
> have been upgraded to support a list of architecture tuples, this patch
> updates the toolchain-bare-metal-buildroot help text to describe the new
> capability.
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
> its prior definition as defining a single tuple with this new definition
> works exactly the same as before.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - no changes
> V2->V3:
> - improved help text
> V3->V5:
> - no changes
> ---
>   toolchain/Config.in                                  |  2 +-
>   toolchain/toolchain-bare-metal-buildroot/Config.in   | 12 +++++++++---
>   .../toolchain-bare-metal-buildroot.mk                |  1 -
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index d6ed25ff96..94723da141 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -941,7 +941,7 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>   comment "Bare metal toolchain"
>   
>   config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
> -	bool "Build a bare metal toolchain"
> +	bool "Build bare metal toolchains"
>   	select BR2_PACKAGE_NEWLIB_BARE_METAL
>   	help
>   	  Select if you need a bare-metal toolchain for building
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> index 6fe969357f..19c97410c6 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -1,10 +1,16 @@
>   if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>   
>   config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> -	string "architecture tuple"
> +	string "list of architecture tuples"
>   	help
> -	  This option allows to define the architecture tuple for the
> -	  bare-metal toolchain.
> +	  This option allows to define the list of architecture
> +	  tuples for which bare-metal toolchains will be created.
> +	  One toolchain will be built for each of the architecture
> +	  tuples specified in this option.
> +
> +	  For example, to build both a Microblaze and a RISC-V bare
> +	  metal toolchain, use the following definition:
> +	  "microblazeel-buildroot-elf riscv32-buildroot-elf"

  Since the microblaze toolchain is only ever going to be used for xilinx 
platforms, and they apparently expect the exact tuply microblazeel-xilinx-elf, I 
kept that one as an example.

  Regards,
  Arnout

>   
>   source "package/newlib-bare-metal/Config.in"
>   
> diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
> index dbfe30a910..71063fcee4 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
> +++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
> @@ -6,7 +6,6 @@
>   
>   TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
>   TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
> -TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
>   TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>   
>   $(eval $(virtual-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
