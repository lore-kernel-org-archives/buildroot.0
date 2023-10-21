Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B580C001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 11:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C03CE84DFC;
	Sat, 21 Oct 2023 11:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C03CE84DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3x_IvWK6KoH; Sat, 21 Oct 2023 11:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179A984DF3;
	Sat, 21 Oct 2023 11:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179A984DF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F82C1BF34B
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 11:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB2AC416DF
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 11:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2AC416DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4AmubCg6rK9 for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 11:15:16 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C74A416C3
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 11:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C74A416C3
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8756FB00596;
 Sat, 21 Oct 2023 13:15:10 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41808])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Oct 2023 13:15:10 +0200
MIME-Version: 1.0
Date: Sat, 21 Oct 2023 13:15:10 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
User-Agent: Webmail Free/1.6.4
Message-ID: <7a3a5533d8fc664535be030d5d1242f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697886913;
 bh=4Jxi1zpnTnOmIXxjdw8O+FXwHteUPpjaW1czK6SeBZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F6liKdv/qW6jjzCpIqEdijDafmVR/h5jvSODRTX1jRcIdMj57HNeXhSsp8UJu25DM
 jUh+FZ6dbj0h/2p3zMzi8DA8DT6pneurn+tfDq1/Gy38J7tieTn1CO6QZgNWyKUm6r
 uyGQDg+goGp8yHeMGzjkRy6P8DEZ1wpih25IDyRPdTWygiW7gF7tdICUdONd2GxiVN
 YFLiiVv5iKOlkwIAisORtW2Tlb1GEYe5Zky1GIk40GPDc8OyOfTrOgxTeYyYwoAJfU
 vQQru1J2OuR9XFKrmdmh603zdxL4egOCpUi+BTwLv/lLuU0bHevbMIgSpG0bzTP1bG
 eQD0Wjh5sClxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F6liKdv/
Subject: Re: [Buildroot] [PATCH v4] package/criu: new package
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

Thanks for the updated patch!

I confirm the normal test-pkg is passing. Then, I ran a "test-pkg -a"
(which test more toolchains/arches) and observed few new minor
failures. I'll comment a bit each failures and provide hints for
improvements, when possible.

     cat >criu.config <<EOF
     BR2_PACKAGE_HOST_PYTHON3=y
     BR2_PACKAGE_CRIU=y
     EOF
     utils/test-pkg -a -c criu.config -p criu
                      arm-aarch64 [ 1/45]: OK
            bootlin-aarch64-glibc [ 2/45]: FAILED

criu uses restartable sequences, see:
https://github.com/checkpoint-restore/criu/blob/v3.18/criu/include/linux/rseq.h#L7

Criu seems to have a header detection on "sys/rseq.h" (i.e. on the
libc side). But the sys/rseq.h then includes linux/rseq.h (i.e. on the
kernel side), which is not checked. Some configurations like
bootlin-aarch64-glibc includes the glibc header, but also have older
kernel. Restartable sequences were introduced in kernel >= 4.18. So
this can be handled by adding a dependency on kernel.

        bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
             bootlin-armv5-uclibc [ 4/45]: SKIPPED
              bootlin-armv7-glibc [ 5/45]: OK
            bootlin-armv7m-uclibc [ 6/45]: SKIPPED
               bootlin-armv7-musl [ 7/45]: OK
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
          bootlin-s390x-z13-glibc [20/45]: FAILED

Build fails with output:

     Makefile:23: *** "The architecture s390x isn't supported".  Stop.

criu Makefile checks for "s390" arch (but "s390x" is passed
here). See:
https://github.com/checkpoint-restore/criu/blob/v3.18/Makefile#L22

               bootlin-sh4-uclibc [21/45]: SKIPPED
            bootlin-sparc64-glibc [22/45]: SKIPPED
             bootlin-sparc-uclibc [23/45]: SKIPPED
             bootlin-x86-64-glibc [24/45]: OK
              bootlin-x86-64-musl [25/45]: OK
            bootlin-x86-64-uclibc [26/45]: FAILED

Build fails with output:

     criu/fsnotify.c:18:10: fatal error: aio.h: No such file or directory
        18 | #include <aio.h>
           |          ^~~~~~~

            bootlin-xtensa-uclibc [27/45]: SKIPPED
                     br-arm-basic [28/45]: SKIPPED
             br-arm-full-nothread [29/45]: SKIPPED
               br-arm-full-static [30/45]: SKIPPED
            br-i386-pentium4-full [31/45]: FAILED

Build fails with output:

     Makefile:23: *** "The architecture i686 isn't supported".  Stop.

         br-i386-pentium-mmx-musl [32/45]: FAILED

Build fails with output:

     Makefile:23: *** "The architecture i586 isn't supported".  Stop.

               br-mips64-n64-full [33/45]: SKIPPED
          br-mips64r6-el-hf-glibc [34/45]: SKIPPED
        br-powerpc-603e-basic-cpp [35/45]: SKIPPED
        br-powerpc64-power7-glibc [36/45]: FAILED

