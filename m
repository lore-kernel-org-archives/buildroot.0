From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 01:29:00 +0200
Subject: [Buildroot] [PATCH 3/4] board/minnowboard-max: Add more
 peripherals and features to the kernel
In-Reply-To: <1460438965-28065-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <570D84BC.40808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 07:29, Ezequiel Garcia wrote:
> This commit enables support for:
>    * HDMI audio
>    * Support for user-provided EDID firmware
>      (useful to workaround broken monitors)
>    * Evdev interface
>    * System V IPC (required by ALSA)
>    * POSIX message queue
>    * fhandle syscall
>    * cgroups

  Why cgroups?

>
> The options are quite common and make the system more useful.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   board/minnowboard-max/linux.config | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/board/minnowboard-max/linux.config b/board/minnowboard-max/linux.config
> index abb7fdce9861..f80170b9b81d 100644
> --- a/board/minnowboard-max/linux.config
> +++ b/board/minnowboard-max/linux.config
> @@ -1,4 +1,8 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_FHANDLE=y
>   CONFIG_NO_HZ=y
> +CONFIG_CGROUPS=y
>   CONFIG_SMP=y
>   CONFIG_X86_INTEL_LPSS=y
>   CONFIG_MATOM=y
> @@ -13,12 +17,15 @@ CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
>   CONFIG_INET=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y

  This is added automatically by Buildroot. That said, it's better if it's 
already in the defconfig.

>   CONFIG_CHR_DEV_SG=y
>   CONFIG_ATA=y
>   CONFIG_SATA_AHCI=y
>   CONFIG_ATA_PIIX=y
>   CONFIG_NETDEVICES=y
>   CONFIG_R8169=y
> +CONFIG_INPUT_EVDEV=y
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_SERIAL_8250_DW=y
> @@ -33,7 +40,15 @@ CONFIG_GPIOLIB=y
>   CONFIG_GPIO_SYSFS=y
>   CONFIG_AGP=y
>   CONFIG_DRM=y
> +CONFIG_DRM_LOAD_EDID_FIRMWARE=y
>   CONFIG_DRM_I915=y
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +# CONFIG_SND_DRIVERS is not set
> +CONFIG_SND_HDA_INTEL=y
> +CONFIG_SND_HDA_CODEC_HDMI=y
> +# CONFIG_SND_SPI is not set
> +# CONFIG_SND_USB is not set
>   CONFIG_USB=y
>   CONFIG_USB_XHCI_HCD=y
>   CONFIG_NOP_USB_XCEIV=y
> @@ -44,3 +59,5 @@ CONFIG_MMC_SDHCI_ACPI=y
>   CONFIG_PWM=y
>   CONFIG_PWM_LPSS=y
>   CONFIG_EXT4_FS=y
> +CONFIG_AUTOFS4_FS=y

  Why?

> +CONFIG_TMPFS_POSIX_ACL=y

  Why?

  Regards,
  Arnout
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
