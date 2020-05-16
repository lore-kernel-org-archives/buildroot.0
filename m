From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 21:43:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: select
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT when needed
In-Reply-To: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
References: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200516194313.GQ12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-16 16:02 +0200, Thomas Petazzoni spake thusly:
> When BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is enabled, and the
> DTBs are built by Linux (i.e BR2_LINUX_KERNEL_DTS_SUPPORT is enabled),
> these DTBs should be built with the -@ Device Tree compiler option, so
> that they can be used together with DTB overlays. So let's select
> BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT in this situation.
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=12831
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Both appiled to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 7cebc5e7ca..cced53f017 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -85,6 +85,8 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	default y
>  	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS \
>  		|| BR2_LINUX_KERNEL_DTS_SUPPORT
> +	select BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT \
> +		if BR2_LINUX_KERNEL_DTS_SUPPORT
>  	help
>  	  Say 'y' here if you need to load one or more of the DTB
>  	  overlays, to support HATs (Hardware Attached on Top, add-on
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
