Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570F8C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C334154A;
	Sat, 12 Aug 2023 20:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C334154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlxYINXvWL9A; Sat, 12 Aug 2023 20:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5818B41553;
	Sat, 12 Aug 2023 20:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5818B41553
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19E311BF578
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4FA381AEF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4FA381AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id docnlzDm2Ue2 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:56:27 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3495081ABA
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3495081ABA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3DEFC780333;
 Sat, 12 Aug 2023 22:56:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 22:56:17 +0200
Date: Sat, 12 Aug 2023 22:56:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230812205617.GT421096@scaer>
References: <20230806124850.71234-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806124850.71234-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691873783;
 bh=wX/wOWVJ+EmPH2kUlAHNEQDKT/kyr8IcDiBaEqu4UsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BrK2UcjNOrIZM6qov/fFrdwM7VeXs0WY6fqkktICxWeYJv8mlGPm9Iy06w4Hbbkq0
 NSEHD7tuV/80+YqehLAiGnls5t+fsFtF4SddVHT6aj1M6yV9n8J18EOc9j3rk0cckW
 GUQaG5uxebTsQfccXdEuH6KapHph7WfXEGZLjteju4oq3XquDLOgQbCzIhwkGkc0T7
 3sSDbWZykwWCVKKRpmUKK3ebS9IJ0qq96FJzhLR/ka0ZIGyPoHYsfCg+XoU0OWh8wC
 eNTJebTDBx7zpIsUNo6zQSGMJpi0SXBn2CfhE5Woqq3YhK+H6Z7lKLspalasOaFs5F
 ZhH6ibJ5/WrtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BrK2UcjN
Subject: Re: [Buildroot] [PATCH next]
 toolchain/toolchain-external/toolchain-external-bootlin: update to 2023.08
 toolchains
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-06 14:48 +0200, Thomas Petazzoni via buildroot spake thusly:
> A new version of Bootlin toolchains, 2023.08, has been recently
> released. Besides the usual updates of GCC, binutils, GDB, kernel
> headers, and C libraries, support for AArch64 BE with musl has been
> enabled, which explains why there are two new toolchains and two new
> test cases.
> 
> All test cases where successfully tested:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/957304450/builds

