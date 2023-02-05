Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF63C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 975EB4010D;
	Sun,  5 Feb 2023 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975EB4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhwndAvlHqbR; Sun,  5 Feb 2023 12:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6468940124;
	Sun,  5 Feb 2023 12:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6468940124
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF621BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6589A416D8
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6589A416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C48jcgfm0Voc for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:54:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE75416CC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABE75416CC
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:54:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DBA272003DC;
 Sun,  5 Feb 2023 13:54:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 13:54:16 +0100
Date: Sun, 5 Feb 2023 13:54:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230205125416.GG2960@scaer>
References: <20230202202002.3272959-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202202002.3272959-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675601661;
 bh=yVHcE8r0oDI+aIzDVeZNu5xrD3dx/Mr1Xua31ipGykc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHrBIcU5sDO7b/RsPSGcTYQus+EXZiHgdcCRzLz/r4NaTVkn9ldmG+eurzbAWMFFc
 rDHXLYT978cvIs8tUaSZ3C/xUyHbSh9budmYekKDDz9+XK6LkReg1ELmYiICwNbLUL
 q9wkd/MS+SBH3qAfx368hA/Y69COdX0Hd2W66Ccov1xjUbA3lZGolhD+U9bNwipiz+
 06SZ/7co0sZRlUs7cTBhIED9v5iQi3l9gkMwYKYre3yHUIqaCTiRSLz2/1nRQyqdJW
 OFj7KOCX3hJqE6DAlGxqrIQxo932DkkG29yug9zbaegwCQw0tkaAu736wvvS3SBF+l
 DuQunrBb4EeMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iHrBIcU5
Subject: Re: [Buildroot] [PATCH v6 1/2] package/rdma-core: new package
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
> This is the userspace components for the Linux Kernel's
> drivers/infiniband subsystem.
> 
> https://github.com/linux-rdma/rdma-core
> 
> Tested-by: Shamraiz Ashraf <shamraizashraf092@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
> new file mode 100644
> index 0000000000..437cf903ac
> --- /dev/null
> +++ b/package/rdma-core/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_RDMA_CORE
> +	bool "rdma-core"
> +	depends on BR2_USE_MMU # fork() used in rstream example
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_STATIC_LIBS # dlopen()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  This is the userspace components for the Linux Kernel's
> +	  drivers/infiniband subsystem.
> +
> +	  Note: The 'rdma' utility program is provided by the
> +	  'iproute2' package, when compiled with the package 'libmnl'
> +	  also selected. This program is needed to configure
> +	  InfiniBand and RDMA networks from the command line.

Since it requires that utility from iproute2, I added a select (and
appropriate dependencies),and dropped that comment.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	  https://github.com/linux-rdma/rdma-core
> +
> +comment "rdma-core needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
> new file mode 100644
> index 0000000000..1aff44f7f4
> --- /dev/null
> +++ b/package/rdma-core/rdma-core.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha256  4a2eec55b37ac25f25e7680a372f71c1781c23808542bd31fb68dc0448b8cba2  rdma-core-44.0.tar.gz
> +sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
> +sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> new file mode 100644
> index 0000000000..885821bf98
> --- /dev/null
> +++ b/package/rdma-core/rdma-core.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# rdma-core
> +#
> +################################################################################
> +
> +RDMA_CORE_VERSION = 44.0
> +RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
> +RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
> +RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
> +RDMA_CORE_DEPENDENCIES = libnl
> +RDMA_CORE_INSTALL_STAGING = YES
> +
> +RDMA_CORE_CONF_OPTS = \
> +	-DNO_MAN_PAGES=1 \
> +	-DNO_PYVERBS=1
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +RDMA_CORE_CONF_OPTS += \
> +	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
> +	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
> +endif
> +
> +$(eval $(cmake-package))
> diff --git a/package/rdma-core/readme.txt b/package/rdma-core/readme.txt
> new file mode 100644
> index 0000000000..9a95226ef4
> --- /dev/null
> +++ b/package/rdma-core/readme.txt
> @@ -0,0 +1,75 @@
> +Testing rdma-core userspace tools
> +=================================
> +
> +Testing rdma-core using Linux software RoCE implementation:
> +https://en.wikipedia.org/wiki/RDMA_over_Converged_Ethernet
> +
> +Using two systems with working TCP/IP configuration, for example:
> +- Server IP: 192.168.123.10
> +- Client IP: 192.168.123.20
> +
> +Make sure firewall configurations are appropriate. Routable RoCE v2
> +uses udp/4791. ibv_rc_pingpong uses tcp/18515 for initial
> +synchronization.
> +
> +Note: this test can be executed in two qemu virtual machines with
> +bridged networking.
> +
> +
> +Kernel configuration
> +--------------------
> +
> +The Linux Kernel needs some InfiniBand configuration. In this example
> +the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). The Kernel
> +config fragment file used for package test can be used as a starting
> +point. See:
> +
> +    support/testing/tests/package/test_rdma_core/linux-rdma.fragment
> +
> +
> +Buildroot package configuration
> +-------------------------------
> +
> +For setting up a software RoCE link, the "rdma" program is needed. It
> +is provided by the "iproute2" package, when "libmnl" is also
> +selected. Make sure to have in your Buildroot configuration:
> +
> +    BR2_PACKAGE_IPROUTE2=y
> +    BR2_PACKAGE_LIBMNL=y
> +    BR2_PACKAGE_RDMA_CORE=y
> +
> +
> +Setting up the rdma link
> +------------------------
> +
> +On both server and client:
> +
> +    modprobe rdma_rxe
> +    rdma link add rxe0 type rxe netdev eth0
> +
> +
> +Testing with rping
> +------------------
> +
> +On the server side, run the command:
> +
> +    rping -s -v
> +
> +On the client side, run the command:
> +
> +    rping -c -v -a 192.168.123.10
> +
> +
> +Testing with ibv_rc_pingpong
> +----------------------------
> +
> +To test with the pingpong example using the reliable connected (RC)
> +transport:
> +
> +On the server side, run the command:
> +
> +    ibv_rc_pingpong -d rxe0 -g 1
> +
> +On the client side, run the command:
> +
> +    ibv_rc_pingpong -d rxe0 -g 1 192.168.123.10
> diff --git a/support/testing/tests/package/test_rdma_core.py b/support/testing/tests/package/test_rdma_core.py
> new file mode 100644
> index 0000000000..614fb51f48
> --- /dev/null
> +++ b/support/testing/tests/package/test_rdma_core.py
> @@ -0,0 +1,43 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestRdmaCore(infra.basetest.BRTest):
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
> +        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
> +
> +        # ibv_devinfo returns 255 if no devices are found
> +        self.assertRunOk("ibv_devinfo -v")
> diff --git a/support/testing/tests/package/test_rdma_core/linux-rdma.fragment b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
> new file mode 100644
> index 0000000000..e305f27e62
> --- /dev/null
> +++ b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
> @@ -0,0 +1,9 @@
> +CONFIG_INFINIBAND=m
> +CONFIG_INFINIBAND_USER_MAD=m
> +CONFIG_INFINIBAND_USER_ACCESS=m
> +CONFIG_RDMA_RXE=m
> +CONFIG_INFINIBAND_IPOIB=m
> +CONFIG_INFINIBAND_IPOIB_CM=y
> +CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
> +CONFIG_INFINIBAND_RTRS_CLIENT=m
> +CONFIG_INFINIBAND_RTRS_SERVER=m
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
