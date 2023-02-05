Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DBC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E9F60746;
	Sun,  5 Feb 2023 14:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E9F60746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGQJxR3nAIEe; Sun,  5 Feb 2023 14:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B991860750;
	Sun,  5 Feb 2023 14:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B991860750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 359AC1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C8A181C04
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C8A181C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NV8GpayJeyJ for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:09:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 426C881BC5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 426C881BC5
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:09:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CAB7013F87F;
 Sun,  5 Feb 2023 15:09:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:09:05 +0100
Date: Sun, 5 Feb 2023 15:09:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230205140905.GH2960@scaer>
References: <20230202202002.3272959-1-ju.o@free.fr>
 <20230202202002.3272959-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202202002.3272959-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675606151;
 bh=pn5TkG3FhwP0TpHe3RrEmLf51Gner6+UA4WGc9JnYJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoYz5QTkOmoHGW8wXz025Hfe4CV6w7nFvSfCC952ls1zSjWKT9jkxESkf0Cpo+JTe
 06jjIXmSx+QN/IxUQ/j14Bs/roFiAQMvtRK8SGvdDxTGAbR+JEZddKL/52UV4n4lF1
 Y5ANu4eVY0mTEHD/1Xdt+YNXLNmm7NBvMuGET5VVifxwtJKDHJuZJRFnzPCMDrtSa6
 KT7dmi+IDCQ4LAnuZyy+KOWXI+bAgR6vPFvXaraAWGwR1mqITFVkD5VR1/7UEwtf+q
 WsHD1FDmExAVS6iiWQPPsT1OTnSWLmwGuZlyE493/THcyQxm6GhIXBH7gNJfryU8Du
 rzpfpVyt1NK/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DoYz5QTk
Subject: Re: [Buildroot] [PATCH v6 2/2] package/perftest: new package
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
Cc: Shamraiz Ashraf <shamraizashraf092@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-02-02 21:20 +0100, Julien Olivain spake thusly:
> Open Fabrics Performance Tests.
> 
> This is a collection of tests written over uverbs intended
> for use as a performance micro-benchmark. The tests may be
> used for HW or SW tuning as well as for functional testing.
> 
> https://github.com/linux-rdma/perftest
> 
> Tested-by: Shamraiz Ashraf <shamraizashraf092@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

I however did a few cleanups:

  - move all arch-related dependencies to _ARCH_SUPPORTS
  - include musl condition in comment and its dependnecies

Regards,
Yann E. MORIN.

