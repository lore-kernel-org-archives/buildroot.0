Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1391AE6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 22:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9980040879;
	Fri,  6 Sep 2024 22:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qwh4nOeUysyB; Fri,  6 Sep 2024 22:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9111F40733
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9111F40733;
	Fri,  6 Sep 2024 22:33:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2AB01BF3CE
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 22:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF77A60754
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 22:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIp4qGac2kB2 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 22:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AF20605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF20605C8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AF20605C8
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 22:33:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DB44319F57E;
 Sat,  7 Sep 2024 00:33:42 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Sep 2024 00:33:42 +0200
MIME-Version: 1.0
Date: Sat, 07 Sep 2024 00:33:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20240828102106.55640-2-vjardin@free.fr>
References: <20240827003813.30083-2-vjardin@free.fr>
 <20240828102106.55640-1-vjardin@free.fr>
 <20240828102106.55640-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <17a5d38e19273c96711a040d50652f94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725662025;
 bh=RJb60WEhpcatSCNfEcluzlE8A6qmXC3KW45yQjNxWUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Deq9xI+5S2ifwYRutpNUuZk6qOYMitaTdPxToZhA0+4tFrPGbHicSKgzWGs3KyMk7
 lX+7d0G0xVW0RpHLLLEAGjcI8h3Wery43/hRwu+HSp/3bUpHmE6kNuMwoIECWwjqWa
 esvhlSi79oSe5ksdNvl15UR6oXOk63j4PIdWft59QnL6eu7AfBWuoICCmTqchlgnkS
 18661zQLjmjyvEE0DChlDIE2gVAErDKyydAnUz+rDYNTXWmKKKycaZMpMTm1YzOstG
 7oR+g/akxHLnqTIaBNHS6uFV+DPGbDVksGr3XBTCKlZr54tKN2pU868ubzDFwVDx0X
 KFu7Oft9YBCyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Deq9xI+5
Subject: Re: [Buildroot] [PATCH v4 1/1] package/dpdk: add 24.07
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

I tested this patch on branch master at commit 3daa037.

All of the test-pkg toolchains are failing. In order to have your patch
merged, we should only have "OK" or "SKIPPED".

You can check with the command:

     utils/test-pkg -a -p dpdk

I have the output:

                      arm-aarch64 [ 1/41]: FAILED
            bootlin-aarch64-glibc [ 2/41]: FAILED
        bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
             bootlin-armv5-uclibc [ 4/41]: SKIPPED
              bootlin-armv7-glibc [ 5/41]: FAILED
            bootlin-armv7m-uclibc [ 6/41]: SKIPPED
               bootlin-armv7-musl [ 7/41]: SKIPPED
         bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
        bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
      bootlin-microblazeel-uclibc [10/41]: SKIPPED
         bootlin-mipsel32r6-glibc [11/41]: FAILED
            bootlin-mipsel-uclibc [12/41]: SKIPPED
              bootlin-nios2-glibc [13/41]: FAILED
          bootlin-openrisc-uclibc [14/41]: SKIPPED
bootlin-powerpc64le-power8-glibc [15/41]: FAILED
    bootlin-powerpc-e500mc-uclibc [16/41]: SKIPPED
            bootlin-riscv32-glibc [17/41]: FAILED
            bootlin-riscv64-glibc [18/41]: FAILED
             bootlin-riscv64-musl [19/41]: SKIPPED
          bootlin-s390x-z13-glibc [20/41]: FAILED
               bootlin-sh4-uclibc [21/41]: SKIPPED
            bootlin-sparc64-glibc [22/41]: FAILED
             bootlin-sparc-uclibc [23/41]: SKIPPED
             bootlin-x86-64-glibc [24/41]: FAILED
              bootlin-x86-64-musl [25/41]: SKIPPED
            bootlin-x86-64-uclibc [26/41]: SKIPPED
            bootlin-x86-i686-musl [27/41]: SKIPPED
            bootlin-xtensa-uclibc [28/41]: SKIPPED
                     br-arm-basic [29/41]: SKIPPED
             br-arm-full-nothread [30/41]: SKIPPED
               br-arm-full-static [31/41]: SKIPPED
            br-i386-pentium4-full [32/41]: SKIPPED
               br-mips64-n64-full [33/41]: SKIPPED
          br-mips64r6-el-hf-glibc [34/41]: FAILED
        br-powerpc-603e-basic-cpp [35/41]: SKIPPED
        br-powerpc64-power7-glibc [36/41]: FAILED
                linaro-aarch64-be [37/41]: SKIPPED
                   linaro-aarch64 [38/41]: SKIPPED
                       linaro-arm [39/41]: SKIPPED
                  sourcery-mips64 [40/41]: SKIPPED
                    sourcery-mips [41/41]: SKIPPED
