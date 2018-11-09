From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 17:32:39 +0100
Subject: [Buildroot] [PATCH] toolchain: Enable Glibc for all
 little-endian ARCs with atomic ops
In-Reply-To: <20181109140023.21402-1-abrodkin@synopsys.com>
References: <20181109140023.21402-1-abrodkin@synopsys.com>
Message-ID: <20181109173239.75ccae8f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Nov 2018 17:00:23 +0300, Alexey Brodkin wrote:

> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 7d9428c70ed0..8d6997e7790b 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>  		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
>  		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
> -		   BR2_archs38
> +		   BR2_arcle

What about:

		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)

instead ?

>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> @@ -56,6 +56,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
>  	depends on !BR2_powerpc_SPE
>  	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> +	depends on BR2_ARC_ATOMIC_EXT || !BR2_arc

and drop this dependency ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
