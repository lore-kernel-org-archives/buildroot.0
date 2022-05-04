Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94688C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D80B60BB4;
	Wed,  4 May 2022 19:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLlm64iUdkEU; Wed,  4 May 2022 19:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF2E960AFA;
	Wed,  4 May 2022 19:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36DDA1BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33B1B40BC8
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3JQS1uzETmN for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF33A40BB7
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:46:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id k27so2880353edk.4
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=h3XINGDgKILZxyLgqoCWse9VgMGukvS1WiLeJJISqWU=;
 b=cbIXMXfJxGiSBXBLAPe9PGwgnyU9xhWJsF6ZRTKc3vHW5MPRFlUKQ+BFybJrgGQdeM
 7A/ncJgsoiq+4rKURowKMeUmmg5mLD5cw74yOjyDsZFQO/97wrCS5vLeKWoPsIIFBqD+
 xHTOfdirAFI2uE+DksVrCWcq8+0a370GeIxnh3WQYEzJXymrdeMX4laKLrJgN/Z71mPl
 u/AOnkL6q/n+5BmZW+ygsh4HHhZ4SoiIiEq2X4ZiGQCh/7I6RafWD1Y2RIpPG2iCqsQ4
 VBKW1kSRxIspeIq4L3BsUzH1BbcBfGxOxUSpShkM/i6veUj3GyqyxyuNDjpaenJ05pV2
 eznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h3XINGDgKILZxyLgqoCWse9VgMGukvS1WiLeJJISqWU=;
 b=lYeBVrWB2kcLlOXb8wkgx4zIXvVQmKjmmKNwI7JcdnLvRhWMtATyunYZIfKQW7/cjX
 ynalvFsQtliEsgj7NTGIZal2zvNXOWe12dIUnspiNr6oKdpNWyAYmHM1SAaGW0Zc02do
 sHKDkdXfMZuGS7f4EV5QFWuSAYEky3K8G2YuAhYMRsbLpI1xrHsl8BAoLbbk3r20WhKU
 pWwp7gdPyphrqKHyf6h7F73tKSLE29YTGII1vZOf1IfGk7IRRfXgs3FZZ6EZZ+KL2X4H
 PSWA1NiXGdCLPSsLQ6jiAZuSycxTxy5LvjpbHZZFPRabEexYPQx/BYBllTBDINS2+Fkl
 Guyw==
X-Gm-Message-State: AOAM530xCQcGnSyjMwZylw3blEF7BVJFKbDEYwilRGGVH8Judp16c5t8
 VOWcFjOHb0CTf6of9zyo0tSf4w==
X-Google-Smtp-Source: ABdhPJzMG8UguNrWOkx5LjZS0BbcXeRYDAMPHRbQJYdlBFXA5RRVxwJYiAvG2HH/Ocm8fhxjI359AQ==
X-Received: by 2002:aa7:dd91:0:b0:427:b2c4:1c7a with SMTP id
 g17-20020aa7dd91000000b00427b2c41c7amr21328486edv.91.1651693597015; 
 Wed, 04 May 2022 12:46:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170907270e00b006f3ef214e3bsm5962105ejk.161.2022.05.04.12.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:46:36 -0700 (PDT)
