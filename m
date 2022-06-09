Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31042C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 03:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDFDC81356;
	Thu,  9 Jun 2022 03:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGcjXjepQ9k4; Thu,  9 Jun 2022 03:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEB0812B7;
	Thu,  9 Jun 2022 03:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CED51BF982
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 03:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C443605A1
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 03:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5A2x7JZ57U3g for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 03:28:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9F846003C
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 03:28:29 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 2593SGDc094395;
 Thu, 9 Jun 2022 11:28:16 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from Thinkpad-L14 (192.168.21.66) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 9 Jun 2022
 11:28:16 +0800
Date: Thu, 9 Jun 2022 11:30:01 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, <buildroot@buildroot.org>
Message-ID: <YqFpOReIrNA+mpYb@Thinkpad-L14>
References: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
 <20220607205921.3312256-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607205921.3312256-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/2.2.5 (a8c7fba1) (2022-05-16)
X-Originating-IP: [192.168.21.66]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 2593SGDc094395
Subject: Re: [Buildroot] [PATCH 3/3] Remove support for the NDS32
 architecture
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
Cc: alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jun 07, 2022 at 10:59:20PM +0200, Thomas Petazzoni wrote:
> The support for this architecture has been removed from the upstream
> Linux kernel, as of commit:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aec499c75cf8e0b599be4d559e6922b613085f8f
> 
> Which states:
> 
>   The nds32 architecture, also known as AndeStar V3, is a custom
>   32-bit RISC target designed by Andes Technologies. Support was added
>   to the kernel in 2016 as the replacement RISC-V based V5 processors
>   were already announced, and maintained by (current or former) Andes
>   employees.
> 
>   As explained by Alan Kao, new customers are now all using RISC-V,
>   and all known nds32 users are already on longterm stable kernels
>   provided by Andes, with no development work going into mainline
>   support any more.
> 
> There has also been little to no maintenance done in Buildroot for
> this architecture in recent times, so let's follow the Linux kernel
> community decision and drop support for this CPU architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

Regards,
Peter Lin

