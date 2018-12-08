From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 17:25:18 +0100
Subject: [Buildroot] [PATCH] configs/bananapi_m2_ultra: add kernel
 headers version option
In-Reply-To: <20181208145015.3095-1-thomas.petazzoni@bootlin.com>
References: <20181208145015.3095-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181208162518.GQ2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-08 15:50 +0100, Thomas Petazzoni spake thusly:
> The bananapi_m2_plus defconfig uses a 4.18 kernel, but doesn't specify
> anything for the kernel headers version, so the Buildroot default gets
> used, which currently is 4.19. Since 4.19 is newer than 4.18,
> Buildroot rightfully whines:
> 
>   Incorrect selection of kernel headers: expected 4.19.x, got 4.18.x
> 
> Let's fix this by telling this defconfig to use the headers from the
> kernel, and that they are of version 4.18.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/131216938
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/bananapi_m2_ultra_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
> index 5dd3edd664..bc1d31a60a 100644
> --- a/configs/bananapi_m2_ultra_defconfig
> +++ b/configs/bananapi_m2_ultra_defconfig
> @@ -1,5 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
> -- 
> 2.19.2
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