Message-ID: <e39370eb-8564-64df-3d21-968fd07e8726@mind.be>
Date: Wed, 4 May 2022 21:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220504182958.82477-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504182958.82477-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/gcc: bump to version 11.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/05/2022 20:29, Romain Naour wrote:
> Tested with toolchain-builder:
> https://gitlab.com/kubu93/toolchains-builder/-/pipelines/529686714
> 
> See:
> https://gcc.gnu.org/pipermail/gcc/2022-April/238573.html
> https://gcc.gnu.org/gcc-11/changes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch | 10 +++++-----
>   ...-or1k-Use-cmodel-large-when-building-crtstuff.patch |  8 ++++----
>   ...ine-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch |  6 +++---
>   package/gcc/Config.in.host                             |  2 +-
>   package/gcc/gcc.hash                                   |  4 ++--
>   5 files changed, 15 insertions(+), 15 deletions(-)
>   rename package/gcc/{11.2.0 => 11.3.0}/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch (96%)
>   rename package/gcc/{11.2.0 => 11.3.0}/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch (93%)
>   rename package/gcc/{11.2.0 => 11.3.0}/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch (88%)
> 
> diff --git a/package/gcc/11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
> similarity index 96%
> rename from package/gcc/11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
> rename to package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
> index 6e32f953a3..4888f7e320 100644
> --- a/package/gcc/11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
> +++ b/package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
> @@ -1,4 +1,4 @@
> -From eff8110674ef193481d3657456a262beeb9951ff Mon Sep 17 00:00:00 2001
> +From 7a20b4574f06472086c786bd1b078ee962cdb02c Mon Sep 17 00:00:00 2001
>   From: Stafford Horne <shorne@gmail.com>
>   Date: Tue, 6 Apr 2021 05:47:17 +0900
>   Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
> @@ -166,10 +166,10 @@ index 6bd0f3eee6d..cc23e3b8856 100644
>    Target RejectNegative Mask(CMOV)
>    Enable generation of conditional move (l.cmov) instructions.  By default the
>   diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index 57b97a0838c..d8a6b0b60c9 100644
> +index 35508efb4ef..a1b7608a3aa 100644
>   --- a/gcc/doc/invoke.texi
>   +++ b/gcc/doc/invoke.texi
> -@@ -1141,7 +1141,8 @@ Objective-C and Objective-C++ Dialects}.
> +@@ -1136,7 +1136,8 @@ Objective-C and Objective-C++ Dialects}.
>    @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
>    -msoft-mul  -msoft-div @gol
>    -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
> @@ -179,7 +179,7 @@ index 57b97a0838c..d8a6b0b60c9 100644
>    
>    @emph{PDP-11 Options}
>    @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
> -@@ -26684,6 +26685,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
> +@@ -26443,6 +26444,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
>    @code{l.slli}) instructions.  By default extra instructions will be generated
>    to store the immediate to a register first.
>    
> @@ -196,5 +196,5 @@ index 57b97a0838c..d8a6b0b60c9 100644
>    @end table
>    
>   --
> -2.25.1
> +2.35.1
>   
> diff --git a/package/gcc/11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
> similarity index 93%
> rename from package/gcc/11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
> rename to package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
> index 00dd5de2a3..716f007a24 100644
> --- a/package/gcc/11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
> +++ b/package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
> @@ -1,4 +1,4 @@
> -From da8a9d695b3c4b9397b5d9a27660bfa48af8d707 Mon Sep 17 00:00:00 2001
> +From c544a63928406b706b8493fd9b8ca2136b433cf0 Mon Sep 17 00:00:00 2001
>   From: Stafford Horne <shorne@gmail.com>
>   Date: Wed, 21 Apr 2021 05:33:15 +0900
>   Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
> @@ -29,10 +29,10 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>    create mode 100644 libgcc/config/or1k/t-crtstuff
>   
>   diff --git a/libgcc/config.host b/libgcc/config.host
> -index 50f00062232..8ca7a00082a 100644
> +index f2dc7e266f4..6f193c32fbd 100644
>   --- a/libgcc/config.host
>   +++ b/libgcc/config.host
> -@@ -1119,12 +1119,12 @@ nios2-*-*)
> +@@ -1132,12 +1132,12 @@ nios2-*-*)
>    	extra_parts="$extra_parts crti.o crtn.o"
>    	;;
>    or1k-*-linux*)
> @@ -56,5 +56,5 @@ index 00000000000..dcae7f3498e
>   +# Compile crtbeginS.o and crtendS.o with -mcmodel=large
>   +CRTSTUFF_T_CFLAGS_S += -mcmodel=large
>   --
> -2.25.1
> +2.35.1
>   
> diff --git a/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
> similarity index 88%
> rename from package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
> rename to package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
> index 5ac03d7c0c..e33dec3ff6 100644
> --- a/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
> +++ b/package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
> @@ -1,4 +1,4 @@
> -From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
> +From 8ef5787701f4d7cf46a27771d38ab54af2499e25 Mon Sep 17 00:00:00 2001
>   From: Bernd Kuhls <bernd.kuhls@t-online.de>
>   Date: Fri, 27 Mar 2020 21:23:53 +0100
>   Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
> @@ -14,7 +14,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>    1 file changed, 2 insertions(+)
>   
>   diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
> -index cbdc781418f..36303af892c 100644
> +index 196f3f3c8f0..0cbdc934af1 100644
>   --- a/gcc/config/or1k/linux.h
>   +++ b/gcc/config/or1k/linux.h
>   @@ -32,6 +32,8 @@
> @@ -27,5 +27,5 @@ index cbdc781418f..36303af892c 100644
>    #define LINK_SPEC "%{h*}			\
>       %{static:-Bstatic}				\
>   --
> -2.31.1
> +2.35.1
>   
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index a1fe192d3a..f6b9b4fa9d 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -81,7 +81,7 @@ config BR2_GCC_VERSION
>   	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
>   	default "9.4.0"     if BR2_GCC_VERSION_9_X
>   	default "10.3.0"    if BR2_GCC_VERSION_10_X
> -	default "11.2.0"    if BR2_GCC_VERSION_11_X
> +	default "11.3.0"    if BR2_GCC_VERSION_11_X
>   	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
>   
>   config BR2_EXTRA_GCC_CONFIG_OPTIONS
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 5655c7a9d7..ad8bae4a99 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
>   sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
>   # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
>   sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
> -# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.2.0/sha512.sum
> -sha512  d53a0a966230895c54f01aea38696f818817b505f1e2bfa65e508753fcd01b2aedb4a61434f41f3a2ddbbd9f41384b96153c684ded3f0fa97c82758d9de5c7cf  gcc-11.2.0.tar.xz
> +# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
> +sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
>   
>   # Locally calculated (fetched from Github)
>   sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
