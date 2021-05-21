From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:57:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/openocd: add optional
 dependency on libgpiod
In-Reply-To: <20210521083211.25356-2-sebastien.szymanski@armadeus.com>
References: <20210521083211.25356-1-sebastien.szymanski@armadeus.com>
 <20210521083211.25356-2-sebastien.szymanski@armadeus.com>
Message-ID: <20210521205741.GV3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2021-05-21 10:32 +0200, S?bastien Szymanski spake thusly:
> To make the Linux GPIOD bitbang adapter driver through libgpiod
> available.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openocd/openocd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 1460495a88..b74426ff47 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -32,7 +32,8 @@ OPENOCD_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
>  	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
>  	$(if $(BR2_PACKAGE_LIBHID),libhid) \
> -	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
> +	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
> +	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)
>  
>  # Adapters
>  OPENOCD_CONF_OPTS += \
> -- 
> 2.26.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