41 builds, 28 skipped, 12 build failed, 1 legal-info failed, 0 show-info 
failed

Then, you can check build failure logs, for example with:

     tail ~/br-test-pkg/arm-aarch64/logfile

In most cases, meson configuration fails with message:

     Compiler for C supports arguments -mcpu=: NO
     /build/dpdk-24.07/config/meson.build:186:8: ERROR: Problem 
encountered: Compiler does not support "" arch flag.

The dpdk meson does not detect the architecture correctly. Maybe
this is introduced by the package patch...

Few other failures are due to incorrect _LICENSE_FILES, see below.

On my side, I was able to have a working configuration, for x86_64.
I think in the current state of the patch, it's probably the only
architecture working. I can have a working dpdk build with the
commands:

     cat <<EOF >.config
     BR2_x86_64=y
     BR2_x86_nehalem=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
     BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
     BR2_ROOTFS_POST_SCRIPT_ARGS="qemu_x86_64_defconfig"
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.49"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_PACKAGE_LIBBPF=y
     BR2_PACKAGE_RDMA_CORE=y
     BR2_PACKAGE_OPENSSL=y
     BR2_PACKAGE_DTC=y
     BR2_PACKAGE_JANSSON=y
     BR2_PACKAGE_DPDK=y
     BR2_PACKAGE_LIBPCAP=y
     BR2_PACKAGE_NUMACTL=y
     BR2_TARGET_ROOTFS_EXT2=y
     BR2_TARGET_ROOTFS_EXT2_SIZE="300M"
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

     qemu-system-x86_64 \
         -M q35 -cpu Nehalem -smp 4 -m 2G \
         -kernel output/images/bzImage \
         -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
         -append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
         -net nic,model=virtio -net user \
         -nographic

     # login, then inside qemu:
     dpdk-test --no-huge crc_autotest threads_autotest lcores_autotest

I'll use such a scenario to write a runtime test later...

On 28/08/2024 12:21, Vincent Jardin wrote:
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
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  ...-cpu_instruction_set-from-meson-opti.patch | 33 +++++++
>  package/dpdk/Config.in                        | 34 ++++++++
>  package/dpdk/dpdk.hash                        | 10 +++
>  package/dpdk/dpdk.mk                          | 87 +++++++++++++++++++
>  6 files changed, 168 insertions(+)
>  create mode 100644 
> package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
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
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..82d9a0a798
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	bool
> +	default y

Here, the "default y" should be removed, otherwise, this
_ARCH_SUPPORTS will not be effective (and will not filter
out unsupported architectures).

> +	# DPDK can be used for the following little endian architecture
> +	default y if BR2_RISCV_64
> +	default y if BR2_aarch64
> +	default y if BR2_powerpc64le
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
> index 0000000000..4be51ee763
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,87 @@
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
> +	BSD-3-Clause, \
> +	BSD-2-Clause,\
                      ^- there is a missing space here

> +	GPL-2.0, \
> +	ISC, \
> +	LGPL-2.1, \
> +	MIT

The identification of components (or group of components) should be 
added
here, rather than in _LICENSE_FILES.

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
> +	license/bsd-3-clause.txt (legacy) \
> +	license/exceptions.txt \
> +	license/mit.txt (drivers/net/gve/base)

This variable should only contains only valid file paths (and no
annotation). This generates error when collecting legal info.
You can see that by running the command:

     make legal-info

It will show the error:

     ...
     >>> dpdk 24.07 Collecting legal info
     license/README: OK (sha256: 
cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab)
     license/bsd-3-clause.txt: OK (sha256: 
9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712)
     /bin/sh: -c: line 1: syntax error near unexpected token '('

> +
> +DPDK_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-python-pyelftools
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

Maybe this is here the correct "cpu_instruction_set" needs to be mapped 
to
the correct value: maybe DPDK does not exactly accept what Buildroot is
providing in BR2_GCC_TARGET_ARCH / BR2_GCC_TARGET_CPU.  I think this is
the last tricky point to resolve before merging this patch.  I'll try to
debug a bit on my side (I would like to have at least the architectures
listed in the _ARCH_SUPPORTS).

> +# Keep the following, even if not mandatory, until the removal of the 
> patch
> +DPDK_MESON_EXTRA_PROPERTIES += platform='generic'
> +
> +$(eval $(meson-package))
> --
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
