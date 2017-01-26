From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Jan 2017 22:25:17 +0100
Subject: [Buildroot] [PATCH 1/4] board: raspberrypi: use regular kernel
 image
In-Reply-To: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
References: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
Message-ID: <20170126212517.GD3413@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-01-26 07:36 +0200, Baruch Siach spake thusly:
> Since release 4.4 a kernel without a trailer is assumed to be device tree
> capable. Since our Raspberry Pi defconfigs all use the newer firmware we can
> just use the regular kernel image.
> 
> https://www.raspberrypi.org/documentation/configuration/device-tree.md
> 
> Tested on Raspberry Pi 3.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/genimage-raspberrypi.cfg  | 2 +-
>  board/raspberrypi/genimage-raspberrypi0.cfg | 2 +-
>  board/raspberrypi/genimage-raspberrypi2.cfg | 2 +-
>  board/raspberrypi/genimage-raspberrypi3.cfg | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
> index 74758f5e25b7..bd5166a0f313 100644
> --- a/board/raspberrypi/genimage-raspberrypi.cfg
> +++ b/board/raspberrypi/genimage-raspberrypi.cfg
> @@ -9,7 +9,7 @@ image boot.vfat {
>        "rpi-firmware/config.txt",
>        "rpi-firmware/fixup.dat",
>        "rpi-firmware/start.elf",
> -      "kernel-marked/zImage"
> +      "zImage"
>      }
>    }
>    size = 32M
> diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
> index a38840c829af..a9d4c4501fd9 100644
> --- a/board/raspberrypi/genimage-raspberrypi0.cfg
> +++ b/board/raspberrypi/genimage-raspberrypi0.cfg
> @@ -7,7 +7,7 @@ image boot.vfat {
>        "rpi-firmware/config.txt",
>        "rpi-firmware/fixup.dat",
>        "rpi-firmware/start.elf",
> -      "kernel-marked/zImage"
> +      "zImage"
>      }
>    }
>    size = 32M
> diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
> index 443c821872f5..a3be2a34426e 100644
> --- a/board/raspberrypi/genimage-raspberrypi2.cfg
> +++ b/board/raspberrypi/genimage-raspberrypi2.cfg
> @@ -7,7 +7,7 @@ image boot.vfat {
>        "rpi-firmware/config.txt",
>        "rpi-firmware/fixup.dat",
>        "rpi-firmware/start.elf",
> -      "kernel-marked/zImage"
> +      "zImage"
>      }
>    }
>    size = 32M
> diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
> index baab0c4cc108..3c9f1e5e2a22 100644
> --- a/board/raspberrypi/genimage-raspberrypi3.cfg
> +++ b/board/raspberrypi/genimage-raspberrypi3.cfg
> @@ -8,7 +8,7 @@ image boot.vfat {
>        "rpi-firmware/fixup.dat",
>        "rpi-firmware/start.elf",
>        "rpi-firmware/overlays",
> -      "kernel-marked/zImage"
> +      "zImage"
>      }
>    }
>    size = 32M
> -- 
> 2.11.0
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
