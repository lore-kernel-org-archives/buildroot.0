From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:27:29 +0100
Subject: [Buildroot] [PATCH master 3/3] MIPS: rename M6201 core to M6250
In-Reply-To: <20161108103258.32196-3-Vincent.Riera@imgtec.com>
References: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
 <20161108103258.32196-3-Vincent.Riera@imgtec.com>
Message-ID: <931f8c67-a2be-8d23-43b6-3c94451e0daf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:32, Vicente Olivert Riera wrote:
> m6201 is the -march option for GCC, but the real core name is
> M6250.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  arch/Config.in.mips        | 6 +++---
>  package/gcc/Config.in.host | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index f407d9a..c14a133 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -51,8 +51,8 @@ config BR2_mips_m5150
>  	bool "M5150"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R5
> -config BR2_mips_m6201
> -	bool "M6201"
> +config BR2_mips_m6250
> +	bool "M6250"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R6
>  config BR2_mips_p5600
> @@ -130,7 +130,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "mips32r6"	if BR2_mips_32r6
>  	default "interaptiv"	if BR2_mips_interaptiv
>  	default "m5101"		if BR2_mips_m5150
> -	default "m6201"		if BR2_mips_m6201
> +	default "m6201"		if BR2_mips_m6250
>  	default "p5600"		if BR2_mips_p5600
>  	default "mips64"	if BR2_mips_64
>  	default "mips64r2"	if BR2_mips_64r2
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index eb1479a..0a63e6a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -65,7 +65,7 @@ choice
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		# Unsupported MIPS cores
>  		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
> -			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
> +			!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
>  		# musl mips64 unsupported
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
> @@ -76,7 +76,7 @@ choice
>  		depends on !BR2_arc
>  		depends on !BR2_microblaze
>  		# Unsupported MIPS cores
> -		depends on !BR2_mips_m6201 && !BR2_mips_p6600
> +		depends on !BR2_mips_m6250 && !BR2_mips_p6600
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  
>  endchoice
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
