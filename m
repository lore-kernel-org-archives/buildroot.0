From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 22:00:43 +0100
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
In-Reply-To: <094f74654295373c7cadd47044cbcfb9a80d8c87.1489093234.git.baruch@tkos.co.il>
References: <094f74654295373c7cadd47044cbcfb9a80d8c87.1489093234.git.baruch@tkos.co.il>
Message-ID: <20170319220043.6f819196@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Mar 2017 23:00:34 +0200, Baruch Siach wrote:
> Add firmware file for the Raspberry Pi 3 Bluetooth module.
> 
> Note that to successfully download the firmware bluez5_utils needs a patch[1].
> 
> [1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html

Wonderful patch :)

> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I think the name of the package is wrong, it shouldn't be
rpi-bt-firmware. Indeed, it has nothing to do with the RPi itself, but
with the WiFi chip. And other boards, such as
http://www.armadeus.org/wiki/index.php?title=OPOS6UL, use a WiFi chip
that need the same firmware. See
http://www.armadeus.org/wiki/index.php?title=Bluetooth#OPOS6UL where
they tell to use exactly that BCM43430A1.hcd firmware.

So perhaps the package should be bcrm-43430-firmware or something along
those lines.


> +RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
> +RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git

Is there a better upstream than this? I found
https://github.com/varigit/bcm_4343w_fw but I'm not sure it really
qualifies as "better".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