> ---
>  Config.in.legacy                         | 10 ++++++++++
>  DEVELOPERS                               |  1 -
>  arch/Config.in                           | 12 ------------
>  arch/Config.in.nds32                     | 17 -----------------
>  docs/manual/known-issues.txt             |  2 +-
>  package/dhcpcd/Config.in                 |  1 -
>  package/gdb/Config.in                    |  1 -
>  package/gdb/Config.in.host               |  1 -
>  package/libbsd/Config.in                 |  1 -
>  package/postgresql/postgresql.mk         |  2 +-
>  package/strace/Config.in                 |  2 +-
>  package/uclibc-ng-test/uclibc-ng-test.mk |  2 +-
>  utils/genrandconfig                      |  3 ---
>  13 files changed, 14 insertions(+), 41 deletions(-)
>  delete mode 100644 arch/Config.in.nds32
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 853a8917be..8d4c7eebbd 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,16 @@ endif
>  
>  ###############################################################################
>  
> +comment "Legacy options removed in 2022.08"
> +
> +config BR2_nds32
> +	bool "nds32 architecture removed"
> +	select BR2_LEGACY
> +	help
> +	  Support for the nds32 architecture has been removed, due to
> +	  its support being removed from the upstream Linux kernel,
> +	  and its lack of maintenance in Buildroot.
> +
>  comment "Legacy options removed in 2022.05"
>  
>  config BR2_PACKAGE_KTAP
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 078fa8a03e..1acd2a1d71 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2162,7 +2162,6 @@ F:	package/systemd/
>  F:	package/tcf-agent/
>  
>  N:	Yu Chien Peter Lin <peterlin@andestech.com>
> -F:	arch/Config.in.nds32
>  F:	board/andes
>  F:	configs/andes_ae350_45_defconfig
>  
> diff --git a/arch/Config.in b/arch/Config.in
> index 49e16fce38..46d7431a45 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -153,14 +153,6 @@ config BR2_mips64el
>  	  http://www.mips.com/
>  	  http://en.wikipedia.org/wiki/MIPS_Technologies
>  
> -config BR2_nds32
> -	bool "nds32"
> -	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
> -	select BR2_ARCH_HAS_MMU_MANDATORY
> -	help
> -	  nds32 is a 32-bit architecture developed by Andes Technology.
> -	  https://en.wikipedia.org/wiki/Andes_Technology
> -
>  config BR2_nios2
>  	bool "Nios II"
>  	select BR2_ARCH_HAS_MMU_MANDATORY
> @@ -449,10 +441,6 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
>  source "arch/Config.in.mips"
>  endif
>  
> -if BR2_nds32
> -source "arch/Config.in.nds32"
> -endif
> -
>  if BR2_nios2
>  source "arch/Config.in.nios2"
>  endif
> diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
> deleted file mode 100644
> index 0babb2cf7f..0000000000
> --- a/arch/Config.in.nds32
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -config BR2_ARCH
> -	default "nds32le"
> -
> -config BR2_NORMALIZED_ARCH
> -	default "nds32"
> -
> -config BR2_GCC_TARGET_ARCH
> -	default "v3"
> -
> -config BR2_ENDIAN
> -	default "LITTLE"
> -
> -config BR2_READELF_ARCH_NAME
> -	default "Andes Technology compact code size embedded RISC processor family"
> -
> -# vim: ft=kconfig
> -# -*- mode:kconfig; -*-
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index 616430b91c..743b794e87 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -7,7 +7,7 @@
>    if such options contain a +$+ sign. For example, the following is known
>    to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
>  
> -* The +libffi+ package is not supported on the SuperH 2, nds32, and ARMv7-M
> +* The +libffi+ package is not supported on the SuperH 2 and ARMv7-M
>    architectures.
>  
>  * The +prboom+ package triggers a compiler failure with the SuperH 4
> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> index 3ebacb3ba2..8612d4ba81 100644
> --- a/package/dhcpcd/Config.in
> +++ b/package/dhcpcd/Config.in
> @@ -20,7 +20,6 @@ config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
>  		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
>  	depends on !(BR2_microblazeel || BR2_microblazebe) || \
>  		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> -	depends on !BR2_nds32 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
>  	depends on !BR2_nios2 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
>  	depends on !BR2_or1k || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>  	depends on !BR2_sh || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index daad6c910d..a39837fe71 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>  	depends on !BR2_microblaze
>  	depends on !BR2_or1k
> -	depends on !BR2_nds32
>  
>  comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
>  	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index d3dea0b0a7..43af64a1ed 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>  	depends on !BR2_microblaze
>  	depends on !BR2_or1k
> -	depends on !BR2_nds32
>  
>  comment "Host GDB Options"
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> index 093a2e646c..9f4b30f68c 100644
> --- a/package/libbsd/Config.in
> +++ b/package/libbsd/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
>  	depends on !BR2_microblaze
>  	depends on !BR2_arc
>  	depends on !BR2_xtensa
> -	depends on !BR2_nds32
>  
>  config BR2_PACKAGE_LIBBSD
>  	bool "libbsd"
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 45049f669d..88be76180a 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -42,7 +42,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
>  POSTGRESQL_CONF_OPTS += --disable-thread-safety
>  endif
>  
> -ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa)$(BR2_nds32),y)
> +ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa),y)
>  POSTGRESQL_CONF_OPTS += --disable-spinlocks
>  endif
>  
> diff --git a/package/strace/Config.in b/package/strace/Config.in
> index c394d4c398..dc245c7297 100644
> --- a/package/strace/Config.in
> +++ b/package/strace/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_STRACE
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
>  	# needs at least kernel headers 5.0 on xtensa
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
> -	depends on !BR2_nds32 && !BR2_RISCV_32
> +	depends on !BR2_RISCV_32
>  	help
>  	  A useful diagnostic, instructional, and debugging tool.
>  	  Allows you to track what system calls a program makes
> diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
> index ea5f224219..6a658b4293 100644
> --- a/package/uclibc-ng-test/uclibc-ng-test.mk
> +++ b/package/uclibc-ng-test/uclibc-ng-test.mk
> @@ -39,7 +39,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
>  endif
>  # no TLS macros available
> -ifeq ($(BR2_nds32)$(BR2_s390x),y)
> +ifeq ($(BR2_s390x),y)
>  UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1
>  endif
>  
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index cf43778183..6f748fa709 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -246,9 +246,6 @@ def fixup_config(sysinfo, configfile):
>      if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
>         'BR2_PACKAGE_LIBFFI=y\n' in configlines:
>          return False
> -    if 'BR2_nds32=y\n' in configlines and \
> -       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
> -        return False
>      if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
>          configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
>          configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
> -- 
> 2.35.3
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
