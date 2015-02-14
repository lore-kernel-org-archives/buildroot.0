From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 00:43:18 +0100
Subject: [Buildroot] [PATCH] rpi-firmware: keep fixup.dat and start.elf
 name
In-Reply-To: <1423954153-22667-1-git-send-email-fhunleth@troodon-software.com>
References: <1423954153-22667-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150214234318.GA27082@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2015-02-14 17:49 -0500, Frank Hunleth spake thusly:
> When enabling the RPi camera (start_x=1 in the config.txt), the start_x.elf
> file needs to remain called start_x.elf. Installing it as start.elf
> creates an image that won't boot. This change installs the files without
> changing their names.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

NAK.

I just tried booting my RPi (model B, the original) with just start_x.elf
and fixup_x.dat (instead of start.elf and fixup.dat), and it does not
boot.

So, clearly, that's not the proper fix.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/rpi-firmware.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 03178d5..e526063 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -28,8 +28,8 @@ endif
>  
>  define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>  	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
> -	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
> +	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf
> +	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
>  	$(RPI_FIRMWARE_INSTALL_DTB)
> -- 
> 1.9.1
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
