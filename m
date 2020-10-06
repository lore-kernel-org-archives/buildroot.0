From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:40:12 +0200
Subject: [Buildroot] [PATCH v2 1/6] toolchain/buildroot: allow uclibc-ng
 for riscv
In-Reply-To: <20200908113324.1022230-2-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-2-damien.lemoal@wdc.com>
Message-ID: <20201006234012.6b3c2697@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Sep 2020 20:33:19 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index de2885bc92..35b1cb8e2f 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -106,6 +106,8 @@ config BR2_UCLIBC_TARGET_ARCH
>  	default "xtensa"   if BR2_xtensa
>  	default "i386"	   if BR2_i386
>  	default "x86_64"   if BR2_x86_64
> +	default "riscv64"  if BR2_riscv && BR2_ARCH_IS_64
> +	default "riscv32"  if BR2_riscv && !BR2_ARCH_IS_6

There was a typo here: BR2_ARCH_IS_6 was truncated.

> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 418d5cb387..49f67c7348 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -32,7 +32,9 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
>  		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>  		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
> -		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
> +		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64  || \
> +		   BR2_riscv

I fixed the alphabetic ordering.

> +

Dropped the empty new line.

And applied with some small improvements to the commit log as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
