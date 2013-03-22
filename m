From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 22 Mar 2013 13:05:29 +0100
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: Fixup config.txt
In-Reply-To: <1358087034-2706-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1358087034-2706-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivyOfFJ=mu8Y-_O_saXTBXPsn58N8YCZ6RZDFAGaskhWcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping ?

On Sun, Jan 13, 2013 at 3:23 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> The default name of the kernel binary for the RaspberryPi is kernel.img, it's a
> only a zImage kernel renamed.
> Since Buildroot will build a zImage, the default config uses that should use it
> instead of forcing the user to rename a file.
>
> Also, remove the cmdline argument rootfstype, as ext4 is a builtin driver,
> there is no need to specify it on the cmdline.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/rpi-firmware/config.txt |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
> index 2cabd68..a818762 100644
> --- a/package/rpi-firmware/config.txt
> +++ b/package/rpi-firmware/config.txt
> @@ -6,9 +6,10 @@
>
>  arm_freq=700
>  core_freq=250
> +kernel=zImage
>  disable_overscan=1
>  gpu_mem_256=100
>  gpu_mem_512=100
>  sdram_freq=400
>  over_voltage=0
> -cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
> +cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait"
> --
> 1.7.10.4
>