Build fails with output:

     In file included from compel/plugins/std/infect.c:14:
     compel/include/uapi/compel/asm/sigframe.h:27:2: error: #error Only 
supporting ABIv2.
        27 | #error Only supporting ABIv2.
           |  ^~~~~

                linaro-aarch64-be [37/45]: FAILED

Build fails with output:

     Makefile:23: *** "The architecture aarch64_be isn't supported".  
Stop.

                   linaro-aarch64 [38/45]: OK
                       linaro-arm [39/45]: FAILED

Build fails with output:

     arm-linux-gnueabihf-gcc: error: unrecognized argument in option 
'-march=armv7-a+fp'
     arm-linux-gnueabihf-gcc: note: valid arguments to '-march=' are: 
armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te 
armv5tej armv6 armv6-m armv6j armv6k armv6kz armv6s-m armv6t2 armv6z 
armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv7ve armv8-a armv8-a+ 
crc armv8-m.base armv8-m.main armv8-m.main+dsp armv8.1-a armv8.2-a 
armv8.2-a+dotprod armv8.2-a+fp16 armv8.2-a+fp16+dotprod iwmmxt iwmmxt2 
native; did you mean 'armv7-a'?

Gcc option "-march=armv7-a+fp" was introduced in gcc commit
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=76d7d5334991a5646026e5aa8c3e7d23629f383a
first included in version 8.1.0.
So the package should have a dependency on this. linaro-arm fails
because it contains 7.3.1.

              sourcery-arm-armv4t [40/45]: SKIPPED
                     sourcery-arm [41/45]: SKIPPED
              sourcery-arm-thumb2 [42/45]: FAILED

Same story as linaro-arm toolchain.

                  sourcery-mips64 [43/45]: SKIPPED
                    sourcery-mips [44/45]: FAILED

Fails with output:

     compel/arch/mips/plugins/std/memcpy.S: Assembler messages:
     compel/arch/mips/plugins/std/memcpy.S:7: Error: opcode not supported 
on this processor: mips32r2 (mips32r2) 'dadd $2,$0,$4'
     compel/arch/mips/plugins/std/memcpy.S:8: Error: opcode not supported 
on this processor: mips32r2 (mips32r2) 'daddiu $13,$0,0'
     compel/arch/mips/plugins/std/memcpy.S:14: Error: opcode not 
supported on this processor: mips32r2 (mips32r2) 'daddiu $13,$13,1'
     compel/arch/mips/plugins/std/memcpy.S:15: Error: opcode not 
supported on this processor: mips32r2 (mips32r2) 'daddiu $4,$4,1'
     compel/arch/mips/plugins/std/memcpy.S:16: Error: opcode not 
supported on this processor: mips32r2 (mips32r2) 'daddiu $5,$5,1'

There is maybe few extra condtions missing in the _ARCH_SUPPORTS for 
mips.

                   sourcery-nios2 [45/45]: SKIPPED
45 builds, 29 skipped, 10 build failed, 0 legal-info failed, 0 show-info 
failed

To test thoroughly your package with a specific list of toolchains, you 
can use the
following commands:

     cp support/config-fragments/autobuild/toolchain-configs.csv 
criu-toolchains.csv
     # edit criu-toolchains.csv to keep your toolchains of interest.
     utils/test-pkg -a -t criu-toolchains.csv -c criu.config -p criu

This will retest only the toolchains kept in the csv.

On 20/10/2023 08:02, Marcus Folkesson wrote:
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
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/criu/Config.in | 48 +++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 ++
>  package/criu/criu.mk   | 70 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 123 insertions(+)
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

There is possibly some rework needed here to fix architecture
related build failures described earlier.

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

A dependency on kernel header >= 4.18 should be added:

     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf

The condition can be raised to:

     depends on BR2_HOST_GCC_AT_LEAST_8 # -march=armv7-a+fp

If gcc older than 8 for non-arm architecture are really needed, it can
also be refined as something like "gcc >= 4.8 && !arm || gcc >= 8 && 
arm".
For reference, gcc 8.1 was release on 2018-05-02.

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

The new toolchain dependencies you will add will need to be reflected
here.

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
> index 0000000000..a84c625696
> --- /dev/null
> +++ b/package/criu/criu.mk
> @@ -0,0 +1,70 @@
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
> +#x86_64 is treated as x86 in criu
> +#Also, powerpc64 is refered to as ppc64 in criu.

There is possibly some rework needed here to fix architecture
related build failures described earlier.

> +ifeq ($(BR2_ARCH),"x86_64")
> +CRIU_MAKE_ENV += ARCH=x86
> +else ifeq ($(BR2_ARCH),"powerpc64")
> +CRIU_MAKE_ENV += ARCH=ppc64
> +else
> +CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)
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
> 2.41.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
