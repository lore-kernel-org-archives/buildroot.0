From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Jul 2017 13:55:06 +0300
Subject: [Buildroot] [PATCH 2/5] arch/arm: fix defaults for AArch64 in
 64-bit mode
In-Reply-To: <354db2be118602b0b12429d6d0f897455918ea12.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
 <354db2be118602b0b12429d6d0f897455918ea12.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <20170705105506.eutzkvcalunabk2b@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Jul 05, 2017 at 12:25:34PM +0200, Yann E. MORIN wrote:
> Even in 64-bit mode we have to specify the -mcpu value.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index aaf4506d7f..e6beacf3d8 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -534,9 +534,9 @@ config BR2_GCC_TARGET_CPU
>  	default "strongarm"	if BR2_strongarm
>  	default "xscale"	if BR2_xscale
>  	default "iwmmxt"	if BR2_iwmmxt
> -	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
> -	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
> -	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
> +	default "cortex-a53"		if (BR2_cortex_a53)
> +	default "cortex-a57"		if (BR2_cortex_a57)
> +	default "cortex-a72"		if (BR2_cortex_a72)

What are the parentheses good for?

baruch

>  
>  config BR2_GCC_TARGET_ABI
>  	default "aapcs-linux"	if BR2_arm || BR2_armeb

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
