From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 00:17:14 +0200
Subject: [Buildroot] [PATCH 27/31] arch/powerpc: get rid of
 BR2_GCC_TARGET_TUNE
In-Reply-To: <1413749285-1108-28-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-28-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141019221714.GH12247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-19 22:08 +0200, Thomas Petazzoni spake thusly:
> According to the gcc documentation for PowerPC options:
> 
> '-mtune=CPU_TYPE'
>      Set the instruction scheduling parameters for machine type
>      CPU_TYPE, but do not set the architecture type, register usage, or
>      choice of mnemonics, as '-mcpu=CPU_TYPE' would.  The same values
>      for CPU_TYPE are used for '-mtune' as for '-mcpu'.  If both are
>      specified, the code generated will use the architecture, registers,
>      and mnemonics set by '-mcpu', but the scheduling parameters set by
>      '-mtune'.
> 
> In the case of Buildroot where we only target a specific system, using
> -mtune therefore doesn't make much sense, and using -mcpu would be
> more appropriate. As a consequence, this patch makes PowerPC use
> BR2_GCC_TARGET_CPU instead of BR2_GCC_TARGET_TUNE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.powerpc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 239f5dc..fabee9f 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -160,7 +160,7 @@ config BR2_ENDIAN
>  config BR2_ARCH_HAS_ATOMICS
>  	default y
>  
> -config BR2_GCC_TARGET_TUNE
> +config BR2_GCC_TARGET_CPU
>  	default "401"		if BR2_powerpc_401
>  	default "403"		if BR2_powerpc_403
>  	default "405"		if BR2_powerpc_405
> -- 
> 2.0.0
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
