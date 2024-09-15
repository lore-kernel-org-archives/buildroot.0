Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C9C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE72981453;
	Sun, 15 Sep 2024 22:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLZq5nKr_N0h; Sun, 15 Sep 2024 22:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46BA281455
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BA281455;
	Sun, 15 Sep 2024 22:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 066D11BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E940440247
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id semLjyJL4fhC for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E7FA400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E7FA400A4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E7FA400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:30:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 58625780331;
 Mon, 16 Sep 2024 00:30:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 00:30:50 +0200
Date: Mon, 16 Sep 2024 00:30:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <ZudgGuhHgwI1VLio@landeda>
References: <20240915143004.24060-1-vjardin@free.fr>
 <20240915143004.24060-2-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915143004.24060-2-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726439456;
 bh=AtcebWHiLiaWX6hFNE69gq1T9eJbymOkB46MrhnbtOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S97Rz12080gTvgcAax3ViEJEbux9dL5d/9uYPRz5Vc3BBtwGNmN/yIz4gdwvouUIn
 lORG6HKC9ERAeykDLLqwZsd20ds10xSSRxAEDTAIwT23agiBqI2Uk6loDt+/uO8G5N
 GdjbsrC9l17oMej1AhlPpFB1IE3iN3CqYH8cjsfajZyO+Bbr8hEh/8nAs1aT4CDv8l
 KHsemDZuTIWuPratyQ8u/FPm8NGgwOUt87vfCpG/1N87L9fmj+Rg0cbxwIuD/WLbPB
 CZ8HtI3aa/+QDzItY82JxI8TtEs334Ovv9eZH8vrUPuii0ms+T8AnluVmKiL+lB97r
 Xdo7DHnQJYJ2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S97Rz120
Subject: Re: [Buildroot] [PATCH v6 1/1] package/dpdk: add 24.07
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2024-09-15 16:30 +0200, Vincent Jardin spake thusly:
> This commit adds the integration of the Data Plane Development Kit (DPDK),
> a suite of libraries and drivers designed for high-performance packet
> processing from the user space. DPDK enables direct packet steering from
> some network interfaces to the userland, bypassing the Linux kernel
> network stack. This is achieved through userland PCI drivers or by
> leveraging some userland memory mappings of the network devices.
> 
> Originally inspired by RDMA (Remote Direct Memory Access) concepts, DPDK
> has been adapted to work with PCI devices that do not inherently support
> RDMA. This adaptation allows for low-latency, high-throughput data
> processing by minimizing the overhead typically associated with
> kernel-space network drivers.

Thank you for this extensive introduction to DPDK. For Buildroot
commits, however, one or two sentences are usually sufficient, while
focusing on the Buildroot side of things is more important, like
describing the challenges and.or decisions that were made in the
packaging itself.

For example, the following paragraphs are really interesting, as they
describe and explain the packaging decisions you made and the rationale
behind them. Thanks a lot!

> Importantly, this commit does not enforce the use of UIO or VFIO
> kernel frameworks, as DPDK's architecture supports userland memory
> mappings that do not require these technologies. By maintaining this
> flexibility, DPDK can operate with a broader range of hardware and
> software configurations, making it suitable for diverse Buildroot's
> deployment scenarios.
> 
> Yocto patch imported from:
>   https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> 
> The patch that fixes DPDK's meson for building properly for aarch64 was
> suggested by Julien. It clearly points that DPDK's meson shall need a
> proper set of fixes in order to properly cross-compile for aarch64,
> riscv64 or ppc64. So for the time being, only the x86_64 and aarch64
> targets are enabled. Other targets will be enabled later once DPDK
> upstream will be properly fixed.
> 
> Only the little endian targets are properly supported by DPDK. Big endian
> was supported, mostly on Power8, but it has not been used for a while and
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

Since those are only optional and thus not enforced, maybe it would be
nice to list them in the help text for the main DPDK option?

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
> DPDK had been including a Kernel Netdevice Interface (KNI) and an IGB_UIO
> kernel module under the GPL-2.0 license. Those modules were moved into a
> different repository [K]. Then, for instance, the KNI module was removed
> by [KNI]. This commit was first included in version v23.11. The IGB_UIO kernel
> module was removed by [UIO] since VFIO became capable of supporting all
> the required usecases for the DPDK. The main remaining issues had been
> the support of memory mapping within a VM or without the use of nested
> virtualization but those were fixed by the latest VFIO's kernel support.
> We can notice that the PMD drivers that are using the ibverbs (RDMA) APIs
> are not sharing this need of UIO/VFIO.

I don't think it makes sense to provide that history; a simple sentence
would have been enough to clarify the situation, e.g.:

    There used to be GPL-2.0-only licensed kernel modules, but they got
    removed in previous versions [K] [KNI], so there is no longer any
    GPL-2.0-only code; it's all either BSD-3-Clause alone, or the dual
    license (GPL-2.0 OR BSD-3-Clause).

> There are also 2 files in "lib/eal/windows" under other licenses
> (namely BSD-2-Clause, ISC and MIT) but they are parts of the Environment
> Abstraction Library (EAL) for Microsoft Windows OS, it means they are
> not used when compiling for the Linux targets of Buildroot.

