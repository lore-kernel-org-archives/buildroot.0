From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 17:56:07 +0200
Subject: [Buildroot] [PATCH 2/2] rpi-firmware: modify settings for Pi 2
In-Reply-To: <1430579415-22802-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <1430579415-22802-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150502155607.GI13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-05-02 17:10 +0200, Floris Bos spake thusly:
> Remove low-level settings from config.txt like arm_freq and sdram_freq.
> The defaults should be good for most and differ by Pi model.
> E.g. the Pi 2 runs at 900 Mhz by default, setting arm_freq=700
> like we had previously would underclock it.
> 
> Add short description in comments to options.
> Mention initramfs option.
> 
> Remove obsolete options from cmdline.txt
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/cmdline.txt |  2 +-
>  package/rpi-firmware/config.txt  | 14 ++++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
> index 061e54b..38aa378 100644
> --- a/package/rpi-firmware/cmdline.txt
> +++ b/package/rpi-firmware/cmdline.txt
> @@ -1 +1 @@
> -dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait
> +root=/dev/mmcblk0p2 rootwait
> diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
> index 994972b..aa8d2ab 100644
> --- a/package/rpi-firmware/config.txt
> +++ b/package/rpi-firmware/config.txt
> @@ -4,11 +4,17 @@
>  # See http://buildroot.org/downloads/manual/manual.html#rootfs-custom
>  # and http://elinux.org/RPiconfig for a description of config.txt syntax
>  
> -arm_freq=700
> -core_freq=250
>  kernel=zImage
> +
> +# To use an external initramfs file
> +#initramfs rootfs.cpio.gz
> +
> +# Disable overscan assuming the display supports displaying the full resolution
> +# If the text shown on the screen disappears off the edge, comment this out
>  disable_overscan=1
> +
> +# How much memory in MB to assign to the GPU on Pi models having
> +# 256, 512 or 1024 MB total memory
>  gpu_mem_256=100
>  gpu_mem_512=100
> -sdram_freq=400
> -over_voltage=0
> +gpu_mem_1024=100
> -- 
> 2.1.4
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
