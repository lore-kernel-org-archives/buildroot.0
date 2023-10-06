Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA7BE94114
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA88C400AF;
	Fri,  6 Oct 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA88C400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtjlJFfnsTj7; Fri,  6 Oct 2023 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF83040332;
	Fri,  6 Oct 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF83040332
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBEFC1BF98E
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9592960EF2
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9592960EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5cVHWWkjYj8 for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 20:52:57 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5620260E50
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5620260E50
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 59C212003A4;
 Fri,  6 Oct 2023 22:52:53 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37474])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Oct 2023 22:52:53 +0200
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 22:52:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20230918084825.786715-1-marcus.folkesson@gmail.com>
References: <20230918084825.786715-1-marcus.folkesson@gmail.com>
User-Agent: Webmail Free/1.6.3
Message-ID: <c868c0891cb8b5692cc11e095edee316@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696625575;
 bh=IH8IPaTFMy1cv+1FFtukczajAo1cEhA+zRzeTWr4Lys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VznWjQIDnn4CpFR/YkKtoAce/bYGvtVnQmqHa0cEQuTUvrJsZwRgIv7s1G2PtCAMw
 Ej3n2w+lrxdopORvvs0eQn93pI7lYY/lXPfX4DudIQ5ttPb/nPzRFHCRqvrC+OOgMx
 JGk+7myfdYdMNpjDX3x0q1cPLbtwxk5+UgbyX724SxVCs4TOcU5ZUiZ9F7tE5PfYNA
 UShXlC2/5DZrQKkLYVBfdkl6FDrkBjF645BRg53NrWj8sDMID1EGYplSdc2fZTKtUr
 T2xBRP9AtX1dMlqmBk754XPLqZMSNWkQRCIGTicuHFjRZQ+4FOkQ24KX6Ox7rBZ3c/
 zGktmaXB5jlSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VznWjQID
Subject: Re: [Buildroot] [PATCH v3] package/criu: new package
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

Hi Marcus,

While testing this v3 patch, I've seen two small parts that would need 
to be
reformatted. See below:

On 18/09/2023 10:48, Marcus Folkesson wrote:
> Checkpoint/Restore In Userspace (CRIU), is a software tool for the
> Linux operating system to make it possible to freeze a running
> application and checkpoint it to persistent storage as a collection of 
> files.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>     v2:
>      - Addressed comments from Thomas.
>      - Tested on ARM target and on x86_64 with qemu.
> 
>     v3:
>      - set CONFIG_CHECKPOINT_RESTORE in kernel config
>      - Only be available for ARMv6, ARMv7 and ARMv8
> 
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/criu/Config.in | 48 ++++++++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 +++
>  package/criu/criu.mk   | 59 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 112 insertions(+)
>  create mode 100644 package/criu/Config.in
>  create mode 100644 package/criu/criu.hash
>  create mode 100644 package/criu/criu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7fae4841e4..d6e6a98202 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1986,6 +1986,7 @@ 
> F:	support/testing/tests/package/test_python_pytest.py
>  F:	support/testing/tests/package/test_python_pytest_asyncio.py
> 
>  N:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +F:	package/criu/
>  F:	package/libcamera/
>  F:	package/libcamera-apps/
>  F:	package/libostree/
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..9a754cb072 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2667,6 +2667,7 @@ menu "System tools"
>  	source "package/coreutils/Config.in"
>  	source "package/cpulimit/Config.in"
>  	source "package/cpuload/Config.in"
> +	source "package/criu/Config.in"
>  	source "package/crun/Config.in"
>  	source "package/daemon/Config.in"
>  	source "package/dc3dd/Config.in"
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> new file mode 100644
> index 0000000000..06e809fb83
> --- /dev/null
> +++ b/package/criu/Config.in
> @@ -0,0 +1,48 @@
> +# criu only builds on certain architectures
> +config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_ARM_CPU_ARMV6
> +	default y if BR2_ARM_CPU_ARMV7A
> +	default y if BR2_ARM_CPU_ARMV7M
> +	default y if BR2_ARM_CPU_ARMV8A
> +	default y if BR2_ARM_CPU_ARMV8M
> +	default y if BR2_aarch64
> +	default y if BR2_i386
> +	default y if BR2_mips
> +	default y if BR2_x86_64
> +	default y if BR2_powerpc64
> +	default y if BR2_s390x
> +
> +menuconfig BR2_PACKAGE_CRIU
> +	bool "criu"
> +	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
> +	depends on !BR2_STATIC_LIBS # protobuf, libbsd
> +	depends on BR2_USE_WCHAR # libbsd
> +	depends on BR2_USE_MMU # libcap
> +	select BR2_PACKAGE_HOST_PYTHON3_SSL
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_PROTOBUF_C
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LIBBSD
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBNET
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_PYTHON3
> +	help
> +	  Checkpoint/Restore In Userspace (CRIU), is a software
> +	  tool for the Linux operating system to make it possible
> +	  to freeze a running application and checkpoint it to
> +	  persistent storage as a collection of files.
> +
> +	  https://criu.org/Main_Page
> +
> +comment "criu needs a toolchain w/ threads, dynamic library, wchar"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> +		|| !BR2_USE_WCHAR
> diff --git a/package/criu/criu.hash b/package/criu/criu.hash
> new file mode 100644
> index 0000000000..2c4a07252b
> --- /dev/null
> +++ b/package/criu/criu.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> 6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  
> criu-3.18.tar.gz
> +sha256  
> 568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  
> COPYING
> diff --git a/package/criu/criu.mk b/package/criu/criu.mk
> new file mode 100644
> index 0000000000..3da7ec90ab
> --- /dev/null
> +++ b/package/criu/criu.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# CRIU
> +#
> +################################################################################
> +
> +CRIU_VERSION = 3.18
> +CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz

