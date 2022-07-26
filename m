Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533EBC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A256419C9;
	Tue, 26 Jul 2022 14:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A256419C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHllJ38D9faO; Tue, 26 Jul 2022 14:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD244195A;
	Tue, 26 Jul 2022 14:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD244195A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5E31BF276
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6727B60FC1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6727B60FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FK4xV-tGHWu for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E370760AE7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E370760AE7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:36:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E5A9878031A;
 Tue, 26 Jul 2022 16:36:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 16:36:12 +0200
Date: Tue, 26 Jul 2022 16:36:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220726143612.GK3168@scaer>
References: <20220726140245.692606-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726140245.692606-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658846175;
 bh=ZSnXZAyumBrp8B4pmJd8q0NOVKdzAz9OUr/QLGIYlK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdtDnGp4FFTik77Bk/Z5H5oabpePTWSJd9rCBZHm8gzgcIXiptpoxPq0LnkoQowOh
 OwKyOVH55Gsimzzwda6m57426hgyoKsE5R/agyGvLPQBM/98lq2HHVJFfdd9ma4sNM
 N++HCNBWofuIbSmoxTUct56CItAP6DLqRLNfnKA9NOMoHa+FAIPV/ls2x0fJJd+J3v
 PvxhSkavPKNW8zqa+7VkYouzFhguR3/29o72P1pHfxwgbaQKUHv4D5x917jUSiuvVj
 rQDy9SBrepd7SYttQOzw97zGbxb/iwCNeQtdRx6ZeeAwD/jhT00SybLlsTAZG7jFqn
 Dx8Sp+CP5dGYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pdtDnGp4
Subject: Re: [Buildroot] [PATCHv2] package/rustc: needs C++ compiler with
 musl based toolchain
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

Romain, All,

On 2022-07-26 16:02 +0200, Romain Naour spake thusly:
> While building host-rust with a musl based toolchain without C++ compiler,
> the build fail since libunwind bundled in rust sources needs a C++ compiler.
> 
> cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system
> 
> Note: the issues can't be reproduced with a glibc based toolchain
> without C++ probaly due to extra steps required to support musl libc.
> 
> We could add the C++ dependency direclty to host-rustc but it would
> requires adding the C++ reverse dependencies to all rust packages.
> 
> Instread, we add the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> only when a musl toolchain is used. So we can still install a prebuilt
> rust compiler but without the rust standard library (rust-std).
> 
> Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS option but
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some
> BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.
> 
> Fixes:
> http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>     after James's review and discussion with Thomas and Arnout
> ---
>  package/rustc/Config.in.host | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fec8726aee..32decba7c1 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -110,11 +110,17 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>  	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
>  
>  # All target rust packages should depend on this option
> +# Note: With musl based toolchain, we need a C++ compiler on the host to
> +# build host-rust some target libraries (libunwind) from llvm source code
> +# bundled in rust sources.
>  config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
> -	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
> -	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> +	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS && \
> +		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
> +	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS && \
> +		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
> +	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS && \
> +		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS

I think it would be much nicer to add a global dependency:

    config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
        bool
        default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
        default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
        default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
        depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
        depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL

And that's all...

Also, as reported on IRC, rustc fails to link with our libz:

    error: linking with `cc` failed: exit status: 1
      |
      = note: "cc" [...]
      = note: /usr/bin/ld: cannot find -lz
              collect2: error: ld returned 1 exit status
      error: could not compile `rustc_driver` due to previous error

But earlier duing the build:

    -- Found ZLIB: /home/ymorin/dev/buildroot/O/master/host/lib/libz.so (found version "1.2.12")

I've run out of time today to look into that...

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_HOST_RUSTC_ARCH
> -- 
> 2.34.3
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
