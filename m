Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE22C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61F0C40018;
	Sun, 24 Dec 2023 16:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F0C40018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KE7vyOydTpSN; Sun, 24 Dec 2023 16:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13C71400FE;
	Sun, 24 Dec 2023 16:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C71400FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8233C1BF30F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A4C400FE
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A4C400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6N4O3lb_1WE1 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:44:51 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3637B40018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3637B40018
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E83B8B0057C;
 Sun, 24 Dec 2023 17:44:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 17:44:44 +0100
Date: Sun, 24 Dec 2023 17:44:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYhf_BKuhSJPyNrJ@landeda>
References: <20231222105655.444328-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222105655.444328-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703436288;
 bh=k++VVYgPmRR+jqi/zKjrV0hj7czFfJUnq8Rif/Z5j2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=efGwlCKiFsiPHoPF04LuoMq4j+xfmkaiEsQss/ZuUOxYZRIH2RJU2qNyNuFqpjXAn
 e6zYaMmK7bXHVaPxRuoResgj89d6feFrVsaL0Qs9ImSCDwt4DmAfKTBgqg1H5VtSb0
 qXEYBOooRPasEo6eisYAyuslWcDw9A7bjJYYLliQk2Nni5evxxLpNUk/1vfqia+9rN
 VQI9xaFOrB5TTkqJhj6o0IoqdYW2aiT60Dd89W2ciRG1aPcnnALh6Na8wEbV0ROWja
 9/ZeVRgsYPlTlgAocUUi28MBwqOFJ6uAoOr53FrzpANrjxKkV+DZKcY2ozRlw3wMIq
 lgCrYFG2xsTNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=efGwlCKi
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/edk2: add support for RISC-V
 64bit architecture
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-12-22 11:56 +0100, Julien Olivain spake thusly:
> RISC-V 64bit qemu virt machine support has been added in edk2
> version "stable202302". See [1].
> 
> Since edk2-stable202308, introduced in buildroot in commit 5c9f310
> "boot/edk2: bump to version edk2-stable202308", it is now possible
> to boot the edk2 UEFI shell in qemu.
> 
> This commit adds this early RISC-V support to edk2.

Building edk2 for risc-v is broken with per-package directories. For
example, this defconfig fails to build:

    BR2_riscv=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_TARGET_EDK2=y

The error message is (empty liens elided for brevity):

    Building ... /home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf [RISCV64]
    build.py...
     : error 7000: Failed to execute command
            make tbuild [/home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/OvmfPkg/PlatformDxe/Platform]
    build.py...
     : error F002: Failed to build module
            /home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/OvmfPkg/PlatformDxe/Platform.inf [RISCV64, GCC5, RELEASE]
    - Failed -

Of course, if one removes the PPD option, the build succeeds. So, it
hints that there is a missing dependency lying around...

I've tried to look around for obvious clues, but apart the fact that it
is failing when running a python script, I did not find anything really
obvious...

Where it gets weirder, though, is that it does work with the docker
image... So, that gives another hint about this python script that is
failing: the docker image is a Debian with python 3.9.2, but my machine
is a Fedora 39 with python 3.12.

Could you have a look, please?

Regards,
Yann E. MORIN.

> The RISC-V edk2 UEFI shell can be booted in Buildroot with the
> following commands:
> 
>     # Build EDK2 images
>     cat > .config <<EOF
>     BR2_riscv=y
>     BR2_RISCV_64=y
>     BR2_PACKAGE_HOST_QEMU=y
>     BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>     BR2_TARGET_EDK2=y
>     EOF
>     make olddefconfig
>     make
> 
>     # edk2 image size should fit the 32MB of qemu pflash memories
>     truncate -s 32M output/images/RISCV_VIRT_CODE.fd
>     truncate -s 32M output/images/RISCV_VIRT_VARS.fd
> 
>     # Start qemu:
>     output/host/usr/bin/qemu-system-riscv64 \
>         -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
>         -nographic \
>         -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
>         -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd
> 
> Note: a Qemu version >= 8.0.0 is needed to properly start edk2. A qemu
> version on the host system might not be sufficient. This is why the
> Buildroot host-qemu is built in this config example.
> 
> [1] https://github.com/tianocore/edk2/releases/tag/edk2-stable202302
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Change v1 -> v2:
> - Fix 2 typos in the commit log, as reported by Thomas in [2]
> 
> Even if Thomas said a v2 was not necessary, I'm resending anyway.
> Since this patch was sent few months back, I successfully
> rechecked this patch on top of master branch at commit e59346f with
> the commands from the commit log.
> 
> Also, the recent release of Grub 2.12 in [3] includes many fixes to
> allow a full RV64 EFI Linux Kernel boot. This patch will be
> necessary to do so. This new grub release is the reason of this v2.
> 
> [2] https://lists.buildroot.org/pipermail/buildroot/2023-September/674103.html
> [3] https://git.savannah.gnu.org/cgit/grub.git/tree/NEWS?h=grub-2.12
> ---
>  boot/edk2/Config.in | 10 ++++++++++
>  boot/edk2/edk2.mk   |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index bed503b168..4e6e7d122c 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -2,6 +2,7 @@ config BR2_TARGET_EDK2_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_aarch64
>  	default y if BR2_i386
> +	default y if BR2_RISCV_64
>  	default y if BR2_x86_64
>  
>  config BR2_TARGET_EDK2
> @@ -20,6 +21,7 @@ if BR2_TARGET_EDK2
>  choice
>  	prompt "Platform"
>  	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
> +	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
>  	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
>  	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
>  
> @@ -31,6 +33,14 @@ config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
>  	  This platform will boot from flash address 0x0.
>  	  It should therefore be used as the first bootloader.
>  
> +config BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV
> +	bool "RISC-V"
> +	depends on BR2_RISCV_64
> +	help
> +	  Platform configuration for RISC-V QEMU targeting the Virt
> +	  machine. This platform will only boot from flash address
> +	  0x0. It should therefore be used as the first bootloader.
> +
>  config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
>  	bool "x86-64"
>  	depends on BR2_x86_64
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index 186854a14c..efdb4d02ce 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -136,6 +136,12 @@ define EDK2_PRE_BUILD_QEMU_SBSA
>  	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa/
>  endef
>  
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV),y)
> +EDK2_ARCH = RISCV64
> +EDK2_PACKAGE_NAME = OvmfPkg/RiscVVirt
> +EDK2_PLATFORM_NAME = RiscVVirtQemu
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +
>  endif
>  
>  EDK2_BASETOOLS_OPTS = \
> -- 
> 2.43.0
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
