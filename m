From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 23:41:36 +0200
Subject: [Buildroot] [PATCH] imx-vpu: add VPU firmware selection
In-Reply-To: <1412546998-16238-1-git-send-email-bisson.gary@gmail.com>
References: <1412546998-16238-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20141017214136.GL3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-10-05 15:09 -0700, Gary Bisson spake thusly:
> As the imx-vpu package needs the firmware to be loaded into the VPU it
> makes sense to have the latter package selected by default.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/imx-vpu/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
> index cf5ab5f..8a95416 100644
> --- a/package/freescale-imx/imx-vpu/Config.in
> +++ b/package/freescale-imx/imx-vpu/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_IMX_VPU
>  	bool "imx-vpu"
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_arm # Only relevant for i.MX
> +	select BR2_PACKAGE_FIRMWARE_IMX
>  	help
>  	  Library of userspace helpers specific for the Freescale i.MX
>  	  platform. It wraps the kernel interfaces for the i.MX platform
> -- 
> 2.1.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
