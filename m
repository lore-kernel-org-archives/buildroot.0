Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35580C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE9142C61;
	Tue, 31 Oct 2023 12:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE9142C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9JE-WRNns6v; Tue, 31 Oct 2023 12:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914C442C66;
	Tue, 31 Oct 2023 12:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914C442C66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25E731BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09707839BB
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09707839BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjfC8Eizz_XB for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:23:06 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8FCE8399E
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8FCE8399E
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9E37419F5C2;
 Tue, 31 Oct 2023 13:23:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34546])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Oct 2023 13:23:00 +0100
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 13:23:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20231030103931.2684786-1-marcus.folkesson@gmail.com>
References: <20231030103931.2684786-1-marcus.folkesson@gmail.com>
User-Agent: Webmail Free/1.6.4
Message-ID: <627c2e7888ad6a916e976d470fc23dd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698754982;
 bh=j0AFKZw1aWV4gvHCpI490+4QzYBZjIgjz86zRVcnJ8A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zt58BgdDSWlGJweDuwdYs5BdfRjXGd9QfoDhkmMWNtnZ/JnbzunUKTZIuZkQQV7KU
 aqUFzoEdrS2a3TSz7EWuFX9e9gFs/0Tj26WWANr/AQ6ZHhmRrE47MI0CcPVTnQqNhP
 j+DZMzoR1fI8RqC9wNVbRvl3Wl1Ep0G6hzm2uewc+s9leyRI0SD2Fkun2VRa+kJBJN
 QY28DY+iBYT8PBnnd+RZaBwZT964VwfS+y7ZCn4msqXA//kQEwmv1Ctk1uQ8BbiGyq
 KeSCaBVUtWkEq8xc7ZpacD6bMLqJdK+H8viynMsT2FTRhwRgxMc4hCtw2xoVmFcbGa
 absH9SfD8GNvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zt58BgdD
Subject: Re: [Buildroot] [PATCH v5] package/criu: new package
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

Thanks for this updated v5 patch!

I confirm I successfully tested this patch on branch master at commit
a9d2040 with commands:

     utils/docker-run make check-package
     ...
     0 warnings generated

     cat >criu.config <<EOF
     BR2_PACKAGE_HOST_PYTHON3=y
     BR2_PACKAGE_CRIU=y
     EOF
     utils/test-pkg -a -c criu.config -p criu
                          arm-aarch64 [ 1/45]: OK
                bootlin-aarch64-glibc [ 2/45]: SKIPPED
            bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
                 bootlin-armv5-uclibc [ 4/45]: SKIPPED
                  bootlin-armv7-glibc [ 5/45]: OK
                bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                   bootlin-armv7-musl [ 7/45]: SKIPPED
             bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
            bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
          bootlin-microblazeel-uclibc [10/45]: SKIPPED
             bootlin-mipsel32r6-glibc [11/45]: SKIPPED
                bootlin-mipsel-uclibc [12/45]: SKIPPED
                  bootlin-nios2-glibc [13/45]: SKIPPED
              bootlin-openrisc-uclibc [14/45]: SKIPPED
     bootlin-powerpc64le-power8-glibc [15/45]: SKIPPED
        bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
                bootlin-riscv32-glibc [17/45]: SKIPPED
                bootlin-riscv64-glibc [18/45]: SKIPPED
                 bootlin-riscv64-musl [19/45]: SKIPPED
              bootlin-s390x-z13-glibc [20/45]: SKIPPED
                   bootlin-sh4-uclibc [21/45]: SKIPPED
                bootlin-sparc64-glibc [22/45]: SKIPPED
                 bootlin-sparc-uclibc [23/45]: SKIPPED
                 bootlin-x86-64-glibc [24/45]: OK
                  bootlin-x86-64-musl [25/45]: SKIPPED
                bootlin-x86-64-uclibc [26/45]: SKIPPED
                bootlin-xtensa-uclibc [27/45]: SKIPPED
                         br-arm-basic [28/45]: SKIPPED
                 br-arm-full-nothread [29/45]: SKIPPED
                   br-arm-full-static [30/45]: SKIPPED
                br-i386-pentium4-full [31/45]: SKIPPED
             br-i386-pentium-mmx-musl [32/45]: SKIPPED
                   br-mips64-n64-full [33/45]: SKIPPED
              br-mips64r6-el-hf-glibc [34/45]: SKIPPED
            br-powerpc-603e-basic-cpp [35/45]: SKIPPED
            br-powerpc64-power7-glibc [36/45]: SKIPPED
                    linaro-aarch64-be [37/45]: SKIPPED
                       linaro-aarch64 [38/45]: SKIPPED
                           linaro-arm [39/45]: SKIPPED
                  sourcery-arm-armv4t [40/45]: SKIPPED
                         sourcery-arm [41/45]: SKIPPED
                  sourcery-arm-thumb2 [42/45]: SKIPPED
                      sourcery-mips64 [43/45]: SKIPPED
                        sourcery-mips [44/45]: SKIPPED
                       sourcery-nios2 [45/45]: SKIPPED
      45 builds, 42 skipped, 0 build failed, 0 legal-info failed, 0 
show-info failed

