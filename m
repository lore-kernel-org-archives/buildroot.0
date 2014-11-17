From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 23:16:18 +0100
Subject: [Buildroot] [PATCH] package/gcc: use correct symbol for powerpc
 version mask
In-Reply-To: <1416262353-17117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416262353-17117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141117221618.GK12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-11-17 19:12 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index de40c63..3bccf36 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -30,7 +30,7 @@ choice
>  		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
>  			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
>  		# Broken or unsupported PPC cores
> -		depends on !BR2_power8
> +		depends on !BR2_powerpc_power8
>  		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
>  		depends on !BR2_sparc_leon3
>  		# Broken or unsupported X86 cores
> @@ -49,7 +49,7 @@ choice
>  		# Broken or unsupported ARM cores
>  		depends on !BR2_cortex_a12 && !BR2_pj4
>  		# Broken or unsupported PPC cores
> -		depends on !BR2_power8
> +		depends on !BR2_powerpc_power8
>  		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
>  		depends on !BR2_sparc_leon3
>  		# Broken or unsupported x86 cores
> @@ -64,7 +64,7 @@ choice
>  		# Broken or unsupported ARM cores
>  		depends on !BR2_cortex_a12
>  		# Broken or unsupported PPC cores
> -		depends on !BR2_power8
> +		depends on !BR2_powerpc_power8
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
>  
> -- 
> 2.0.4
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
