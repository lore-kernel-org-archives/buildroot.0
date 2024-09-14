Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E983C021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34BD781155;
	Sat, 14 Sep 2024 19:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqhGex61yx4c; Sat, 14 Sep 2024 19:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BFEA8113A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BFEA8113A;
	Sat, 14 Sep 2024 19:56:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B012A1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE016073A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGQ_KkqsRGBa for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 977F760701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977F760701
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 977F760701
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:56:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E8B7AB00573;
 Sat, 14 Sep 2024 21:56:44 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60652])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Sep 2024 21:56:44 +0200
MIME-Version: 1.0
Date: Sat, 14 Sep 2024 21:56:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20240909125804.64690-2-vjardin@free.fr>
References: <20240828102106.55640-2-vjardin@free.fr>
 <20240909125804.64690-1-vjardin@free.fr>
 <20240909125804.64690-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <33f4749e4084bc4015a6c35d5edec68c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726343807;
 bh=rX8EgF+JPO/Kg+Ikm5mDAWEHu01ntsO7KPIRn3OxtwM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cn8snOP4NRp60c5lhX7vgQzNPfGsmSTU09OM/bv6tZdEr7f7gbzLtXAOhW1MtKmQa
 BR828wrOk3QviBOsrUc9EhoybODe6ButJKU0jEvTDfYg7epOgzHA1mDnoZmrlOWcwP
 cnyBDnhd0u2J2H++Wa1EcoGoFDehR+Yd6ijT36+kKTWAjb/HTHm8bhB7ycNPPvjxiE
 hgZKIe7M3GwXb+hnRWBBskVY9zM/5BM32O2j1Cuzh4DffWBQw+Mt1HX7Xa1V0c96vO
 zuZ8Tj9YE5++xKikmw9pX3DGMudmwlEDwwvQWk4ddfj10Br2zc5rkvTWPw2dUzQwWb
 YCVB010g92KWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cn8snOP4
Subject: Re: [Buildroot] [PATCH v5 1/1] package/dpdk: add 24.07
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Thanks for the updated patch.

I confirm this patch successfully pass the "utils/test-pkg -a -p dpdk"
command (no build failures).

I have also one last comment, see below.

