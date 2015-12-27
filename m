From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 20:58:24 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM11 MPCore CPU target support
In-Reply-To: <BLU437-SMTP123CD239C2AFC2F2A7D66EC1020@phx.gbl>
References: <BLU437-SMTP123CD239C2AFC2F2A7D66EC1020@phx.gbl>
Message-ID: <20151227195824.GJ3483@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergi, All,

On 2015-11-28 15:55 +0100, Sergi Granell spake thusly:
> gcc differentiates the mpcore-with-vfp from the mcpore-without-vfp
> CPUs. The former is named just 'mpcore', while the latter is named
> 'mpcorenovfp'.
> 
> We only add one entry, 'mpcore' and let the user select whether or
> not to use the VFP. We then name the CPU according to the user's
> selection.
> 
> Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.arm | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 67ff384..1bf1fe2 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -104,6 +104,13 @@ config BR2_arm1176jzf_s
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_ARMV6
>  	select BR2_ARCH_HAS_MMU_OPTIONAL
> +config BR2_arm11mpcore
> +	bool "mpcore"
> +	select BR2_ARM_CPU_HAS_ARM
> +	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
> +	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
> +	select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a5
>  	bool "cortex-A5"
>  	select BR2_ARM_CPU_HAS_ARM
> @@ -419,6 +426,8 @@ config BR2_GCC_TARGET_CPU
>  	default "arm1136jf-s"	if BR2_arm1136jf_s
>  	default "arm1176jz-s"	if BR2_arm1176jz_s
>  	default "arm1176jzf-s"	if BR2_arm1176jzf_s
> +	default "mpcore"	if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
> +	default "mpcorenovfp"	if BR2_arm11mpcore
>  	default "cortex-a5"	if BR2_cortex_a5
>  	default "cortex-a7"	if BR2_cortex_a7
>  	default "cortex-a8"	if BR2_cortex_a8
> -- 
> 2.6.2
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