Running command:

     utils/docker-run make check-package

generates the warning:

     package/criu/criu.mk:8: remove default value of _SOURCE variable 
(http://nightly.buildroot.org/#generic-package-reference)

So this CRIU_SOURCE line can be removed.

> +CRIU_SITE = 
> https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)

I suggest to use the Buildroot download helper for github here:

CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))

> +
> +CRIU_LICENSE = GPL-2.0
> +CRIU_LICENSE_FILES = COPYING
> +CRIU_DEPENDENCIES =\
> +	host-pkgconf \
> +	host-protobuf-c \
> +	host-python3 \
> +	host-python-pip \
> +	libaio \
> +	libbsd \
> +	libcap \
> +	libnet \
> +	libnl \
> +	protobuf \
> +	protobuf-c \
> +	python3
> +
> +CRIU_MAKE_ENV =\
> +	$(TARGET_MAKE_ENV) \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CROSS_COMPILE=$(TARGET_CROSS) \
> +	WERROR=0
> +
> +#x86_64 is treated as x86 in criu
> +#Also, powerpc64 is refered to as ppc64 in criu.
> +ifeq ($(BR2_ARCH),"x86_64")
> +CRIU_MAKE_ENV += ARCH=x86
> +else ifeq ($(BR2_ARCH),"powerpc64")
> +CRIU_MAKE_ENV += ARCH=ppc64
> +else
> +CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)
> +endif
> +

The following CRIU_LINUX_CONFIG_FIXUPS text blocks has extra spaces
at the beginning of the lines that could be removed.

> + # Criu needs Kernel Checkpoint/restore support which is not enabled
> + # by default.
> + define CRIU_LINUX_CONFIG_FIXUPS
> +		 $(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)

A single tab and no space would be better here.

> + endef
> +
> +define CRIU_BUILD_CMDS
> +	rm -rf $(@D)/images/google/protobuf/descriptor.proto
> +	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto 
> $(@D)/images/google/protobuf/descriptor.proto
> +	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(TARGET_CFLAGS)" -C $(@D)
> +endef
> +
> +define CRIU_INSTALL_TARGET_CMDS
> +	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) 
> install-criu install-lib install-compel
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.41.0
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
