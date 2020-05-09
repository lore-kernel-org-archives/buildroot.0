From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 12:05:28 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot: enable
 uclibc for riscv64
In-Reply-To: <20200508103338.16391-1-mark@dibsco.co.uk>
References: <20200508103338.16391-1-mark@dibsco.co.uk>
Message-ID: <20200509120528.6ff5c45f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 11:33:37 +0100
Mark Corbin <mark@dibsco.co.uk> wrote:

>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc-ng"
> -	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> -		   BR2_arm     || BR2_armeb    || \
> -		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
> -		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> -		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
> -		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
> +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle      || BR2_arceb    || \
> +		   BR2_arm     || BR2_armeb      || \
> +		   BR2_i386    || BR2_m68k       || BR2_microblaze || \
> +		   BR2_mips    || BR2_mipsel     || BR2_mips64     || BR2_mips64el || \
> +		   BR2_or1k    || BR2_powerpc    || BR2_riscv      || \
> +		   BR2_sh2a    || BR2_sh4	 || BR2_sh4eb      || BR2_sparc    || \
> +		   BR2_xtensa  || BR2_x86_64
> +	depends on BR2_ARCH_IS_64 || !BR2_riscv

I think we really want to keep a single "depends on", so just add:

	.... || (BR2_riscv && BR2_ARCH_IS_64) ||

or simpler:

	.... || BR2_RISCV_64 || ...

You could also use BR2_RISCV_64 in package/uclibc/Config.in.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