I also tested with the runtime test from:
https://patchwork.ozlabs.org/project/buildroot/patch/20230915221444.1686011-1-ju.o@free.fr/

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_criu
     ...
     OK

I have also few minor comments.

On 30/10/2023 11:39, Marcus Folkesson wrote:
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
>     v4:
>     - set SUBARCH for armv6, armv7 and armv8
>     - Use github download helper
> 
>     Result from test-pkg:
>                         bootlin-armv5-uclibc [1/6]: SKIPPED
>                          bootlin-armv7-glibc [2/6]: OK
>                        bootlin-armv7m-uclibc [3/6]: SKIPPED
>                          bootlin-x86-64-musl [4/6]: OK
>                           br-arm-full-static [5/6]: SKIPPED
>                                 sourcery-arm [6/6]: SKIPPED
>     6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 
> show-info failed
> 
>     v5:
>     - Remove support for s390 arch
>     - Depend on BR2_HOST_GCC_AT_LEAST_8
>     - Depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
>     - Depend on !BR2_TOOLCHAIN_USES_UCLIBC
>     - Use BR2_NORMALIZED_ARCH instead of BR2_ARCH
> 
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/criu/Config.in | 55 ++++++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 ++
>  package/criu/criu.mk   | 71 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 131 insertions(+)
>  create mode 100644 package/criu/Config.in
>  create mode 100644 package/criu/criu.hash
>  create mode 100644 package/criu/criu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 57015e245e..2047827bd9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2007,6 +2007,7 @@ 
> F:	support/testing/tests/package/test_python_pytest.py
>  F:	support/testing/tests/package/test_python_pytest_asyncio.py
> 
>  N:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +F:	package/criu/
>  F:	package/libcamera/
>  F:	package/libcamera-apps/
>  F:	package/libostree/
> diff --git a/package/Config.in b/package/Config.in
> index 4e489c4706..9e2099f6a5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2678,6 +2678,7 @@ menu "System tools"
>  	source "package/coreutils/Config.in"
>  	source "package/cpulimit/Config.in"
>  	source "package/cpuload/Config.in"
> +	source "package/criu/Config.in"
>  	source "package/crun/Config.in"
>  	source "package/daemon/Config.in"
>  	source "package/dc3dd/Config.in"
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> new file mode 100644
> index 0000000000..7963e6e8df
> --- /dev/null
> +++ b/package/criu/Config.in
> @@ -0,0 +1,55 @@
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
> +	default y if BR2_BR2_powerpc64le #Only support powerpc64 with LE
> +	#default y if BR2_s390x

I think this BR2_s390x Kconfig line can be removed. Keeping only the
following comment will be sufficient.

> +	#CRIU has "some" support for s390 but it is not included due to
> +	#BE/LE endian issues.
> +
> +menuconfig BR2_PACKAGE_CRIU
> +	bool "criu"
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # -march=armv7-a+fp

This should be BR2_TOOLCHAIN_GCC_AT_LEAST_8 (i.e. target gcc). It
should then replace the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8"
you already have for protobuf. I didn't see any build failure, as it
is probably hidden with the kernel headers >= 4.18 dependency.

> +	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf

This line should be replaced by BR2_HOST_GCC_AT_LEAST_8, as commented
earlier.

> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
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

The comment should be slightly refined, with something like,
in one line:
"criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 
4.18, dynamic library, wchar"

> +	depends on !BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \

The change I proposed earlier should also be reflected here:

     depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || ...

> +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
> +		|| BR2_TOOLCHAIN_USES_UCLIBC \
> +		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
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
> index 0000000000..9814e4a0de
> --- /dev/null
> +++ b/package/criu/criu.mk
> @@ -0,0 +1,71 @@
> +################################################################################
> +#
> +# CRIU
> +#
> +################################################################################
> +
> +CRIU_VERSION = 3.18
> +CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
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
> +#Remap to match the used in criu.
> +ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
> +CRIU_MAKE_ENV += ARCH=x86
> +else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
> +CRIU_MAKE_ENV += ARCH=ppc64
> +else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
> +CRIU_MAKE_ENV += ARCH=aarch64
> +else
> +CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_ARMV6), y)
> +CRIU_MAKE_ENV += SUBARCH=armv6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A), y)
> +CRIU_MAKE_ENV += SUBARCH=armv7
> +else ifeq ($(BR2_ARM_CPU_ARMV7M), y)
> +CRIU_MAKE_ENV += SUBARCH=armv7
> +else ifeq ($(BR2_ARM_CPU_ARMV8A), y)
> +CRIU_MAKE_ENV += SUBARCH=armv8
> +else ifeq ($(BR2_ARM_CPU_ARMV8M), y)
> +CRIU_MAKE_ENV += SUBARCH=armv8
> +endif
> +
> +# Criu needs Kernel Checkpoint/restore support which is not enabled
> +# by default.
> +define CRIU_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
> +endef
> +
> +define CRIU_BUILD_CMDS
> +	rm -rf $(@D)/images/google/protobuf/descriptor.proto
> +	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto 
> $(@D)/images/google/protobuf/descriptor.proto
> +	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define CRIU_INSTALL_TARGET_CMDS
> +	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) 
> install-criu install-lib install-compel
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.42.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