On 09/09/2024 14:58, Vincent Jardin wrote:
> This commit adds the integration of the Data Plane Development Kit 
> (DPDK),
> a suite of libraries and drivers designed for high-performance packet
> processing from the user space. DPDK enables direct packet steering 
> from
> some network interfaces to the userland, bypassing the Linux kernel
> network stack. This is achieved through userland PCI drivers or by
> leveraging some userland memory mappings of the network devices.
> 
> Originally inspired by RDMA (Remote Direct Memory Access) concepts, 
> DPDK
> has been adapted to work with PCI devices that do not inherently 
> support
> RDMA. This adaptation allows for low-latency, high-throughput data
> processing by minimizing the overhead typically associated with
> kernel-space network drivers.
> 
> Importantly, this commit does not enforce the use of UIO or VFIO
> kernel frameworks, as DPDK's architecture supports userland memory
> mappings that do not require these technologies. By maintaining this
> flexibility, DPDK can operate with a broader range of hardware and
> software configurations, making it suitable for diverse Buildroot's
> deployment scenarios.
> 
> Yocto patch imported from:
>   
> https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> 
> The patch that fixes DPDK's meson for building properly for aarch64 was
> suggested by Julien. It clearly points that DPDK's meson shall need a
> proper set of fixes in order to properly cross-compile for aarch64,
> riscv64 or ppc64. So for the time being, only the x86_64 and aarch64
> targets are enabled. Other targets will be enabled later once DPDK
> upstream will be properly fixed.
> 
> Only the little endian targets are properly supported by DPDK. Big 
> endian
> was supported, mostly on Power8, but it has not been used for a while 
> and
> IBM is not strongly pushing any tests. Should big endian be supported
> again, DPDK community will be welcoming any  contributions.
> 
> Some nice to have for the Kernel, but not mandatory:
> - CONFIG_VFIO_IOMMU_TYPE1=y
> - CONFIG_VFIO_VIRQFD=y
> - CONFIG_VFIO=y
> - CONFIG_VFIO_NOIOMMU=y
> - CONFIG_VFIO_PCI=y
> - CONFIG_VFIO_PCI_MMAP=y
> - CONFIG_HUGETLBFS=y
> - CONFIG_HUGETLB_PAGE=y
> - CONFIG_PROC_PAGE_MONITOR=y
> 
> For x86 only, HPET and HPET_MMAP can be some nice to have too.
> 
> Since they are some nice to have, but not mandatory ones, the following
> Kernel config fixups are not used:
> define DPDK_LINUX_CONFIG_FIXUPS
> 	$(call KCONFIG_ENABLE_OPT, CONFIG_HUGETLBFS)
> 	...
> endef
> 
> Notes about license:
> 
> DPDK was released with the BSD-3-Clause license.
> 
> One network driver, the Google Virtual Ethernet (GVE) include files
> under the MIT license. See [2] and [3].
> 
> DPDK had been including a Kernel Netdevice Interface (KNI) and an 
> IGB_UIO
> kernel module under the GPL-2.0 license. Those modules were moved into 
> a
> different repository [K]. Then, for instance, the KNI module was 
> removed
> by [KNI]. This commit was first included in version v23.11. The IGB_UIO 
> kernel
> module was removed by [UIO] since VFIO became capable of supporting all
> the required usecases for the DPDK. The main remaining issues had been
> the support of memory mapping within a VM or without the use of nested
> virtualization but those were fixed by the latest VFIO's kernel 
> support.
> We can notice that the PMD drivers that are using the ibverbs (RDMA) 
> APIs
> are not sharing this need of UIO/VFIO.
> 
> There are also 2 files in "lib/eal/windows" under other licenses
> (namely BSD-2-Clause, ISC and MIT) but they are parts of the 
> Environment
> Abstraction Library (EAL) for Microsoft Windows OS, it means they are
> not used when compiling for the Linux targets of Buildroot.
> 
> The list of DPDK license exceptions is maintained at [3].
> 
> Add configuration options to enable DPDK examples and tests.
> 
> [1] https://www.dpdk.org/
> [2] https://git.dpdk.org/dpdk/tree/doc/guides/nics/gve.rst?h=v24.07
> [3] https://git.dpdk.org/dpdk/tree/license/exceptions.txt?h=v24.07
> [KNI] 
> https://git.dpdk.org/dpdk/commit/?id=f78c100bc87119c6a94130a6689d773afdaa9d98
> [UIO] 
> https://git.dpdk.org/dpdk/commit/?id=56bb5841fd0608989101d933f091852a3126b4fe
> [K] 
> https://git.dpdk.org/dpdk-kmods/commit/?id=d16f3b44987be181b6effee139558a084eaf9f8c
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Suggested-by: Julien Olivain <ju.o@free.fr>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  ...-cpu_instruction_set-from-meson-opti.patch | 33 +++++++
>  package/dpdk/0010-Fix-aarch64-build.patch     | 37 +++++++
>  package/dpdk/Config.in                        | 45 +++++++++
>  package/dpdk/dpdk.hash                        | 10 ++
>  package/dpdk/dpdk.mk                          | 99 +++++++++++++++++++
>  7 files changed, 228 insertions(+)
>  create mode 100644 
> package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
>  create mode 100644 package/dpdk/0010-Fix-aarch64-build.patch
>  create mode 100644 package/dpdk/Config.in
>  create mode 100644 package/dpdk/dpdk.hash
>  create mode 100644 package/dpdk/dpdk.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 426590d5c5..7c3d858e40 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3238,6 +3238,9 @@ F:	package/rtl8822cs/
>  N:	Victor Huesca <victor.huesca@bootlin.com>
>  F:	support/testing/tests/core/test_root_password.py
> 
> +N:	Vincent Jardin <vjardin@free.fr>
> +F:	package/dpdk/
> +
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
>  F:	package/utp_com/
> diff --git a/package/Config.in b/package/Config.in
> index 211080345a..90e521330b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1988,6 +1988,7 @@ menu "Networking"
>  	source "package/daq3/Config.in"
>  	source "package/davici/Config.in"
>  	source "package/dht/Config.in"
> +	source "package/dpdk/Config.in"
>  	source "package/enet/Config.in"
>  	source "package/filemq/Config.in"
>  	source "package/fmlib/Config.in"
> diff --git 
> a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch 
> b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> new file mode 100644
> index 0000000000..8e99379fb6
> --- /dev/null
> +++ 
> b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> @@ -0,0 +1,33 @@
> +From 121e5d019f0bb6dec0ace2b361611edd10fc8ff8 Mon Sep 17 00:00:00 2001
> +From: Lee Chee Yang <chee.yang.lee@intel.com>
> +Date: Wed, 6 Dec 2023 16:58:10 +0800
> +Subject: [PATCH] config/meson: get cpu_instruction_set from meson 
> option
> +
> +Workaround error:
> +| ../git/config/meson.build:178:8: ERROR: Problem encountered: 
> Compiler
> +does not support "x86_64" arch flag.
> +
> +Upstream-Status: Inappropriate [ yocto specific to set 
> cpu_instruction_set ]
> +
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +Upstream: 
> https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> +---
> + config/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/meson.build b/config/meson.build
> +index a9ccd56deb..f310c7adf6 100644
> +--- a/config/meson.build
> ++++ b/config/meson.build
> +@@ -105,7 +105,7 @@ platform = get_option('platform')
> +
> + # set the cpu_instruction_set and cflags for it
> + if meson.is_cross_build()
> +-    cpu_instruction_set = host_machine.cpu()
> ++    cpu_instruction_set = get_option('cpu_instruction_set')
> + else
> +     cpu_instruction_set = get_option('cpu_instruction_set')
> +     machine = get_option('machine')
> +--
> +2.37.3
> +
> diff --git a/package/dpdk/0010-Fix-aarch64-build.patch 
> b/package/dpdk/0010-Fix-aarch64-build.patch
> new file mode 100644
> index 0000000000..64f44b2b50
> --- /dev/null
> +++ b/package/dpdk/0010-Fix-aarch64-build.patch
> @@ -0,0 +1,37 @@
> +From c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Sun, 8 Sep 2024 13:20:14 +0200
> +Subject: [PATCH] Fix aarch64 build
> +
> +The condition on which DPDK meson skip the -march detection for 
> Aarch64
> +seems incorrect or incomplete. This patch changes the condition in 
> order
> +to better match the comment (that the options are decided in
> +config/arm/meson.build). It actually test for the architecture name.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +Upstream: 
> https://github.com/DPDK/dpdk/commit/c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb

