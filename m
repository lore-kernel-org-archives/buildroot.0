From: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>
Date: Tue, 1 Nov 2016 19:54:39 +0100
Subject: [Buildroot] <DKIM> [PATCH 2/4] board/lego/ev3: Create images
 using genimage
In-Reply-To: <1477870346-4941-3-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
 <1477870346-4941-3-git-send-email-david@lechnology.com>
Message-ID: <9a91d8fb-28b4-4296-19fe-a2f16ade6b00@bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/2016 12:32 AM, David Lechner wrote:
> This adds a script to create SD card and flash images for LEGO MINDSTORMS
> EV3 using the genimage tool.

Hi David,

Thank you very much for your ev3 patches series!

..
> diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
> index 7d9ec4f..878dd2e 100644
> --- a/board/lego/ev3/readme.txt
> +++ b/board/lego/ev3/readme.txt
> @@ -25,9 +25,13 @@ How it works
>  Boot process :
>  --------------
>  
> -The u-boot on-board the EV3 brick has provision to boot a Linux kernel from the
> -external ?SD card. It will try to load a uImage from the first ?SD card
> -partition, which must be formatted with a FAT filesystem.
> +The EV3 boots from an EEPROM. This loads whatever is on the built-in 16MB flash
> +(usually U-Boot) and runs it. The U-Boot from the official LEGO firmware and
> +mainline U-Boot will attempt to boot a Linux kernel from the external ?SD card.
> +It will try to load a uImage (and optional boot.scr) from the first ?SD card
> +partition, which must be formatted with a FAT filesystem. If no ?SD is found or
> +it does not contain a uImage file, then the EV3 will boot the uImage from from

Very minor remark: there is a duplicate "from" at the end of the line.

As Thomas mentioned already I needed to add host-dosfstools and
host-mtools for proper build, then the generated sdcard.img booted ok,
and I do see weedo.ko from the ev3dev "extra" drivers.

Thanks!

Best regards,

Vincent.