The above is indeed important, thanks for noticing!

[--SNIP--]
> diff --git a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> new file mode 100644
> index 0000000000..8e99379fb6
> --- /dev/null
> +++ b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> @@ -0,0 +1,33 @@
> +From 121e5d019f0bb6dec0ace2b361611edd10fc8ff8 Mon Sep 17 00:00:00 2001
> +From: Lee Chee Yang <chee.yang.lee@intel.com>
> +Date: Wed, 6 Dec 2023 16:58:10 +0800
> +Subject: [PATCH] config/meson: get cpu_instruction_set from meson option
> +
> +Workaround error:
> +| ../git/config/meson.build:178:8: ERROR: Problem encountered: Compiler
> +does not support "x86_64" arch flag.
> +
> +Upstream-Status: Inappropriate [ yocto specific to set cpu_instruction_set ]
> +
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +Upstream: https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch

This is not an "upstream": indeed, Yocto is not the upstream of DPDK,
but it is a downstream.

The "Upstream" tag must reference the status of the patch in upstream:
  - has the patch been submitted? What's the URL, then?
  - if not, why not?
  - if refused, why do we keep it?

And you indeed have sch a status, which is the one in the Yocto's own
Upstream-Status tag, so just reuse that.

The location where you got it is indeed important, and you can just adsd
it below Lee Chee Yang's SoB line.

You also need to add your own sign-off on the patches you carry, as your
part of the chain of custody for that patch.

    Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
    Links: https://yocto..../......
    Upstream: Not applicable, see Yocto's Upstream-Status, above
    Signed-off-by: Your Name <your@email>

[--SNIP--]
> diff --git a/package/dpdk/0010-Fix-aarch64-build.patch b/package/dpdk/0010-Fix-aarch64-build.patch
> new file mode 100644
> index 0000000000..845ec9235b
> --- /dev/null
> +++ b/package/dpdk/0010-Fix-aarch64-build.patch
> @@ -0,0 +1,42 @@
> +From c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Sun, 8 Sep 2024 13:20:14 +0200
> +Subject: [PATCH] Fix aarch64 build
> +
> +The condition on which DPDK meson skip the -march detection for Aarch64
> +seems incorrect or incomplete. This patch changes the condition in order
> +to better match the comment (that the options are decided in
> +config/arm/meson.build). It actually test for the architecture name.
> +
> +While this patch might need some discussion with DPDK maintainers to
> +cover all situations, it can still be useful here in Buildroot, as it
> +fixes the Aarch64 cross compilation.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +Upstream: to be proposed https://patches.dpdk.org/project/dpdk/list/
> +Links: cherry-picked from https://github.com/jolivain/dpdk/commit/c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb

Ditto, add your sign-off.

Will you eventually send that patch upstream?

[--SNIP--]
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..2fe129c47f
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,45 @@
[--SNIP--]
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

The help texts for those two options are mostly useless; indeed, the
phelp text mostly duplicated the prompt, so they do not provide any
additional information. If the prompt is enough to understand an option,
then there is no need to rpvide a help text.

> +endif
> +
> +comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
> +	depends on BR2_USE_MMU # pthread() memory mappings
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19

Those two are superfluous and incorrect: we want to see the comment when
either consition is false, but with the above two, as soon as gcc >= 4.9
or the headers are >= 4.19, the com ment will be hidden; also, they are
already properly inclued in the cpondition below.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
[--SNIP--]
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

I'm not sure GPL-2.0 and LGPL-2.1 on their own make sense. Indeed, you
said earlier that GPL-2.0-only and LGPL-2.1-only code were removed.

What we would need however is probably something like:

    DPDK_LICENSE = \
        BSD-2-Clause, \
        BSD-3-Clause, \
        BSD=-3-Clause OR GPL-2.0, \
        BSD=-3-Clause OR LGPL-2.1, \
        ISC, \
        MIT

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

I think this is a misunderstanding of licensing terms: the files *are*
dual-licensed, so that is the licensing terms they are available under;
one is then free to exercise the rights they get from either or both
licenses.

So we want to include the GPL-2.0 and LGPL-2.0 license files, because
they do apply to some files, even if just as an option to choose from.

> +# See the DPDK's license/README for more details.
> +#
> +# The legacy and historical license of the DPDK is BSD-3-clause.
> +DPDK_LICENSE_FILES = \
> +	license/README \

That file does not contain licensing terms; it just contains the
licensing policy to follow when contributoing to DPDK, so it does not
belong to the list of licebnse files, IMHO.

> +	license/bsd-3-clause.txt \
> +	license/exceptions.txt \
> +	license/mit.txt
> +
> +DPDK_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-python-pyelftools

This will only guarantee that a "basic" host python3 is available, i.e.
without bz2, xz, curses, and ssl. Is that OK? If not, then both
BR2_PACKAGE_HOST_PYTHON3 and any needed option should be selected from
Config.in.

Regards,
Yann E. MORIN.

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
