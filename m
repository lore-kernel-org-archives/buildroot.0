From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 02 Feb 2015 17:17:24 +0100
Subject: [Buildroot] [PATCH 1/4] arm: conditionally support regular ARM
 instructions
In-Reply-To: <1421951608-31233-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <54CFA314.8020304@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

Le 22/01/2015 19:33, Ezequiel Garcia a ?crit :
> From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Until now, all ARM processors supported the original ARM instructions.
> However, the Cortex-M variants don't support them, and support only
> Thumb/Thumb2 modes.
> 
> So, make a Kconfig option for ARM support and use it.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---

[...]

>  choice
>  	prompt "ARM instruction set"
> -	depends on BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
> +	depends on BR2_ARM_CPU_HAS_ARM || BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2

This prompt is now always displayed, so the depends on can be removed.

>  
>  config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
>  	bool "ARM"
> +	depends on BR2_ARM_CPU_HAS_ARM
>  	help
>  	  This option instructs the compiler to generate regular ARM
>  	  instructions, that are all 32 bits wide.
> 

Best regards,
Romain Naour
