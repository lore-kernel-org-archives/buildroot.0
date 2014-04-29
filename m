From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 20:04:31 +0200
Subject: [Buildroot] [PATCH 2/2] configs: bump raspberrypi_defconfig to
 use latest rpi-3.12.y
In-Reply-To: <5efda6750ee674d89ab6d3ce4cf140930c107ea7.1398794127.git.yann.morin.1998@free.fr>
References: <cover.1398794127.git.yann.morin.1998@free.fr>
 <5efda6750ee674d89ab6d3ce4cf140930c107ea7.1398794127.git.yann.morin.1998@free.fr>
Message-ID: <20140429180431.GD3248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-04-29 19:56 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The Raspberry Pi people are now considering there stable version to
> be based on the 3.12.series:
>     http://www.raspberrypi.org/forums/viewtopic.php?f=29&t=75895
> 
>     > The 3.12 kernel tree has long term support and we are moving to it.
> 
> Bump the Raspberry Pi defconfig to use the latest stable version of
> the rpi-3.12.y branch, based on linux-3.12.18.
> 
> Bump the kernel headers at the same time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  configs/raspberrypi_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index b7fe8c0..6cefc74 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -8,15 +8,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>  
>  BR2_PACKAGE_RPI_FIRMWARE=y
>  
> -# Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
> +# Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.10.36"
> +BR2_DEFAULT_KERNEL_VERSION="3.12.18"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y

Doh, I missed that one... New version in the pipe...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
