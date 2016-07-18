From: David PICARD <davepiq@yahoo.fr>
Date: Mon, 18 Jul 2016 20:24:27 +0000 (UTC)
Subject: [Buildroot] How to use the ft6236 touchscreen driver ?
In-Reply-To: <20160715001556.2541f600@gmx.net>
References: <f9bfab32-2dd3-6b86-9ca1-5fca7fff84e7@yahoo.fr>
 <20160713171659.GF2139@sapphire.tkos.co.il> <57875AE2.1010908@yahoo.fr>
 <20160715001556.2541f600@gmx.net>
Message-ID: <819951176.1968905.1468873467924.JavaMail.yahoo@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
It works perfectly. Thank you very much.
David. 

    Le Vendredi 15 juillet 2016 0h16, Peter Seiderer <ps.report@gmx.net> a ?crit :
 

 Hello David,

On Thu, 14 Jul 2016 11:26:58 +0200, David Picard <davepiq@yahoo.fr> wrote:

> Well, could you please give me some directions ? Like where the dts file 
> is, how do I compile it, some reference documentation...
> 

Maybe try the following additions at the config.txt file (on the boot/vfat partition of the SD card):

# for adafruit 2.8 tft? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? 
dtparam=spi=on? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? 
dtparam=i2c1=on
dtparam=i2c_arm=on
dtoverlay=pitft28-capacitive.dtbo


Enable the following at the buildroot .config file:

BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y

And copy images/rpi-firmware/overlays/pitft28-capacitive.dtbo to overlays/pitft28-capacitive.dtbo
on the boot/vfat partition of the SD card...

Regards,
Peter

> Thanks.
> 
> Le 13/07/2016 19:16, Baruch Siach a ?crit :
> > Hi David,
> >
> > On Wed, Jul 13, 2016 at 07:07:43PM +0200, David Picard wrote:
> >> I am trying to use the touch capability of Adafruit's PiTFT 2.8" on a RPi2,
> >> BR 2016.05. When I modprobe ft6236, nothing happens : no message in dmesg,
> >> no device created in /dev/input. i2cdetect detects it at address 38h.
> >>
> >> I did load i2c_bcm2708, i2c-dev. I2C works (tested with a RTCC).
> >>
> >> I tried :
> >> # echo ft6236 0x38 > /sys/class/i2c-adapter/i2c-1/new_device
> >>
> >> and I got something in dmesg :
> >> ft6236 1-0038: irq is missing
> >> ft6236: probe of 1-0038 failed with error -22
> >> i2c i2c-1: new_device: Instantiated device ft6236 at 0x38
> >>
> >> But still no entry in /dev/input.
> >>
> >> Any idea ?
> >
> > You most likely need to update your device tree file (.dts), and add your
> > PiTFT device as a sub-node of the i2c master.
> >
> > baruch
> >
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160718/c400f268/attachment.html>
