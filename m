Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B30C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB9940204;
	Thu, 30 Dec 2021 17:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTi67DWufHbo; Thu, 30 Dec 2021 17:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B73440904;
	Thu, 30 Dec 2021 17:52:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABA81BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F314C40904
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2Lhknl_9Yrc for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:52:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7358440204
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:52:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:14b5:310a:ddef:6cec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8E53013F84C;
 Thu, 30 Dec 2021 18:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640886734;
 bh=BmWizrlhubpnafncGwhejdhLrJHVYr5xWWWGURqFOVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4slvigI7XoKm7J2xGnK78hBm59PN9yr8U3Csvs3ph/3ySyGfLd1daPCwyiw+mUGc
 UE+S7ISpMu4kVAin1LVi4BQKLfsHab3VIqH5D7LFSy2lgtO4e0ZOpvSmEw0oqVp+3y
 6URauU20O2rC8WwVgWvMxGJA6mB4blVRQXQ0D1hZSNSaFqJIfKeaU+9RiL3udflh9s
 b+GehJXYb4obOtl4bZY5UHmDQkYx257Qyeh04bNa7z6IPVsu0myQBSQTHk/G3zbnbr
 z7FemMdoXS2zlCAOXBAZxChTo/dWVcFrsgB2Cn32LccO9wzt1ASMMg8KSwBiav3bZZ
 HNHfkeMR5ULHQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Dec 2021 18:52:01 +0100
