From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:25:58 +0100
Subject: [Buildroot] [PATCH master 2/3] MIPS: rename M5101 core to M5150
In-Reply-To: <20161108103258.32196-2-Vincent.Riera@imgtec.com>
References: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
 <20161108103258.32196-2-Vincent.Riera@imgtec.com>
Message-ID: <1d4c72c1-ad51-a51e-94da-917566b6cd91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:32, Vicente Olivert Riera wrote:
> m5101 is the -march option for GCC, but the real core name is M5150.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

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
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
