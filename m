Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D736C3DA7A
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2125A400E2;
	Thu, 29 Dec 2022 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2125A400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id salPxYUR3lIr; Thu, 29 Dec 2022 21:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDA6400E3;
	Thu, 29 Dec 2022 21:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDA6400E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81A211BF2AB
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4D6400E3
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 21:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4D6400E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rrk1KzLxhfQv for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 21:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4837400E2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4837400E2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 21:46:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8b2:164d:cd47:a5be])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD95CB00533;
 Thu, 29 Dec 2022 22:46:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 29 Dec 2022 22:46:11 +0100
Date: Thu, 29 Dec 2022 22:46:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20221229214611.GJ2498764@scaer>
References: <20221227114842.2620182-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227114842.2620182-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672350374;
 bh=EXzXVbX4pNbmaeBpa3jIft0jD4LbFxG5XRcAeO5ITWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBCe5fHzmmKURq8SaGJAXpu5XLx+RsksBpV/aCV8DPqwttn/5KLBjrxDDMgb11gCv
 MSpZWafMRCmHoiElQyV7aXjpkx+twSVJ5RGUOJOYYAD6kv39JFLh9vUWi003gNgb6J
 2lBXCW0Fix9sptWOLhhRUWgg2/D+MgdcXthrZHt+LgdHNo0TBy0P2uP/QJI5u8qQam
 lKCb1CK54rc8bCgndjPkfAcJwdsjwyFEig1nV4fBdnDnxsHwS6v2Jx2Xa7aj0dcS4e
 uZYw3GmU6DHuT/XFIQvPVSKpScW4IeUSV+EQK5wN7kh0GjTYyZyQwk23j9TBmqYLr6
 fvQ6d6sLuujnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oBCe5fHz
Subject: Re: [Buildroot] [PATCH v2] package/qemu: refactor target emulator
 selection
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2022-12-27 08:48 -0300, unixmania@gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The current mechanism to select emulation targets works this way:
> 
> - BR2_PACKAGE_QEMU_SYSTEM selects the "system" (softmmu) targets. It
>   selects FDT and creates a dependency on the "dtc" package but this is
>   not always necessary. Only 14 system targets, out of 31, actually
>   require FDT.
> 
> - BR2_PACKAGE_QEMU_LINUX_USER selects the "linux-user" targets. It does
>   not select FDT, which is not required by linux-user emulators.
> 
> - Alternatively, we fill BR2_PACKAGE_QEMU_CUSTOM_TARGETS with a list of
>   emulators (e.g.  "x86_64-softmmu x86_64-linux-user"). Then we pass
>   "--enable-system --enable-linux-user --target-list="..." to the
>   configure script, so QEMU builds its list of default targets, from
>   which it checks if the specified subset is valid.
> 
> Since CUSTOM_TARGETS does not select FDT, we can get build errors like
> this:
> 
>   ../meson.build:2778:2: ERROR: Problem encountered: fdt not available but required by targets x86_64-softmmu
> 
> We could select FDT when CUSTOM_TARGETS is set, but this would force an
> unnecessary dependency on dtc, as BR2_PACKAGE_QEMU_SYSTEM does.
> 
> In order to fix these problems, refactor the package configuration:
> 
> - Keep BR2_PACKAGE_QEMU_SYSTEM and BR2_PACKAGE_QEMU_LINUX_USER, which by
>   default build all corresponding target emulators.
> 
> - Add a BR2_PACKAGE_QEMU_CHOOSE_TARGETS config, to permit choosing the
>   desired emulators.
> 
> - Add configs for each supported target. They select FDT, when needed.
> 
> - Move QEMU to a separate menu, since the number of configuration itens
>   became too large.
> 
> - Select BR2_LEGACY if BR2_PACKAGE_QEMU_CUSTOM_TARGETS is set, because
>   this situation requires user intervention to reconfigure the package.
> 
> - Reorganize the make file accordingly. Selecting CHOOSE_TARGETS without
>   choosing at least one emulator is considered an error.

This commit log is more descriptive than explanatory; for example, it
ususally is not necessary to describe a change such as "we add an option
FOO": it is relatively obvious that an option FOO has been added.

What is important in a commit log, is to explain why the change is done
that way.

For example, I'd have liked explanations why we did not have individual
targets that select SYSTEM/USER rather than depend on it, like:

    menuconfig QEMU
        bool "qemu"

    if QEMU

    config QEMU_SYSTEM
        bool "system emulation"
    config QEMU_USER
        bool "user emulation"

    config QEMU_CHOOSE
        bool "chose individual targets"
    if QEMU_CHOOSE
    config QEMU_aarch64
        bool "aarch64"
        select QEMU_SYSTEM
        select QEMU_USER
    config QEMU_aarch64_be
        bool "aarch64_be"
        select QEMU_USER
    # and so on...
    endif # QEMU_CHOOSE

    endif # QEMU