Date: Thu, 30 Dec 2021 18:52:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211230175201.GI3390456@scaer>
References: <20211228091541.1155068-1-thomas.petazzoni@bootlin.com>
 <20211228091541.1155068-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228091541.1155068-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] toolchain: re-generate Bootlin
 toolchain descriptions
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-28 10:15 +0100, Thomas Petazzoni spake thusly:
> Following the releases of 2021.11 Bootlin toolchains, this commit
> represents the result of re-running the gen-bootlin-toolchains script.
> 
> The only part that isn't auto-generated are the contents of
> Config.in.legacy, which account for the replacement of the RISC-V LP64
> toolchain by RISC-V LP64D toolchains.
> 
> The complete set of runtime test cases was verified on Gitlab CI:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/437767674
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I re-ran the script locally, and there was no single change; good.
I also downloaded a few toolchains, and their hashes matched; good.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                              |  14 +
>  .../tests/toolchain/test_external_bootlin.py  |  80 +-
>  .../Config.in.options                         | 856 +++++++++---------
>  .../toolchain-external-bootlin.hash           | 684 +++++++-------
>  .../toolchain-external-bootlin.mk             | 374 ++++----
>  5 files changed, 1084 insertions(+), 924 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d240bda810..5994d94487 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,20 @@ endif
>  
>  comment "Legacy options removed in 2022.02"
>  
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
> +	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
> +	select BR2_LEGACY
> +	help
> +	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
> +	  in favor of RISC-V 64-bit LP64D toolchains.
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE
> +	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
> +	select BR2_LEGACY
> +	help
> +	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
> +	  in favor of RISC-V 64-bit LP64D toolchains.
> +
>  config BR2_PACKAGE_IPUTILS_TFTPD
>  	bool "iputils tftpd option removed"
>  	select BR2_LEGACY
> diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
> index af60c21f7d..5e908b957e 100644
> --- a/support/testing/tests/toolchain/test_external_bootlin.py
> +++ b/support/testing/tests/toolchain/test_external_bootlin.py
> @@ -2050,15 +2050,15 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToo
>          TestExternalToolchain.common_check(self)
>  
>  
> -class TestExternalToolchainBootlinRiscv64GlibcBleedingEdge(TestExternalToolchain):
> +class TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge(TestExternalToolchain):
>      config = """
>          BR2_riscv=y
>          BR2_riscv_g=y
>          BR2_RISCV_64=y
> -        BR2_RISCV_ABI_LP64=y
> +        BR2_RISCV_ABI_LP64D=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>      toolchain_prefix = "riscv64-linux"
> @@ -2067,15 +2067,83 @@ class TestExternalToolchainBootlinRiscv64GlibcBleedingEdge(TestExternalToolchain
>          TestExternalToolchain.common_check(self)
>  
>  
> -class TestExternalToolchainBootlinRiscv64MuslBleedingEdge(TestExternalToolchain):
> +class TestExternalToolchainBootlinRiscv64lp64dGlibcStable(TestExternalToolchain):
>      config = """
>          BR2_riscv=y
>          BR2_riscv_g=y
>          BR2_RISCV_64=y
> -        BR2_RISCV_ABI_LP64=y
> +        BR2_RISCV_ABI_LP64D=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "riscv64-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
> +class TestExternalToolchainBootlinRiscv64lp64dMuslBleedingEdge(TestExternalToolchain):
> +    config = """
> +        BR2_riscv=y
> +        BR2_riscv_g=y
> +        BR2_RISCV_64=y
> +        BR2_RISCV_ABI_LP64D=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "riscv64-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
> +class TestExternalToolchainBootlinRiscv64lp64dMuslStable(TestExternalToolchain):
> +    config = """
> +        BR2_riscv=y
> +        BR2_riscv_g=y
> +        BR2_RISCV_64=y
> +        BR2_RISCV_ABI_LP64D=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "riscv64-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
> +class TestExternalToolchainBootlinRiscv64lp64dUclibcBleedingEdge(TestExternalToolchain):
> +    config = """
> +        BR2_riscv=y
> +        BR2_riscv_g=y
> +        BR2_RISCV_64=y
> +        BR2_RISCV_ABI_LP64D=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "riscv64-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
> +class TestExternalToolchainBootlinRiscv64lp64dUclibcStable(TestExternalToolchain):
> +    config = """
> +        BR2_riscv=y
> +        BR2_riscv_g=y
> +        BR2_RISCV_64=y
> +        BR2_RISCV_ABI_LP64D=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>      toolchain_prefix = "riscv64-linux"
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> index 61ead9b82e..898a1ff511 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> @@ -32,7 +32,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
>  	default y if BR2_powerpc64 && BR2_powerpc_power8
>  	default y if BR2_powerpc64le && BR2_powerpc_power8
>  	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
> -	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64
> +	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
>  	default y if BR2_sh && BR2_sh4
>  	default y if BR2_sh && BR2_sh4aeb
>  	default y if BR2_sparc64 && BR2_sparc_v9
> @@ -53,11 +53,11 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
>  choice
>  	prompt "Bootlin toolchain variant"
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
> -	bool "aarch64 glibc bleeding-edge 2020.08-1"
> +	bool "aarch64 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -68,7 +68,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the aarch64 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -78,11 +77,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
> -	bool "aarch64 glibc stable 2020.08-1"
> +	bool "aarch64 glibc stable 2021.11-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -93,7 +92,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the aarch64 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -103,10 +101,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
> -	bool "aarch64 musl bleeding-edge 2020.08-1"
> +	bool "aarch64 musl bleeding-edge 2021.11-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -126,10 +124,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
> -	bool "aarch64 musl stable 2020.08-1"
> +	bool "aarch64 musl stable 2021.11-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -148,9 +146,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
> -	bool "aarch64 uclibc bleeding-edge 2020.08-1"
> +	bool "aarch64 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_aarch64
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -171,9 +169,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
> -	bool "aarch64 uclibc stable 2020.08-1"
> +	bool "aarch64 uclibc stable 2021.11-1"
>  	depends on BR2_aarch64
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -194,11 +192,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
> -	bool "aarch64be glibc bleeding-edge 2020.08-1"
> +	bool "aarch64be glibc bleeding-edge 2021.11-1"
>  	depends on BR2_aarch64_be
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -209,7 +207,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the aarch64be architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -219,11 +216,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
> -	bool "aarch64be glibc stable 2020.08-1"
> +	bool "aarch64be glibc stable 2021.11-1"
>  	depends on BR2_aarch64_be
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -234,7 +231,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the aarch64be architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -244,9 +240,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
> -	bool "aarch64be uclibc bleeding-edge 2020.08-1"
> +	bool "aarch64be uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_aarch64_be
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -267,9 +263,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
> -	bool "aarch64be uclibc stable 2020.08-1"
> +	bool "aarch64be uclibc stable 2021.11-1"
>  	depends on BR2_aarch64_be
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -290,10 +286,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
> -	bool "arcle-750d uclibc bleeding-edge 2020.08-1"
> +	bool "arcle-750d uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_arcle
>  	depends on BR2_arc750d
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -314,10 +310,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
> -	bool "arcle-750d uclibc stable 2020.08-1"
> +	bool "arcle-750d uclibc stable 2021.11-1"
>  	depends on BR2_arcle
>  	depends on BR2_arc750d
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -338,12 +334,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
> -	bool "arcle-hs38 glibc bleeding-edge 2020.08-1"
> +	bool "arcle-hs38 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -354,7 +350,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the arcle-hs38 architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -364,13 +359,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
> -	bool "arcle-hs38 glibc stable 2020.08-1"
> +	bool "arcle-hs38 glibc stable 2021.11-3"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_SSP
> @@ -380,7 +375,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the arcle-hs38 architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -390,10 +384,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
> -	bool "arcle-hs38 uclibc bleeding-edge 2020.08-1"
> +	bool "arcle-hs38 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -414,10 +408,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
> -	bool "arcle-hs38 uclibc stable 2020.08-1"
> +	bool "arcle-hs38 uclibc stable 2021.11-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -438,12 +432,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
> -	bool "armv5-eabi glibc bleeding-edge 2020.08-1"
> +	bool "armv5-eabi glibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -454,7 +448,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv5-eabi architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -464,12 +457,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
> -	bool "armv5-eabi glibc stable 2020.08-1"
> +	bool "armv5-eabi glibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -480,7 +473,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv5-eabi architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -490,11 +482,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
> -	bool "armv5-eabi musl bleeding-edge 2020.08-1"
> +	bool "armv5-eabi musl bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -514,11 +506,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
> -	bool "armv5-eabi musl stable 2020.08-1"
> +	bool "armv5-eabi musl stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -538,10 +530,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
> -	bool "armv5-eabi uclibc bleeding-edge 2020.08-1"
> +	bool "armv5-eabi uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -562,10 +554,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
> -	bool "armv5-eabi uclibc stable 2020.08-1"
> +	bool "armv5-eabi uclibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -586,12 +578,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
> -	bool "armv6-eabihf glibc bleeding-edge 2020.08-1"
> +	bool "armv6-eabihf glibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -602,7 +594,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv6-eabihf architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -612,12 +603,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
> -	bool "armv6-eabihf glibc stable 2020.08-1"
> +	bool "armv6-eabihf glibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -628,7 +619,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv6-eabihf architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -638,11 +628,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
> -	bool "armv6-eabihf musl bleeding-edge 2020.08-1"
> +	bool "armv6-eabihf musl bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -662,11 +652,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
> -	bool "armv6-eabihf musl stable 2020.08-1"
> +	bool "armv6-eabihf musl stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -686,10 +676,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
> -	bool "armv6-eabihf uclibc bleeding-edge 2020.08-1"
> +	bool "armv6-eabihf uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -710,10 +700,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
> -	bool "armv6-eabihf uclibc stable 2020.08-1"
> +	bool "armv6-eabihf uclibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -734,12 +724,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
> -	bool "armv7-eabihf glibc bleeding-edge 2020.08-1"
> +	bool "armv7-eabihf glibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -750,7 +740,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv7-eabihf architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -760,12 +749,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
> -	bool "armv7-eabihf glibc stable 2020.08-1"
> +	bool "armv7-eabihf glibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -776,7 +765,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the armv7-eabihf architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -786,11 +774,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
> -	bool "armv7-eabihf musl bleeding-edge 2020.08-1"
> +	bool "armv7-eabihf musl bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -810,11 +798,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
> -	bool "armv7-eabihf musl stable 2020.08-1"
> +	bool "armv7-eabihf musl stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -834,10 +822,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
> -	bool "armv7-eabihf uclibc bleeding-edge 2020.08-1"
> +	bool "armv7-eabihf uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -858,10 +846,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
> -	bool "armv7-eabihf uclibc stable 2020.08-1"
> +	bool "armv7-eabihf uclibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -882,9 +870,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
> -	bool "armv7m uclibc bleeding-edge 2020.08-1"
> +	bool "armv7m uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7M
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -903,9 +891,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
> -	bool "armv7m uclibc stable 2020.08-1"
> +	bool "armv7m uclibc stable 2021.11-1"
>  	depends on BR2_ARM_CPU_ARMV7M
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -924,9 +912,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
> -	bool "m68k-68xxx uclibc bleeding-edge 2020.08-1"
> +	bool "m68k-68xxx uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_m68k_m68k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -947,9 +935,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
> -	bool "m68k-68xxx uclibc stable 2020.08-1"
> +	bool "m68k-68xxx uclibc stable 2021.11-1"
>  	depends on BR2_m68k_m68k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -970,9 +958,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
> -	bool "m68k-coldfire uclibc bleeding-edge 2020.08-1"
> +	bool "m68k-coldfire uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_m68k_cf
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -991,9 +979,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
> -	bool "m68k-coldfire uclibc stable 2020.08-1"
> +	bool "m68k-coldfire uclibc stable 2021.11-1"
>  	depends on BR2_m68k_cf
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1012,11 +1000,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
> -	bool "microblazebe glibc bleeding-edge 2020.08-1"
> +	bool "microblazebe glibc bleeding-edge 2021.11-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1026,7 +1014,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the microblazebe architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -1036,11 +1023,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
> -	bool "microblazebe glibc stable 2020.08-1"
> +	bool "microblazebe glibc stable 2021.11-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1050,7 +1037,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the microblazebe architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -1060,10 +1046,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
> -	bool "microblazebe musl bleeding-edge 2020.08-1"
> +	bool "microblazebe musl bleeding-edge 2021.11-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1082,10 +1068,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
> -	bool "microblazebe musl stable 2020.08-1"
> +	bool "microblazebe musl stable 2021.11-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1104,9 +1090,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
> -	bool "microblazebe uclibc bleeding-edge 2020.08-1"
> +	bool "microblazebe uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_microblazebe
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1127,9 +1113,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
> -	bool "microblazebe uclibc stable 2020.08-1"
> +	bool "microblazebe uclibc stable 2021.11-1"
>  	depends on BR2_microblazebe
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1150,11 +1136,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
> -	bool "microblazeel glibc bleeding-edge 2020.08-1"
> +	bool "microblazeel glibc bleeding-edge 2021.11-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1164,7 +1150,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the microblazeel architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -1174,11 +1159,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
> -	bool "microblazeel glibc stable 2020.08-1"
> +	bool "microblazeel glibc stable 2021.11-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1188,7 +1173,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the microblazeel architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -1198,10 +1182,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
> -	bool "microblazeel musl bleeding-edge 2020.08-1"
> +	bool "microblazeel musl bleeding-edge 2021.11-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1220,10 +1204,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
> -	bool "microblazeel musl stable 2020.08-1"
> +	bool "microblazeel musl stable 2021.11-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1242,9 +1226,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
> -	bool "microblazeel uclibc bleeding-edge 2020.08-1"
> +	bool "microblazeel uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_microblazeel
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1265,9 +1249,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
> -	bool "microblazeel uclibc stable 2020.08-1"
> +	bool "microblazeel uclibc stable 2021.11-1"
>  	depends on BR2_microblazeel
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1288,13 +1272,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
> -	bool "mips32 glibc bleeding-edge 2020.08-1"
> +	bool "mips32 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1305,7 +1289,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -1315,13 +1298,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
> -	bool "mips32 glibc stable 2020.08-1"
> +	bool "mips32 glibc stable 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1332,7 +1315,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -1342,12 +1324,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
> -	bool "mips32 musl bleeding-edge 2020.08-1"
> +	bool "mips32 musl bleeding-edge 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1367,12 +1349,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
> -	bool "mips32 musl stable 2020.08-1"
> +	bool "mips32 musl stable 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1391,11 +1373,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
> -	bool "mips32 uclibc bleeding-edge 2020.08-1"
> +	bool "mips32 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1416,11 +1398,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
> -	bool "mips32 uclibc stable 2020.08-1"
> +	bool "mips32 uclibc stable 2021.11-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1441,13 +1423,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32el glibc bleeding-edge 2020.08-1"
> +	bool "mips32el glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1458,7 +1440,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32el architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -1468,13 +1449,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
> -	bool "mips32el glibc stable 2020.08-1"
> +	bool "mips32el glibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1485,7 +1466,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32el architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -1495,12 +1475,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
> -	bool "mips32el musl bleeding-edge 2020.08-1"
> +	bool "mips32el musl bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1520,12 +1500,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
> -	bool "mips32el musl stable 2020.08-1"
> +	bool "mips32el musl stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1544,11 +1524,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32el uclibc bleeding-edge 2020.08-1"
> +	bool "mips32el uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1569,11 +1549,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
> -	bool "mips32el uclibc stable 2020.08-1"
> +	bool "mips32el uclibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1594,13 +1574,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32r5el glibc bleeding-edge 2020.08-1"
> +	bool "mips32r5el glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1611,7 +1591,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32r5el architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -1621,13 +1600,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
> -	bool "mips32r5el glibc stable 2020.08-1"
> +	bool "mips32r5el glibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1638,7 +1617,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32r5el architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -1648,12 +1626,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
> -	bool "mips32r5el musl bleeding-edge 2020.08-1"
> +	bool "mips32r5el musl bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1673,12 +1651,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
> -	bool "mips32r5el musl stable 2020.08-1"
> +	bool "mips32r5el musl stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1698,11 +1676,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32r5el uclibc bleeding-edge 2020.08-1"
> +	bool "mips32r5el uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1723,11 +1701,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
> -	bool "mips32r5el uclibc stable 2020.08-1"
> +	bool "mips32r5el uclibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1748,13 +1726,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32r6el glibc bleeding-edge 2020.08-1"
> +	bool "mips32r6el glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1765,7 +1743,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32r6el architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -1775,13 +1752,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
> -	bool "mips32r6el glibc stable 2020.08-1"
> +	bool "mips32r6el glibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1792,7 +1769,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips32r6el architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -1802,12 +1778,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
> -	bool "mips32r6el musl bleeding-edge 2020.08-1"
> +	bool "mips32r6el musl bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1827,12 +1803,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
> -	bool "mips32r6el musl stable 2020.08-1"
> +	bool "mips32r6el musl stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1852,11 +1828,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32r6el uclibc bleeding-edge 2020.08-1"
> +	bool "mips32r6el uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1877,11 +1853,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
> -	bool "mips32r6el uclibc stable 2020.08-1"
> +	bool "mips32r6el uclibc stable 2021.11-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -1902,14 +1878,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64-n32 glibc bleeding-edge 2020.08-1"
> +	bool "mips64-n32 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1920,7 +1896,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64-n32 architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -1930,14 +1905,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
> -	bool "mips64-n32 glibc stable 2020.08-1"
> +	bool "mips64-n32 glibc stable 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1948,7 +1923,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64-n32 architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -1958,13 +1932,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64-n32 musl bleeding-edge 2020.08-1"
> +	bool "mips64-n32 musl bleeding-edge 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -1984,13 +1958,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
> -	bool "mips64-n32 musl stable 2020.08-1"
> +	bool "mips64-n32 musl stable 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2010,12 +1984,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64-n32 uclibc bleeding-edge 2020.08-1"
> +	bool "mips64-n32 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2036,12 +2010,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
> -	bool "mips64-n32 uclibc stable 2020.08-1"
> +	bool "mips64-n32 uclibc stable 2021.11-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2062,14 +2036,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64el-n32 glibc bleeding-edge 2020.08-1"
> +	bool "mips64el-n32 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2080,7 +2054,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64el-n32 architecture, using
>  	  the glibc C library. This is a bleeding-edge version, which
> @@ -2090,14 +2063,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
> -	bool "mips64el-n32 glibc stable 2020.08-1"
> +	bool "mips64el-n32 glibc stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2108,7 +2081,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64el-n32 architecture, using
>  	  the glibc C library. This is a stable version, which means
> @@ -2118,13 +2090,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64el-n32 musl bleeding-edge 2020.08-1"
> +	bool "mips64el-n32 musl bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2144,13 +2116,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
> -	bool "mips64el-n32 musl stable 2020.08-1"
> +	bool "mips64el-n32 musl stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2170,12 +2142,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64el-n32 uclibc bleeding-edge 2020.08-1"
> +	bool "mips64el-n32 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2196,12 +2168,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
> -	bool "mips64el-n32 uclibc stable 2020.08-1"
> +	bool "mips64el-n32 uclibc stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2222,14 +2194,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64r6el-n32 glibc bleeding-edge 2020.08-1"
> +	bool "mips64r6el-n32 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2240,7 +2212,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64r6el-n32 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -2250,14 +2221,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
> -	bool "mips64r6el-n32 glibc stable 2020.08-1"
> +	bool "mips64r6el-n32 glibc stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2268,7 +2239,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the mips64r6el-n32 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -2278,13 +2248,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64r6el-n32 musl bleeding-edge 2020.08-1"
> +	bool "mips64r6el-n32 musl bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2304,13 +2274,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
> -	bool "mips64r6el-n32 musl stable 2020.08-1"
> +	bool "mips64r6el-n32 musl stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2330,12 +2300,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64r6el-n32 uclibc bleeding-edge 2020.08-1"
> +	bool "mips64r6el-n32 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2356,12 +2326,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
> -	bool "mips64r6el-n32 uclibc stable 2020.08-1"
> +	bool "mips64r6el-n32 uclibc stable 2021.11-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2382,11 +2352,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
> -	bool "nios2 glibc bleeding-edge 2020.08-1"
> +	bool "nios2 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_nios2
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2397,7 +2367,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the nios2 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -2407,11 +2376,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
> -	bool "nios2 glibc stable 2020.08-1"
> +	bool "nios2 glibc stable 2021.11-1"
>  	depends on BR2_nios2
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2422,7 +2391,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the nios2 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -2432,10 +2400,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
> -	bool "openrisc musl bleeding-edge 2020.08-1"
> +	bool "openrisc musl bleeding-edge 2021.11-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2455,10 +2423,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
> -	bool "openrisc musl stable 2020.08-1"
> +	bool "openrisc musl stable 2021.11-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2477,9 +2445,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
> -	bool "openrisc uclibc bleeding-edge 2020.08-1"
> +	bool "openrisc uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_or1k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2500,9 +2468,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
> -	bool "openrisc uclibc stable 2020.08-1"
> +	bool "openrisc uclibc stable 2021.11-1"
>  	depends on BR2_or1k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2523,12 +2491,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-440fp glibc bleeding-edge 2020.08-2"
> +	bool "powerpc-440fp glibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2538,7 +2506,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	help
>  	  Bootlin toolchain for the powerpc-440fp architecture, using
> @@ -2549,12 +2516,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
> -	bool "powerpc-440fp glibc stable 2020.08-2"
> +	bool "powerpc-440fp glibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2564,7 +2531,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	help
>  	  Bootlin toolchain for the powerpc-440fp architecture, using
> @@ -2575,11 +2541,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
> -	bool "powerpc-440fp musl bleeding-edge 2020.08-2"
> +	bool "powerpc-440fp musl bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2598,11 +2564,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
> -	bool "powerpc-440fp musl stable 2020.08-2"
> +	bool "powerpc-440fp musl stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2621,10 +2587,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-440fp uclibc bleeding-edge 2020.08-2"
> +	bool "powerpc-440fp uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2645,10 +2611,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
> -	bool "powerpc-440fp uclibc stable 2020.08-2"
> +	bool "powerpc-440fp uclibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2669,12 +2635,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-e300c3 glibc bleeding-edge 2020.08-1"
> +	bool "powerpc-e300c3 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2685,7 +2651,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc-e300c3 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -2695,12 +2660,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
> -	bool "powerpc-e300c3 glibc stable 2020.08-1"
> +	bool "powerpc-e300c3 glibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2711,7 +2676,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc-e300c3 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -2721,11 +2685,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
> -	bool "powerpc-e300c3 musl bleeding-edge 2020.08-1"
> +	bool "powerpc-e300c3 musl bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2744,11 +2708,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
> -	bool "powerpc-e300c3 musl stable 2020.08-1"
> +	bool "powerpc-e300c3 musl stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2767,10 +2731,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-e300c3 uclibc bleeding-edge 2020.08-1"
> +	bool "powerpc-e300c3 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2791,10 +2755,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
> -	bool "powerpc-e300c3 uclibc stable 2020.08-1"
> +	bool "powerpc-e300c3 uclibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2815,12 +2779,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-e500mc glibc bleeding-edge 2020.08-1"
> +	bool "powerpc-e500mc glibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2831,7 +2795,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc-e500mc architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -2841,12 +2804,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
> -	bool "powerpc-e500mc glibc stable 2020.08-1"
> +	bool "powerpc-e500mc glibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2857,7 +2820,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc-e500mc architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -2867,11 +2829,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
> -	bool "powerpc-e500mc musl bleeding-edge 2020.08-1"
> +	bool "powerpc-e500mc musl bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2890,11 +2852,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
> -	bool "powerpc-e500mc musl stable 2020.08-1"
> +	bool "powerpc-e500mc musl stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2913,10 +2875,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-e500mc uclibc bleeding-edge 2020.08-1"
> +	bool "powerpc-e500mc uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2937,10 +2899,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
> -	bool "powerpc-e500mc uclibc stable 2020.08-1"
> +	bool "powerpc-e500mc uclibc stable 2021.11-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -2961,12 +2923,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-e5500 glibc bleeding-edge 2020.08-1"
> +	bool "powerpc64-e5500 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e5500
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2977,7 +2939,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-e5500 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -2987,12 +2948,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
> -	bool "powerpc64-e5500 glibc stable 2020.08-1"
> +	bool "powerpc64-e5500 glibc stable 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e5500
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3003,7 +2964,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-e5500 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -3013,12 +2973,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-e6500 glibc bleeding-edge 2020.08-1"
> +	bool "powerpc64-e6500 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3029,7 +2989,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-e6500 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -3039,12 +2998,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
> -	bool "powerpc64-e6500 glibc stable 2020.08-1"
> +	bool "powerpc64-e6500 glibc stable 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3055,7 +3014,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-e6500 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -3065,11 +3023,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
> -	bool "powerpc64-e6500 musl bleeding-edge 2020.08-1"
> +	bool "powerpc64-e6500 musl bleeding-edge 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3089,11 +3047,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
> -	bool "powerpc64-e6500 musl stable 2020.08-1"
> +	bool "powerpc64-e6500 musl stable 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3113,12 +3071,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-power8 glibc bleeding-edge 2020.08-1"
> +	bool "powerpc64-power8 glibc bleeding-edge 2021.11-2"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3129,7 +3087,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-power8 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -3139,12 +3096,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
> -	bool "powerpc64-power8 glibc stable 2020.08-1"
> +	bool "powerpc64-power8 glibc stable 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3155,7 +3112,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64-power8 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -3165,11 +3121,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
> -	bool "powerpc64-power8 musl bleeding-edge 2020.08-1"
> +	bool "powerpc64-power8 musl bleeding-edge 2021.11-2"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3189,11 +3145,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
> -	bool "powerpc64-power8 musl stable 2020.08-1"
> +	bool "powerpc64-power8 musl stable 2021.11-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3213,12 +3169,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64le-power8 glibc bleeding-edge 2020.08-1"
> +	bool "powerpc64le-power8 glibc bleeding-edge 2021.11-2"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3229,7 +3185,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64le-power8 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -3239,12 +3194,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
> -	bool "powerpc64le-power8 glibc stable 2020.08-1"
> +	bool "powerpc64le-power8 glibc stable 2021.11-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3255,7 +3210,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the powerpc64le-power8 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -3265,11 +3219,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
> -	bool "powerpc64le-power8 musl bleeding-edge 2020.08-1"
> +	bool "powerpc64le-power8 musl bleeding-edge 2021.11-2"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3289,11 +3243,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
> -	bool "powerpc64le-power8 musl stable 2020.08-1"
> +	bool "powerpc64le-power8 musl stable 2021.11-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3313,14 +3267,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
> -	bool "riscv32-ilp32d glibc bleeding-edge 2020.08-1"
> +	bool "riscv32-ilp32d glibc bleeding-edge 2021.11-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_32
>  	depends on BR2_RISCV_ABI_ILP32D
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3339,15 +3293,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
>  
>  	  https://toolchains.bootlin.com/
>  
> -config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
> -	bool "riscv64 glibc bleeding-edge 2020.08-1"
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
> +	bool "riscv64-lp64d glibc bleeding-edge 2021.11-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
> -	depends on BR2_RISCV_ABI_LP64
> +	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3358,22 +3312,22 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
> -	  Bootlin toolchain for the riscv64 architecture, using the
> -	  glibc C library. This is a bleeding-edge version, which
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the glibc C library. This is a bleeding-edge version, which
>  	  means it is using the latest versions of gcc, gdb and
>  	  binutils.
>  
>  	  https://toolchains.bootlin.com/
>  
> -config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE
> -	bool "riscv64 musl bleeding-edge 2020.08-1"
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
> +	bool "riscv64-lp64d glibc stable 2021.11-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
> -	depends on BR2_RISCV_ABI_LP64
> +	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3384,22 +3338,126 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	help
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the glibc C library. This is a stable version, which means
> +	  it is using stable and proven versions of gcc, gdb and
> +	  binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
> +	bool "riscv64-lp64d musl bleeding-edge 2021.11-1"
> +	depends on BR2_riscv
> +	depends on BR2_riscv_g
> +	depends on BR2_RISCV_64
> +	depends on BR2_RISCV_ABI_LP64D
> +	depends on BR2_USE_MMU
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_MUSL
>  	help
> -	  Bootlin toolchain for the riscv64 architecture, using the
> -	  musl C library. This is a bleeding-edge version, which
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the musl C library. This is a bleeding-edge version, which
>  	  means it is using the latest versions of gcc, gdb and
>  	  binutils.
>  
>  	  https://toolchains.bootlin.com/
>  
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
> +	bool "riscv64-lp64d musl stable 2021.11-1"
> +	depends on BR2_riscv
> +	depends on BR2_riscv_g
> +	depends on BR2_RISCV_64
> +	depends on BR2_RISCV_ABI_LP64D
> +	depends on BR2_USE_MMU
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	help
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the musl C library. This is a stable version, which means
> +	  it is using stable and proven versions of gcc, gdb and
> +	  binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
> +	bool "riscv64-lp64d uclibc bleeding-edge 2021.11-1"
> +	depends on BR2_riscv
> +	depends on BR2_riscv_g
> +	depends on BR2_RISCV_64
> +	depends on BR2_RISCV_ABI_LP64D
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_USE_WCHAR
> +	select BR2_ENABLE_LOCALE
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	help
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the uclibc C library. This is a bleeding-edge version,
> +	  which means it is using the latest versions of gcc, gdb and
> +	  binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
> +	bool "riscv64-lp64d uclibc stable 2021.11-1"
> +	depends on BR2_riscv
> +	depends on BR2_riscv_g
> +	depends on BR2_RISCV_64
> +	depends on BR2_RISCV_ABI_LP64D
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_USE_WCHAR
> +	select BR2_ENABLE_LOCALE
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	help
> +	  Bootlin toolchain for the riscv64-lp64d architecture, using
> +	  the uclibc C library. This is a stable version, which means
> +	  it is using stable and proven versions of gcc, gdb and
> +	  binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
> -	bool "sh-sh4 glibc bleeding-edge 2020.08-1"
> +	bool "sh-sh4 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3410,7 +3468,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sh-sh4 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -3420,12 +3477,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
> -	bool "sh-sh4 glibc stable 2020.08-1"
> +	bool "sh-sh4 glibc stable 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3436,7 +3493,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sh-sh4 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -3446,11 +3502,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
> -	bool "sh-sh4 musl bleeding-edge 2020.08-1"
> +	bool "sh-sh4 musl bleeding-edge 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3470,11 +3526,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
> -	bool "sh-sh4 musl stable 2020.08-1"
> +	bool "sh-sh4 musl stable 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3493,10 +3549,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
> -	bool "sh-sh4 uclibc bleeding-edge 2020.08-1"
> +	bool "sh-sh4 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3517,10 +3573,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
> -	bool "sh-sh4 uclibc stable 2020.08-1"
> +	bool "sh-sh4 uclibc stable 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3541,12 +3597,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
> -	bool "sh-sh4aeb glibc bleeding-edge 2020.08-1"
> +	bool "sh-sh4aeb glibc bleeding-edge 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3557,7 +3613,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sh-sh4aeb architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -3567,12 +3622,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
> -	bool "sh-sh4aeb glibc stable 2020.08-1"
> +	bool "sh-sh4aeb glibc stable 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3583,7 +3638,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sh-sh4aeb architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -3593,11 +3647,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
> -	bool "sh-sh4aeb musl bleeding-edge 2020.08-1"
> +	bool "sh-sh4aeb musl bleeding-edge 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3617,11 +3671,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
> -	bool "sh-sh4aeb musl stable 2020.08-1"
> +	bool "sh-sh4aeb musl stable 2021.11-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3640,12 +3694,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
> -	bool "sparc64 glibc bleeding-edge 2020.08-1"
> +	bool "sparc64 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_sparc64
>  	depends on BR2_sparc_v9
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3656,7 +3710,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sparc64 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -3666,12 +3719,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
> -	bool "sparc64 glibc stable 2020.08-1"
> +	bool "sparc64 glibc stable 2021.11-1"
>  	depends on BR2_sparc64
>  	depends on BR2_sparc_v9
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3682,7 +3735,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the sparc64 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -3692,7 +3744,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
> -	bool "sparcv8 uclibc bleeding-edge 2020.08-1"
> +	bool "sparcv8 uclibc bleeding-edge 2021.11-3"
>  	depends on BR2_sparc
>  	depends on BR2_sparc_v8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> @@ -3716,10 +3768,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
> -	bool "sparcv8 uclibc stable 2020.08-1"
> +	bool "sparcv8 uclibc stable 2021.11-1"
>  	depends on BR2_sparc
>  	depends on BR2_sparc_v8
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3740,7 +3792,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
> -	bool "x86-64-core-i7 glibc bleeding-edge 2020.08-1"
> +	bool "x86-64-core-i7 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3751,7 +3803,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3762,7 +3814,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-64-core-i7 architecture,
>  	  using the glibc C library. This is a bleeding-edge version,
> @@ -3772,7 +3823,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
> -	bool "x86-64-core-i7 glibc stable 2020.08-1"
> +	bool "x86-64-core-i7 glibc stable 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3783,7 +3834,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3794,7 +3845,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-64-core-i7 architecture,
>  	  using the glibc C library. This is a stable version, which
> @@ -3804,7 +3854,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
> -	bool "x86-64-core-i7 musl bleeding-edge 2020.08-1"
> +	bool "x86-64-core-i7 musl bleeding-edge 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3814,7 +3864,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3834,7 +3884,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
> -	bool "x86-64-core-i7 musl stable 2020.08-1"
> +	bool "x86-64-core-i7 musl stable 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3844,7 +3894,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3864,7 +3914,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64-core-i7 uclibc bleeding-edge 2020.08-1"
> +	bool "x86-64-core-i7 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3873,7 +3923,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3894,7 +3944,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
> -	bool "x86-64-core-i7 uclibc stable 2020.08-1"
> +	bool "x86-64-core-i7 uclibc stable 2021.11-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3903,7 +3953,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3924,7 +3974,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
> -	bool "x86-core2 glibc bleeding-edge 2020.08-1"
> +	bool "x86-core2 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3933,7 +3983,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3944,7 +3994,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-core2 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -3954,7 +4003,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
> -	bool "x86-core2 glibc stable 2020.08-1"
> +	bool "x86-core2 glibc stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3963,7 +4012,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3974,7 +4023,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-core2 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -3984,7 +4032,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
> -	bool "x86-core2 musl bleeding-edge 2020.08-1"
> +	bool "x86-core2 musl bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -3992,7 +4040,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4011,7 +4059,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
> -	bool "x86-core2 musl stable 2020.08-1"
> +	bool "x86-core2 musl stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4019,7 +4067,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4037,14 +4085,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
> -	bool "x86-core2 uclibc bleeding-edge 2020.08-1"
> +	bool "x86-core2 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -4065,14 +4113,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
> -	bool "x86-core2 uclibc stable 2020.08-1"
> +	bool "x86-core2 uclibc stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -4093,14 +4141,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
> -	bool "x86-i686 glibc bleeding-edge 2020.08-1"
> +	bool "x86-i686 glibc bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4111,7 +4159,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-i686 architecture, using the
>  	  glibc C library. This is a bleeding-edge version, which
> @@ -4121,14 +4168,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
> -	bool "x86-i686 glibc stable 2020.08-1"
> +	bool "x86-i686 glibc stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4139,7 +4186,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Bootlin toolchain for the x86-i686 architecture, using the
>  	  glibc C library. This is a stable version, which means it
> @@ -4149,13 +4195,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
> -	bool "x86-i686 musl bleeding-edge 2020.08-1"
> +	bool "x86-i686 musl bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4174,13 +4220,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
> -	bool "x86-i686 musl stable 2020.08-1"
> +	bool "x86-i686 musl stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -4198,12 +4244,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
> -	bool "x86-i686 uclibc bleeding-edge 2020.08-1"
> +	bool "x86-i686 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -4224,12 +4270,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
> -	bool "x86-i686 uclibc stable 2020.08-1"
> +	bool "x86-i686 uclibc stable 2021.11-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
>  	depends on !BR2_x86_x1000
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -4250,11 +4296,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
> -	bool "xtensa-lx60 uclibc bleeding-edge 2020.08-1"
> +	bool "xtensa-lx60 uclibc bleeding-edge 2021.11-1"
>  	depends on BR2_xtensa
>  	depends on BR2_XTENSA_CUSTOM
>  	depends on BR2_XTENSA_LITTLE_ENDIAN
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -4275,11 +4321,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
> -	bool "xtensa-lx60 uclibc stable 2020.08-1"
> +	bool "xtensa-lx60 uclibc stable 2021.11-1"
>  	depends on BR2_xtensa
>  	depends on BR2_XTENSA_CUSTOM
>  	depends on BR2_XTENSA_LITTLE_ENDIAN
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> index 3e6eb99cc8..2a4c4179d4 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> @@ -1,340 +1,348 @@
>  # This file was auto-generated by support/scripts/gen-bootlin-toolchains
>  # Do not edit
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  212f3c05f3b2263b0e2f902d055aecc2755eba10c0011927788a38faee8fc9aa  aarch64--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2020.08-1.sha256
> -sha256  8ab7a2f17cb96621b048ab0a872650dd62faa54cd74c961b9902b8c04bff7dd1  aarch64--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2020.08-1.sha256
> -sha256  3cf00c1ccaf16d0fbc526529789791de1cf98b918ff812e779f8400d40b6c048  aarch64--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2020.08-1.sha256
> -sha256  8319d27e3e637f32ecbdf49ceee2e9b7768b32d3ec7c92c888ff52e6f062bde4  aarch64--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  57fe5cecf37778b35dd09d9a016a1d6d9d7bb0e96ffcc5565e0aa483a46ea3db  aarch64--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2020.08-1.sha256
> -sha256  04176f56ac977215c5257c307cece2d32e03770b96380e09c50379d4d84a5b39  aarch64--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  9631a57809d2fc2c7bb82bdd79d7647ccabe193126cc59ff9721a573d8870510  aarch64be--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2020.08-1.sha256
> -sha256  71e24a2a205726d7d8ec56ead13b7eb427d5aed0e057a94ee06688334a07e6dd  aarch64be--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  76017614f0e7770499b5d18943398e51ae1c36d075cf8fba90ea050a29cad747  aarch64be--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2020.08-1.sha256
> -sha256  a3bff78e98b2e17ab142ec630f9184f0cd4be6f1f313fdc112d89a843d92cedc  aarch64be--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  e33570bdddc08d01b0da81ef6c3b240c6e0a4948f0100314b0be63c18c5f75db  arcle-750d--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2020.08-1.sha256
> -sha256  bae0cbcab3b3b0149503aef6003dd816102b261461e37d89d32ffe9eb7f5dab9  arcle-750d--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  219be8c5390da6830e7529cb0a611996a8c9451bfa1560d7bda4ed5b182f7744  arcle-hs38--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2020.08-1.sha256
> -sha256  ca73399803b6bb46cf27aa2bef5f98eae05fb2fa547403777354067117b44f2f  arcle-hs38--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  65e1408112518c1b31350285838f000a78a0dcd78880842933ef80d64d023967  arcle-hs38--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2020.08-1.sha256
> -sha256  f0839aa541fe3f29660387c731b52e495bf1b285127b9fba91350b5b67f8ff3e  arcle-hs38--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  261e73520fb211f63a88ecce0689d3647acf295527bd6bd16e88e1bd65b3c603  armv5-eabi--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2020.08-1.sha256
> -sha256  ed175329057693e496b0d6dbac1ff9db8f8f34737530ab38b5ed677afaefad03  armv5-eabi--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2020.08-1.sha256
> -sha256  486b2424321b9866c2677e1dccd3a999394a86f890542c0c63edd5f9456bc4f9  armv5-eabi--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2020.08-1.sha256
> -sha256  732edab571d017c550d74b8c53dc703fc650de7aab66e68c70a0bc19d66d0a22  armv5-eabi--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  5e11ec24b910c43f24577b41a38cded192e443c0606be60944fe85b0fbf4b2dd  armv5-eabi--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2020.08-1.sha256
> -sha256  cf6a668d4f30a4a2e76a0e88177e1301342cc011e94ea399353e77ede0efbb22  armv5-eabi--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  0c66147f05b21529311338e246ed285f9f0f4830af0d4db28e401160a81d1b4f  armv6-eabihf--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2020.08-1.sha256
> -sha256  539e31b3bdcf76c3d6710951c74fbe682e2de8da4d110b981e9108b656890f4a  armv6-eabihf--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2020.08-1.sha256
> -sha256  e8c05fb7b909dfd5a42f6de78d1b20605c453a9aea219981966d213ee98968e2  armv6-eabihf--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2020.08-1.sha256
> -sha256  68e43e3cd0e1fdd5c2b3ab718368f6ee24824725c641e148ef0a0da57f872034  armv6-eabihf--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  749bb97f7535414c3096564f6e790d1e43ab8c406282480937d8f34478ac7a35  armv6-eabihf--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2020.08-1.sha256
> -sha256  680a3bf708cb792c74561514dcba882727086c9317397e8a3ebece1b50fbea4e  armv6-eabihf--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  9f5c703cea20834276e1a81e2e54483d0f4fe0e57063ba4d058338ef9c858eb2  armv7-eabihf--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2020.08-1.sha256
> -sha256  7b6682603af9a9b5c0e46fd57165723483bb68295e827d14d238e63f33a147a8  armv7-eabihf--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2020.08-1.sha256
> -sha256  d9e71499cfb1790a31056ca9199981f699c7e4966b5854f7780d97f5a74d601e  armv7-eabihf--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2020.08-1.sha256
> -sha256  5c4c9bce5a2a46a9ad46e49e86df708893a8907e702a8ee1b5febd3950e030ed  armv7-eabihf--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  7c3ee9f3d6bd4eda38ec94a686a9e348b0f800214f1225c68d172e4ac6b81066  armv7-eabihf--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2020.08-1.sha256
> -sha256  f61866b0e60da62eff92b197f0e2a72e8d023bf944a25eb97efc9f5d93680ed9  armv7-eabihf--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  9ce29bbcbc0a2c4925e814a6332c2c71e9a13476040e1db0a5495c68d1566bee  armv7m--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2020.08-1.sha256
> -sha256  c20df31191b88df09d8ff225ca82e3bb769b2b7ffd3827f6dbf77a6d23230339  armv7m--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  49e26c831694d15bb023a0a36cf9d3967e0ab75c555d8d07bba3317a0a18aa40  m68k-68xxx--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2020.08-1.sha256
> -sha256  b133663f5589c71315224792b7e542cfa578e4c354e4a2ac8afcd5ee77fd6f45  m68k-68xxx--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  3efa687ca5d1c5f1ec53032e05a12467ec148c2328836754841f74be217bb035  m68k-coldfire--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2020.08-1.sha256
> -sha256  f9879a167e2279fe925a3dc963d349d3d84c85866ec91512b5a7ce667318d716  m68k-coldfire--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  d9fb4403d14f53d5f4be18f38e9604244042ea33ad980ebf0b0057b70d603d16  microblazebe--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2020.08-1.sha256
> -sha256  ea466445240a25ba98cd7b34f748afca151fc2479b187566f2faa98f586bfd93  microblazebe--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2020.08-1.sha256
> -sha256  0157d051ac5e8b46b4eed7333c9323d1c1602ad5e958e2c12fe9b8dc3b6781c7  microblazebe--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2020.08-1.sha256
> -sha256  ec51b07f63cf6d0af1eaed10641d8690a350d879e4b74addca2b3f7992186ee2  microblazebe--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  3aaaab352ca31b2263e29c363609a363a38931f9733c8ad3a386c5cbb791f8e1  microblazebe--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2020.08-1.sha256
> -sha256  d2b31177c9c009cd70a9ad4af6e903dfdb5254e3f49fe9389e0e11af7a98e6b6  microblazebe--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  83a451601b24b6a9c609630119e100ef9f18408bdfe1241cc53a904d540e6936  microblazeel--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2020.08-1.sha256
> -sha256  c168737ec92889e632673f826b13cf74cfe4ba3ad06cc9e328ee20268ec439e9  microblazeel--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2020.08-1.sha256
> -sha256  47660f8a4d84c7b8cd7610b8ba9df5bbfba043b35ebc07d96468c950b282f44d  microblazeel--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2020.08-1.sha256
> -sha256  6a51e38fe3f72765ad1172488321b60c59867253edce7b6680500c4193a542f7  microblazeel--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  6005fa2b229be380a2e4b8227daa0b4be4739b7cda628679de6d0e048755c769  microblazeel--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2020.08-1.sha256
> -sha256  845a4795cab5f88d96679945f7147c5dfe0dd19751b88734ef786bfd5ee5db67  microblazeel--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  63baffcf0a94d7f1b7421ad61ddb56ce5c05595acd09f482dffe13ddf17efd81  mips32--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2020.08-1.sha256
> -sha256  90e300a2d224ea79b69cae68e93b0aab70858381b0d11bac846458c625d72653  mips32--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2020.08-1.sha256
> -sha256  4ebc20461eafca9c9b50e36f81e13095229aac0cd1dd98a985060f2e95665983  mips32--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2020.08-1.sha256
> -sha256  1a544242e9aaaee75c240439a31d2f4304b97705ed2d9e9e38ca552c5f03dced  mips32--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  4e0e1bf24e74746775992efd8b8bafbf5b6dd56bfdd1421b2207e1ea23ba2eb3  mips32--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2020.08-1.sha256
> -sha256  4c1da37d131f4e66b07536707c6d1be3de29719f228346d4c860c4b3cb4fef31  mips32--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  617c845261bb0a00571c68f250c5a369e60a09164dd3316ab8126c327d911c4b  mips32el--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2020.08-1.sha256
> -sha256  87875c25075b3850526a54c5e828ce489355d0d50107c262539ee5f577f38d6d  mips32el--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2020.08-1.sha256
> -sha256  4c81898f2e484c1e1e7d7ac1ae80e0aca5619ef01190df37e41ca459a147e682  mips32el--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2020.08-1.sha256
> -sha256  02155c88e0bf92f63105803767ce457790bfd920297ef326c9920853b5a3fe20  mips32el--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  024b0e27fd0c9792bad1944e052768e03173b133079d7c95bf30435d05620152  mips32el--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2020.08-1.sha256
> -sha256  8398010ea3dbd43ee99b6be0e3340db44b32228bf063a9c13bf43a359e3d1f6e  mips32el--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  f000e8a78a24671a6f87909156e0c2a7403ab5864001c1388faf60190f8594c8  mips32r5el--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2020.08-1.sha256
> -sha256  a52a115b852afce04732aa9460c58f30fbfdb17601f9bf32ea97a77d1a073a53  mips32r5el--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2020.08-1.sha256
> -sha256  2620edf1045c61ddaf12f979a86719fa83b6598eb10f358a379e52462bb734ba  mips32r5el--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2020.08-1.sha256
> -sha256  0e03a5f2a7d8ba739f3ef53538d73c33bfc55f45522d4515688ebcb58005e5a1  mips32r5el--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  585e252971553b52833d3970f709196707d908a84a5e1be8360e3019d6bb0da9  mips32r5el--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2020.08-1.sha256
> -sha256  7ffccb1f86e7b0f1dd0d87f455ff5f2619a58724850b0b9f106b6545d4de8b3f  mips32r5el--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  d6376aeb2b243a58a98c415f2ecf131e14ccdce849a76c0f01902ca4b02fc0ba  mips32r6el--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2020.08-1.sha256
> -sha256  8640635116e26e51d57b6d5dc1e3213528f742f0cf97cd326af4f5d8e17a63f2  mips32r6el--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2020.08-1.sha256
> -sha256  2647d34cb990bdab77efbcc6b4e3d5b1fd02c5032837b7a64bc52cef64aba4ec  mips32r6el--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2020.08-1.sha256
> -sha256  24b1adfa2eb31f49ae5b4fce9ee9fcb30205ca6f29e423f77bd851070baaa255  mips32r6el--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  18dee7e9de84f6e7d6c9d083decdd465ab08979ebd661d82efbe5dc93f11dcb0  mips32r6el--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2020.08-1.sha256
> -sha256  28999f7474a84c3ec36b504c47cf671fc6e82d9b38580a0e2ebe495850ada097  mips32r6el--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  b5d90c06c894d841677da5f81e395113d22a79c53f934e12151128660dd08e76  mips64-n32--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2020.08-1.sha256
> -sha256  7ed7a81f1a086e47ddb79d0bdc7142a6b7349feea20b05393be133cc4cf1fff5  mips64-n32--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2020.08-1.sha256
> -sha256  937ce7ffda61c93489862122fe6dbfd53445afbdbfb615c06805b05497f336fb  mips64-n32--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2020.08-1.sha256
> -sha256  2a2acf732498b0acb22f815e1ce7c3ca8124719131febe95c723b1cbab76d947  mips64-n32--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  16ac2a957757f56e0414a638bb3bd526b2d1c3055dd7e036dcdec4bf950f0d1b  mips64-n32--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2020.08-1.sha256
> -sha256  10d9fb894e5e548e47e2930139117de9549ea49b971ca9fad12f56ef6d188b77  mips64-n32--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  7de65f68b14350670adbd0249562d69e75f7fc65b749284303c32f88112cb6b4  mips64el-n32--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2020.08-1.sha256
> -sha256  a6eea19d94a7a953cac84670dcac3adb42dd3eb8950b1f7ca0f1ef37abc7e33f  mips64el-n32--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2020.08-1.sha256
> -sha256  7cff57dd6d0ee7778c5b764a388bf9e997ba2349da5274b8d8598173030618be  mips64el-n32--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2020.08-1.sha256
> -sha256  3c42d88c84689703d5b1380f4cf5ad20872611d08ce5fac1a4375bfec80a6b27  mips64el-n32--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  5553a979238f6a25c4e965e18cfbebe36018041ba46968174063328c25e485fc  mips64el-n32--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2020.08-1.sha256
> -sha256  80e8fa6cca6e0267dad5376bca79ce7457b8d345d43a0d409e4820a791965db9  mips64el-n32--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  0f09da21d6069642064f767a25e64c89caad80660ea184345652301c41a30ac9  mips64r6el-n32--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2020.08-1.sha256
> -sha256  7100d3862983c5fb8237386ff4148f6e550e6b299c8b7946a349dedef60f75c9  mips64r6el-n32--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2020.08-1.sha256
> -sha256  a692687149e59fdb7ad780cfc51e4a7307ed599433280369fe9e43c63453e4ec  mips64r6el-n32--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2020.08-1.sha256
> -sha256  e7a35e063fcd748df6f347e5aa97d081f4422480fb02ce6925c4c351c9aca318  mips64r6el-n32--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  69d4287cb32413e054684db9545e6898c09cb90c86a0dce8bb9999498eb798ab  mips64r6el-n32--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2020.08-1.sha256
> -sha256  4d9eb8900b99871e02ae17b823341189dce3aa592ee82864c73ca3164948aaae  mips64r6el-n32--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  b3c7c24e08759af3ea13fc39e8bddb52e4528a05d4aee3c2f75733e067d12edc  nios2--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2020.08-1.sha256
> -sha256  a46d5ff90e3623d159f3b5be53493e13a2e78ebb733a1ccb68e829d6e28aa129  nios2--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2020.08-1.sha256
> -sha256  382ec04511d51f99028b6c568c909e4e010bcfe1d4a4c1ff6f10c7c07c24b3b2  openrisc--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2020.08-1.sha256
> -sha256  697ef122917022f400003931bc6da75fe07bb5234ef8186cbe027e560f04a168  openrisc--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  e45d02c9272c909db1c92b6403ed1e0813889ef0c22b2f5166d2675f62d3f20f  openrisc--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2020.08-1.sha256
> -sha256  62c60f9f99828a01f3a16060ceba74b8e2603a8ca3585649434a66f721ecdf75  openrisc--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2020.08-2.sha256
> -sha256  7b7c2f66ccd3d44cd8a829b5879277be9cfb17f34a26d5055b29a6bab40ff9df  powerpc-440fp--glibc--bleeding-edge-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2020.08-2.sha256
> -sha256  ae7b3d06090dfcf54b1e3b4bd4fda9ae5aaaf34aba9118820e6e9d8f1b70c0c4  powerpc-440fp--glibc--stable-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2020.08-2.sha256
> -sha256  a6def102659538e3e5838bf4267cd33486d795db753a7109b5e413499ef5df89  powerpc-440fp--musl--bleeding-edge-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2020.08-2.sha256
> -sha256  76de0310078633ff34654c8c54d7e80a609c58521a7f2a8041ae4a574889d38a  powerpc-440fp--musl--stable-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2020.08-2.sha256
> -sha256  abbe38fc92a71d568c08452f99fe3470e5ded9a666c6829d9104fcf06b984503  powerpc-440fp--uclibc--bleeding-edge-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2020.08-2.sha256
> -sha256  d4346ce563ddfbd4946b2dfbc766cafebbf4b09488dc8b398ab8bb242bac9268  powerpc-440fp--uclibc--stable-2020.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  fe4b9817f060d84118fff5b7d855eacac472975f2adfececb641d2999f94a7ea  powerpc-e300c3--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2020.08-1.sha256
> -sha256  77d215d650850af65c3ac1792dcf100322f3dfea78ba174118197ec0c8a49807  powerpc-e300c3--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2020.08-1.sha256
> -sha256  4aa2b5c3c2c3263edfdf95284f0774aed8a47446b7a362ee44dc24d83db06896  powerpc-e300c3--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2020.08-1.sha256
> -sha256  129d9aab59e9edfc68739b612f2ee4abce5679830250fbcd50b89ec3d2c865c5  powerpc-e300c3--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  54e6960edd6419bb268b651ffedc24af73a72ad9dd145c1849a6e0fb6f997b15  powerpc-e300c3--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2020.08-1.sha256
> -sha256  1057b488623a80037558a1439555b1a15b25a4d7f42dc49d0169349592ad5b3e  powerpc-e300c3--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  8cab4fbb645be782a6eaeb7b6afd75fda4c0dc8ca9a4095b0be9b6eeb29a9759  powerpc-e500mc--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2020.08-1.sha256
> -sha256  5bb9f6b10b9d2d1a90a1a96a477b90eea32a269c1afccd89284a38a63d7f1c82  powerpc-e500mc--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2020.08-1.sha256
> -sha256  36636df56a04e44ddb5bba2e0a30b1f3986618399381278cdb2be207a25825c0  powerpc-e500mc--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2020.08-1.sha256
> -sha256  7f924fc3cc3c9070ea1c9d270fea71715bd52beac14649d8a00416dfde1b897b  powerpc-e500mc--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  262a2bddd29d6c24cbc32a873e78895499732624923195a5e7ffe16b487dc461  powerpc-e500mc--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2020.08-1.sha256
> -sha256  e817af2d5a0fba654e7766dcad89380e278af9feb35c2d0591a0f8d893defa48  powerpc-e500mc--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  418b79f8313ac4ff29cb6c2d639848eb74a0245666142a307374513cffd472e6  powerpc64-e5500--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2020.08-1.sha256
> -sha256  a51ddba944394de41b2f7c001772bb68074175d65a0976749da5289a5e705f23  powerpc64-e5500--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  c537c2ef618f767762295806658bb0add514453068ea72ce2bd6e6e805e64af5  powerpc64-e6500--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2020.08-1.sha256
> -sha256  1d8aaf1492f69496b01fc930fa928ffd3144d1465c7c954128ed31ce576306b6  powerpc64-e6500--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2020.08-1.sha256
> -sha256  c46c7595384929211ce2f54655ceb4eb1d32054923892cd5d10913be364fa6f2  powerpc64-e6500--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2020.08-1.sha256
> -sha256  a295073db591ed16eec90caf5fdef62ccff5550166d36496ab24aa993bdb2a42  powerpc64-e6500--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  cbe65abf36fa807176a01488751a2e45800791534400b803c024e4c29357862c  powerpc64-power8--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2020.08-1.sha256
> -sha256  a670ec95dbfb53a812e9f21aec2ad880a3349125f19219b9a0d139a7d5b9e83b  powerpc64-power8--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2020.08-1.sha256
> -sha256  1f5b3da078534f9e493f29956d3a1f31ad0539d26b8f83e55c271b6671021928  powerpc64-power8--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2020.08-1.sha256
> -sha256  12043ab87cd4ae0c4339cddcb3eb017eaae406bbb332bf3edebfd7f70ecd0a31  powerpc64-power8--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  14e3ff4afbf363decb2c0ddc33b75e41aad9748a65a445cc176215853d0d6185  powerpc64le-power8--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2020.08-1.sha256
> -sha256  342442f0773cdf5091443ab06ecf9c3d3c05cf8e2464b82a54707bec90d2a358  powerpc64le-power8--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2020.08-1.sha256
> -sha256  fab5f4bc6d219f53f8b15e0d49aea27cdbac9e08e05946577440329c003fc216  powerpc64le-power8--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2020.08-1.sha256
> -sha256  47d184beca271c67bdb544fac87cb2126ea2b397d076a79dfaf9667e999fbccd  powerpc64le-power8--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  18a47b0c221137f40720df08e9bbdc0bcb6e68cde3a30906681e4dec83eb7547  riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs/riscv64--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  09818eccb414359b1df87ec347d94e7bfccc45f8a5eafe8791fddf8110fcc581  riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs/riscv64--musl--bleeding-edge-2020.08-1.sha256
> -sha256  2af03e220070eacf6eaf63ccb7442ca5af805caf96ae52fb3eb15370988f12cf  riscv64--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  277e78c999c2cba42b25660bbbe0d105a80277c986e0807cfa16a6595af6ce9e  sh-sh4--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2020.08-1.sha256
> -sha256  256064f35b2759c71ac1bb6c9fe74a7c7c62f070746cfeb35ff0ecb40a91c2b4  sh-sh4--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2020.08-1.sha256
> -sha256  34bf211ea0456ef86bbe914e0755f18681531a015e33b8c26b97ca68e29a3ed5  sh-sh4--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2020.08-1.sha256
> -sha256  d335189728a6bebd5d180c58c6dabd049500d57ae60fcc8fc51ba5aafafb21d3  sh-sh4--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  89e42b9e7bc3f67660656690899b2fad4015af5c9084dad6624315c39b486d76  sh-sh4--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2020.08-1.sha256
> -sha256  13a60cd5653c24491748388284080d5b8da649a63090c0d308c3a3b069b04f21  sh-sh4--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  fe063dd95c71ab41145412faf5e4c2a1386efdda5d944ecc83121fb9b4e213f2  sh-sh4aeb--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2020.08-1.sha256
> -sha256  054e669a3165aff35539d3fb7cbde2650c79e5aa88a90a844488ba175a645a07  sh-sh4aeb--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2020.08-1.sha256
> -sha256  aa2c560ed4cf4dac8a8803b3fccf846472a226a1a22833c1cbe0d7fd347af3a7  sh-sh4aeb--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2020.08-1.sha256
> -sha256  89e7fa5792ed1c35bd57c65935888beafce9a81f84c7d73508b1582539415a3b  sh-sh4aeb--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  abba04fcfa11a1eedbf5f5ff38d69d793d394f08998f8374723358b3123cc113  sparc64--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2020.08-1.sha256
> -sha256  57184f6edfba03ae9c098ad0bab6635475bb45a874982ad11c0b91bf6043dbc4  sparc64--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  210defc0781683a240bac25295ff612d6b6c875c7d938d11512f8ec9472245bc  sparcv8--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2020.08-1.sha256
> -sha256  14d508510bf0ed813f6436718486cce7fc6ebfb29b46eea5e52a474b2d5eaa00  sparcv8--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  77935109bbd1bdb84813a588b807052823033ed9094131fdd56f558023a3de08  x86-64-core-i7--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2020.08-1.sha256
> -sha256  3dd408e857f5c8e579748995477f2783fcf5ad0aac89719ea3c5c75446dfa63c  x86-64-core-i7--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2020.08-1.sha256
> -sha256  5d2d13d56a76db30ec28a11a3d6219fe407c3d1b9bbcd4a7255a783da4fcdfcb  x86-64-core-i7--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2020.08-1.sha256
> -sha256  26ea3cc16c294663b64123c15a95d53f00419ef0f6bcdef489865835c6022650  x86-64-core-i7--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  d1ff16cde93c727b4b39844877f93d865d6945185e71dba4b6c07d2d725e2576  x86-64-core-i7--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2020.08-1.sha256
> -sha256  0fdcb93add6ff697b536198da76b4e93bd81efd67793d6640fd6bc1b216abc00  x86-64-core-i7--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  10e7b362008fc3057e9eb42a3fab5f0dc430e05b285dc4f2ec3367d5f36a3094  x86-core2--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2020.08-1.sha256
> -sha256  18bbabb672df24bbc2646d94d23c47d16a6c0d8342d910bf441021fad4a82ce3  x86-core2--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2020.08-1.sha256
> -sha256  81edcbd69f2fd479d9a25597d0515d42c9c891e1a534d947e87a2e9a3dc67924  x86-core2--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2020.08-1.sha256
> -sha256  9e23de3364e1aaec50945c70089273a025ff44815ce4632324d1950e7ba07e9a  x86-core2--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  717b6c103e8e50202a45277eef8f9b41b978b17a0110cacddd52a01b7eba3039  x86-core2--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2020.08-1.sha256
> -sha256  e23812719fa1027fa0e2a161216cf97ff14bf3bcc19bb400281060a40e762a0d  x86-core2--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2020.08-1.sha256
> -sha256  9e8c83479dc91e516ee66fe21ff8693afa380cfdb3192c5c1351430a035ab92a  x86-i686--glibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2020.08-1.sha256
> -sha256  77362d37279636371a42b09bab4f8f1a51a786ed7ec316221786b279389c8008  x86-i686--glibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2020.08-1.sha256
> -sha256  ccb6896f02be3444d6cabff0966a0b6f866ebc6d32b483031541626c2fc748fe  x86-i686--musl--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2020.08-1.sha256
> -sha256  bbbf8b7946e65f35366cb0371910fe3e95e6399c4e6a9cac8b0a4674bcadc36b  x86-i686--musl--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  bd57d5cd7958ba7469d74abdf93db1993042f30c774ec3d1fceff57d522a489c  x86-i686--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2020.08-1.sha256
> -sha256  139c31c25f9834137bbbb4aadc9d78def2819d2c1b9e89dd2300b11fb4879bb4  x86-i686--uclibc--stable-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2020.08-1.sha256
> -sha256  46801fc1ae89f380c1b6e1bf8ea723f9d7b1590eea3a2d1218a0307cd4325bc8  xtensa-lx60--uclibc--bleeding-edge-2020.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2020.08-1.sha256
> -sha256  b4b28d855594290c853292c9cce43bba573d4187ecb47d78f25411a7f4300d49  xtensa-lx60--uclibc--stable-2020.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  55b90e0e844ac02a7fc3352be42b7cb9bb3ec582c23649dbb77e05c60eb84434  aarch64--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2021.11-1.sha256
> +sha256  dec070196608124fa14c3f192364c5b5b057d7f34651ad58ebb8fc87959c97f7  aarch64--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2021.11-1.sha256
> +sha256  c56f51c518eca9e614cc639ffb99719531c1022275045a43dfcdf79a142ba4dc  aarch64--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2021.11-1.sha256
> +sha256  6919b4cf04b8c5628a2a93bcf4b05e1143ab15dfb4bc2acde02a2e3c075bf041  aarch64--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  9ba30538bb38a3ee4db5289469fd0a539ba248b00da4e1b1b6f5c3724c20deef  aarch64--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2021.11-1.sha256
> +sha256  ec629adb0acd80d56b00f35e9fe823571bdcdb72072c7fc2d50607b3882c1f98  aarch64--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  8d610107f7bea8957d71dca45bb84368c74e01da786a113d1089b72ee79ca095  aarch64be--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2021.11-1.sha256
> +sha256  6327121b67799ea967882cba746d25cf6a274a061f283d5c1b2818a651da0c9a  aarch64be--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  809d448f3f54fd9a4b01440acc697c022f3f0107e1bf0e9de3ee454a57be99e4  aarch64be--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2021.11-1.sha256
> +sha256  08898011a5f12bf3fa0646a794bb63422fa24d20eb79d01665b2f91aa65f75aa  aarch64be--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  088b03942306b572db93025eae703086ddbfe9886e14544cf68ecd9dfa0ad4b4  arcle-750d--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2021.11-1.sha256
> +sha256  6a7454aa1559ef304dfa55361763167848eb6d47539be31b24c7cf6723f581fd  arcle-750d--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  e2a35602cf3a518e16681184c5ac095693dbc1d3edd1ae219da2dfff0cce7d67  arcle-hs38--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2021.11-3.sha256
> +sha256  c7c00e3dcdb5123098cea365cfcf261e36adcf816bdd62e4e1ad661e1145f084  arcle-hs38--glibc--stable-2021.11-3.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  552b2387ed8129fd205d3387ca508f816d1a67b90dd1d5ea16ff4872c5129fd9  arcle-hs38--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2021.11-1.sha256
> +sha256  85ea258031a8c304dce0a660c18e67ec415a032f0d9f2c4080f04a47efb44c48  arcle-hs38--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  72a1964f1ba61d730b6be3b178bb4bc24de191a2ad8ada36e067d57011aae1a4  armv5-eabi--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2021.11-1.sha256
> +sha256  22de590c491057d2f974b315055b357511319227c6084cccb1532e30c829687c  armv5-eabi--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2021.11-1.sha256
> +sha256  4906e6b454c1f9b2041d617df7e253f96288050f9760859868d60857e6bab924  armv5-eabi--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2021.11-1.sha256
> +sha256  2201fa9ce6d1226dafaf060cc568029d853af158b2ab182dcb8c7956bd993408  armv5-eabi--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  0187e76a377a096f7228b243637224cbe0dca12f5736202f813473723c566ea3  armv5-eabi--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2021.11-1.sha256
> +sha256  888e65c2a75d125422ef4d2c144e3fed37d9a00169a78b4613fac34e7f9349ce  armv5-eabi--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  c585b4129f60d3ae45c7b77fc6baf87f1c6a3d6d66b06059e1bf9f6e2fcf2899  armv6-eabihf--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2021.11-1.sha256
> +sha256  c40177a063aa7db47747cbf4f26254d63abee9e20d8d88210261b50f03b51b22  armv6-eabihf--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2021.11-1.sha256
> +sha256  d6114bbde0a308cf7057aa9c4f5641432c1e785d3decc650f64f5cb261370078  armv6-eabihf--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2021.11-1.sha256
> +sha256  41c463f2cd2984a2d53e5dee2e9a81b09c6cac2ba7b306766bdfc8f4865977bf  armv6-eabihf--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  aca019db7e6167d5cf8d8ff68b10bad7d9dd7ae8784f991960754e8d027f424e  armv6-eabihf--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2021.11-1.sha256
> +sha256  e7e19796a2f0b0d839508a721506e148cb4383ed82dcc2ff4b3c0c496a4229f3  armv6-eabihf--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  1d2b488d047d1a1694305613adb918167a36bf0857cd6bda3ce87a0e4c2b7f28  armv7-eabihf--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2021.11-1.sha256
> +sha256  6d10f356811429f1bddc23a174932c35127ab6c6f3b738b768f0c29c3bf92f10  armv7-eabihf--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2021.11-1.sha256
> +sha256  31a373fded82805ac4ddac7608c5075b2086999dcd46ce6ba33c432b24faffaf  armv7-eabihf--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2021.11-1.sha256
> +sha256  767c99155f74d5620cfd59d0224df2f82dec7ce58be24d702081dca9793408a9  armv7-eabihf--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  8d6cea2dfec2205ead2e6476f664d81442228d3b1e3fb9b320a54c68706ab9a2  armv7-eabihf--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2021.11-1.sha256
> +sha256  3f8b1101a7318e2a6260a6b1c916b9b3bc69e8fd866d9e88eb85d3a496ad5064  armv7-eabihf--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  392215b53d8c03ca501481f6cfaa720676cf5a67ad1f25647f5a096398f57b28  armv7m--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2021.11-1.sha256
> +sha256  2fca1ac4e767f8ce182a92c74f7b1e4866e7b74b447a2e4c62176379421bedbe  armv7m--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  2b694fb4397421504e805a71db182efd55b25fa6403ecf225cddd4a8212903b0  m68k-68xxx--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2021.11-1.sha256
> +sha256  9b3afcd370cbe4912f730696d89ca5f8d26581992c80bdff027b2dd6a8910899  m68k-68xxx--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  0e6743d8679cfe197223e011a2e1e064a213f6032d2f4b0d922b9124fe981d84  m68k-coldfire--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2021.11-1.sha256
> +sha256  27ed1e76826a8824d72ef702d3a770544757a0d297c9992eb623012f1d9b387c  m68k-coldfire--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  1512dde9d646c4c34e5a637d5d6b3be777e199e3f16340ed26e8f0b085cdbdf0  microblazebe--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2021.11-1.sha256
> +sha256  c853fe33b9454d3e31951ef99c53b6a6ad09f2458cf79ad4b1680c125a011899  microblazebe--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2021.11-1.sha256
> +sha256  65d6486dd8fd8c6a0aad44346d77a8d4f2473230b967ac7fa12e639603e9f007  microblazebe--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2021.11-1.sha256
> +sha256  5195575b4bd178dbdc8080e728fa485df13ede62ae684cdda131c1d55e655b11  microblazebe--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  c0d8bf9ce99eada90be299e7d448b9cc578005d26b80205788a639c587071a36  microblazebe--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2021.11-1.sha256
> +sha256  2de12511a0a9b8369f769ccd0ecf32939948b95079e0fd57d3ea390ad4c4ff43  microblazebe--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  fa871c5a4fc700f5a7d9e04ddda271d69395066afea98df2de2bba78826b461e  microblazeel--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2021.11-1.sha256
> +sha256  f7c64f142f970cd084ffa0e14bc3ac957db921e559eb036cb0f098d2f187328b  microblazeel--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2021.11-1.sha256
> +sha256  6978582d587f89fd02d11e89f1b0eee320ad45c42a51ec4fca8fc24b69f65c46  microblazeel--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2021.11-1.sha256
> +sha256  4bd56f3fa100b71174888fc4da1f710ed2f56433edc570ba435f2ffdfc3bcc49  microblazeel--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  ee3cf68bb5680b44087aa8e805f74397fb34283ce9ad4d7a303f777e2242b796  microblazeel--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2021.11-1.sha256
> +sha256  61a33972e3a282c5334717eef0922a3617c881dd3c28a0aed7dfaf69df8493c8  microblazeel--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  b4b28cc187dbcd6d55e3c00a1b4a08cf68797946c284a48f30be2f659756b2d7  mips32--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2021.11-1.sha256
> +sha256  42c6d72edd35249cda113796aa776556f8e8aa285fa8e511d2784a65c4df71d6  mips32--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2021.11-1.sha256
> +sha256  7609a3d3601e9aaf8c08f68f1d70539858f17229ca4985842d290e8c35e1b7e3  mips32--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2021.11-1.sha256
> +sha256  999faca83c3490662ba5ae855935dd9bde270d11d234294cd6c9cc9ca0bfe17c  mips32--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  58240ac30e5bbec4cb07d92ad4250693cd4f4c9761e6e9602e3cbe0d9077ea4e  mips32--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2021.11-1.sha256
> +sha256  e010dd9fca694f658af457e473831ec9a22da7262ed9f460fee1bf30081d4a1a  mips32--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  6167ef7286741551ccb53ffb62e45611fc258e62cd1880418a2cf94051a51e05  mips32el--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2021.11-1.sha256
> +sha256  018e3393e1ba50444ae0a05db05a295553b3af224afdf20b52f9d271f1ec91a4  mips32el--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2021.11-1.sha256
> +sha256  66f7991de789d4a9ea0206e4f1c7e380521778b771295315af8e98984a1a2b1d  mips32el--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2021.11-1.sha256
> +sha256  381ec343ffde3c905addfe27e5ae737b4709142d5949c327f783c26d0acd05d1  mips32el--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  ce6e49762e54ba4a2a6477d14dd6f37b3d6d116905150a80cd4ed2afeaec2633  mips32el--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2021.11-1.sha256
> +sha256  18baf32f742acd9c9eab78eca040f265194bb10589d6e8bccb964ccd8a22307a  mips32el--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  5524925d82e1c28cbc272d94e8b9f40603d623875d09989a862fda7b88e5f163  mips32r5el--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2021.11-1.sha256
> +sha256  5911d789152f922adbf99d231f3267c0e7aec8942b73a759a44d1410ed6d6493  mips32r5el--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2021.11-1.sha256
> +sha256  a599b59ab19aa10d841fbf50f58fdf2a09263a3cdcb01499225f259ef5615be1  mips32r5el--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2021.11-1.sha256
> +sha256  5ea65771ca522b77f3cc39f12ef09eda59d9e4743dc7057067f73e86983107c2  mips32r5el--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  84bef9c460f2abf00fa5c18f850a9d9e4fdf9e7d593a1ad5f7b6efe34dfcf037  mips32r5el--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2021.11-1.sha256
> +sha256  48b058d3057a611eb3d09b3a206bc38e449f0ea0cd7c8ebf2ee99da9182d0707  mips32r5el--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  161ec4ca6dad1b5d3e79880e30c7f618e24fc1c8dbfcbaec50db02ac73c111af  mips32r6el--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2021.11-1.sha256
> +sha256  c50ba26a9fad62180dc4816cfa6451f82ba3ea9c9f069899874c012a5472fa77  mips32r6el--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2021.11-1.sha256
> +sha256  81637b0ddfda0ed02bd549fda70efddbcabe6ad943156311d034f3b8a8bce086  mips32r6el--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2021.11-1.sha256
> +sha256  d858e9b2a7d826f23cd6432e5c1cad2f4f98447682cdcf7df1430daabfbf49c0  mips32r6el--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  40b78cbfb757b328f5b0a861c6ed1e4f716784bdc2d5e6eba9d2dcad5057002c  mips32r6el--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2021.11-1.sha256
> +sha256  e39de078f5f713ab385e5f008e181062265e6a3979904263d283f90304146014  mips32r6el--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  d8543128dc7a115fdee418dfee954d65cb0fb60aae161222fc03177a190bfef1  mips64-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2021.11-1.sha256
> +sha256  8d5c891bb2eecccf1f9c51095d266c899dae4dd7e75ef19ff6c66c8e4602919c  mips64-n32--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2021.11-1.sha256
> +sha256  7cf2177c2e41651a25676a9d1c96bbe8c254f94db920a1b3a7aa5708b17b1ef1  mips64-n32--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2021.11-1.sha256
> +sha256  ac997df9a0f82f0ce60ac904ce75245741fa432c4d85c8e8ae88c35296dfaa99  mips64-n32--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  e5119b684b078fd0c3bf7f7eb09ab31dff666cbbbc3d91118ae912e197ca3852  mips64-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2021.11-1.sha256
> +sha256  8f5c1293e789eb04ab3f0bcb415c6ee0ef5ae26cd77354374984752548ac4e2c  mips64-n32--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  d1063f99d389f0065b8db5331597969450f1f813265ddf9205215fec5500997c  mips64el-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2021.11-1.sha256
> +sha256  73bbd84905e1fd094f7426f64e01f6058f21409218306b80e94bd2ad0aaa8ad3  mips64el-n32--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2021.11-1.sha256
> +sha256  a0a48faf217468e9eb1dd820d16ced1caa8f00706e9f48cb1e64899963f3bcba  mips64el-n32--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2021.11-1.sha256
> +sha256  c9c895ea09900ec5c63931af0716cf12f48f7c9826629ac48c4cee4e596af5ee  mips64el-n32--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  5d3573faab6757efd4e2a78e2c1361d3e8e7b821fd385d016fbe71c56d9cc1d2  mips64el-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2021.11-1.sha256
> +sha256  cd95e539cbb343c3e57c9f2d7d786ea2b0b58009f1b87a4b48eb9d4bb73a205a  mips64el-n32--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  7b551725f9e6f5eefc56ad67b5daa10812d4895842ec5986eeb93a79455e4762  mips64r6el-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2021.11-1.sha256
> +sha256  c575274871f30d019c121947e0f65973475e16baf621f235c54bfc292353d5d0  mips64r6el-n32--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2021.11-1.sha256
> +sha256  2b85466873cf847b62b5c66198cc01002890a7a41e5cc9262b4906dcef640ead  mips64r6el-n32--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2021.11-1.sha256
> +sha256  4210ca4ded17fdeb7cc7a5cf0d7d4676161d711f70708ca50be62ce397687672  mips64r6el-n32--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  de1a1cff7c02d804aa949b813d92c3d55a33e47602bd538bac6deaa155c93c6d  mips64r6el-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2021.11-1.sha256
> +sha256  30d82c7ca41a0df9931a29a46ed881f21a889e9e59baf04e820c6679be87a7fb  mips64r6el-n32--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  5c2dc11062f4817e81a328b12ab30be486b7e68c7c876eb45fffca72332a8804  nios2--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2021.11-1.sha256
> +sha256  f6f37f1e551edda0251ece8d906ed720bd8ec45da9d4b3e1d13721bdc9ef2882  nios2--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-1.sha256
> +sha256  9b413c970bd3c92cd1c805e2fa1c5d86e808a18985f518be565afd9794a96c60  openrisc--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-1.sha256
> +sha256  71ffaf12c0d8a317d301a236389483a12045064c088c213dd481eeab295e603d  openrisc--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  85171daa8556bba550a48fe9ef7783ef465de79e2f41a2188cefea0c01dcb804  openrisc--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-1.sha256
> +sha256  4f13b2ef95c3dfd886cd696de28bd29b20bc3379103fd6f76c9cf0816d34a5c6  openrisc--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  53afdbe1e48d0c60d560db8d17042a99288661fe10eebbfcfec4e56a6c2ca594  powerpc-440fp--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2021.11-1.sha256
> +sha256  d7fc756c954184cfc4e6118e0e0ac33613916973f6af4aafaa162959662aea96  powerpc-440fp--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2021.11-1.sha256
> +sha256  094bad002682608cfc7b095a35c3d495cad793ec0f15a7c035a11eae69d0211e  powerpc-440fp--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2021.11-1.sha256
> +sha256  187226d9c427e91bae57058060950cfbd61fb89993edf42386a2c4281ca681ba  powerpc-440fp--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  6c5d3ef56effad9bea791ee814f108929e967eb88a992d21b7d9f9d8d51a048a  powerpc-440fp--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2021.11-1.sha256
> +sha256  9a9663674fc2af69b403bfacc5c9d6c0d7ea7c7aa4b93c928bfd79bfb634b828  powerpc-440fp--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  89164ef2be5f5eb5f0de9d8d821d76a1e69c963529bc450a1caf61944665f929  powerpc-e300c3--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2021.11-1.sha256
> +sha256  1665004c81e0dfe1c8aa15a691232537c27a4343d80f8c035f83623b65d99ae3  powerpc-e300c3--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2021.11-1.sha256
> +sha256  6bbb7d8416708754debc216f122366d7cc25b9372b59e16590f2d942fc727cee  powerpc-e300c3--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2021.11-1.sha256
> +sha256  e97a52ed0d2f617f869e055d076c62e0698cdffd17e8b5945d0285f98cb57de2  powerpc-e300c3--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  9b886501833b6785bdbfff90e3d7b191eca4e59fea0c039c772c43825032fb86  powerpc-e300c3--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2021.11-1.sha256
> +sha256  31fc2c3b1f2878eb71766c7c0d8b88cdd4c1b2b66e34237917557df818e1c4e0  powerpc-e300c3--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  a2505f7d2968c5324747653da2b367fde7c86c68fcfcb2051c07b27fc0726988  powerpc-e500mc--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2021.11-1.sha256
> +sha256  f9a86eee7817042d26aeda8473c23d7da22920ace233e7ad8714cc87409767ca  powerpc-e500mc--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2021.11-1.sha256
> +sha256  0f58c7a792de85703c715100dc8fde2575acd4f41523dbcf2ca920611f8e38f3  powerpc-e500mc--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2021.11-1.sha256
> +sha256  367219213274c0b291855354f5cf2f59a915cf0d9538db9236d7829423a79c92  powerpc-e500mc--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  0c9616694108bcc879fdbd804b6ec42b17101bddea2a9426f023f625c3def39b  powerpc-e500mc--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2021.11-1.sha256
> +sha256  5a6e8489e39ddd73d413926c1d00b7cb214e5a083bdea6bf7fbcd5b4a3b82d47  powerpc-e500mc--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  62c53dd85d6172a1d13833d2303561a6e943d73836faa3be0eb5c8d937ae3bf1  powerpc64-e5500--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2021.11-1.sha256
> +sha256  4c8c2884ed5f42155508ffb5c62343312427904f469ce003bfb6b547075cd4aa  powerpc64-e5500--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  62845f66f9b29c001e85b86557b953b2275fd1ecbf681500521b8386d8df1ed6  powerpc64-e6500--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2021.11-1.sha256
> +sha256  054d3793f1c8c42ff9310163d4eb45ce09be7654f01221ff28914bc28950f832  powerpc64-e6500--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2021.11-1.sha256
> +sha256  21452d9a1e4a5fe980054c0367f00f640ff0f6af4f0443469c340106f902c9c6  powerpc64-e6500--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2021.11-1.sha256
> +sha256  015285c7313ffd6c25984db3df003a703868758919f59e8d0b9b45cd494e54cd  powerpc64-e6500--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2021.11-2.sha256
> +sha256  19618e538bd170e3ed458a1ff9593ca169078eb9a990cbab0af635aed622429e  powerpc64-power8--glibc--bleeding-edge-2021.11-2.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2021.11-1.sha256
> +sha256  7b35b694e79b4829e5f2fdb2bd1570035619f665be2a73d0568e4c1f4b6ce56d  powerpc64-power8--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2021.11-2.sha256
> +sha256  6f5a6674bbe028bcf2cb6820a57b53e06b06ab4b7359397b77fada3ef06635b5  powerpc64-power8--musl--bleeding-edge-2021.11-2.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2021.11-1.sha256
> +sha256  9dff16b6af51f0492093f08e4d7571b787afa37e059ea1105ded18a7fa7baa88  powerpc64-power8--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2021.11-2.sha256
> +sha256  624b2bb3763e3bd085b69c39cb9a1574d60dbb29780469c2b171bba564c3d1d3  powerpc64le-power8--glibc--bleeding-edge-2021.11-2.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2021.11-1.sha256
> +sha256  04473768185c3a1848f4f323380dc7caffa13d1e1bcb49317cebf090917fee2a  powerpc64le-power8--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2021.11-2.sha256
> +sha256  e81d0b3c9128cd0069dc8bcfbf512e395175e4c4f0a9ed500a3d7b15a76f8e65  powerpc64le-power8--musl--bleeding-edge-2021.11-2.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2021.11-1.sha256
> +sha256  09dafac6313ad49731de6d93ef2f1c2806a6a78127d0441adcee76a7a256f4e3  powerpc64le-power8--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  63defd144fdb1d40712316e2c3acd37275d6407b52d70efcd36e7f7129b4a0d0  riscv32-ilp32d--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  13984509df102d452f64fbe576e9240920bc677838c2380e57fad8236fca70bc  riscv64-lp64d--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2021.11-1.sha256
> +sha256  70fe7d9fc74220b08b2ae0d3527641f4b938a1e4eb6bb305b2ac68fa76f2d6a4  riscv64-lp64d--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2021.11-1.sha256
> +sha256  0ba18be42bc1aac9992384c86efeb83cb55215eab565f71cef340f61a1fec420  riscv64-lp64d--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2021.11-1.sha256
> +sha256  42ca8024547e51e6126e3c9e711d80815aa4b2997900dfc8af4b9514105e8b78  riscv64-lp64d--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  02dd9fe4a024f84c7f73b7155640066017c7d18dd90c4da6efe6f0e66d24f75c  riscv64-lp64d--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2021.11-1.sha256
> +sha256  01f061e1b3d106d25614ae5bd64df3a3588bc960caa3bbad14b50f718a558f41  riscv64-lp64d--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  64c14617fb95b1eeb50564d1e0ccbf73fa73e5e58aea6b192549fc7127e4bd5c  sh-sh4--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2021.11-1.sha256
> +sha256  702125cce2aaee4025cc4eb07614fe51a4e56498e8d0b2b8a5863d31840829e0  sh-sh4--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2021.11-1.sha256
> +sha256  37fefd46ded9067cb836f067073c4df501265e86d887ff91015087747a5613d4  sh-sh4--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2021.11-1.sha256
> +sha256  7f77aefe39c1dc9bfe1fe637c7c957fba19898d0b04db4ba7a0b76bb97ed72e9  sh-sh4--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  3285ac52a681a951d7d080d6645f3d02451de644582928d71469813e95bd928f  sh-sh4--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2021.11-1.sha256
> +sha256  841c400d303021311895bf61fa7d16292ef19cf021ea06c091a424f43294f6a5  sh-sh4--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  b1ebde33ada33d1006046c589891d96af902eefcea1d9e103ae738c9fe26c36f  sh-sh4aeb--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2021.11-1.sha256
> +sha256  3afebc93a72af85a31c6d096b5939c60bb87939b051c6cddc52e1e540714267a  sh-sh4aeb--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2021.11-1.sha256
> +sha256  c9216bd579ac3f0fa7d0efb9e1892f5d34eba10ee183d03fc87ca17c4b8eb6d4  sh-sh4aeb--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2021.11-1.sha256
> +sha256  1e58aaab9d77019df71777a3c9a2457f691355a6a7aed6b9897921e38571117a  sh-sh4aeb--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  0b83bb7f3ce7b67a5c359c95c695398054d13903259014147d4c99e2884e1377  sparc64--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2021.11-1.sha256
> +sha256  0ef307f6c91733ee82ce65801768013f7e6220b605f4e152158cb55b4f983582  sparc64--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2021.11-3.sha256
> +sha256  3c85420becb7caa84a9a229483f3f2d7158eb66817acdfa5d5700c3a05436cba  sparcv8--uclibc--bleeding-edge-2021.11-3.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2021.11-1.sha256
> +sha256  f6d35e33338b26e71403b4c6d3944ab561f2a6e9b801ab33fbb401b4722044dd  sparcv8--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  a3dbfcd3347a72ca344ae77882f929615776ea9b1b058eeea0a0915e7db89b69  x86-64-core-i7--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2021.11-1.sha256
> +sha256  3d443bb0bc6d16982824952a02dcb8b7d10c258b4e0debb47708fb9a02573951  x86-64-core-i7--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2021.11-1.sha256
> +sha256  c724f0a8338c57e65479844eeb1725ffce2157a195067601e8893c0f781d2a86  x86-64-core-i7--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2021.11-1.sha256
> +sha256  008aa485ad85deda4af41f6ab162ee33be96c2f479e93a03dd9ee360fbf461b1  x86-64-core-i7--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  99ac2c1fb6bd819222578d4d3c2d3043d3f08f48a988fe7a56ecb2dc44950ebb  x86-64-core-i7--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2021.11-1.sha256
> +sha256  f7224ebf557f96b3854c4760f0d561f33f02e71586e6c5b958fdb686ecf5a058  x86-64-core-i7--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  51a7aa03b16fca52a6ac88c7272a727a56a120fb1a03edaff7da741471dffa63  x86-core2--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2021.11-1.sha256
> +sha256  6afb13f10694756f2c7b69e0e5fdd416d3c446d2d630ed9a707797613c38fb15  x86-core2--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2021.11-1.sha256
> +sha256  b779acc67eff7ae349a1ecb6d092576131537ce4d92530447d6483e3b7320186  x86-core2--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2021.11-1.sha256
> +sha256  9f79cd4443386b9611d917506bcb6fd9d844e7934905a7368827441644ae7821  x86-core2--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  1a3803d19a6d65a943dab7c4cfb29f37e1c96b1155bdd6c04e5fc609c135b970  x86-core2--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2021.11-1.sha256
> +sha256  235be5851ccdbf579163a0d57b4caba48c63c808f7a08e6476f56c3537636520  x86-core2--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2021.11-1.sha256
> +sha256  bb21d6fdb83ef1603346c27572a0622a890633d4fc1ab28bf0aa387a44c8dfee  x86-i686--glibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2021.11-1.sha256
> +sha256  9deb1c61a3196114ba1996c0cbe4c4135af9e82f1a0f9111084c86badee3ff30  x86-i686--glibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2021.11-1.sha256
> +sha256  313e4bbd8a19fc927b2d9d059cfacdb89cb41213d34158cac2ba00b071468273  x86-i686--musl--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2021.11-1.sha256
> +sha256  fa6cd3e2aa25287e03070eba526983a902d8622ad148b57027acf85d690eaf27  x86-i686--musl--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  4ee09d8c4524e6e6f19db07ed49f8e43a60e806bc57134f9ac2477d41c98340e  x86-i686--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2021.11-1.sha256
> +sha256  d15cfe391474ea19e6a468c011955027581c6a16953380baf3c5718ad42fc45d  x86-i686--uclibc--stable-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2021.11-1.sha256
> +sha256  469450c734051b9dfb7021532a5ec6fb35b3cf79a95613836e654c3e666b4150  xtensa-lx60--uclibc--bleeding-edge-2021.11-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2021.11-1.sha256
> +sha256  2fd9dc2d1ec8a167ae3c353682bc4d166f25a7db1c1b889e3058bc644bd3f92c  xtensa-lx60--uclibc--stable-2021.11-1.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> index cfe447428d..7093feb404 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> @@ -7,1015 +7,1039 @@
>  # This file was auto-generated by support/scripts/gen-bootlin-toolchains
>  # Do not edit
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-3
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
>  endif
>  
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> -TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> -TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> -TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> -TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-3
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
>  endif
> -- 
> 2.31.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

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
