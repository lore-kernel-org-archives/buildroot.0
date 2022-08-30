Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABAEECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB4A940BCC;
	Tue, 30 Aug 2022 19:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4A940BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsONO8uNONGZ; Tue, 30 Aug 2022 19:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA2E840BC7;
	Tue, 30 Aug 2022 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA2E840BC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86BDF1BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61FB361003
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61FB361003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8JUdFI-Vf-c for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:16:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D9460FFF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35D9460FFF
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:16:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 641A1B00573;
 Tue, 30 Aug 2022 21:16:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:16:38 +0200
Date: Tue, 30 Aug 2022 21:16:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220830191638.GB68979@scaer>
References: <20220727083753.935654-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727083753.935654-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661887000;
 bh=Ec0aJYLDR7miEex+cb+fNDoTJpUxIPkFkjiKCu8NYWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCZFLY8JXQzI52OyPIaDmIOsRsy1bMKKlOWWNCDx8HHGCJpJ2RrJ4A+s7vOF4tU9M
 jwURz9ADNtiYgRneLYccvYL2oATvTxOOYYUFFjB3plUJ6hD6wnYyr12zsH7wcwuCir
 PQ3QtQn92ybttxmRJ5IHee6MjlHjZnwFFAl/8I+xjHD8FXsgZN4pyqKtdyn4q347/I
 JKG0Dj6d6IH9PcpDq04BusM7lOZYP1B0vJmaz+1vFjNyr+JH5M3pyKRxKkm6GiGel8
 2Zc+6t882RBTeH+NCgB7eGy6KovMLYRUGxI3WSv8g7bvpEoQ/kYBdcFWMsOLAh1I2t
 ob5oKZkoPn5ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pCZFLY8J
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
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

On 2022-07-27 10:37 +0200, Romain Naour spake thusly:
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

By lack of a better alternative (like using a standalone libunwind as
James suggested): applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v3: add a global C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS (Yann)
>     update comment to use "C++ cross compiler"
> v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>     after James's review and discussion with Thomas and Arnout
> ---
>  package/rustc/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fec8726aee..822de68dbb 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -110,11 +110,15 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>  	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
>  
>  # All target rust packages should depend on this option
> +# Note: With musl based toolchain, we need a C++ cross compiler to
> +# build host-rust some target libraries (libunwind) from llvm source
> +# code bundled in rust sources.
>  config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
>  	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>  	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> +	depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  
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