This URL incorrectly suggests this patch has been accepted
upstream. It has not. It came from by personal fork, from:
https://github.com/jolivain/dpdk/commit/c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb

While this patch might need some discussion with DPDK maintainers to
cover all situations, it can still be useful here in Buildroot, as it
fixes the Aarch64 cross compilation. Then, to better reflect the
situation, you could simply add a mention that we will propose this
patch later. Something like:

Upstream: to be proposed on https://patches.dpdk.org/project/dpdk/list/
Link: Taken from 
https://github.com/jolivain/dpdk/commit/c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb

> +---
> + config/meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/config/meson.build b/config/meson.build
> +index 8c8b019c25..ea48e55ce3 100644
> +--- a/config/meson.build
> ++++ b/config/meson.build
> +@@ -176,10 +176,10 @@ if not is_ms_compiler
> +     else
> +         machine_args += '-march=' + cpu_instruction_set
> +         # arm manages generic/auto config in config/arm/meson.build
> +-        if cpu_instruction_set != 'generic' and cpu_instruction_set 
> != 'auto'
> +-            compiler_arch_support = cc.has_argument('-march=' + 
> cpu_instruction_set)
> +-        else
> ++        if host_machine.cpu_family().startswith('aarch')
> +             compiler_arch_support = true
> ++        else
> ++            compiler_arch_support = cc.has_argument('-march=' + 
> cpu_instruction_set)
> +         endif
> +     endif
> +     if not compiler_arch_support
> +--
> +2.46.0
> +
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..2fe129c47f
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,45 @@
> +config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	bool
> +	# DPDK can be used for the following little endian architecture
> +	default y if BR2_aarch64
> +	# DPDK requires SSE4.2 for x86_64 since v17.08
> +	default y if BR2_x86_64 && BR2_X86_CPU_HAS_SSE42
> +
> +config BR2_PACKAGE_DPDK
> +	bool "dpdk"
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # DPDK design
> +	depends on BR2_USE_MMU # pthread() memory mappings
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  DPDK (Data Plane Development Kit) is a set of libraries
> +	  and drivers for fast packet processing.
> +
> +	  http://dpdk.org/
> +
> +if BR2_PACKAGE_DPDK
> +
> +config BR2_PACKAGE_DPDK_EXAMPLES
> +	bool "Install examples"
> +	help
> +	  Install all DPDK examples.
> +
> +config BR2_PACKAGE_DPDK_TESTS
> +	bool "Install tests"
> +	help
> +	  Install all DPDK tests.
> +
> +endif
> +
> +comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, 
> kernel headers >= 4.19"
> +	depends on BR2_USE_MMU # pthread() memory mappings
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> new file mode 100644
> index 0000000000..4e98d9dc25
> --- /dev/null
> +++ b/package/dpdk/dpdk.hash
> @@ -0,0 +1,10 @@
> +# Locally computed
> +sha256  
> 9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd  
> dpdk-24.07.tar.xz
> +sha256  
> 1531b66affc3bae796d755e12850795e56e25ccedd685bf7d2644d8ddfadbad8  
> license/bsd-2-clause.txt
> +sha256  
> 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  
> license/bsd-3-clause.txt
> +sha256  
> e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  
> license/exceptions.txt
> +sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> license/gpl-2.0.txt
> +sha256  
> be8f198f2e1c9b30226e293255bbe6933ee6607a580ee5874185aa023bcc3c39  
> license/isc.txt
> +sha256  
> 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  
> license/lgpl-2.1.txt
> +sha256  
> 6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  
> license/mit.txt
> +sha256  
> cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  
> license/README
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> new file mode 100644
> index 0000000000..0c6be05e6e
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,99 @@
> +################################################################################
> +#
> +# dpdk
> +#
> +################################################################################
> +
> +DPDK_VERSION = 24.07
> +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
> +DPDK_SITE = https://fast.dpdk.org/rel
> +DPDK_LICENSE = \
> +	BSD-3-Clause (legacy), \
> +	BSD-2-Clause, \
> +	GPL-2.0, \
> +	ISC, \
> +	LGPL-2.1, \
> +	MIT (drivers/net/gve/base)
> +
> +# Only the Windows target has the 2 following licenses:
> +# - license/bsd-2-clause.txt
> +# - license/isc.txt
> +# which is related to a Windows getopt.[ch] compatibility layer.
> +# Since Buildroot is not used for Windows target, it is not listed
> +# here.
> +#
> +# All the userland files of DPDK have dual licences BSD or GPL/LGPL
> +# Since the Linux kernel modules had been removed from the DPDK, there
> +# is no GPL only code into the DPDK anymore.
> +# The usage of DPDK with Buildroot is for userland only, it means
> +# that for the dual licenced files, BSD clause is used but not the
> +# following ones:
> +# - license/gpl-2.0.txt
> +# - license/lgpl-2.1.txt
> +# See the DPDK's license/README for more details.
> +#
> +# The legacy and historical license of the DPDK is BSD-3-clause.
> +DPDK_LICENSE_FILES = \
> +	license/README \
> +	license/bsd-3-clause.txt \
> +	license/exceptions.txt \
> +	license/mit.txt
> +
> +DPDK_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-python-pyelftools
> +
> +ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
> +DPDK_CONF_OPTS += -Dexamples=all
> +else
> +DPDK_CONF_OPTS += -Dexamples=
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
> +DPDK_CONF_OPTS += -Dtests=true
> +else
> +DPDK_CONF_OPTS += -Dtests=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBBSD),y)
> +DPDK_DEPENDENCIES += libbsd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JANSSON),y)
> +DPDK_DEPENDENCIES += jansson
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> +DPDK_DEPENDENCIES += libpcap
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DPDK_DEPENDENCIES += zlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +DPDK_DEPENDENCIES += libexecinfo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NUMACTL),y)
> +DPDK_DEPENDENCIES += numactl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
> +DPDK_DEPENDENCIES += libarchive
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBBPF),y)
> +DPDK_DEPENDENCIES += libbpf
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RDMA_CORE),y)
> +DPDK_DEPENDENCIES += rdma-core
> +endif
> +
> +# DPDK's meson shall need to be clean'd, hack here along the enclosed 
> patch
> +DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
> +# Keep the following, even if not mandatory, until the removal of the 
> patch
> +DPDK_MESON_EXTRA_PROPERTIES += platform='generic'
> +
> +$(eval $(meson-package))
> --
> 2.46.0

With that minor change, I would be OK for this patch to be merged as is.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