I guess that's because it makes things a bit more complex to handle in
menuconfig, but I forgot to explain that in the commit log before I
pushed...

> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master with a few changes:
  - always build at least user or system
  - add help text to BR2_PACKAGE_QEMU_CHOOSE_TARGETS
  - simplify prompt for BR2_PACKAGE_QEMU_CHOOSE_TARGETS
  - simplify list of targets with unique QEMU_TARGET_LIST_y
  - extend the commit log with "Notes about the list of enabled targets"

Regards,
Yann E. MORIN.

> ---
> Changes v1->v2:
> - Rebase
> - Fix Config.in.legacy after rebase
> ---
>  Config.in.legacy       |  11 ++
>  package/qemu/Config.in | 282 ++++++++++++++++++++++++++++++++++-------
>  package/qemu/qemu.mk   |  99 +++++++++++++--
>  3 files changed, 332 insertions(+), 60 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ca25c18b16..6d66f1b958 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,17 @@ endif
>  
>  comment "Legacy options removed in 2023.02"
>  
> +config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
> +	string "the QEMU specific targets option has been removed"
> +	help
> +	  This option has been replaced by a list of individual targets
> +	  for the many architectures supported by QEMU.
> +
> +config BR2_PACKAGE_QEMU_CUSTOM_TARGETS_WRAP
> +	bool
> +	default y if BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
> +	select BR2_LEGACY
> +
>  config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
>  	bool "xf86-input-keyboard removed"
>  	help
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 15d6c7d6b5..d1c8234e98 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -17,7 +17,7 @@ comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
>  	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR) || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
> -config BR2_PACKAGE_QEMU
> +menuconfig BR2_PACKAGE_QEMU
>  	bool "QEMU"
>  	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
> @@ -49,20 +49,13 @@ if BR2_PACKAGE_QEMU
>  
>  comment "Emulators selection"
>  
> -config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
> -	string "Enable specific targets"
> +config BR2_PACKAGE_QEMU_SYSTEM
> +	bool "Enable systems emulation"
> +	depends on !BR2_STATIC_LIBS # dtc
>  	help
> -	  Enter here the list of QEMU targets you want to build. For
> -	  example:
> +	  Say 'y' to build system emulators/virtualisers.
>  
> -	    System emulation      | User-land emulation
> -	    ----------------------+-----------------------
> -	    i386-softmmu          | i386-linux-user
> -	    arm-softmmu           | ppc-linux-user
> -	    x86_64-softmmu        | sparc-bsd-user
> -	    ...                   | ...
> -
> -comment "Networking options"
> +if BR2_PACKAGE_QEMU_SYSTEM
>  
>  config BR2_PACKAGE_QEMU_SLIRP
>  	bool "Enable user mode networking (SLIRP)"
> @@ -87,69 +80,260 @@ config BR2_PACKAGE_QEMU_SLIRP
>  	  Notice that this option does not disable other networking
>  	  modes.
>  
> -if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
> -
> -comment "... or you can select emulator families to enable, below:"
> +config BR2_PACKAGE_QEMU_SDL
> +	bool "Enable SDL frontend"
> +	select BR2_PACKAGE_SDL2
> +	help
> +	  Say 'y' to enable the SDL frontend, that is, a graphical
> +	  window presenting the VM's display.
>  
> -config BR2_PACKAGE_QEMU_SYSTEM
> -	bool "Enable all systems emulation"
> -	depends on !BR2_STATIC_LIBS # dtc
> -	select BR2_PACKAGE_QEMU_FDT
> +config BR2_PACKAGE_QEMU_FDT
> +	bool "Enable FDT"
> +	select BR2_PACKAGE_DTC
>  	help
> -	  Say 'y' to build all system emulators/virtualisers that QEMU
> -	  supports.
> +	  Say 'y' here to have QEMU capable of constructing Device
> +	  Trees, and passing them to the VMs.
> +
> +endif # BR2_PACKAGE_QEMU_SYSTEM
>  
>  comment "systems emulation needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_QEMU_LINUX_USER
> -	bool "Enable all Linux user-land emulation"
> +	bool "Enable Linux user-land emulation"
>  	# Incompatible "struct sigevent" definition on musl
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	help
> -	  Say 'y' to build all Linux user-land emulators that QEMU
> -	  supports.
> +	  Say 'y' to build Linux user-land emulators.
>  
>  # Note: bsd-user can not be build on Linux
>  
>  comment "Linux user-land emulation needs a glibc or uClibc toolchain"
>  	depends on BR2_TOOLCHAIN_USES_MUSL
>  
> -endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
> +config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
> +	bool "Choose emulator targets (default is to enable all)"
> +	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
>  
> -config BR2_PACKAGE_QEMU_HAS_EMULS
> -	def_bool y
> -	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
> +if BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>  
> -if BR2_PACKAGE_QEMU_HAS_EMULS
> +config BR2_PACKAGE_QEMU_TARGET_AARCH64
> +	bool "aarch64"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  ARM 64-bit architecture.
>  
> -comment "Frontends"
> +config BR2_PACKAGE_QEMU_TARGET_AARCH64_BE
> +	bool "aarch64_be (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  ARM 64-bit architecture, big-endian.
>  
> -config BR2_PACKAGE_QEMU_SDL
> -	bool "Enable SDL frontend"
> -	depends on !BR2_STATIC_LIBS # sdl2
> -	select BR2_PACKAGE_SDL2
> +config BR2_PACKAGE_QEMU_TARGET_ALPHA
> +	bool "alpha"
>  	help
> -	  Say 'y' to enable the SDL frontend, that is, a graphical
> -	  window presenting the VM's display.
> +	  DEC Alpha 64-bit RISC architecture.
>  
> -comment "SDL frontend needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +config BR2_PACKAGE_QEMU_TARGET_ARM
> +	bool "arm"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  ARM EABI architecture, little-endian.
>  
> -comment "Misc. features"
> +config BR2_PACKAGE_QEMU_TARGET_ARMEB
> +	bool "armeb (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  ARM EABI architecture, big-endian.
>  
> -config BR2_PACKAGE_QEMU_FDT
> -	bool "Enable FDT"
> -	depends on !BR2_STATIC_LIBS # dtc
> -	select BR2_PACKAGE_DTC
> +config BR2_PACKAGE_QEMU_TARGET_AVR
> +	bool "avr (system, only)"
> +	depends on BR2_PACKAGE_QEMU_SYSTEM
>  	help
> -	  Say 'y' here to have QEMU capable of constructing Device
> -	  Trees, and passing them to the VMs.
> +	  AVR 8-bit microcontroller architecture.
>  
> -comment "FDT support needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +config BR2_PACKAGE_QEMU_TARGET_CRIS
> +	bool "cris"
> +	help
> +	  ETRAX CRIS microcontroller architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_HEXAGON
> +	bool "hexagon (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  Qualcomm's Hexagon VLSI DSP architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_HPPA
> +	bool "hppa"
> +	help
> +	  HP PA-RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_I386
> +	bool "i386"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Intel i386 32-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_LOONGARCH64
> +	bool "loongarch64"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Loongson 64-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_M68K
> +	bool "m68k"
> +	help
> +	  Motorola 68000 architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
> +	bool "microblaze"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Xilinix MicroBlaze soft processor.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
> +	bool "microblazeel"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Xilinix MicroBlaze EL soft processor.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPS
> +	bool "mips"
> +	help
> +	  MIPS 32-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPSEL
> +	bool "mipsel"
> +	help
> +	  MIPS 32-bit architecture, little-endian.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPS64
> +	bool "mips64"
> +	help
> +	  MIPS 64-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPS64EL
> +	bool "mips64el"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  MIPS 64-bit architecture, little-endian.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPSN32
> +	bool "mipsn32 (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  MIPS N32 architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_MIPSN32EL
> +	bool "mipsn32el (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  MIPS N32 architecture, little-endian.
> +
> +config BR2_PACKAGE_QEMU_TARGET_NIOS2
> +	bool "nios2"
> +	help
> +	  Nios II architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_OR1K
> +	bool "or1k"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  OpenRISC 1000 architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_PPC
> +	bool "ppc"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  PoewerPC 32-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_PPC64
> +	bool "ppc64"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  PoewerPC 64-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_PPC64LE
> +	bool "ppc64le (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  PoewerPC 64-bit architecture, little-endian.
> +
> +config BR2_PACKAGE_QEMU_TARGET_RISCV32
> +	bool "riscv32"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  RISC-V 33-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_RISCV64
> +	bool "riscv64"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  RISC-V 64-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_RX
> +	bool "rx (system-only)"
> +	depends on BR2_PACKAGE_QEMU_SYSTEM
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Renesas Electronics RX 32-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_S390X
> +	bool "s390x"
> +	help
> +	  IBM z/Architecture 64-bit mainframe (s390x)
> +
> +config BR2_PACKAGE_QEMU_TARGET_SH4
> +	bool "sh4"
> +	help
> +	  Super-H 32-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_SH4EB
> +	bool "sh4eb"
> +	help
> +	  Super-H EB 32-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_SPARC
> +	bool "sparc"
> +	help
> +	  SPARC 32-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_SPARC32PLUS
> +	bool "sparc32plus (linux-user, only)"
> +	depends on BR2_PACKAGE_QEMU_LINUX_USER
> +	help
> +	  SPARC 32-bit RISC architecture (Sun's v8plus).
> +
> +config BR2_PACKAGE_QEMU_TARGET_SPARC64
> +	bool "sparc64"
> +	help
> +	  SPARC 64-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_TRICORE
> +	bool "tricore (system, only)"
> +	depends on BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Infineon TriCore 32-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_X86_64
> +	bool "x86_64"
> +	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
> +	help
> +	  Intel x86 64-bit architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_XTENSA
> +	bool "xtensa"
> +	help
> +	  Xtensa 32-bit RISC architecture.
> +
> +config BR2_PACKAGE_QEMU_TARGET_XTENSAEB
> +	bool "xtensaeb"
> +	help
> +	  Xtensa 32-bit RISC architecture, big-endian.
> +
> +endif # BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>  
> -endif # BR2_PACKAGE_QEMU_HAS_EMULS
> +comment "Tools selection"
>  
>  config BR2_PACKAGE_QEMU_TOOLS
>  	bool "Enable tools"
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index a991d49993..bf95b4dc62 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -30,30 +30,107 @@ QEMU_OPTS =
>  
>  QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
>  
> -# If we want to specify only a subset of targets, we must still enable all
> -# of them, so that QEMU properly builds its list of default targets, from
> -# which it then checks if the specified sub-set is valid. That's what we
> -# do in the first part of the if-clause.
> -# Otherwise, if we do not want to pass a sub-set of targets, we then need
> -# to either enable or disable -user and/or -system emulation appropriately.
> -# That's what we do in the else-clause.
> -ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
> -QEMU_OPTS += --enable-system --enable-linux-user
> -QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
> -else
> +# If we want to build all emulation targets, we just need to either enable -user
> +# and/or -system emulation appropriately.
> +# Otherwise, if we want only a subset of targets, we must still enable all of
> +# them, so that QEMU properly builds a list of default targets from which it
> +# checks if the specified sub-set is valid.
> +# That's why we check for BR2_PACKAGE_QEMU_CHOOSE_TARGETS, in the blocks below,
> +# and treat selecting it without selecting any emulation target as an error.
>  
>  ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
>  QEMU_OPTS += --enable-system
> +ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
> +QEMU_SYSTEM_TARGET_LIST = \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64),aarch64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_ALPHA),alpha-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_ARM),arm-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_AVR),avr-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_CRIS),cris-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_HPPA),hppa-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_I386),i386-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64),loongarch64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_M68K),m68k-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE),microblaze-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL),microblazeel-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS),mips-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64),mips64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64EL),mips64el-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSEL),mipsel-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_NIOS2),nios2-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_OR1K),or1k-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC),ppc-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64),ppc64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV32),riscv32-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV64),riscv64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_RX),rx-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_S390X),s390x-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4),sh4-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4EB),sh4eb-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC),sparc-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC64),sparc64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_TRICORE),tricore-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_X86_64),x86_64-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSA),xtensa-softmmu) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSAEB),xtensaeb-softmmu)
> +ifeq ("$(call qstrip,$(QEMU_SYSTEM_TARGET_LIST))","")
> +$(error "No system emulator target has ben chosen")
> +endif
> +endif
>  else
>  QEMU_OPTS += --disable-system
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
>  QEMU_OPTS += --enable-linux-user
> +ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
> +QEMU_LINUX_USER_TARGET_LIST = \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64),aarch64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE),aarch64_be-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_ALPHA),alpha-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_ARM),arm-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_ARMEB),armeb-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_CRIS),cris-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_HEXAGON),hexagon-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_HPPA),hppa-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_I386),i386-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64),loongarch64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_M68K),m68k-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE),microblaze-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL),microblazeel-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS),mips-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64),mips64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64EL),mips64el-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSEL),mipsel-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSN32),mipsn32-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSN32EL),mipsn32el-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_NIOS2),nios2-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_OR1K),or1k-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC),ppc-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64),ppc64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64LE),ppc64le-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV32),riscv32-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV64),riscv64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_S390X),s390x-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4),sh4-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4EB),sh4eb-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC),sparc-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC32PLUS),sparc32plus-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC64),sparc64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_X86_64),x86_64-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSA),xtensa-linux-user) \
> +	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSAEB),xtensaeb-linux-user)
> +ifeq ("$(call qstrip,$(QEMU_LINUX_USER_TARGET_LIST))","")
> +$(error "No user-land emulator target has ben chosen")
> +endif
> +endif
>  else
>  QEMU_OPTS += --disable-linux-user
>  endif
>  
> +# Build the list of desired targets, if any.
> +ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
> +QEMU_OPTS += --target-list="$(call qstrip,$(QEMU_SYSTEM_TARGET_LIST) $(QEMU_LINUX_USER_TARGET_LIST))"
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -- 
> 2.31.1
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