I've added a little note that the sparcv8 uclibc toolchains are not
updated because they are consuderd obsolete.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../tests/toolchain/test_external_bootlin.py  |   28 +
>  .../Config.in.options                         | 1261 +++++++++--------
>  .../toolchain-external-bootlin.hash           |  824 +++++------
>  .../toolchain-external-bootlin.mk             |  422 +++---
>  4 files changed, 1314 insertions(+), 1221 deletions(-)
> 
> diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
> index 96a8780d36..fb82a0a377 100644
> --- a/support/testing/tests/toolchain/test_external_bootlin.py
> +++ b/support/testing/tests/toolchain/test_external_bootlin.py
> @@ -115,6 +115,34 @@ class TestExternalToolchainBootlinAarch64beGlibcStable(TestExternalToolchain):
>          TestExternalToolchain.common_check(self)
>  
>  
> +class TestExternalToolchainBootlinAarch64beMuslBleedingEdge(TestExternalToolchain):
> +    config = """
> +        BR2_aarch64_be=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "aarch64_be-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
> +class TestExternalToolchainBootlinAarch64beMuslStable(TestExternalToolchain):
> +    config = """
> +        BR2_aarch64_be=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    toolchain_prefix = "aarch64_be-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +
> +
>  class TestExternalToolchainBootlinAarch64beUclibcBleedingEdge(TestExternalToolchain):
>      config = """
>          BR2_aarch64_be=y
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> index d90137af09..e1867ee690 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> @@ -58,11 +58,11 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
>  choice
>  	prompt "Bootlin toolchain variant"
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
> -	bool "aarch64 glibc bleeding-edge 2022.08-1"
> +	bool "aarch64 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -82,11 +82,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
> -	bool "aarch64 glibc stable 2022.08-1"
> +	bool "aarch64 glibc stable 2023.08-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -106,11 +106,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
> -	bool "aarch64 musl bleeding-edge 2022.08-1"
> +	bool "aarch64 musl bleeding-edge 2023.08-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -130,10 +130,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
> -	bool "aarch64 musl stable 2022.08-2"
> +	bool "aarch64 musl stable 2023.08-1"
>  	depends on BR2_aarch64
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -153,10 +153,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
> -	bool "aarch64 uclibc bleeding-edge 2022.08-1"
> +	bool "aarch64 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_aarch64
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -177,10 +177,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
> -	bool "aarch64 uclibc stable 2022.08-1"
> +	bool "aarch64 uclibc stable 2023.08-1"
>  	depends on BR2_aarch64
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -201,11 +201,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
> -	bool "aarch64be glibc bleeding-edge 2022.08-1"
> +	bool "aarch64be glibc bleeding-edge 2023.08-1"
>  	depends on BR2_aarch64_be
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -225,11 +225,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
> -	bool "aarch64be glibc stable 2022.08-1"
> +	bool "aarch64be glibc stable 2023.08-1"
>  	depends on BR2_aarch64_be
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -248,11 +248,58 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
>  
>  	  https://toolchains.bootlin.com/
>  
> -config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
> -	bool "aarch64be uclibc bleeding-edge 2022.08-1"
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
> +	bool "aarch64be musl bleeding-edge 2023.08-1"
> +	depends on BR2_aarch64_be
> +	depends on BR2_USE_MMU
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_OPENMP
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	help
> +	  Bootlin toolchain for the aarch64be architecture, using the
> +	  musl C library. This is a bleeding-edge version, which
> +	  means it is using the latest versions of gcc, gdb and
> +	  binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
> +	bool "aarch64be musl stable 2023.08-1"
>  	depends on BR2_aarch64_be
> +	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_OPENMP
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	help
> +	  Bootlin toolchain for the aarch64be architecture, using the
> +	  musl C library. This is a stable version, which means it is
> +	  using stable and proven versions of gcc, gdb and binutils.
> +
> +	  https://toolchains.bootlin.com/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
> +	bool "aarch64be uclibc bleeding-edge 2023.08-1"
> +	depends on BR2_aarch64_be
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -273,10 +320,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
> -	bool "aarch64be uclibc stable 2022.08-1"
> +	bool "aarch64be uclibc stable 2023.08-1"
>  	depends on BR2_aarch64_be
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -297,11 +344,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
> -	bool "arcle-750d uclibc bleeding-edge 2022.08-1"
> +	bool "arcle-750d uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_arc750d
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -321,11 +368,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
> -	bool "arcle-750d uclibc stable 2022.08-1"
> +	bool "arcle-750d uclibc stable 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_arc750d
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -345,12 +392,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
> -	bool "arcle-hs38 glibc bleeding-edge 2022.08-1"
> +	bool "arcle-hs38 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_SSP
> @@ -369,7 +416,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
> -	bool "arcle-hs38 glibc stable 2022.08-1"
> +	bool "arcle-hs38 glibc stable 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
>  	depends on BR2_USE_MMU
> @@ -393,11 +440,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
> -	bool "arcle-hs38 uclibc bleeding-edge 2022.08-1"
> +	bool "arcle-hs38 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -417,11 +464,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
> -	bool "arcle-hs38 uclibc stable 2022.08-1"
> +	bool "arcle-hs38 uclibc stable 2023.08-1"
>  	depends on BR2_arcle
>  	depends on BR2_archs38
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -441,13 +488,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
> -	bool "armv5-eabi glibc bleeding-edge 2022.08-1"
> +	bool "armv5-eabi glibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -467,13 +514,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
> -	bool "armv5-eabi glibc stable 2022.08-1"
> +	bool "armv5-eabi glibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -493,13 +540,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
> -	bool "armv5-eabi musl bleeding-edge 2022.08-1"
> +	bool "armv5-eabi musl bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -519,13 +566,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
> -	bool "armv5-eabi musl stable 2022.08-1"
> +	bool "armv5-eabi musl stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -545,12 +592,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
> -	bool "armv5-eabi uclibc bleeding-edge 2022.08-1"
> +	bool "armv5-eabi uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -571,12 +618,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
> -	bool "armv5-eabi uclibc stable 2022.08-1"
> +	bool "armv5-eabi uclibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV5
>  	depends on BR2_ARM_EABI
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -597,13 +644,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
> -	bool "armv6-eabihf glibc bleeding-edge 2022.08-1"
> +	bool "armv6-eabihf glibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -623,13 +670,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
> -	bool "armv6-eabihf glibc stable 2022.08-1"
> +	bool "armv6-eabihf glibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -649,13 +696,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
> -	bool "armv6-eabihf musl bleeding-edge 2022.08-1"
> +	bool "armv6-eabihf musl bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -675,13 +722,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
> -	bool "armv6-eabihf musl stable 2022.08-1"
> +	bool "armv6-eabihf musl stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -701,12 +748,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
> -	bool "armv6-eabihf uclibc bleeding-edge 2022.08-1"
> +	bool "armv6-eabihf uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -727,12 +774,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
> -	bool "armv6-eabihf uclibc stable 2022.08-1"
> +	bool "armv6-eabihf uclibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV6
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -753,13 +800,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
> -	bool "armv7-eabihf glibc bleeding-edge 2022.08-1"
> +	bool "armv7-eabihf glibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -779,13 +826,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
> -	bool "armv7-eabihf glibc stable 2022.08-1"
> +	bool "armv7-eabihf glibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -805,13 +852,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
> -	bool "armv7-eabihf musl bleeding-edge 2022.08-1"
> +	bool "armv7-eabihf musl bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -831,13 +878,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
> -	bool "armv7-eabihf musl stable 2022.08-1"
> +	bool "armv7-eabihf musl stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -857,12 +904,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
> -	bool "armv7-eabihf uclibc bleeding-edge 2022.08-1"
> +	bool "armv7-eabihf uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -883,12 +930,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
> -	bool "armv7-eabihf uclibc stable 2022.08-1"
> +	bool "armv7-eabihf uclibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -909,13 +956,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
> -	bool "armebv7-eabihf glibc bleeding-edge 2022.08-1"
> +	bool "armebv7-eabihf glibc bleeding-edge 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -935,13 +982,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
> -	bool "armebv7-eabihf glibc stable 2022.08-1"
> +	bool "armebv7-eabihf glibc stable 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -961,13 +1008,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
> -	bool "armebv7-eabihf musl bleeding-edge 2022.08-1"
> +	bool "armebv7-eabihf musl bleeding-edge 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -987,13 +1034,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
> -	bool "armebv7-eabihf musl stable 2022.08-1"
> +	bool "armebv7-eabihf musl stable 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1013,12 +1060,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
> -	bool "armebv7-eabihf uclibc bleeding-edge 2022.08-1"
> +	bool "armebv7-eabihf uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1039,12 +1086,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
> -	bool "armebv7-eabihf uclibc stable 2022.08-1"
> +	bool "armebv7-eabihf uclibc stable 2023.08-1"
>  	depends on BR2_armeb
>  	depends on BR2_ARM_CPU_ARMV7A
>  	depends on BR2_ARM_EABIHF
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1065,11 +1112,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
> -	bool "armv7m uclibc bleeding-edge 2022.08-1"
> +	bool "armv7m uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7M
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1088,11 +1135,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
> -	bool "armv7m uclibc stable 2022.08-1"
> +	bool "armv7m uclibc stable 2023.08-1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7M
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1111,10 +1158,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
> -	bool "m68k-68xxx uclibc bleeding-edge 2022.08-1"
> +	bool "m68k-68xxx uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_m68k_m68k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1135,10 +1182,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
> -	bool "m68k-68xxx uclibc stable 2022.08-1"
> +	bool "m68k-68xxx uclibc stable 2023.08-1"
>  	depends on BR2_m68k_m68k
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1159,14 +1206,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
> -	bool "m68k-coldfire uclibc bleeding-edge 2021.11-1"
> +	bool "m68k-coldfire uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_m68k_cf
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_OPENMP
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1180,14 +1228,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
> -	bool "m68k-coldfire uclibc stable 2021.11-1"
> +	bool "m68k-coldfire uclibc stable 2023.08-1"
>  	depends on BR2_m68k_cf
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_TOOLCHAIN_HAS_OPENMP
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1201,12 +1250,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
> -	bool "microblazebe glibc bleeding-edge 2022.08-1"
> +	bool "microblazebe glibc bleeding-edge 2023.08-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1224,12 +1273,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
> -	bool "microblazebe glibc stable 2022.08-1"
> +	bool "microblazebe glibc stable 2023.08-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1247,12 +1296,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
> -	bool "microblazebe musl bleeding-edge 2022.08-1"
> +	bool "microblazebe musl bleeding-edge 2023.08-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1270,12 +1319,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
> -	bool "microblazebe musl stable 2022.08-1"
> +	bool "microblazebe musl stable 2023.08-1"
>  	depends on BR2_microblazebe
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1293,11 +1342,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
> -	bool "microblazebe uclibc bleeding-edge 2022.08-1"
> +	bool "microblazebe uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_microblazebe
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1317,11 +1366,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
> -	bool "microblazebe uclibc stable 2022.08-1"
> +	bool "microblazebe uclibc stable 2023.08-1"
>  	depends on BR2_microblazebe
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1341,12 +1390,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
> -	bool "microblazeel glibc bleeding-edge 2022.08-1"
> +	bool "microblazeel glibc bleeding-edge 2023.08-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1364,12 +1413,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
> -	bool "microblazeel glibc stable 2022.08-1"
> +	bool "microblazeel glibc stable 2023.08-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1387,12 +1436,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
> -	bool "microblazeel musl bleeding-edge 2022.08-1"
> +	bool "microblazeel musl bleeding-edge 2023.08-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1410,12 +1459,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
> -	bool "microblazeel musl stable 2022.08-1"
> +	bool "microblazeel musl stable 2023.08-1"
>  	depends on BR2_microblazeel
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_THREADS
> @@ -1433,11 +1482,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
> -	bool "microblazeel uclibc bleeding-edge 2022.08-1"
> +	bool "microblazeel uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_microblazeel
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1457,11 +1506,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
> -	bool "microblazeel uclibc stable 2022.08-1"
> +	bool "microblazeel uclibc stable 2023.08-1"
>  	depends on BR2_microblazeel
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1481,13 +1530,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
> -	bool "mips32 glibc bleeding-edge 2022.08-1"
> +	bool "mips32 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1507,13 +1556,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
> -	bool "mips32 glibc stable 2022.08-1"
> +	bool "mips32 glibc stable 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1533,13 +1582,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
> -	bool "mips32 musl bleeding-edge 2022.08-1"
> +	bool "mips32 musl bleeding-edge 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1559,13 +1608,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
> -	bool "mips32 musl stable 2022.08-1"
> +	bool "mips32 musl stable 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1584,12 +1633,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
> -	bool "mips32 uclibc bleeding-edge 2022.08-1"
> +	bool "mips32 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1610,12 +1659,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
> -	bool "mips32 uclibc stable 2022.08-1"
> +	bool "mips32 uclibc stable 2023.08-1"
>  	depends on BR2_mips
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1636,13 +1685,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32el glibc bleeding-edge 2022.08-1"
> +	bool "mips32el glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1662,13 +1711,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
> -	bool "mips32el glibc stable 2022.08-1"
> +	bool "mips32el glibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1688,13 +1737,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
> -	bool "mips32el musl bleeding-edge 2022.08-1"
> +	bool "mips32el musl bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1714,13 +1763,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
> -	bool "mips32el musl stable 2022.08-1"
> +	bool "mips32el musl stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1739,12 +1788,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32el uclibc bleeding-edge 2022.08-1"
> +	bool "mips32el uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1765,12 +1814,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
> -	bool "mips32el uclibc stable 2022.08-1"
> +	bool "mips32el uclibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1791,13 +1840,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32r5el glibc bleeding-edge 2022.08-1"
> +	bool "mips32r5el glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1817,13 +1866,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
> -	bool "mips32r5el glibc stable 2022.08-1"
> +	bool "mips32r5el glibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1843,13 +1892,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
> -	bool "mips32r5el musl bleeding-edge 2022.08-1"
> +	bool "mips32r5el musl bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1869,13 +1918,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
> -	bool "mips32r5el musl stable 2022.08-1"
> +	bool "mips32r5el musl stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1895,12 +1944,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32r5el uclibc bleeding-edge 2022.08-1"
> +	bool "mips32r5el uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1921,12 +1970,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
> -	bool "mips32r5el uclibc stable 2022.08-1"
> +	bool "mips32r5el uclibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r5
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -1947,13 +1996,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
> -	bool "mips32r6el glibc bleeding-edge 2022.08-1"
> +	bool "mips32r6el glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1973,13 +2022,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
> -	bool "mips32r6el glibc stable 2022.08-1"
> +	bool "mips32r6el glibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -1999,13 +2048,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
> -	bool "mips32r6el musl bleeding-edge 2022.08-1"
> +	bool "mips32r6el musl bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2025,13 +2074,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
> -	bool "mips32r6el musl stable 2022.08-1"
> +	bool "mips32r6el musl stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2051,12 +2100,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
> -	bool "mips32r6el uclibc bleeding-edge 2022.08-1"
> +	bool "mips32r6el uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2077,12 +2126,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
> -	bool "mips32r6el uclibc stable 2022.08-1"
> +	bool "mips32r6el uclibc stable 2023.08-1"
>  	depends on BR2_mipsel
>  	depends on BR2_mips_32r6
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2103,14 +2152,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64-n32 glibc bleeding-edge 2022.08-1"
> +	bool "mips64-n32 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2130,14 +2179,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
> -	bool "mips64-n32 glibc stable 2022.08-1"
> +	bool "mips64-n32 glibc stable 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2157,14 +2206,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64-n32 musl bleeding-edge 2022.08-1"
> +	bool "mips64-n32 musl bleeding-edge 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2184,14 +2233,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
> -	bool "mips64-n32 musl stable 2022.08-1"
> +	bool "mips64-n32 musl stable 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2211,13 +2260,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64-n32 uclibc bleeding-edge 2022.08-1"
> +	bool "mips64-n32 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2238,13 +2287,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
> -	bool "mips64-n32 uclibc stable 2022.08-1"
> +	bool "mips64-n32 uclibc stable 2023.08-1"
>  	depends on BR2_mips64
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2265,14 +2314,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64el-n32 glibc bleeding-edge 2022.08-1"
> +	bool "mips64el-n32 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2292,14 +2341,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
> -	bool "mips64el-n32 glibc stable 2022.08-1"
> +	bool "mips64el-n32 glibc stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2319,14 +2368,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64el-n32 musl bleeding-edge 2022.08-1"
> +	bool "mips64el-n32 musl bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2346,14 +2395,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
> -	bool "mips64el-n32 musl stable 2022.08-1"
> +	bool "mips64el-n32 musl stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2373,13 +2422,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64el-n32 uclibc bleeding-edge 2022.08-1"
> +	bool "mips64el-n32 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2400,13 +2449,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
> -	bool "mips64el-n32 uclibc stable 2022.08-1"
> +	bool "mips64el-n32 uclibc stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2427,14 +2476,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
> -	bool "mips64r6el-n32 glibc bleeding-edge 2022.08-1"
> +	bool "mips64r6el-n32 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2454,14 +2503,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
> -	bool "mips64r6el-n32 glibc stable 2022.08-1"
> +	bool "mips64r6el-n32 glibc stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2481,14 +2530,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
> -	bool "mips64r6el-n32 musl bleeding-edge 2022.08-1"
> +	bool "mips64r6el-n32 musl bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2508,14 +2557,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
> -	bool "mips64r6el-n32 musl stable 2022.08-1"
> +	bool "mips64r6el-n32 musl stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2535,13 +2584,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
> -	bool "mips64r6el-n32 uclibc bleeding-edge 2022.08-1"
> +	bool "mips64r6el-n32 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2562,13 +2611,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
> -	bool "mips64r6el-n32 uclibc stable 2022.08-1"
> +	bool "mips64r6el-n32 uclibc stable 2023.08-1"
>  	depends on BR2_mips64el
>  	depends on BR2_mips_64r6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_MIPS_SOFT_FLOAT
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2589,11 +2638,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
> -	bool "nios2 glibc bleeding-edge 2022.08-1"
> +	bool "nios2 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_nios2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2613,11 +2662,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
> -	bool "nios2 glibc stable 2022.08-1"
> +	bool "nios2 glibc stable 2023.08-1"
>  	depends on BR2_nios2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2637,12 +2686,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
> -	bool "openrisc glibc bleeding-edge 2022.08-1"
> +	bool "openrisc glibc bleeding-edge 2023.08-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2662,11 +2711,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
> -	bool "openrisc glibc stable 2022.08-1"
> +	bool "openrisc glibc stable 2023.08-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -2687,12 +2736,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
> -	bool "openrisc musl bleeding-edge 2022.08-1"
> +	bool "openrisc musl bleeding-edge 2023.08-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2712,12 +2761,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
> -	bool "openrisc musl stable 2022.08-1"
> +	bool "openrisc musl stable 2023.08-1"
>  	depends on BR2_or1k
>  	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2736,11 +2785,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
> -	bool "openrisc uclibc bleeding-edge 2022.08-1"
> +	bool "openrisc uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_or1k
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2761,11 +2810,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
> -	bool "openrisc uclibc stable 2022.08-1"
> +	bool "openrisc uclibc stable 2023.08-1"
>  	depends on BR2_or1k
>  	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2786,12 +2835,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-440fp glibc bleeding-edge 2022.08-1"
> +	bool "powerpc-440fp glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2811,12 +2860,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
> -	bool "powerpc-440fp glibc stable 2022.08-1"
> +	bool "powerpc-440fp glibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2836,12 +2885,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
> -	bool "powerpc-440fp musl bleeding-edge 2022.08-1"
> +	bool "powerpc-440fp musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2860,12 +2909,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
> -	bool "powerpc-440fp musl stable 2022.08-1"
> +	bool "powerpc-440fp musl stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2884,11 +2933,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-440fp uclibc bleeding-edge 2022.08-1"
> +	bool "powerpc-440fp uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2909,11 +2958,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
> -	bool "powerpc-440fp uclibc stable 2022.08-1"
> +	bool "powerpc-440fp uclibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_440fp
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -2934,12 +2983,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-e300c3 glibc bleeding-edge 2022.08-1"
> +	bool "powerpc-e300c3 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2959,12 +3008,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
> -	bool "powerpc-e300c3 glibc stable 2022.08-1"
> +	bool "powerpc-e300c3 glibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -2984,12 +3033,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
> -	bool "powerpc-e300c3 musl bleeding-edge 2022.08-1"
> +	bool "powerpc-e300c3 musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3008,12 +3057,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
> -	bool "powerpc-e300c3 musl stable 2022.08-1"
> +	bool "powerpc-e300c3 musl stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3032,11 +3081,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-e300c3 uclibc bleeding-edge 2022.08-1"
> +	bool "powerpc-e300c3 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3057,11 +3106,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
> -	bool "powerpc-e300c3 uclibc stable 2022.08-1"
> +	bool "powerpc-e300c3 uclibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e300c3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3082,12 +3131,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
> -	bool "powerpc-e500mc glibc bleeding-edge 2022.08-1"
> +	bool "powerpc-e500mc glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3107,12 +3156,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
> -	bool "powerpc-e500mc glibc stable 2022.08-1"
> +	bool "powerpc-e500mc glibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3132,12 +3181,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
> -	bool "powerpc-e500mc musl bleeding-edge 2022.08-1"
> +	bool "powerpc-e500mc musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3156,12 +3205,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
> -	bool "powerpc-e500mc musl stable 2022.08-1"
> +	bool "powerpc-e500mc musl stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3180,11 +3229,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
> -	bool "powerpc-e500mc uclibc bleeding-edge 2022.08-1"
> +	bool "powerpc-e500mc uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3205,11 +3254,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
> -	bool "powerpc-e500mc uclibc stable 2022.08-1"
> +	bool "powerpc-e500mc uclibc stable 2023.08-1"
>  	depends on BR2_powerpc
>  	depends on BR2_powerpc_e500mc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3230,12 +3279,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-e5500 glibc bleeding-edge 2022.08-1"
> +	bool "powerpc64-e5500 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e5500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3255,12 +3304,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
> -	bool "powerpc64-e5500 glibc stable 2022.08-1"
> +	bool "powerpc64-e5500 glibc stable 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e5500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3280,12 +3329,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-e6500 glibc bleeding-edge 2022.08-1"
> +	bool "powerpc64-e6500 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3305,12 +3354,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
> -	bool "powerpc64-e6500 glibc stable 2022.08-1"
> +	bool "powerpc64-e6500 glibc stable 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3330,12 +3379,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
> -	bool "powerpc64-e6500 musl bleeding-edge 2022.08-1"
> +	bool "powerpc64-e6500 musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3355,12 +3404,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
> -	bool "powerpc64-e6500 musl stable 2022.08-1"
> +	bool "powerpc64-e6500 musl stable 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_e6500
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3380,12 +3429,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64-power8 glibc bleeding-edge 2022.08-1"
> +	bool "powerpc64-power8 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3405,12 +3454,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
> -	bool "powerpc64-power8 glibc stable 2022.08-1"
> +	bool "powerpc64-power8 glibc stable 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3430,12 +3479,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
> -	bool "powerpc64-power8 musl bleeding-edge 2022.08-1"
> +	bool "powerpc64-power8 musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3455,12 +3504,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
> -	bool "powerpc64-power8 musl stable 2022.08-1"
> +	bool "powerpc64-power8 musl stable 2023.08-1"
>  	depends on BR2_powerpc64
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3480,12 +3529,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
> -	bool "powerpc64le-power8 glibc bleeding-edge 2022.08-1"
> +	bool "powerpc64le-power8 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3505,12 +3554,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
> -	bool "powerpc64le-power8 glibc stable 2022.08-1"
> +	bool "powerpc64le-power8 glibc stable 2023.08-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3530,12 +3579,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
> -	bool "powerpc64le-power8 musl bleeding-edge 2022.08-1"
> +	bool "powerpc64le-power8 musl bleeding-edge 2023.08-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3555,12 +3604,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
> -	bool "powerpc64le-power8 musl stable 2022.08-1"
> +	bool "powerpc64le-power8 musl stable 2023.08-1"
>  	depends on BR2_powerpc64le
>  	depends on BR2_powerpc_power8
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3580,14 +3629,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
> -	bool "riscv32-ilp32d glibc bleeding-edge 2022.08-1"
> +	bool "riscv32-ilp32d glibc bleeding-edge 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_32
>  	depends on BR2_RISCV_ABI_ILP32D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3607,14 +3656,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
> -	bool "riscv64-lp64d glibc bleeding-edge 2022.08-1"
> +	bool "riscv64-lp64d glibc bleeding-edge 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3634,13 +3683,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
> -	bool "riscv64-lp64d glibc stable 2022.08-1"
> +	bool "riscv64-lp64d glibc stable 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3661,14 +3710,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
> -	bool "riscv64-lp64d musl bleeding-edge 2022.08-1"
> +	bool "riscv64-lp64d musl bleeding-edge 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3688,13 +3737,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
> -	bool "riscv64-lp64d musl stable 2022.08-1"
> +	bool "riscv64-lp64d musl stable 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> @@ -3715,14 +3764,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
> -	bool "riscv64-lp64d uclibc bleeding-edge 2022.08-1"
> +	bool "riscv64-lp64d uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3743,13 +3792,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
> -	bool "riscv64-lp64d uclibc stable 2022.08-1"
> +	bool "riscv64-lp64d uclibc stable 2023.08-1"
>  	depends on BR2_riscv
>  	depends on BR2_riscv_g
>  	depends on BR2_RISCV_64
>  	depends on BR2_RISCV_ABI_LP64D
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
> @@ -3771,12 +3820,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
> -	bool "s390x-z13 glibc bleeding-edge 2022.08-1"
> +	bool "s390x-z13 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_s390x
>  	depends on BR2_s390x_z13
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3796,12 +3845,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
> -	bool "s390x-z13 glibc stable 2022.08-1"
> +	bool "s390x-z13 glibc stable 2023.08-1"
>  	depends on BR2_s390x
>  	depends on BR2_s390x_z13
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3821,12 +3870,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
> -	bool "sh-sh4 glibc bleeding-edge 2022.08-1"
> +	bool "sh-sh4 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3846,12 +3895,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
> -	bool "sh-sh4 glibc stable 2022.08-1"
> +	bool "sh-sh4 glibc stable 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3871,12 +3920,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
> -	bool "sh-sh4 musl bleeding-edge 2022.08-1"
> +	bool "sh-sh4 musl bleeding-edge 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3896,12 +3945,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
> -	bool "sh-sh4 musl stable 2022.08-1"
> +	bool "sh-sh4 musl stable 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3920,11 +3969,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
> -	bool "sh-sh4 uclibc bleeding-edge 2022.08-1"
> +	bool "sh-sh4 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3945,11 +3994,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
> -	bool "sh-sh4 uclibc stable 2022.08-1"
> +	bool "sh-sh4 uclibc stable 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -3970,12 +4019,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
> -	bool "sh-sh4aeb glibc bleeding-edge 2022.08-1"
> +	bool "sh-sh4aeb glibc bleeding-edge 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -3995,12 +4044,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
> -	bool "sh-sh4aeb glibc stable 2022.08-1"
> +	bool "sh-sh4aeb glibc stable 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4020,12 +4069,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
> -	bool "sh-sh4aeb musl bleeding-edge 2022.08-1"
> +	bool "sh-sh4aeb musl bleeding-edge 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4045,12 +4094,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
> -	bool "sh-sh4aeb musl stable 2022.08-1"
> +	bool "sh-sh4aeb musl stable 2023.08-1"
>  	depends on BR2_sh
>  	depends on BR2_sh4aeb
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4069,12 +4118,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
> -	bool "sparc64 glibc bleeding-edge 2022.08-1"
> +	bool "sparc64 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_sparc64
>  	depends on BR2_sparc_v9
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4094,12 +4143,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
> -	bool "sparc64 glibc stable 2022.08-1"
> +	bool "sparc64 glibc stable 2023.08-1"
>  	depends on BR2_sparc64
>  	depends on BR2_sparc_v9
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4169,14 +4218,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
> -	bool "x86-64 glibc bleeding-edge 2022.08-1"
> +	bool "x86-64 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4196,14 +4245,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
> -	bool "x86-64 glibc stable 2022.08-1"
> +	bool "x86-64 glibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4223,14 +4272,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
> -	bool "x86-64 musl bleeding-edge 2022.08-1"
> +	bool "x86-64 musl bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4250,14 +4299,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
> -	bool "x86-64 musl stable 2022.08-1"
> +	bool "x86-64 musl stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4276,13 +4325,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-64 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4303,13 +4352,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
> -	bool "x86-64 uclibc stable 2022.08-1"
> +	bool "x86-64 uclibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4330,7 +4379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
> -	bool "x86-64-v2 glibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v2 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4340,8 +4389,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4361,7 +4410,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
> -	bool "x86-64-v2 glibc stable 2022.08-1"
> +	bool "x86-64-v2 glibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4371,8 +4420,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4392,7 +4441,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
> -	bool "x86-64-v2 musl bleeding-edge 2022.08-1"
> +	bool "x86-64-v2 musl bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4402,8 +4451,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4423,7 +4472,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
> -	bool "x86-64-v2 musl stable 2022.08-1"
> +	bool "x86-64-v2 musl stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4433,8 +4482,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4453,7 +4502,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64-v2 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v2 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4462,8 +4511,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4484,7 +4533,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
> -	bool "x86-64-v2 uclibc stable 2022.08-1"
> +	bool "x86-64-v2 uclibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4493,8 +4542,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4515,7 +4564,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
> -	bool "x86-64-v3 glibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v3 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4527,8 +4576,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4548,7 +4597,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
> -	bool "x86-64-v3 glibc stable 2022.08-1"
> +	bool "x86-64-v3 glibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4560,8 +4609,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4581,7 +4630,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
> -	bool "x86-64-v3 musl bleeding-edge 2022.08-1"
> +	bool "x86-64-v3 musl bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4593,8 +4642,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4614,7 +4663,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
> -	bool "x86-64-v3 musl stable 2022.08-1"
> +	bool "x86-64-v3 musl stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4626,8 +4675,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4646,7 +4695,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64-v3 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v3 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4657,8 +4706,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4679,7 +4728,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
> -	bool "x86-64-v3 uclibc stable 2022.08-1"
> +	bool "x86-64-v3 uclibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4690,8 +4739,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4712,7 +4761,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
> -	bool "x86-64-v4 glibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v4 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4725,8 +4774,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4746,7 +4795,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
> -	bool "x86-64-v4 glibc stable 2022.08-1"
> +	bool "x86-64-v4 glibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4759,8 +4808,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4780,7 +4829,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
> -	bool "x86-64-v4 musl bleeding-edge 2022.08-1"
> +	bool "x86-64-v4 musl bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4793,8 +4842,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4814,7 +4863,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
> -	bool "x86-64-v4 musl stable 2022.08-1"
> +	bool "x86-64-v4 musl stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4827,8 +4876,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4847,7 +4896,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64-v4 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-64-v4 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4859,8 +4908,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4881,7 +4930,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
> -	bool "x86-64-v4 uclibc stable 2022.08-1"
> +	bool "x86-64-v4 uclibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4893,8 +4942,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_AVX
>  	depends on BR2_X86_CPU_HAS_AVX2
>  	depends on BR2_X86_CPU_HAS_AVX512
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -4915,7 +4964,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
> -	bool "x86-64-core-i7 glibc bleeding-edge 2022.08-1"
> +	bool "x86-64-core-i7 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4925,8 +4974,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4946,7 +4995,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
> -	bool "x86-64-core-i7 glibc stable 2022.08-1"
> +	bool "x86-64-core-i7 glibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4956,8 +5005,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -4977,7 +5026,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
> -	bool "x86-64-core-i7 musl bleeding-edge 2022.08-1"
> +	bool "x86-64-core-i7 musl bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -4987,8 +5036,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5008,7 +5057,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
> -	bool "x86-64-core-i7 musl stable 2022.08-1"
> +	bool "x86-64-core-i7 musl stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5018,8 +5067,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5039,7 +5088,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
> -	bool "x86-64-core-i7 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-64-core-i7 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5048,8 +5097,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5070,7 +5119,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
> -	bool "x86-64-core-i7 uclibc stable 2022.08-1"
> +	bool "x86-64-core-i7 uclibc stable 2023.08-1"
>  	depends on BR2_x86_64
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5079,8 +5128,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_X86_CPU_HAS_SSE4
>  	depends on BR2_X86_CPU_HAS_SSE42
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5101,7 +5150,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
> -	bool "x86-core2 glibc bleeding-edge 2022.08-1"
> +	bool "x86-core2 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5109,8 +5158,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5130,7 +5179,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
> -	bool "x86-core2 glibc stable 2022.08-1"
> +	bool "x86-core2 glibc stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5138,8 +5187,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5159,7 +5208,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
> -	bool "x86-core2 musl bleeding-edge 2022.08-1"
> +	bool "x86-core2 musl bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5167,8 +5216,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5187,7 +5236,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
> -	bool "x86-core2 musl stable 2022.08-1"
> +	bool "x86-core2 musl stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
> @@ -5195,8 +5244,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5214,15 +5263,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
> -	bool "x86-core2 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-core2 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5243,15 +5292,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
> -	bool "x86-core2 uclibc stable 2022.08-1"
> +	bool "x86-core2 uclibc stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on BR2_X86_CPU_HAS_MMX
>  	depends on BR2_X86_CPU_HAS_SSE
>  	depends on BR2_X86_CPU_HAS_SSE2
>  	depends on BR2_X86_CPU_HAS_SSE3
>  	depends on BR2_X86_CPU_HAS_SSSE3
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5272,7 +5321,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
> -	bool "x86-i686 glibc bleeding-edge 2022.08-1"
> +	bool "x86-i686 glibc bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5283,8 +5332,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5304,7 +5353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
> -	bool "x86-i686 glibc stable 2022.08-1"
> +	bool "x86-i686 glibc stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5315,8 +5364,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5336,7 +5385,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
> -	bool "x86-i686 musl bleeding-edge 2022.08-1"
> +	bool "x86-i686 musl bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5347,8 +5396,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5367,7 +5416,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
> -	bool "x86-i686 musl stable 2022.08-1"
> +	bool "x86-i686 musl stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5378,8 +5427,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
>  	depends on BR2_USE_MMU
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
> @@ -5397,7 +5446,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
> -	bool "x86-i686 uclibc bleeding-edge 2022.08-1"
> +	bool "x86-i686 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5407,8 +5456,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
>  	depends on !BR2_x86_c3
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5429,7 +5478,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
> -	bool "x86-i686 uclibc stable 2022.08-1"
> +	bool "x86-i686 uclibc stable 2023.08-1"
>  	depends on BR2_i386
>  	depends on !BR2_x86_i486
>  	depends on !BR2_x86_i586
> @@ -5439,8 +5488,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
>  	depends on !BR2_x86_c3
>  	depends on !BR2_x86_winchip_c6
>  	depends on !BR2_x86_winchip2
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5461,12 +5510,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
> -	bool "xtensa-lx60 uclibc bleeding-edge 2022.08-1"
> +	bool "xtensa-lx60 uclibc bleeding-edge 2023.08-1"
>  	depends on BR2_xtensa
>  	depends on BR2_XTENSA_CUSTOM
>  	depends on BR2_XTENSA_LITTLE_ENDIAN
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -5487,12 +5536,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
>  	  https://toolchains.bootlin.com/
>  
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
> -	bool "xtensa-lx60 uclibc stable 2022.08-1"
> +	bool "xtensa-lx60 uclibc stable 2023.08-1"
>  	depends on BR2_xtensa
>  	depends on BR2_XTENSA_CUSTOM
>  	depends on BR2_XTENSA_LITTLE_ENDIAN
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_USE_WCHAR
>  	select BR2_ENABLE_LOCALE
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> index 9565ab1c1e..29bbdf56c2 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
> @@ -1,416 +1,420 @@
>  # This file was auto-generated by support/scripts/gen-bootlin-toolchains
>  # Do not edit
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  d11a94113dc92fe1c141096dbeb1c3fe2adb0552b495bb9e3e41fad96b4b429a  aarch64--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2022.08-1.sha256
> -sha256  844df3c99508030ee9cb1152cb182500bb9816ff01968f2e18591d51d766c9e7  aarch64--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2022.08-1.sha256
> -sha256  20d9b6cca203d18355a57cc8014ebf701e548922149aeec0d6109399bcc37b42  aarch64--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2022.08-2.sha256
> -sha256  06f5e1d63be86dfbe3c8f7508164464116d43a044b9bef20fe97277f34400bc2  aarch64--musl--stable-2022.08-2.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  24d3c9c294ef15669fa6182dff951f3850320e590b869587cc1650633f6c9b7f  aarch64--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2022.08-1.sha256
> -sha256  b448a1752a58d6bb118c030028cd26f070cedccc0edc95ce8d684cced1bd1c0d  aarch64--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  456b684924d581749fc6c2889320170b1bb5e3227324922109432e2a1dd54d91  aarch64be--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2022.08-1.sha256
> -sha256  6cbc48f30cc0e8178cf083eeb48123c519f6e5e0a628a531a415d8907027b2d3  aarch64be--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  923441910c0d132e94a0f0681c403feea78d84a47b593f7946640c2e687771b0  aarch64be--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2022.08-1.sha256
> -sha256  b29fc8d852f531aaa094cda9ab08d0f28817f7404990f3b3a20b2ce180091566  aarch64be--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  bea37db5d3f229318c44d59efa444f5c2012bc773dbf23f1914669110c931f9b  arcle-750d--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2022.08-1.sha256
> -sha256  b333bfbb6b664f7f38a36a5648bac3567cec3f3672c12eadb368b3fc773e5570  arcle-750d--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  2c5fd77f67f2126412fcc7b163e492452f8bb0a2c7fa943cb7350387d00e2a46  arcle-hs38--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2022.08-1.sha256
> -sha256  af8295901ad4bd359dc3e5da442ad9e6d0474e96cd38f31479d8c714bf4315e2  arcle-hs38--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  c6a00bae6d5e1bb343c339a942466f5f0de7d736671a6ba2d3f76890d9b0d486  arcle-hs38--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2022.08-1.sha256
> -sha256  8fbe4086d5dafb1e0cd69f3762cb4d8c1273ee8b6bbbd8850fce54a5a8dad374  arcle-hs38--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  4c015e4fcee7eab2782f6be04acdb15c55986b98f6e1f4c0e23458461f76c84f  armv5-eabi--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2022.08-1.sha256
> -sha256  6230d9835894347f5c2b84e81d6d4825bb5315908a4ab50edd6270c8ba4477bf  armv5-eabi--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2022.08-1.sha256
> -sha256  fbc0db4138768433fc1704e2d7a82c7f527c82549c1562d09e12c154037a4f2c  armv5-eabi--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2022.08-1.sha256
> -sha256  74c4d7969e8c92b3ce848e957fc0aae3238eb826e0707692adf4993de5323a72  armv5-eabi--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  5072d99dc06123d197fc171d3dcfc15d7c1767dbcba0f0b95ed3b8de7fb78d2d  armv5-eabi--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2022.08-1.sha256
> -sha256  6a39098391ecaab84c090fb7aba02e595ea07d4916b687bc1e2a6731a4c60506  armv5-eabi--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  123e69824b789c752c980f36fb3923bb88baa23c05beff138c8fe119d3a2d1f3  armv6-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2022.08-1.sha256
> -sha256  474167bc7f97af44a73a1f96ed088d201a42645af2e99f7c9c57bf0d45966407  armv6-eabihf--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2022.08-1.sha256
> -sha256  f971220c45074a93ec52298917a30a93f541599c545c389618984e2b603ee34b  armv6-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2022.08-1.sha256
> -sha256  91cc2a45cccd9eb89b2737fbd4461c73bb589882d1a377408d0e3cefc24ca59a  armv6-eabihf--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  320df86444cced5d346f7bd5baa9b3cab04ffe5004feab16286ee7b25b14e2cf  armv6-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2022.08-1.sha256
> -sha256  80a3ca5009440e2a0924eea60f915c75f10067427fb0312591b0936a8146cec0  armv6-eabihf--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  7a3ceba0e5ed7ccb16da16e630a905c76c2ea58f66d161d6d45dce33321e70f6  armv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2022.08-1.sha256
> -sha256  64329b3e72350ceda65997368395a945ef83769013d82414dc5f2021c33f2d44  armv7-eabihf--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2022.08-1.sha256
> -sha256  9f9837426dc798d8bd70458b6eb1f7c8f278a5bba5a212462bd8672d61177d83  armv7-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2022.08-1.sha256
> -sha256  71f156ab45a9d9790d3b36ff970d9ce2e476e96b2ea94eb17aac632777e14eca  armv7-eabihf--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  01182a4fcdfcffe53bb2ade152e0bca40b36c1817c78cfb155306ae5250e0e7b  armv7-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2022.08-1.sha256
> -sha256  9e4191ab996fdf5f4e8de7e4617c67cbf46127ca2754fca0ad45d60e393ace05  armv7-eabihf--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  d5dff34e074b56a6132361415e8416c0efec583b2a001005d51ff54f2eaed4d4  armebv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2022.08-1.sha256
> -sha256  ba6916b3045cdbaa251673acf1585254b929b2ee641282ce0c4d694211489fb4  armebv7-eabihf--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2022.08-1.sha256
> -sha256  f33c5cdedb914e11f2c7c0095c476f410e0d1d231848b2efbac1cb53f0262625  armebv7-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2022.08-1.sha256
> -sha256  7cec24dbf74fed46d461cc92aae0147069f13f1fa55ec76b317c2d3fa8398570  armebv7-eabihf--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  e469ec0b72464c8722cf51c2ed09fc435815b72a4e82011843ecba75d99c30f7  armebv7-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2022.08-1.sha256
> -sha256  7f95f52d5a56f824269effc28cfbd9c8722de6d612899e888b5651c762a4d800  armebv7-eabihf--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  8eb72d7d9585b7305112d9c2ad3e6156b148f88acdf933381a414cb2c77ff797  armv7m--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2022.08-1.sha256
> -sha256  f6ae943fe56fbda046b27015e5b1bab6fc647b29f65d2d1720afc43ab36e876e  armv7m--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  cf4a2e56a0f325db586f80cef6bb252eff70d34981445e1bb77336fd03617df4  m68k-68xxx--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2022.08-1.sha256
> -sha256  885983f2c4273934018ade58b33863b43bf69d05a95342526b4ef4da7bdd7ab0  m68k-68xxx--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2021.11-1.sha256
> -sha256  0e6743d8679cfe197223e011a2e1e064a213f6032d2f4b0d922b9124fe981d84  m68k-coldfire--uclibc--bleeding-edge-2021.11-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2021.11-1.sha256
> -sha256  27ed1e76826a8824d72ef702d3a770544757a0d297c9992eb623012f1d9b387c  m68k-coldfire--uclibc--stable-2021.11-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  e0af9e5a647b432c22693c6a7e7114ecd5475007b2b17d10075d61509246d81d  microblazebe--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2022.08-1.sha256
> -sha256  1b73e8ef541ab0a43314ec8354368adfb333657f3ae3e2ef4cb966721db2d068  microblazebe--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2022.08-1.sha256
> -sha256  8a2570a5f490249a7a02afef62c00140e2eb3fa2cdf41e5897f484e41f5c55a1  microblazebe--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2022.08-1.sha256
> -sha256  90c26fedc85eba703e37e85036e284bb73475bb07d004ceedc27a4e64110ecad  microblazebe--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  44b04fb51396e84b51f395bf1f08176b759cc8a85080980c45653ff0bd8b3602  microblazebe--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2022.08-1.sha256
> -sha256  23189d4f0ec2a1de15d7e30e7d12327fe7c620b395b6e402b6be42c3ad148656  microblazebe--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  2371b597fad7ec6092e1417c21343cd78f59c0b68c189d77a306bfcebd1dda31  microblazeel--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2022.08-1.sha256
> -sha256  9507f13355a37ab0401c3225251d9760a0e40475243744b2e9bd5f11113ca8a0  microblazeel--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2022.08-1.sha256
> -sha256  b67eef1613e960df351a4600c845d6ac24c60a3b2362f195c4b69bf21f7874e0  microblazeel--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2022.08-1.sha256
> -sha256  44b767649a3d8a9546dd27c1b53aea8a3f106e99d9ae650e1746551c78f7cf8c  microblazeel--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  08e0a44f0beb4675745d25a1f98afa31a672caec5150da73a8b23038e931426e  microblazeel--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2022.08-1.sha256
> -sha256  70883813924f9a1756e08258d8c41e06bb6d4e9571fdb020b2097dd4823ffb9f  microblazeel--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  69f8608d78e295bc9c78a57f47d3f2aa1d74a8ee69307e1f112588dc08c29adc  mips32--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2022.08-1.sha256
> -sha256  27fdea806e3d02441ed034f500843b9137b34ec144cab9d2aeb991644f32af5b  mips32--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2022.08-1.sha256
> -sha256  190023be69fdedbcc758184cbd02e0e64df99c5d1d2f9330c239c97cdca4928e  mips32--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2022.08-1.sha256
> -sha256  5e971b1420f29c5c694a93591f7eda5048d7dc792bff6d2117b6f2866970fd5a  mips32--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  c937259732031ca4c640257774e80b0d6b42cc3e90e6677d6b3a014b0e3fd155  mips32--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2022.08-1.sha256
> -sha256  e670cf475c47dabac6e8fb4ffc0df5bb9c4ffeb55aeff55099ffd0b969e919ce  mips32--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  0984a478a526e943e22fbe979bd083acf34bcd99e1366c8aca11d4ed43af8b66  mips32el--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2022.08-1.sha256
> -sha256  8e5d9b8ba0b4f7add2001143ffd92718c037c27aa2cef64d79aa577e6b0bf2e1  mips32el--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2022.08-1.sha256
> -sha256  89b6b64b9839c506e38e5c57d01de0a15018a6d82c41cc3b001708725032ecba  mips32el--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2022.08-1.sha256
> -sha256  ca6ddc1ec4b053116f854767c04c49ebd3442e15ad6529eaeafa4fd0272021ff  mips32el--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  dd0d1144113a79aa32457d008302e11e354d949a63718f0984a5dbe185099275  mips32el--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2022.08-1.sha256
> -sha256  f20f373afdec0e36afefd0b1eec7dfb9609e110ef19feb40df7e37196a23ccbf  mips32el--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  dc6cee7db89c2263c8de0a8c902dabfed02186ccb9b6f643bf2b3fcaa6f694d3  mips32r5el--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2022.08-1.sha256
> -sha256  d7e14faebf10897799426c8579b9e01c3479a290bb6b30ef37a2b4e1fbe4e440  mips32r5el--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2022.08-1.sha256
> -sha256  d6aa828f18fddb4a4bdb78720ac1ecca76f0a0941d2fc3854a75a10ffe5069f3  mips32r5el--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2022.08-1.sha256
> -sha256  c29003698f82de6a6c5a3b4b4029e1a6f563d4417296941d84882f9e3cf4c573  mips32r5el--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  38fbc1b77e010723ef939ee52e6fc42adc0042139fe61f018c4b67767966e36f  mips32r5el--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2022.08-1.sha256
> -sha256  f04408f2903b0488392cc097062d0295d6d2d02000f09edfe63a33237a09695c  mips32r5el--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  be3eb28eff19cfe7471e92716cfce112eddb13a27322f7abd0987b3864b33776  mips32r6el--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2022.08-1.sha256
> -sha256  4c89db5c2548d1fda32c61f86399d5c53749becfb260e22776866b3b0343deed  mips32r6el--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2022.08-1.sha256
> -sha256  4f3312d85183c8ac83e793ec4f8788053215381edca1904b1286bc0eca0dab36  mips32r6el--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2022.08-1.sha256
> -sha256  46b7d074f395cf1264109b78053c944b54c580812999b017fee60ecf196efda6  mips32r6el--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  5adc9fffcca0e6ea08edccfc72ff5330ffd7949c0f236ff198f93afba29d308e  mips32r6el--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2022.08-1.sha256
> -sha256  03d90d509f745f29ad04ebc9ef29e38b8d015c25c5bb0d5e0ddd214a1d28b26d  mips32r6el--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  764aef21ef143613595595ed0ff81491636b2381b77ef082dbb4a2e2f17542a8  mips64-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2022.08-1.sha256
> -sha256  4bc1a70194be6d87502f403ab59d95bfeacbdc3903f8b45464734f7447301cd3  mips64-n32--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2022.08-1.sha256
> -sha256  f50358647c98c6b4eb373e732187e3b405402487b5e55d2ef63481d4a4ed017b  mips64-n32--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2022.08-1.sha256
> -sha256  fa77ef0623b92baf20405cee90d52c6d91e2daddfed0a89a28b781fd36a4279c  mips64-n32--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  f03f7070063921143cc01d9591b10abfa185617c71008adc2c7e059202d42c43  mips64-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2022.08-1.sha256
> -sha256  892f2e5912c48901e2c40df7eac1109d7fd02c6b2aa9b6c13d8659dae50e781f  mips64-n32--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  5c9e79402471f35401ac8737fdee39156f1db1e72f5c9c4c2b4fea988fbc0c72  mips64el-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2022.08-1.sha256
> -sha256  59e2fe9b268fdbd8b4bcba14574c1293171675249a0e6913e1525adee66a7b36  mips64el-n32--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2022.08-1.sha256
> -sha256  c6c76749c40d41a020bf0943bb5f3d67ad0a9a9994a4883c73c7302944f87814  mips64el-n32--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2022.08-1.sha256
> -sha256  6e0cd1b77c9333807fa575aff24a7274817840442f9cd32c653a70a07d3b5b55  mips64el-n32--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  b9c573bfbda5ba60bb80652879664cb0d515b179c9d06ca1321f506d26f7a7af  mips64el-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2022.08-1.sha256
> -sha256  850817e5d1f99c11dae52abdd35518b855382587ffd4345c44131d26b04d6dcd  mips64el-n32--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  a665beeacd598da7de8f4ae44b938fb374d4a301daeae99de14e67d3fd5696c0  mips64r6el-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2022.08-1.sha256
> -sha256  8a0f0a4fc4e1a09f20ec45005dcf6f074be416fa26838eb19831a47f00da6391  mips64r6el-n32--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2022.08-1.sha256
> -sha256  ed9b42fb60074f31664626796b1a47f9ec4b46a25dee78904dbda93613b50bae  mips64r6el-n32--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2022.08-1.sha256
> -sha256  03e4d97084f8f5cc7bb1452a862e1e3856b2a63b903779be0cda0577195603c0  mips64r6el-n32--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  e5aeb7b0bd9bbc5c283eeb28545f35f3fcec43e72ed9c7d0e8fa9fd112ec20eb  mips64r6el-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2022.08-1.sha256
> -sha256  7d523cea26e84487860de83556c10d790876c98f27d9e7987c1b1ecdcc4a43e7  mips64r6el-n32--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  bbb95de0b45d06429b9212682df0392f1c8255aaae9febeef586ed556c0cb537  nios2--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2022.08-1.sha256
> -sha256  bcc84bf3a37c1d19e4de21d0eee6848d9917b5cc6cba7e734ce2fffa4aefc2bd  nios2--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  69461f231e4d994a6b0fa6dc2e71610037f277d7bccb7b43acef43a3245bff7f  openrisc--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2022.08-1.sha256
> -sha256  e8122c2b52ed2ebf7b65384f9fe0782b95cb541702341ea73046165acc80cf4b  openrisc--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2022.08-1.sha256
> -sha256  562582da8b5a386624a7c18cbe0511f8f4bed206f2de7009e66b75214f56dd32  openrisc--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2022.08-1.sha256
> -sha256  cf2b57067d9621f0eb74622412e8ca3eaa85e98a2044e5974cfc573eeb6cc8f0  openrisc--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  b9125cb9d238100a4ab88795f55d5e92e5cd43e302d7f306dbad0e1900976892  openrisc--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2022.08-1.sha256
> -sha256  cdb6df4a341d8d30b005f8175fb79fdbb3fff08b363d83d2bf39bf216f22410f  openrisc--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  d21b08f39f6f6b038fb37e3c71130c8db86c76a060b4b9980efd083bcb9c2b21  powerpc-440fp--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2022.08-1.sha256
> -sha256  5d891f8fae87fcd0736e3250864bec3199a03bbce66c21a3b145e34de80c4c7a  powerpc-440fp--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2022.08-1.sha256
> -sha256  322acf83e10c951ac8fa1b7826d4d0ae041c1a9ad2c1df45ea9cadf5cbb76922  powerpc-440fp--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2022.08-1.sha256
> -sha256  60298c1c675467ccfef3d7021c7d16beff59c4bc10ff86b07b07ed9bc9342903  powerpc-440fp--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  dd3a795f3079d8f559bd81c5ea35b20355c0b2188a5d75c493f7a75da83fde6d  powerpc-440fp--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2022.08-1.sha256
> -sha256  61be67b9dc19e764791190d0cae4b23a620ccf9b1715e3e4700983a15ebdca49  powerpc-440fp--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  2b4feb8fe946c4571639590ad7972fccd860b153aa192826861f6a40ba46531f  powerpc-e300c3--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2022.08-1.sha256
> -sha256  f4fcbefcf0748198b0fed7b27a7f45023067b8550d1b29857e3de8b3e394d44e  powerpc-e300c3--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2022.08-1.sha256
> -sha256  6e8e152d4bc58891c9b93b98e2d4a15ab26f9ceee00725092c0f9c2aff4ed503  powerpc-e300c3--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2022.08-1.sha256
> -sha256  0c2418120d9b32faddb59570e18d700c5d17396e6287a368263b59eea1895f08  powerpc-e300c3--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  07a8e609ee1ab8b5aa4c8a2fa07a6c7a2ba47f387ef180e33f8b3972a976a138  powerpc-e300c3--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2022.08-1.sha256
> -sha256  a755ab1c79099e089aa238ff5dc012fea756076fb60f39fbf53d151985825eb1  powerpc-e300c3--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  e932a8f76e00140b246ea3a925f6eafc4921cb974b527336ec737be9f1b7ff31  powerpc-e500mc--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2022.08-1.sha256
> -sha256  fce8332a339732350350d06340003d450a7ba315cf8c03655be5377b953a843e  powerpc-e500mc--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2022.08-1.sha256
> -sha256  33600548051fae6e44fbf34fcf2116ab0c8dc8db79e51d2ed8ffe23baac04447  powerpc-e500mc--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2022.08-1.sha256
> -sha256  1c2fea3db1c5fb058b56739b2e716f8ce8e1e4a605e5a46c45abfcb1a36103ea  powerpc-e500mc--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  6d622a86574d29b1e84aadad1a1a58737c9b0068fcb8093739684ceea949b089  powerpc-e500mc--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2022.08-1.sha256
> -sha256  cd3c1a34d7825b268cf1a2aaa906aabcb6ea9a1cb3764efe5efad7d6d56567a4  powerpc-e500mc--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  d05d7d247d53b552fa3656384a4c4252a09aa3b58004854f315f2e576c833fe9  powerpc64-e5500--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2022.08-1.sha256
> -sha256  d754ce34ea8d028abed71672c92530a4d1839e4108323f2ff7d6e71d60e4f23a  powerpc64-e5500--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  f601c50d1d1eb6fc9d8162270c5fc631f86cc622d7d732100d2764a31a3a2c41  powerpc64-e6500--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2022.08-1.sha256
> -sha256  3327d4b9c27a51efa6f5128d2f582c8685df1a5a095a7fd316ab78573d9d13ec  powerpc64-e6500--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2022.08-1.sha256
> -sha256  ee6f75dfde53782763a9d39f8293f93b44e2e1685db967530c3b6011771337e3  powerpc64-e6500--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2022.08-1.sha256
> -sha256  66e358b0a46593f32aab0aa942f327787f3d99a55c3ff063001cabcc04deb85c  powerpc64-e6500--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  0cf79c59189f1c9e5b058986b5535b845c53d787a9879923b20ccd4b6561cc3c  powerpc64-power8--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2022.08-1.sha256
> -sha256  ece83b6b7ad026eb769d555264dc7565cb7c04f9742355a171882a1817e98b73  powerpc64-power8--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2022.08-1.sha256
> -sha256  3eade3adc05e3b09f7b65d31e724d37ceac7c81d78afecf3394a7ad0c84972b5  powerpc64-power8--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2022.08-1.sha256
> -sha256  5196955f9f4b46d12d8e0211ae64902a73bc491cfced31e2d85865bda5ed3443  powerpc64-power8--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  9882709003776bf8da785a30bbd1b75b64d9752ef70bface22ff6434be136682  powerpc64le-power8--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2022.08-1.sha256
> -sha256  37e404425c3d8176b3a19b5a2ae8b57460871f9aec4e6491ded638f5115f5081  powerpc64le-power8--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2022.08-1.sha256
> -sha256  9eb4ca911853d259228229490af9ae6eaf30d79b8d41a29f807cc27979cd9104  powerpc64le-power8--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2022.08-1.sha256
> -sha256  c1bce8d56c1b667a382eccc4a061d35add21a68d7479e9c62f8c35271d8c5f32  powerpc64le-power8--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  47a4b8365d5d772de4b4b1100a221421c5a3cb8ff09d366d4578df2c0cdf23bb  riscv32-ilp32d--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  a5ceafc2d1dbe2598ed9c8018f8f7108b7d5cb4847303842e924976a4cfe14be  riscv64-lp64d--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2022.08-1.sha256
> -sha256  556c860783c69f21d77be8b2856e7dd24f66b115775bb5ef6c8de5f4a6b1b861  riscv64-lp64d--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2022.08-1.sha256
> -sha256  3e8d0ac53b9188d46630fe8ade2794e05ae9a2636a45c60b89b62ac1a3f6e6c5  riscv64-lp64d--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2022.08-1.sha256
> -sha256  fd2d6b2ac2b2e02caabd9fa43b506dcc87eb1afbe475999180891a5e0208c436  riscv64-lp64d--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  8469a9c7ec50a401fc6466e81dc0d7032648c4e7f1b602afcf5ddab2ffabaac4  riscv64-lp64d--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2022.08-1.sha256
> -sha256  002e98d438519f62a2b2de42acac226051b1887a98523f02d54322275c3ffd25  riscv64-lp64d--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  295e281935dd22433d1a819a7a010356fdf6e19cea27631fdc884d3251c344a0  s390x-z13--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2022.08-1.sha256
> -sha256  965c7ab533e7e4812fc515badc595f0e4f79ab7986eef992889f6a1a225d4c19  s390x-z13--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  413703c54af9fdceb955a311f5db4f3fa34b4170dc5f12b99da3c464915bcbfa  sh-sh4--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2022.08-1.sha256
> -sha256  5084c4545a60bdec153bcef7dd52a824c3937c85686b223a6e92667d71850963  sh-sh4--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2022.08-1.sha256
> -sha256  243079028e9155c7dfcb1c67ae9bd42bfcb9d5a23f9e9078c9ca53613c5d607b  sh-sh4--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2022.08-1.sha256
> -sha256  46ad264d4074ca4ac0ab4acd244145e4820aef315a14bdd9a6e54e888c04b630  sh-sh4--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  7c7a009e0335396839ab1be8b7817084414792ef04aa25df4c178c9d2ec0aa13  sh-sh4--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2022.08-1.sha256
> -sha256  1b1c22ebf92664df828151eaec3c7fe9a6bb1c48fa177c85a62418ec627b2756  sh-sh4--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  5765af1f25bcc34e31561b7cf955dabae5a3fb1650148a60915cbb4ccd87e49a  sh-sh4aeb--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2022.08-1.sha256
> -sha256  47f9694a263af6e943acf59d8da9af34b6f9a562d67883f4298b4cc4469fdcff  sh-sh4aeb--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2022.08-1.sha256
> -sha256  fa519ec4e29701de84af63943c51c0f740620ce3577ae689d89c2a578ed425de  sh-sh4aeb--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2022.08-1.sha256
> -sha256  f3ca7d35bd5ce1b99dd1395b8f2a7c162b23a60eed6ae938cfa2fbd20d25a470  sh-sh4aeb--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  bb08735ffbb2c0e60bd5b1fa1d65fe44f7781a4c57872ede0797a9a495ed575e  sparc64--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2022.08-1.sha256
> -sha256  9c14934230a73f4ca99d4452dd0f24a033e3843fe2be28cb723f0d66635d4a4f  sparc64--glibc--stable-2022.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  62094460b853970dcba91cae4314bfd1210bb2963be540f7b69be882f5f795ba  aarch64--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2023.08-1.sha256
> +sha256  aed4223eadef27c1a84676333cbbdb75cbb5ee5a4a0cfc3ec5a491c6a6179de8  aarch64--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2023.08-1.sha256
> +sha256  6e3f69eb9b85d8672805220c7af10bc7a761eb67504931b092d840dc4e1afa90  aarch64--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2023.08-1.sha256
> +sha256  25767ae9ca70a76e9a71a13c6bc145532066a36d118d8f0ef14bd474784095ce  aarch64--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  7ca79cbebf0143d89734765b259b5b261a22ecd4cde37f8dda0a02a152f49296  aarch64--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2023.08-1.sha256
> +sha256  4c05602d75bc97a9acdcba3e94ed14d6452f176970a1e446bdb5a672fe2b77fb  aarch64--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  a1df95eb94350b77c32d84dc9a1730f541d29ce6679331ea6eebe803a28427c7  aarch64be--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2023.08-1.sha256
> +sha256  f03d955da294083b62505d7c0d0093fb289ab51377b8be980b537f8a3da6f34e  aarch64be--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2023.08-1.sha256
> +sha256  b2b30d563559664d0efc23eb00bc469c808bdfd400198967ba1255863301efc0  aarch64be--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2023.08-1.sha256
> +sha256  d24322115bffa3bde073a39149527cb212a9d07b2bc8cfad57145c13ec60ece5  aarch64be--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  8d3f1b453643a80331543688e08c2a979a83eef59f7a9db1ec9a4dab8fe868a5  aarch64be--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2023.08-1.sha256
> +sha256  6f92269995e4e028a3b0d7982827fcff415b56fae34a61d845775332f981061d  aarch64be--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  7129cef2a9c3c511c6c7f025cfe526be9d30150707e1e400780c611369b5ed02  arcle-750d--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2023.08-1.sha256
> +sha256  1e1ce3fb4eda609dc73df731a7192cf1fcaabade8ea65f9bce6d9e9be41633b9  arcle-750d--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  69e9c144a86931eba4b56873e8973f018d4edc2151aa8fdbefb4f2948a1af8f9  arcle-hs38--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2023.08-1.sha256
> +sha256  71a078574d1ab044a04b1e79d10af46a6334ad43d82ff4b76b5547d70b9ef4b7  arcle-hs38--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  ce56ea212cad7d23fd9544d60916808762c21a32b2492ca96e94b07d1762bbcd  arcle-hs38--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2023.08-1.sha256
> +sha256  b0835a1eda4c9a0b82fcfe053a7f879dbb2518fc9311229d015ac43354413479  arcle-hs38--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  79e017a9f7455a679eeb734c029cf17b32c62c30e85e39d48154645f2bef7f11  armv5-eabi--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.08-1.sha256
> +sha256  65eee9d2e60a2ad78a4bb852eaf1039f26ede6bb04292999b384b1cc0178ec58  armv5-eabi--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2023.08-1.sha256
> +sha256  7ad1405bb5407f890d1958abaab0c9ae47ab30c4120aed98d3ed88e9915c749d  armv5-eabi--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2023.08-1.sha256
> +sha256  15c5e09b21328e1a8bfa641fac208934b32bc2e4c1ebab9e9343ad59ed30e869  armv5-eabi--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  d7be53ed9bdf7c56c8cba39580d1528aad6fa4dd79d75a836adfe454b3cfd5ab  armv5-eabi--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2023.08-1.sha256
> +sha256  b8e4a8426819eb226d30facf93288855b7710165b5aecc2224b65936b64bc3ad  armv5-eabi--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  7d72017f0e8da2f9804ffe913d1e7a9b1fe8629c107354cb3c84bc08acf58f0b  armv6-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2023.08-1.sha256
> +sha256  fc2bc606081754dbfb8fbb955d66a9d07bce844777ba6501d2c31763a17cc86f  armv6-eabihf--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2023.08-1.sha256
> +sha256  23bb6e3ded0399604cb810d903f3d7bbdde13274575f8e91da094045044cd910  armv6-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2023.08-1.sha256
> +sha256  7f8a93f39d7470e5587c05e74780fcdcb49165fcaf7436ff4e4fe301a0ff3f93  armv6-eabihf--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  f06216aa73f8d02a34e09a3db79d3d34fbc31ecde7883896d497dbc10c60a636  armv6-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2023.08-1.sha256
> +sha256  f0f77ddb287d64a0ddcf07241dab9afeeda7cf02f0959e85f7048564c0b1bcff  armv6-eabihf--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  fe0b14d6c92ab939d47dcff1f39552aa299d9bbdf0a4571428c56daf69246e70  armv7-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2023.08-1.sha256
> +sha256  8b87e1694e3554260d31583d19201a5d420c4c0a903396aea2d29bbce104c8ec  armv7-eabihf--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2023.08-1.sha256
> +sha256  6422c3fe6cb66694a0c3384e39ffe352b3e69cf4035e64180765a23973bb00d1  armv7-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2023.08-1.sha256
> +sha256  4f06ed760d3b2e779f0d8aec73becd21edce9d04560d2fba53549ca8c12f51ba  armv7-eabihf--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  4a5b34842986fb0c2e08c67ecb2c35ddf9576ae0b575ae40ab7d887d4ef24a42  armv7-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2023.08-1.sha256
> +sha256  45b079fe0bb57ce5d8ae2d0e8d675b7abac7f5de58570a084df61a992224a961  armv7-eabihf--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  c70e70ae5ed56752ad55b5b989f385378d5a11e8f0e3e6ee88476db81c459ab0  armebv7-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2023.08-1.sha256
> +sha256  d762a7abeac58dad63f6beec5e867243259779124531c1d7507ea95b68e884d3  armebv7-eabihf--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2023.08-1.sha256
> +sha256  57aaad8d2d8f6b28d95132f7dff3963264d441155e06d4605c11a32e62e255a0  armebv7-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2023.08-1.sha256
> +sha256  c707a9ba4bedc4db3e23653038c17ee7ee55e1d8c8bb2cc14cf47d5c3dcc4b9d  armebv7-eabihf--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  bf69352181139d7c206841e5a3d6d671b75db42c6311e5ec6825d574317c637f  armebv7-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2023.08-1.sha256
> +sha256  8223fd5853298060e253b595615bedaa0c43a957d630133e99cd63c0d600e402  armebv7-eabihf--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  94583517119f1d02ca205787bda91252a7693a3c1895e34057fcb48b66115032  armv7m--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2023.08-1.sha256
> +sha256  e903697238d4c75595bf9ca112e2b09c3a1457f0142d39c5bab523650a327994  armv7m--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  61c7953c741113f30ff643fa846713c8b88bd2c4a91de26349e504d553e8ca9c  m68k-68xxx--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2023.08-1.sha256
> +sha256  e631e9fea5fad6db056e9028c17e41abca9f7bb6463950045756d040dfb34a6f  m68k-68xxx--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  59dc6c063a9e982042bbfde36b5cbe263b3130e6ee04df8b8503cfde0cbcc43d  m68k-coldfire--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2023.08-1.sha256
> +sha256  25d516ad069fd64f6d891606455cc9e5584b002a658e2dbbfbb1cdd2fa2cddd4  m68k-coldfire--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  52964e876701c8d8cceaf241720741b290b32cf3aeff04e5c0a9b2bb8867e00c  microblazebe--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2023.08-1.sha256
> +sha256  f83fe1e9788c43c502322d7b1dff57030718fd461b9df06d27ce69653b234489  microblazebe--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2023.08-1.sha256
> +sha256  66455c641d0d7dd61c01a9791d9225e4a02d9f33571993bdf53b07f5ce85d112  microblazebe--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2023.08-1.sha256
> +sha256  0605fcdc0b8be08a1737b73f090782b16c5f905996a14a2a587c99d3bf6a76b2  microblazebe--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  384f1b9573e9e187407b2b2afc88ca5161de866ef792928b856972bfb6abc3b3  microblazebe--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2023.08-1.sha256
> +sha256  8e432dd0fbc4c4ea0e64bd8bfa37c17cdcc4f6b1ccb6a78a68dc21bfc00590f1  microblazebe--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  5abe0a6cc448284bc0442b49e7266acf73cffe2c10e7c4472346c3a4ac810ce9  microblazeel--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2023.08-1.sha256
> +sha256  72f0efd879d97cbdfb2b362d2f1f7f53cfaf5254ebb4928e503e74f65ab578de  microblazeel--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2023.08-1.sha256
> +sha256  923616f2c14a571cc9257f81b9373a49b86997c6cbe8ecf5cd816527d04dd321  microblazeel--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2023.08-1.sha256
> +sha256  69cef52cf75cb9c1b127a3c7a657aef98d0c419188b3cbb1a3a79b61a7327b30  microblazeel--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  f9f41a97c6a3278d6d9c62280f40c13684addf31a29cc81813fa899ccd2aacc4  microblazeel--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2023.08-1.sha256
> +sha256  cccb9cd740adb524d144967d5bd2382a88b5f1c737c6dd38981c462dc86ea162  microblazeel--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  93a266be4d77df50112274830358160252c618217a28b5bdc1a2944e97e1bc9b  mips32--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2023.08-1.sha256
> +sha256  6b84446398d4c3241fdec0f8f4933b88df9b2c119845390a6d3afc76c092c750  mips32--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2023.08-1.sha256
> +sha256  4dbb260e89f95c851ccf29a729f15725112b361d9ab93ba4f732548c76bc6c39  mips32--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2023.08-1.sha256
> +sha256  4b7004efce6d23b4c90e2ac1e8ba98d835ea61b1c36adddf688efe891c75fe9b  mips32--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  b243c072465bee94cdac3af715eab513d07fc41fe067dc5d19cec0cb8acc53c8  mips32--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2023.08-1.sha256
> +sha256  dd5b0a4ae492e5023029cef073e43621c83d6b4858cda4cdf148b0e2e9ad468b  mips32--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  190300b5a7056f3b5cc5de1637fe8f52d74aad1b0335b2291c46341c6e4589e4  mips32el--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2023.08-1.sha256
> +sha256  5594d9f0ab8c14b4eed181c7a383399fadeb56b84e4fa5f22460dfaf68ab819e  mips32el--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2023.08-1.sha256
> +sha256  d267cbc5ecb9e22bab2edd95450ae314f7d75d2eac34574f8df87d5778d8ae07  mips32el--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2023.08-1.sha256
> +sha256  818b57f58b2b03b2246a561c1ec427bab87158cbb99e1ccce5c814774cdc791b  mips32el--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  5ba6bab76c827870f5da94cc125b77144e5e7abf2bbbea348ccebdb60084a857  mips32el--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2023.08-1.sha256
> +sha256  98ec0d45de93f531896f4273f206ff1fe10d87bd728d11945c5a9f8cfff3de16  mips32el--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  ddf0f8b760422ceebb1a797ae9e75001a77b8a67cb5ba8737e409d1a3491c9ae  mips32r5el--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2023.08-1.sha256
> +sha256  18127d0728f1200483ec6739357e4d19cc2df9de33f76bf70598b78b43ff2496  mips32r5el--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2023.08-1.sha256
> +sha256  7a8e20d4dfb7e75f4d1c032ebb0ee36aab321797ed21a2cc325ea819fd569c3b  mips32r5el--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2023.08-1.sha256
> +sha256  8b8e6b402ac3343d37e766907d4871512b1ffe3cd9079a3ca226eeba290d2a5d  mips32r5el--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  e0d320e1bb1c4d7f0f6724368cbd4f79868123e1b8cfd06ee14c2a20d69484ff  mips32r5el--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2023.08-1.sha256
> +sha256  883d72f17f040410b9ff05aaee6cf6ccda46ae2e99fe9ffbc03a72f0a4789096  mips32r5el--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  4924db22355c9f797dc6776b426ce72618a1803b225370519e7dfe44c2957094  mips32r6el--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2023.08-1.sha256
> +sha256  2f4b44733eb26884a4d941dcd5f5ea88f7b17f8b1b68cf799e047a55ab7b7e65  mips32r6el--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2023.08-1.sha256
> +sha256  1a3c850dd6619791ca32042e3b3f52f25e33c8b050a6f102efb2a3568a63a43f  mips32r6el--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2023.08-1.sha256
> +sha256  ec544f499dc7f1713f09c2424844228183cf68ff77061bc6c65821855a7228cd  mips32r6el--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  9e046c31cd9d59fb7126693644a722cd9141381ddeda69a7c8e648aa65037c41  mips32r6el--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2023.08-1.sha256
> +sha256  901d78b12dcab01006616ccc8797d593c53d361752b4cd04791495a3470dfe12  mips32r6el--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  94a2afea880a378a82c3f146671ad9b86f6e05bb13f97573d26c9214adb5b064  mips64-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2023.08-1.sha256
> +sha256  83f673bebab7df55324362f97a483490a27199faf336780866d2de84b9f76895  mips64-n32--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2023.08-1.sha256
> +sha256  178b2702d652bffd8d8f7ca7e0a756ce044485b7e26f29db47d19c9a3b700869  mips64-n32--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2023.08-1.sha256
> +sha256  49fb59b0ce83ce0f60fda437c43f107519f538aadaf0c029f65c32f279852a6e  mips64-n32--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  6d3825d31c0f91f0d319517ebbf67bb9c44d779224ebd8e90e88c9a7d75bc07b  mips64-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2023.08-1.sha256
> +sha256  b2d87b8d501570fc07e19d6fd78d41c7be891c64cb9565c827eaa4b16a4212ae  mips64-n32--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  d7ed3131fc1eab9dde7a242652043756caa09848f7c63cb283f79f42e38ffdab  mips64el-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2023.08-1.sha256
> +sha256  d23f56b610be40774f41af5b96cffdd8dd35b983a0e5ed42b2a1a88ddafce6c9  mips64el-n32--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2023.08-1.sha256
> +sha256  f1d63dfa8615d6ffec4d66751e483623de0ccdf1fdb70d1981104457ba5cf4ff  mips64el-n32--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2023.08-1.sha256
> +sha256  2a558c0665497bb7976d02a3fd5c1e7b8a61c753373cebbef799b1aae2e7d307  mips64el-n32--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  25599336b65c1d0ede5d02b128bac0f4d3b21ec5d21c260c702849e94317adfc  mips64el-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2023.08-1.sha256
> +sha256  220d8dbbd81d71cb4d6345757ea78ab03a263bf664bc7a1732450da3555c18b1  mips64el-n32--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  09d36c965e88e413604820c53118f999ad0552422e15c27d34b0ef182c620c89  mips64r6el-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2023.08-1.sha256
> +sha256  ef65c7717cd1560c08097f669244515b8261e5f4df4cda1780c507f43b98ada7  mips64r6el-n32--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2023.08-1.sha256
> +sha256  b6d673e2e742dda1e2865759737419781190df06f57db4d6a3945dd4be161bd9  mips64r6el-n32--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2023.08-1.sha256
> +sha256  cd879a9cba5ebb5ad1e5ea93dc0465661a38af8a5b968c06043ce259f612f903  mips64r6el-n32--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  46471513a3ed2fe2b5f18e27d6f314d50b2799e85714ee2610276c01caeb3580  mips64r6el-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2023.08-1.sha256
> +sha256  c6525bb93fcac16a354e039abd47ebdd33c379a364c812bab3b8dd69ab27dcb2  mips64r6el-n32--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  b4278214069a381ac8979e0d957ca6a122b92e54bf3d443845ae421f96259b59  nios2--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2023.08-1.sha256
> +sha256  427c9c52209927883865b74d0c1310b47148013832069359da6d9fd23654b2be  nios2--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  6d94154ffcce33d0f24fc7bf0a0ac3dcf794aecabc42d126e8fca772d55dcec3  openrisc--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2023.08-1.sha256
> +sha256  bae2a29dcff4606c40766da9cae88be0846b5bdc870e83e282ffde1f93be1c1b  openrisc--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2023.08-1.sha256
> +sha256  c663809a5f5ec6c23eefd85f0eb0b341d3ca5b782adb243c16ab3cd6ef3db93d  openrisc--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2023.08-1.sha256
> +sha256  88fd3eb838a2527980aba33403c7654b156665aafe825a4f86f1af2007277e15  openrisc--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  6fd48b14f900ef94cb7763eef9e2a4cd5f55a02591050be9bf7286fb53f7a073  openrisc--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2023.08-1.sha256
> +sha256  6857723b0fc53465d2d2a7a32efc694443dd0a1ba4d1abebc5b9d2f7a9389b76  openrisc--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  860e79fd5e3e65094e26af8c08273b5cb25b416ed33d95f0d30ce01751c61bc6  powerpc-440fp--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2023.08-1.sha256
> +sha256  e8b0ecf725c48794f8fa33b05725cbb8f988b364c66a371c414c6cf0118669f4  powerpc-440fp--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2023.08-1.sha256
> +sha256  bb55c1a0b4cce5ea40b6fbbd81259bb295c31e71e150dfd4df8f27add4fd75fb  powerpc-440fp--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2023.08-1.sha256
> +sha256  c95aafaf7257a9ba125d2ff7a126c5f31123db45c200a63549e13b17526e091f  powerpc-440fp--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  ca1f56e00b2b4163fb82a011e1ca9d7d2463332aa483321b850395cb8f8686fd  powerpc-440fp--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2023.08-1.sha256
> +sha256  94f5cdc6aed04d46d8bec86e7109b8195c0f8d373478724f9af2bedeac57543d  powerpc-440fp--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  6fa51b33d4ee181f82179e56c410e752dddc809dd2dac748686d1a414ae4dfb1  powerpc-e300c3--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2023.08-1.sha256
> +sha256  c997956cb53d65491557aeca2fcff951348b12d07764057d4942d58accad4925  powerpc-e300c3--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2023.08-1.sha256
> +sha256  f158d1d49b1578ce36261a26d82e221937e2c11575bb25133e69fd3dfc43a8d9  powerpc-e300c3--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2023.08-1.sha256
> +sha256  49bf91af733b5efc107f8d1764959feeb5de0fa10b3f80e60cbb167aaef3d1ab  powerpc-e300c3--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  b4b0d05b9b81be8ab0b0bfc2aae08aeb7adf1c9dbf9f78a7311c5caf30f03869  powerpc-e300c3--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2023.08-1.sha256
> +sha256  75acfa5021ba296b069aa787cf3cf84c950eaff87e201494dea530bf4d503556  powerpc-e300c3--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  ca322217020237d0c728119654337857e2643ae848f808eb575a2223f191f89b  powerpc-e500mc--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2023.08-1.sha256
> +sha256  7c767173e9d96c11927be890fd34052873406c5c707ac031aaf5c6f956c2fee9  powerpc-e500mc--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2023.08-1.sha256
> +sha256  a47518b65c9d866b7d61b1382149b7c63da1a5166e3291096b34cb6407f5382d  powerpc-e500mc--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2023.08-1.sha256
> +sha256  b65e2912928838d6bee32a724bf25a53810ee2dfcff2954702057d2f9fce3f72  powerpc-e500mc--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  4281a38e79f2a32dcb9b51f379c78ca98cd982d4272449a9c7a4890d8402f7c2  powerpc-e500mc--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2023.08-1.sha256
> +sha256  4a37d3dd4eee82fcc5d2d0fcf71831d8efca601abfee236c49a5a7bd064d27f4  powerpc-e500mc--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  2e6b3d79ddd8de8a4e99b39dbf9990deacf1c2b6114d1686f49cbcfd949f229c  powerpc64-e5500--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2023.08-1.sha256
> +sha256  f3094cb9cc065c36ae6407c80002dc22b996c895ce74261902e5a3e5bca12579  powerpc64-e5500--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  7761a61fc413683f1190275ef6d7438351da133bbfaaa83af336432ec2b2a0a4  powerpc64-e6500--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2023.08-1.sha256
> +sha256  e95b5afc2cbb7b510009e552477e20c806262615a85e03d0e89330574eab7330  powerpc64-e6500--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2023.08-1.sha256
> +sha256  18572cbbfd25426666594c1f4758beb57983e457487bcf0036b57e31b92d41bd  powerpc64-e6500--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2023.08-1.sha256
> +sha256  596b2369457e6155420d97c3d67646eb94e5cace277aa943010cd1bc29191322  powerpc64-e6500--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  7af62a63e0e9ebec8d020f017e8053c44e9c3bbdb418de5b1a7a6bf6b6ebb958  powerpc64-power8--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2023.08-1.sha256
> +sha256  ee974fe55cd465145efb0ffe01e64f9488bf4d4c3d6abe17c74b4822e8158415  powerpc64-power8--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2023.08-1.sha256
> +sha256  680c70daafe2f19a450d5a64694f758407abc71cfeaa385c7bb8af428ef0d11a  powerpc64-power8--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2023.08-1.sha256
> +sha256  c1116ad8c2c34ab964fee09e2cb95537701ec65f11b40ea8da08ba9140928af5  powerpc64-power8--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  6b0f83a79375774eeff1c67de6b22610833be9f4ef75535368f2c6d1e14ec4ca  powerpc64le-power8--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2023.08-1.sha256
> +sha256  b9ed7a538472df2c727f8133ccd8166f5ea26fbd09ec0729b577c89ced0a87c4  powerpc64le-power8--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2023.08-1.sha256
> +sha256  69dd5562fe86154a7d749bd414949cbca5e9e6eda370cb4188de5493b682431f  powerpc64le-power8--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2023.08-1.sha256
> +sha256  f01de6d7ea263e1343b771b95a9b8848c767be45d43e10550c3d23a15e749d83  powerpc64le-power8--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  b5a674b07be757639885bde165244ab85c26db2d7e39284d897175701f6f16c3  riscv32-ilp32d--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  9eda527aea5ce7da27957c3b8e4adb65430be046b713dca25432a09cb6675976  riscv64-lp64d--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2023.08-1.sha256
> +sha256  97d7f95ced5852e3fa0119fd5370356df0b652844a76ad9a1c88caa8dd09f367  riscv64-lp64d--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2023.08-1.sha256
> +sha256  3687ddfbc6d4008e6b5fa2533a6e651d6db7281014917de8d2200b320f440633  riscv64-lp64d--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2023.08-1.sha256
> +sha256  09e2fa682043c4ac6378887468085a333d07734edac2b784ade2aacc0a815bb3  riscv64-lp64d--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  612ddd98eacb4bd1e575c3376bbc709e16d4617b49789f8b9663eaa1e13799b6  riscv64-lp64d--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2023.08-1.sha256
> +sha256  47830bb06baaf351735729672a3b866c123ef6ad6151869a1fc0135396e7a360  riscv64-lp64d--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  38edb78e044ce8c47214452084d5ce38c8b94a2484b296972a764da701ca738a  s390x-z13--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2023.08-1.sha256
> +sha256  a31927e8331f986ee753edbb931495d03ff00290e5b61618b1e897ed980481b9  s390x-z13--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  11da1e48d2a7aebfd0f0280d830bd98423620afc82a7bd62671333661e9cb438  sh-sh4--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2023.08-1.sha256
> +sha256  91f6eeb80d4ceb5ee49221708e543a0d312a7e16d7b9bdd47db48098a034b17d  sh-sh4--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2023.08-1.sha256
> +sha256  cff9a006550ca7f6d5e71b10043b2ade1d379ad5859202f7ff9dc460348c7f82  sh-sh4--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2023.08-1.sha256
> +sha256  e76eee2ac9b04926d0cd8699c11abe09194e235117985fa6f65b16221889823f  sh-sh4--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  0b8b94a26d66168173797d212fc8a5da0c8d239607208661201c413c61056c00  sh-sh4--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2023.08-1.sha256
> +sha256  d08f583f45f61c72c187754a330d82d4ac9f81a91c998820663d884363a27877  sh-sh4--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  32efc818e2a09ae5af5756c3fac89832743b6f03ad7414c5f6c6abb238cbcc64  sh-sh4aeb--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2023.08-1.sha256
> +sha256  4b5f36bcb32a23b40c04117b549fc571c0f1b40ae29c7a69a78e9d014efb55ea  sh-sh4aeb--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2023.08-1.sha256
> +sha256  16f82d8ce61fe30b26ad75e716418c57d8669d7a7fbc63a131f8be00ba7ec305  sh-sh4aeb--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2023.08-1.sha256
> +sha256  2f4af8a25bd24888149f5772413c3f8ce1ee40a16b2a4aec5fc4b4382d021d4f  sh-sh4aeb--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  8c29c6f65204a2940012384b769fb5d5848498c47d243a9accf530fe74665dc2  sparc64--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2023.08-1.sha256
> +sha256  643acebd4fd6ed1b1ee8dfcb6ab3066e4f2c42aee7754ebea7825ecfeabf32ed  sparc64--glibc--stable-2023.08-1.tar.bz2
>  # From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2022.08-2.sha256
>  sha256  ccd4110fa574d2323f038394c0603245384002fbe906204db36fe200c9c8f886  sparcv8--uclibc--bleeding-edge-2022.08-2.tar.bz2
>  # From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2022.08-1.sha256
>  sha256  da3b9f0a936401cbd3cc305b86d3611531391354cc0226a0eeb3ce4ddcc7b7dc  sparcv8--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  9a09ac03001ef2a6cab391cc658fc2a32730b6a8f25614e97a91b9a79537fe33  x86-64--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2022.08-1.sha256
> -sha256  861c1e8ad0a66e4c28e7a1f8319d68080ab0ff8d16a765e65540f1957203a190  x86-64--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2022.08-1.sha256
> -sha256  18149a2d69d1cd392536a97f53d6a02b90887c7e8b86db871b80396d46b9142d  x86-64--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2022.08-1.sha256
> -sha256  6a47708f72d2c01721e31907ceb524b7980764d3546b9aca4a6804f6d8db2676  x86-64--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  ef40c02af986bb3e4d14c76a3bc60285f5249d0676fb01400081f87b2414438b  x86-64--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2022.08-1.sha256
> -sha256  d4fbec618e17a70521c0b6339c9889f298b9806ee342e29ffe05ac76ee87c83c  x86-64--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  7ac996b2ca1acdcdaddce38a3fd19bc30b864f6b73f8e6d0537243e912b5d36f  x86-64-v2--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2022.08-1.sha256
> -sha256  4313a04996173bd79935ffaec48b97ba7c32332880774ec61b40ab76804b8fbb  x86-64-v2--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2022.08-1.sha256
> -sha256  83c57b50ba00555c4e2d7fdfa700b69032f06bfe743b5022a69036b0f18fbfdf  x86-64-v2--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2022.08-1.sha256
> -sha256  a76ebe570be5e74875d8f0b82aba3ad055679e734af5c6bdac036ef5f7c7b6fd  x86-64-v2--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  ab395da0c3d64a8a7121f640d16c8e79d4c187dbd866b42e4456f8c26eeadf4a  x86-64-v2--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2022.08-1.sha256
> -sha256  f64742f3c5cfdde7e068c3694e86d9df1b5a5ad8e4b0c9542c1e7de55951459a  x86-64-v2--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  40196066dcd7b6d52b956de823f7840fcae76207030d885bb4d07b692505f71f  x86-64-v3--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2022.08-1.sha256
> -sha256  97e43a5e7059a6262278795a102c6b0a2895731ba6aba8125ccd8a354cc68216  x86-64-v3--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2022.08-1.sha256
> -sha256  6a26d96022edde94de3b2ec9b414b2865cb99430b0eef4b3f263b0f0713875ac  x86-64-v3--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2022.08-1.sha256
> -sha256  082b698fdf995806a4b94c30c7a3c90755747a5cbd73e5f89423052063c7b562  x86-64-v3--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  1102391f5c03c335f7a27d2bf67818f67b675768c9e4fb1beb826624cc468033  x86-64-v3--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2022.08-1.sha256
> -sha256  c9f0fb4ea32d5d878ef8b719b750904ad4779a01c54a186a05f0e15f5257a653  x86-64-v3--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  95d25e92e4b4d1b93da6667e61615457d2086efa2ea9f1fbd73404bcad1f3456  x86-64-v4--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2022.08-1.sha256
> -sha256  93b31a24c7ec8b1d4fc8343edf506b78e2b15d017e7436bf28be4e888af183a1  x86-64-v4--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2022.08-1.sha256
> -sha256  e67339ac587bc8815a2ee7fa2e74240ffacae75c26a785d4f3404766c550e15a  x86-64-v4--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2022.08-1.sha256
> -sha256  d20b1866f77a9ea4789404610859ea08e76803bbfca3d92627c9a7ae036eb13f  x86-64-v4--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  4c0ae459a70134fe61b0cb32bfb94e61504efd3e8860cc265dfb3043ec140929  x86-64-v4--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2022.08-1.sha256
> -sha256  bec5542fe02be69e4ef8d0722d3c920b64a06206adc580434f2d0088eaa9effa  x86-64-v4--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  995dcaf678cf37b193be86ce6733c0402129fc22eee6a45f76acb86deb8c481d  x86-64-core-i7--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2022.08-1.sha256
> -sha256  7a31f72e6dc378eac8a97b0915b3619ba95c79f73046d052539c44f91bee9a02  x86-64-core-i7--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2022.08-1.sha256
> -sha256  2ff43343f39f99a238502293b6ce20b0324f850c1b606ad4772d7d54f2b73206  x86-64-core-i7--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2022.08-1.sha256
> -sha256  fbfdf31724e24a19af4f83e3a9bc766f8fc455f4c4e912401aec1e81f2e71b4c  x86-64-core-i7--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  86e9c65eebf909f7deae7d75ef3af4fc6bcee51ef21c92f0ed6fa1ae7206ae50  x86-64-core-i7--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2022.08-1.sha256
> -sha256  cc06ac611d1930a4a87016adfabade8b3bba5ce6ed743a60059fee9d70634de5  x86-64-core-i7--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  3c828987dcd4be469dce355d44e0c42166ab9d939a99b8f1d1463b769f6ecbea  x86-core2--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2022.08-1.sha256
> -sha256  5bff24ea3e83207e91cae12ca5929da823f3caf2a035ed4995658a5b7b571ecb  x86-core2--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2022.08-1.sha256
> -sha256  75b83133ba59c87bd060cd8f516df9685eaa70a7bda544447630c2c0b94dd1fb  x86-core2--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2022.08-1.sha256
> -sha256  61ee5639fa9fb5b454bd675061b539c51615b4e95c7939ca5ef4d46f4e9d8b31  x86-core2--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  5107c9a89a2162393c95d9aa63ea1c85892ea9cb1393556110af844f147f8bad  x86-core2--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2022.08-1.sha256
> -sha256  ce9bed3cc5d21f3b12b7780783b32498beae186e0693f57884d0cffff13d445f  x86-core2--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2022.08-1.sha256
> -sha256  6eda31bf8c4504f322e1e2689beb7172f831400061168a03c0c16956a777a806  x86-i686--glibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2022.08-1.sha256
> -sha256  6364eb674e5594947cc658bd7ff4928624eb03a20469395a0be93761a804723b  x86-i686--glibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2022.08-1.sha256
> -sha256  fd94a3905991bab90e5474e7407e6b593222e44947e70e9d0061f393ab420b0d  x86-i686--musl--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2022.08-1.sha256
> -sha256  7cc2a015e12ac0ae1bd2050e9078fbe87241de2e30ecd4b789ba494b08b3382a  x86-i686--musl--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  c61f6090e96813417880150b8c89ad34502c74e5b69b640701e98378441d9cfc  x86-i686--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2022.08-1.sha256
> -sha256  a35b1f2d4ef5ce829d2211efb4735196c0c7dcb451d5d40089c126e8b8e6c02e  x86-i686--uclibc--stable-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2022.08-1.sha256
> -sha256  a822972e8865b4bc9ad1a077c38fbe095c89ea018364411240da1183fcf7c2ad  xtensa-lx60--uclibc--bleeding-edge-2022.08-1.tar.bz2
> -# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2022.08-1.sha256
> -sha256  35df9b38a5b424cc7d18dd7d382a7962c813dcd19b0c6e9887e3fbb4e3a6d44d  xtensa-lx60--uclibc--stable-2022.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  e896274d4c540a45da02c1a167264116314b5e3afd298b79f28554b0f4eb498d  x86-64--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2023.08-1.sha256
> +sha256  d6eca7f1ea736ef6f868a027a9d0baa875f9513755026aed2badc04a2b9cd7bd  x86-64--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2023.08-1.sha256
> +sha256  cdef47dd21b099c0b3d97e89ce2a2eb3939e6021ca8f77b8adb0f7ae36f01dc4  x86-64--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2023.08-1.sha256
> +sha256  e07d11f32a7552bd5155530333d7b3ac9ef5627e10072fd05fbc093cd1f88c50  x86-64--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  8f35f75ce07f76a776dc08fa4b5f36bb0295c62aa70db0b4eca51a99a80b3bba  x86-64--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2023.08-1.sha256
> +sha256  cd6ead4a50380fa3346d1d20697f9ad4f3ca93f52d9e5c4000d06f340d766580  x86-64--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  dbb470879dff87a6a99f6736959f5b38f6cce665b1f9c56c1c6450663c0f07de  x86-64-v2--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2023.08-1.sha256
> +sha256  fd5a2031e1ef2d01de8ba26ce7c445ba7c7fd9ddae9507dfdde8a784d32c7bb7  x86-64-v2--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2023.08-1.sha256
> +sha256  0fca4c4eb07abd94535a961304af89a9a0e805f7f208b51d806e8ff1817e9f01  x86-64-v2--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2023.08-1.sha256
> +sha256  dcb7044492f51a5bc7920b78f377d37b48dedb9082cc38c6d6ad4058373f2616  x86-64-v2--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  8fa29561f0b783c88a9929cd909fdc86ca4430656c6a7887ac412fbc38892b02  x86-64-v2--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2023.08-1.sha256
> +sha256  8c412f719f30ce1ea1f7123cdbc72a432e46d47596fb55c35d6db64e571e3c05  x86-64-v2--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  8c2a9de04b56a33ca55190e4479d5ebea17e853fd1ad38eb4750868f2bf459ee  x86-64-v3--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2023.08-1.sha256
> +sha256  fc3be4d3e6f04f48c11cd33689b9fad37af2c7b23ffc23bc2d72108b012e9b81  x86-64-v3--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2023.08-1.sha256
> +sha256  ee3c55397a4dacb12ce8dad82e9e1da6aec3014458385665892524125882a82c  x86-64-v3--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2023.08-1.sha256
> +sha256  b714633981e49954f0164795508710183ddfeb471c748328e5088809ca3cc588  x86-64-v3--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  1954fdc6a49d0f5c784fa270269c908138518106b4e445d0961fe245b9f408a9  x86-64-v3--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2023.08-1.sha256
> +sha256  addce3971dd028ea8772e3f683d2b65e5703de1279d4f5d0c82269570dfb98c2  x86-64-v3--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  59cc1a8d860fd63a597efa863a47dfdecb489723678dfee6386e0970fb556693  x86-64-v4--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2023.08-1.sha256
> +sha256  48e8c2095b065a658f55a19ecf2e3c15533b5e8d4d3b7cf1676305c6b660a135  x86-64-v4--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2023.08-1.sha256
> +sha256  03ad7a76121551bce3645835286c43d75e73d397f715fb41e60635f9139711f2  x86-64-v4--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2023.08-1.sha256
> +sha256  e8c74dfe36a4e6c79808d7fe10ddcee546fdbdcb2994bd60bfbf8e6a14ab7abd  x86-64-v4--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  6220868a0f3ba104a21eb6bdecaed30fb5e625a39899abd753b1d60ef3204196  x86-64-v4--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2023.08-1.sha256
> +sha256  1cddc357e6af9f10814e628b92acdb3142a305f5050541eeb82463060295bc63  x86-64-v4--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  64aa0e9a7face18330aee47f4314229c10c559fea9d0ff4ccf0f8a5dbee81b94  x86-64-core-i7--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2023.08-1.sha256
> +sha256  78360790108be258bd5f9d4a0dfbc7fc51159cff9943d25b2bf40db0b6530593  x86-64-core-i7--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2023.08-1.sha256
> +sha256  4c49c759c7371330df3e83a28f9428a832455c9efab8450b30d124e766815ebc  x86-64-core-i7--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2023.08-1.sha256
> +sha256  7e16c0e6f2924e0c57c3c7f7ebe48af42f97bab77978fbe72dbee49eddbbdc73  x86-64-core-i7--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  3a2aabaf3287f2c2149809cd4bfa335730edfaed13a93dcc3a3550d7a00e09d1  x86-64-core-i7--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2023.08-1.sha256
> +sha256  4fd2aa823492307e840152cc5d0b56dac22b2891975c465a83e14cb42bc0caa1  x86-64-core-i7--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  4c6fa3c7f43ae68f7bff28f609176e8cd06985dd90582c27e81b2ed5f0a69dd4  x86-core2--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2023.08-1.sha256
> +sha256  63a868a1813f67a1f54c6213fe2514e7f5c94bf440cff7941442e5ebe3aa0a8b  x86-core2--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2023.08-1.sha256
> +sha256  1d2c421fe9f2f4fb8fffb427264c7be39b9fcba1e4cb56486a6676082f07dbe3  x86-core2--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2023.08-1.sha256
> +sha256  74a544e52bebd8bd1aeb30838bc59c86dc220648f324a7a7b61d2cdea8fdae50  x86-core2--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  21efd75d421e72d5612b4f8b7a1daa649e5fa78c73ad47ec55629df5d486a137  x86-core2--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2023.08-1.sha256
> +sha256  f161582dda7a8d4cd8fabb728dda0844f70aa0008d94be1b91d012a0a7966315  x86-core2--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2023.08-1.sha256
> +sha256  97041d43941afefc4b950623be6a364434adc6a31f5a506ea578c9530a6e0f04  x86-i686--glibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2023.08-1.sha256
> +sha256  bba2e990fa8cd6a156c0a4acd909e9f8265708772f2b2c438fe2c294bdbae313  x86-i686--glibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2023.08-1.sha256
> +sha256  f2efb6b34c5b04940163fa2c91b9fcc9f76c5a5532bca2f44279fd318f460123  x86-i686--musl--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2023.08-1.sha256
> +sha256  5109b0d57432800a34a402cea789993f0670cfeda5f174b61e0bc19c69e98078  x86-i686--musl--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  2222e4ef0e26185c4c6f39d08eacb4ce3a1dab3e0dbc09d37708d72d5df39417  x86-i686--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2023.08-1.sha256
> +sha256  294d84dbc6043e17a2e357b2a1377b2b57039dffd6d766a2851adec7d2d5da21  x86-i686--uclibc--stable-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2023.08-1.sha256
> +sha256  79b002a8d1d6dee72c75a336e0fb3b07cdf4cd373de842e5f3f6c67e502f9c94  xtensa-lx60--uclibc--bleeding-edge-2023.08-1.tar.bz2
> +# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2023.08-1.sha256
> +sha256  f9f8d55ef6c29c69174084f05310cd69a1cb3626831e5c806f30d9b5a842a35a  xtensa-lx60--uclibc--stable-2023.08-1.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> index 230552af71..6f4be09793 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
> @@ -7,967 +7,979 @@
>  # This file was auto-generated by support/scripts/gen-bootlin-toolchains
>  # Do not edit
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE),y)
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
> +TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
>  endif
> @@ -985,265 +997,265 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
> -TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
> +TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
>  TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
>  endif
> -- 
> 2.41.0
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
