From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Nov 2016 16:44:03 +0100
Subject: [Buildroot] [PATCH master 2/3] MIPS: rename M5101 core to M5150
In-Reply-To: <20161108103258.32196-2-Vincent.Riera@imgtec.com>
References: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
 <20161108103258.32196-2-Vincent.Riera@imgtec.com>
Message-ID: <20161113154403.GC3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-11-08 10:32 +0000, Vicente Olivert Riera spake thusly:
> m5101 is the -march option for GCC, but the real core name is M5150.

There should have been a legacy entry for this renamed option.
ditto the 6201, in next patch.

I'll send a patch for that in a m moment.

Regards,
Yann E. MORIN.

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips                    | 6 +++---
>  package/gcc/Config.in.host             | 2 +-
>  toolchain/toolchain-external/Config.in | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 289e35d..f407d9a 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -47,8 +47,8 @@ config BR2_mips_interaptiv
>  	bool "interAptiv"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R2
> -config BR2_mips_m5101
> -	bool "M5101"
> +config BR2_mips_m5150
> +	bool "M5150"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R5
>  config BR2_mips_m6201
> @@ -129,7 +129,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "mips32r5"	if BR2_mips_32r5
>  	default "mips32r6"	if BR2_mips_32r6
>  	default "interaptiv"	if BR2_mips_interaptiv
> -	default "m5101"		if BR2_mips_m5101
> +	default "m5101"		if BR2_mips_m5150
>  	default "m6201"		if BR2_mips_m6201
>  	default "p5600"		if BR2_mips_p5600
>  	default "mips64"	if BR2_mips_64
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index f46656c..eb1479a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -64,7 +64,7 @@ choice
>  		# musl ppc64 unsupported
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		# Unsupported MIPS cores
> -		depends on !BR2_mips_interaptiv && !BR2_mips_m5101 && \
> +		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
>  			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
>  		# musl mips64 unsupported
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 22f760b..476b37b 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -530,7 +530,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>  		BR2_x86_64
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	# Unsupported MIPS cores
> -	depends on !BR2_mips_interaptiv && !BR2_mips_m5101
> +	depends on !BR2_mips_interaptiv && !BR2_mips_m5150
>  	# Unsupported for MIPS R6
>  	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
>  	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> -- 
> 2.10.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
