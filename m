From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 23:30:39 +0200
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
In-Reply-To: <20170319220043.6f819196@free-electrons.com>
References: <094f74654295373c7cadd47044cbcfb9a80d8c87.1489093234.git.baruch@tkos.co.il>
 <20170319220043.6f819196@free-electrons.com>
Message-ID: <20170320213039.wlpa2tdplbon6f2n@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 19, 2017 at 10:00:43PM +0100, Thomas Petazzoni wrote:
> On Thu,  9 Mar 2017 23:00:34 +0200, Baruch Siach wrote:
> > Add firmware file for the Raspberry Pi 3 Bluetooth module.
> > 
> > Note that to successfully download the firmware bluez5_utils needs a patch[1].
> > 
> > [1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html
> 
> Wonderful patch :)
> 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I think the name of the package is wrong, it shouldn't be
> rpi-bt-firmware. Indeed, it has nothing to do with the RPi itself, but
> with the WiFi chip. And other boards, such as
> http://www.armadeus.org/wiki/index.php?title=OPOS6UL, use a WiFi chip
> that need the same firmware. See
> http://www.armadeus.org/wiki/index.php?title=Bluetooth#OPOS6UL where
> they tell to use exactly that BCM43430A1.hcd firmware.

Thanks for the link.

Do you have any indication that this is indeed the same file that RPi uses? My 
impression was that this firmware is tailored specifically for the RPi board, 
but I don't know for sure. That fact that Broadcom licenses the file may 
indicate that this is the same one. But ...

> So perhaps the package should be bcrm-43430-firmware or something along
> those lines.
> 
> 
> > +RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
> > +RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
> 
> Is there a better upstream than this? I found
> https://github.com/varigit/bcm_4343w_fw but I'm not sure it really
> qualifies as "better".

... this is not the same file:

ls -l bcm43430a1.hcd pi-bluetooth/BCM43430A1.hcd 
-rw-r--r-- 1 baruch baruch 14265 Mar 20 23:22 bcm43430a1.hcd
-rw-r--r-- 1 baruch baruch 35976 Jan 17 12:25 pi-bluetooth/BCM43430A1.hcd

I have not tested the Variscite firmware on the RPi, though. There is a small 
chance it might damage the hardware.

And since the git repo we use is named 'pi-bluetooth' maybe rpi-bt-firmware is 
not such a bad name after all.

barauch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
