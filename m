Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A17EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0981440407;
	Sun, 10 Sep 2023 21:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0981440407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6Db9YPdp5DS; Sun, 10 Sep 2023 21:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114E0404B2;
	Sun, 10 Sep 2023 21:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114E0404B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED6631BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D323360B06
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D323360B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoLhc_e30jpg for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:37:53 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00BBE606EC
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BBE606EC
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EF7782003DA;
 Sun, 10 Sep 2023 23:37:47 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39364])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Sep 2023 23:37:47 +0200
MIME-Version: 1.0
Date: Sun, 10 Sep 2023 23:37:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20230910193725.1435827-1-marcus.folkesson@gmail.com>
References: <20230910193725.1435827-1-marcus.folkesson@gmail.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <e1d80899a049d9f0822ce783429613e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694381870;
 bh=1xD9rQUA6EMJ0gqyto77nsqKH8Tf0vAYrIbgRQEfLbQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fxem8d/olNSQ+LQIWXY6fqPvrp8nbKrJV6t3MAewRITvTRWNoWz7GDeAHxVIa9MMK
 Mraw7yNapvfr2hc3UPkXwm6iz2ZNpb+8/vRw4LBPJNDrF9Na4q0wM7ww3QhTSbielJ
 EH3lRTx+aHGDT+B3J4iqHc9r55VMY07UdbZpkfAB8WtLuRxvR9h+uGrYev9TklUQHI
 Y5Hxk5qmPSWz0E9bYB50gYZe/npL+xQr3OstgjTS1Ko2ZcwRceORnEjxuqy59hnboH
 Qhd5OQivGtARUtb/A/2XiCKcf+QimArEP9MAINyvZbaYA3TA1M98t3YWujI3Sy8or9
 53si3H+obhjhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fxem8d/o
Subject: Re: [Buildroot] [PATCH v2] package/criu: new package
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

criu requires the Kernel to have the checkpoint/restore support.
This support is disabled by default in the Kernel. It could be
convenient to automatically enable it, when this package is
selected. See below.

On 10/09/2023 21:37, Marcus Folkesson wrote:
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
> 
>     - Addressed comments from Thomas.
>     - Tested on ARM target and on x86_64 with qemu.
> 
>     test-pkg skips test though, and I'm not sure why.
>     $ utils/test-pkg -d ~/mnt/encwork/git/br-test-pkg/ -p criu
>                         bootlin-armv5-uclibc [1/6]: SKIPPED
>                          bootlin-armv7-glibc [2/6]: SKIPPED
>                        bootlin-armv7m-uclibc [3/6]: SKIPPED
>                          bootlin-x86-64-musl [4/6]: SKIPPED
>                           br-arm-full-static [5/6]: SKIPPED
>                                 sourcery-arm [6/6]: SKIPPED
> 
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/criu/Config.in | 44 +++++++++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 +++
>  package/criu/criu.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 package/criu/Config.in
>  create mode 100644 package/criu/criu.hash
>  create mode 100644 package/criu/criu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3af43d2d27..cf7cb9718a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2050,6 +2050,7 @@ 
> F:	support/testing/tests/package/test_python_pytest.py
>  F:	support/testing/tests/package/test_python_pytest_asyncio.py
> 
>  N:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +F:	package/criu/
>  F:	package/libcamera/
>  F:	package/libcamera-apps/
>  F:	package/libostree/
> diff --git a/package/Config.in b/package/Config.in
> index b21a2f8c65..c6c809f59c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2665,6 +2665,7 @@ menu "System tools"
>  	source "package/coreutils/Config.in"
>  	source "package/cpulimit/Config.in"
>  	source "package/cpuload/Config.in"
> +	source "package/criu/Config.in"
>  	source "package/crun/Config.in"
>  	source "package/daemon/Config.in"
>  	source "package/dc3dd/Config.in"
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> new file mode 100644
> index 0000000000..932e65863e
> --- /dev/null
> +++ b/package/criu/Config.in
> @@ -0,0 +1,44 @@
> +# criu only builds on certain architectures
> +config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm
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
> index 0000000000..095ff8e290
> --- /dev/null
> +++ b/package/criu/criu.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# CRIU
> +#
> +################################################################################
> +
> +CRIU_VERSION = 3.18
> +CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz
> +CRIU_SITE = 
> https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)
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

You can add a Linux Kernel config fixup, for example:

     # Criu needs Kernel Checkpoint/restore support which is not enabled
     # by default.
     define CRIU_LINUX_CONFIG_FIXUPS
             $(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
     endef

Without this kernel option set, running criu checks fails:

     criu check
     ...
     Error (criu/cr-check.c:158): sys/kernel/ns_last_pid sysctl is 
inaccessible: No such file or directory
     Warn  (criu/cr-check.c:1447): Does not look good.

With this option, criu check shows:

     Looks good.

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

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
