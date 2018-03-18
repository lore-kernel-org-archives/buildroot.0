From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Mar 2018 20:16:23 +0100
Subject: [Buildroot] [PATCH v5 1/5] qemu-host: remove support for some
 powerpc processors.
In-Reply-To: <20180318190131.21404-2-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
 <20180318190131.21404-2-aduskett@gmail.com>
Message-ID: <20180318191623.GF2478@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adma, All,

On 2018-03-18 15:01 -0400, Adam Duskett spake thusly:
> The 620, 630, and 970 are not supported at this time by qemu.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v4:
>   - Add patch to series.
> 
> Changes v4 -> v5:
>  - Seperate this patch into it's own patch.
> 
>  package/qemu/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index 78fe54a85c..bbc2aa27c5 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
>  		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
>  		BR2_sparc        || BR2_x86_64
> +		depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
>  
>  config BR2_PACKAGE_HOST_QEMU
>  	bool "host qemu"
> -- 
> 2.14.3
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
