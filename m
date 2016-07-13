From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Jul 2016 20:16:59 +0300
Subject: [Buildroot] How to use the ft6236 touchscreen driver ?
In-Reply-To: <f9bfab32-2dd3-6b86-9ca1-5fca7fff84e7@yahoo.fr>
References: <f9bfab32-2dd3-6b86-9ca1-5fca7fff84e7@yahoo.fr>
Message-ID: <20160713171659.GF2139@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Wed, Jul 13, 2016 at 07:07:43PM +0200, David Picard wrote:
> I am trying to use the touch capability of Adafruit's PiTFT 2.8" on a RPi2,
> BR 2016.05. When I modprobe ft6236, nothing happens : no message in dmesg,
> no device created in /dev/input. i2cdetect detects it at address 38h.
> 
> I did load i2c_bcm2708, i2c-dev. I2C works (tested with a RTCC).
> 
> I tried :
> # echo ft6236 0x38 > /sys/class/i2c-adapter/i2c-1/new_device
> 
> and I got something in dmesg :
> ft6236 1-0038: irq is missing
> ft6236: probe of 1-0038 failed with error -22
> i2c i2c-1: new_device: Instantiated device ft6236 at 0x38
> 
> But still no entry in /dev/input.
> 
> Any idea ?

You most likely need to update your device tree file (.dts), and add your 
PiTFT device as a sub-node of the i2c master.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
