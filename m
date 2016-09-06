From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:32:34 +0200
Subject: [Buildroot] [PATCH RESEND v2] configs: Add support for warp7
 board
In-Reply-To: <1472850510-31135-1-git-send-email-festevam@gmail.com>
References: <1472850510-31135-1-git-send-email-festevam@gmail.com>
Message-ID: <20160906213234.71b8b1ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 18:08:30 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Add support for warp7, which is a board based on NXP i.MX7S processor.
> 
> More information about warp7 can be found at:
> https://www.element14.com/community/docs/DOC-79058
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

This looks good, except on one aspect (for which I'd like a
confirmation before applying).


> +Create a bootable SD card
> +=========================

So here you say that you explain how to create a bootable SD card...

> +
> +In the U-Boot prompt lauch:
> +
> +=> ums 0 mmc 0  
> +
> +This will mount the eMMC content in the host PC as a mass storage device.
> +
> +To determine the device associated to the eMMC card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be dumped on the eMMC card. Launch the following
> +command:
> +
> +sudo dd if=output/images/sdcard.img of=/dev/<your-sd-device>

... but in fact you explain how to flash the internal eMMC.

I am missing something?

> +*** WARNING! This will destroy all the card content. Use with care! ***

You are again talking about "card".

Just for my understanding: with this mechanism, you rely on U-Boot to
provide a mass-storage access to the internal eMMC. So if you reflash a
non-working U-Boot, you are not able to reflash the system again. Is
this correct? Is there a recovery process available (booting over SD
card? something else?).

If the image file produced by Buildroot is to be flashed on the eMMC, I
think naming it sdcard.img is a bit confusing. Maybe emmc.img is a
better name?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
