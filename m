From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:41:22 +0100
Subject: [Buildroot] [PATCH v2 2/3] libz160: fix dependencies
In-Reply-To: <1417252360-10929-3-git-send-email-jezz@sysmic.org>
References: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
 <1417252360-10929-3-git-send-email-jezz@sysmic.org>
Message-ID: <20141207214121.GE10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-29 10:12 +0100, J?r?me Pouiller spake thusly:
> libz160 is provided as binary. We need EABI toolchain with glibc to use
> it.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/libz160/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
> index f956cce..f4abcc5 100644
> --- a/package/freescale-imx/libz160/Config.in
> +++ b/package/freescale-imx/libz160/Config.in
> @@ -1,5 +1,11 @@
>  config BR2_PACKAGE_LIBZ160
>  	bool "libz160"
> +	depends on BR2_ARM_EABI
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  An API for user space programs to perform 2D accelerated graphics
>  	  operations on AMD GPU (included for examples in iMX5x chipsets)
> +
> +comment "libz160 needs an EABI toolchain w/ (e)glibc"
> +	depends on BR2_arm

Not needed, we're already in a depends-on-arm block thanks to
BR2_PACKAGE_FREESCALE_IMX.

> +	depends on (!BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC)

The parenthesis are superfluous here.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -- 
> 1.9.1
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
