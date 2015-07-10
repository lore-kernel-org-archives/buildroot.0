From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 01:38:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware: add missing
 nvs file for the wl18xx firmware
In-Reply-To: <1436401523-7916-1-git-send-email-mac@vrvana.com>
References: <1436401523-7916-1-git-send-email-mac@vrvana.com>
Message-ID: <20150710233826.GG5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MArc-Andre, All,

On 2015-07-08 20:25 -0400, Marc-Andre Chenier spake thusly:
> The wl18xx shares the same wlcore as the wl1271 and needs the 
> wl1271-nvs.bin file.  Also, refactor some comments and list items.
> 
> Signed-off-by: Marc-Andre Chenier <mac@vrvana.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Changes v1 -> v2:
>    - put symbolic link comment before list (suggested by Yann E. Morin)
>    - move symbolic link into list (suggested by Yann E. Morin)
> 
>  package/linux-firmware/linux-firmware.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 25a942a..87804d8 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -151,6 +151,7 @@ endif
>  
>  # wl128x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
> +# wl1271-nvs.bin and wl12xx-nvs.bin are symlinks to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl128x-fw-3.bin				\
>  	ti-connectivity/wl128x-fw-ap.bin			\
> @@ -159,6 +160,7 @@ LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl1271-nvs.bin				\
>  	ti-connectivity/wl128x-nvs.bin				\
>  	ti-connectivity/wl12xx-nvs.bin				\
> +	ti-connectivity/wl127x-nvs.bin				\
>  	ti-connectivity/wl128x-fw-4-mr.bin			\
>  	ti-connectivity/wl128x-fw-4-plt.bin			\
>  	ti-connectivity/wl128x-fw-4-sr.bin			\
> @@ -166,18 +168,19 @@ LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl128x-fw-5-plt.bin			\
>  	ti-connectivity/wl128x-fw-5-sr.bin			\
>  	ti-connectivity/TIInit_7.2.31.bts
> -# wl12xx-nvs.bin (above) is a symlink to:
> -LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>  endif
>  
>  # wl18xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
> +# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl18xx-fw.bin \
>  	ti-connectivity/wl18xx-fw-2.bin \
>  	ti-connectivity/wl18xx-fw-3.bin \
>  	ti-connectivity/wl18xx-fw-4.bin \
> +	ti-connectivity/wl1271-nvs.bin \
> +	ti-connectivity/wl127x-nvs.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>  endif
> -- 
> 2.4.5
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
