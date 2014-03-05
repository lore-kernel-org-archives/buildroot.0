From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 23:39:45 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: remove useless info
 in help text of Linaro ARM toolchains
In-Reply-To: <1394058220-5863-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140305223945.GA9644@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-05 23:23 +0100, Thomas Petazzoni spake thusly:
> The information "To use this toolchain, you must disable soft float
> usage." which was visible in the help text of Linaro toolchains is no
> longer useful, since those toolchains are only visible when the ARM
> EABIhf ABI is selected, which by design is not compatible with
> soft-float.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/Config.in | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index fd1a826..8647357 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -27,8 +27,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
>  	  with the hard floating point calling convention, and uses
>  	  the VFPv3-D16 FPU instructions.
>  
> -	  To use this toolchain, you must disable soft float usage.
> -
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
>  	bool "Linaro 2014.01"
>  	depends on BR2_arm
> @@ -50,8 +48,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
>  	  with the hard floating point calling convention, and uses
>  	  the VFPv3-D16 FPU instructions.
>  
> -	  To use this toolchain, you must disable soft float usage.
> -
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
>  	bool "Linaro 2013.12"
>  	depends on BR2_arm
> @@ -73,8 +69,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
>  	  with the hard floating point calling convention, and uses
>  	  the VFPv3-D16 FPU instructions.
>  
> -	  To use this toolchain, you must disable soft float usage.
> -
>  comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on BR2_arm
>  	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
> -- 
> 1.8.3.2
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
