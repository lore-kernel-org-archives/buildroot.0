From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 22:35:40 +0200
Subject: [Buildroot] [PATCH 2/5] configs/beaglebone: kernel build needs
 mkimage
In-Reply-To: <20190422200830.2831-3-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
 <20190422200830.2831-3-thomas.petazzoni@bootlin.com>
Message-ID: <20190422203540.GD6200@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-22 22:08 +0200, Thomas Petazzoni spake thusly:
> Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
> LINUX_BUILD_CMDS"), the Linux kernel build for beaglebone_defconfig
> builds more things, including some .itb files, which require mkimage
> with FIT support.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339433
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/beaglebone_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 2d9fba57dd..b4f152fd69 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -26,3 +26,5 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
