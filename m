Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67A8383D25;
	Wed,  1 Nov 2023 17:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A8383D25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euEAsnWO5g4g; Wed,  1 Nov 2023 17:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E0483CE9;
	Wed,  1 Nov 2023 17:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E0483CE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC9A21BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A06E04318F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A06E04318F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id saVx0rjGpy57 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:31:32 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E2BC41720
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2BC41720
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EE0C319F57B;
 Wed,  1 Nov 2023 18:31:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 18:31:24 +0100
Date: Wed, 1 Nov 2023 18:31:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20231101173124.GF114892@scaer>
References: <20231101152205.530647-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101152205.530647-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698859889;
 bh=Jpqi5unPEBksEuA4wKD5mxLrpn2TmexBeUtXE37G//I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XBeOz5pnyqUhhrE+rAOTrDGNPw8eZCN2XgBRVee3JWiRVjKjscZOJYkdR5U0s5BjQ
 q/GBkSf9qtXHBt484+lpwbMNbcT040nfQxBEo3Kt5ZaMS+SDRYlaoyA+fmR/nNZ3M8
 hpbTYB1eqtxPwQ9PfePbkCYqd5DHXzBxYLGgadUd4RAhPmvEiZr1zE5tWpxGey1/z7
 nW7yz1bMDoy3+4nDDmgQXSraSLUxK88i76FFJByhGXoSCY8jQMvjkpHdh2QwDEqes/
 KtEI0fDaTdS3yM1YObh4vPEGhxm9w+Epphr05cgL1tEc9nu6Ngs4HQlmSjd5xWuoeH
 h6g00+5v/NGrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XBeOz5pn
Subject: Re: [Buildroot] [PATCH v6] package/criu: new package
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

Marcus, All,

On 2023-11-01 16:22 +0100, Marcus Folkesson spake thusly:
> Checkpoint/Restore In Userspace (CRIU), is a software tool for the
> Linux operating system to make it possible to freeze a running
> application and checkpoint it to persistent storage as a collection of files.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

    $ ./utils/docker-run make check-package
    package/criu/Config.in:8: BR2_ARM_CPU_ARMV8M referenced but not defined
    package/criu/Config.in:13: BR2_BR2_powerpc64le referenced but not defined
    package/criu/criu.mk:51: BR2_ARM_CPU_ARMV8M referenced but not defined

Indeed, BR2_ARM_CPU_ARMV8M does not exist at all in Buildroot: we (so
far) do not have support for non-A armv8.

BR2_BR2_powerpc64le is just a typo (who am I to complain about typoes?).

I fixed those, and did quite some changes too:

  - BR2_ARM_CPU_ARMV8M does not exist
  - BR2_BR2_powerpc64le misspelled
  - move all arch dependencies to BR2_PACKAGE_CRIU_ARCH_SUPPORTS
  - comment hidden with arch dependencies
  - select host-python3, don't depend on it
  - extend legal-info: LPLG-2.1 for lib/, MIT for images/
  - PREFIX is also used at compile time for PLUGINDIR
  - copy .proto file, rather than symlinking
  - wrap long lines

Please have a look at the resulting package and check I did not totally
bork it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
>     6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>     
>     v5:
>     - Remove support for s390 arch
>     - Depend on BR2_HOST_GCC_AT_LEAST_8
>     - Depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
>     - Depend on !BR2_TOOLCHAIN_USES_UCLIBC
>     - Use BR2_NORMALIZED_ARCH instead of BR2_ARCH
>     
>     v6:
>     - Replace dependency BR2_HOST_GCC_AT_LEAST_8 with BR2_TOOLCHAIN_GCC_AT_LEAST_8
>     - Remove dependency BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>     - Reflect changes in comment
> 
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/criu/Config.in | 53 +++++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 ++
>  package/criu/criu.mk   | 71 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 129 insertions(+)
>  create mode 100644 package/criu/Config.in
>  create mode 100644 package/criu/criu.hash
>  create mode 100644 package/criu/criu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 57015e245e..2047827bd9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2007,6 +2007,7 @@ F:	support/testing/tests/package/test_python_pytest.py
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
> index 0000000000..fbc66d322b
> --- /dev/null
> +++ b/package/criu/Config.in
> @@ -0,0 +1,53 @@
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
> +	#CRIU has "some" support for s390 but it is not included due to
> +	#BE/LE endian issues.
> +
> +menuconfig BR2_PACKAGE_CRIU
> +	bool "criu"
> +	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
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
> +comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
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
> +sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
> +sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
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
> +	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
> +	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define CRIU_INSTALL_TARGET_CMDS
> +	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install-criu install-lib install-compel
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.42.0
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
