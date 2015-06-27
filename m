From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 12:24:10 +0200
Subject: [Buildroot] [PATCH 1/4] arm: update processor types
In-Reply-To: <1435340002-20396-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1435340002-20396-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150627102410.GB3565@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2015-06-26 14:33 -0300, Guido Mart?nez spake thusly:
> Add the Cortex M3 variant. These microcontrollers don't support regular
> ARM instructions and don't have an MMU.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.arm | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index a2f00d2..9aa23a3 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -146,6 +146,10 @@ config BR2_cortex_a15
>  	select BR2_ARM_CPU_HAS_THUMB2
>  	select BR2_ARM_CPU_ARMV7A
>  	select BR2_ARCH_HAS_MMU_OPTIONAL
> +config BR2_cortex_m3
> +	bool "cortex-M3"
> +	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_HAS_THUMB2
>  config BR2_fa526
>  	bool "fa526/626"
>  	select BR2_ARM_CPU_HAS_ARM
> @@ -408,6 +412,7 @@ config BR2_GCC_TARGET_CPU
>  	default "cortex-a9"	if BR2_cortex_a9
>  	default "cortex-a12"	if BR2_cortex_a12
>  	default "cortex-a15"	if BR2_cortex_a15
> +	default "cortex-m3"	if BR2_cortex_m3
>  	default "fa526"		if BR2_fa526
>  	default "marvell-pj4"	if BR2_pj4
>  	default "strongarm"	if BR2_strongarm
> -- 
> 2.1.4
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