> ---
> Changes v5 -> v6:
> - Update perftest from version 4.5-0.18 to 4.5-0.20
> - Update kernel in test from 5.15.80 to 5.15.91
> - Add perftest entries in DEVELOPERS file
> 
> Changes v1 -> v5:
> - introduce perftest package in v5 patch series
> ---
> Tested on branch main at commit aff4317 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     python3 -m flake8  support/testing/tests/package/test_perftest.py
>     [no-output]
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_perftest.TestPerftest
>     ...
>     OK
> 
>     ./utils/test-pkg -a -p perftest
>                              arm-aarch64 [ 1/44]: OK
>                    bootlin-aarch64-glibc [ 2/44]: OK
>                bootlin-arcle-hs38-uclibc [ 3/44]: SKIPPED
>                     bootlin-armv5-uclibc [ 4/44]: SKIPPED
>                      bootlin-armv7-glibc [ 5/44]: OK
>                    bootlin-armv7m-uclibc [ 6/44]: SKIPPED
>                       bootlin-armv7-musl [ 7/44]: SKIPPED
>                 bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/44]: SKIPPED
>              bootlin-microblazeel-uclibc [10/44]: SKIPPED
>                 bootlin-mipsel32r6-glibc [11/44]: SKIPPED
>                    bootlin-mipsel-uclibc [12/44]: SKIPPED
>                      bootlin-nios2-glibc [13/44]: SKIPPED
>                  bootlin-openrisc-uclibc [14/44]: SKIPPED
>         bootlin-powerpc64le-power8-glibc [15/44]: OK
>            bootlin-powerpc-e500mc-uclibc [16/44]: OK
>                    bootlin-riscv32-glibc [17/44]: OK
>                    bootlin-riscv64-glibc [18/44]: OK
>                     bootlin-riscv64-musl [19/44]: SKIPPED
>                       bootlin-sh4-uclibc [20/44]: SKIPPED
>                    bootlin-sparc64-glibc [21/44]: OK
>                     bootlin-sparc-uclibc [22/44]: SKIPPED
>                     bootlin-x86-64-glibc [23/44]: OK
>                      bootlin-x86-64-musl [24/44]: SKIPPED
>                    bootlin-x86-64-uclibc [25/44]: OK
>                    bootlin-xtensa-uclibc [26/44]: SKIPPED
>                             br-arm-basic [27/44]: SKIPPED
>                     br-arm-full-nothread [28/44]: SKIPPED
>                       br-arm-full-static [29/44]: SKIPPED
>                    br-i386-pentium4-full [30/44]: OK
>                 br-i386-pentium-mmx-musl [31/44]: SKIPPED
>                       br-mips64-n64-full [32/44]: SKIPPED
>                  br-mips64r6-el-hf-glibc [33/44]: SKIPPED
>                br-powerpc-603e-basic-cpp [34/44]: OK
>                br-powerpc64-power7-glibc [35/44]: OK
>                        linaro-aarch64-be [36/44]: SKIPPED
>                           linaro-aarch64 [37/44]: OK
>                               linaro-arm [38/44]: OK
>                      sourcery-arm-armv4t [39/44]: SKIPPED
>                             sourcery-arm [40/44]: SKIPPED
>                      sourcery-arm-thumb2 [41/44]: OK
>                          sourcery-mips64 [42/44]: SKIPPED
>                            sourcery-mips [43/44]: SKIPPED
>                           sourcery-nios2 [44/44]: SKIPPED
>     44 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  package/perftest/Config.in                    | 41 ++++++++++++++++
>  package/perftest/perftest.hash                |  3 ++
>  package/perftest/perftest.mk                  | 15 ++++++
>  .../testing/tests/package/test_perftest.py    | 48 +++++++++++++++++++
>  6 files changed, 110 insertions(+)
>  create mode 100644 package/perftest/Config.in
>  create mode 100644 package/perftest/perftest.hash
>  create mode 100644 package/perftest/perftest.mk
>  create mode 100644 support/testing/tests/package/test_perftest.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5eb746f8b4..7abfbe3c44 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1692,6 +1692,7 @@ F:	package/gnupg2/
>  F:	package/glslsandbox-player/
>  F:	package/octave/
>  F:	package/ola/
> +F:	package/perftest/
>  F:	package/ptm2human/
>  F:	package/python-distro/
>  F:	package/python-gnupg/
> @@ -1709,6 +1710,7 @@ F:	support/testing/tests/package/test_ncdu.py
>  F:	support/testing/tests/package/test_octave.py
>  F:	support/testing/tests/package/test_ola.py
>  F:	support/testing/tests/package/test_ola/
> +F:	support/testing/tests/package/test_perftest.py
>  F:	support/testing/tests/package/test_python_distro.py
>  F:	support/testing/tests/package/test_python_gnupg.py
>  F:	support/testing/tests/package/test_python_pyalsa.py
> diff --git a/package/Config.in b/package/Config.in
> index 1f6db14d56..f32209db95 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -133,6 +133,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/oprofile/Config.in"
>  	source "package/pax-utils/Config.in"
>  	source "package/pcm-tools/Config.in"
> +	source "package/perftest/Config.in"
>  	source "package/piglit/Config.in"
>  	source "package/ply/Config.in"
>  	source "package/poke/Config.in"
> diff --git a/package/perftest/Config.in b/package/perftest/Config.in
> new file mode 100644
> index 0000000000..9b2e46e64a
> --- /dev/null
> +++ b/package/perftest/Config.in
> @@ -0,0 +1,41 @@
> +config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
> +	bool
> +	# Accurate cycle measurement in perftest is implemented for a
> +	# limited set of architectures, see:
> +	# https://github.com/linux-rdma/perftest/blob/v4.5-0.20/src/get_clock.h
> +	# Note: the package has also a fallback to use "asm/timex.h"
> +	# from the Kernel, in
> +	# "$(LINUX_DIR)/arch/$(KERNEL_ARCH)/include". It is not
> +	# reflected here as this path is not well tested.
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && !BR2_ARM_CPU_ARMV6
> +	default y if BR2_aarch64
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_s390x
> +	default y if BR2_sparc || BR2_sparc64
> +	default y if BR2_riscv
> +
> +config BR2_PACKAGE_PERFTEST
> +	bool "perftest"
> +	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS # rdma-core
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # rdma-core
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_USE_MMU # rdma-core
> +	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_RDMA_CORE # libibverbs, librdmacm, libibumad
> +	help
> +	  Open Fabrics Performance Tests.
> +
> +	  This is a collection of tests written over uverbs intended
> +	  for use as a performance micro-benchmark. The tests may be
> +	  used for HW or SW tuning as well as for functional testing.
> +
> +	  https://github.com/linux-rdma/perftest
> +
> +comment "perftest needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
> new file mode 100644
> index 0000000000..4333231c44
> --- /dev/null
> +++ b/package/perftest/perftest.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  32e667dac1c0dd41a3951c5a54b961a8e28db5d9478caea2dfc268a312968c99  perftest-4.5-0.20.tar.gz
> +sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
> diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
> new file mode 100644
> index 0000000000..7ad20d0974
> --- /dev/null
> +++ b/package/perftest/perftest.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# perftest
> +#
> +################################################################################
> +
> +PERFTEST_VERSION = 4.5-0.20
> +PERFTEST_SITE = $(call github,linux-rdma,perftest,v$(PERFTEST_VERSION))
> +PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
> +PERFTEST_LICENSE_FILES = COPYING
> +PERFTEST_DEPENDENCIES = pciutils rdma-core
> +# Fetched from Github, with no configure script
> +PERFTEST_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
> new file mode 100644
> index 0000000000..680b70d784
> --- /dev/null
> +++ b/support/testing/tests/package/test_perftest.py
> @@ -0,0 +1,48 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestPerftest(infra.basetest.BRTest):
> +
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_IPROUTE2=y
> +        BR2_PACKAGE_LIBMNL=y
> +        BR2_PACKAGE_RDMA_CORE=y
> +        BR2_PACKAGE_PERFTEST=y
> +        """.format(
> +            infra.filepath("tests/package/test_rdma_core/linux-rdma.fragment")
> +        )
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.login()
> +
> +        # Add the rxe0 interface
> +        self.assertRunOk("ip link set dev eth0 up")
> +        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
> +
> +        # start a server
> +        self.assertRunOk("ib_read_bw > /dev/null 2>&1 &")
> +
> +        # start a client
> +        self.assertRunOk("sleep 1 && ib_read_bw 127.0.0.1")
> -- 
> 2.39.1
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
