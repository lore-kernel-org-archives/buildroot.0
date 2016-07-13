From: David Picard <davepiq@yahoo.fr>
Date: Wed, 13 Jul 2016 19:07:43 +0200
Subject: [Buildroot] How to use the ft6236 touchscreen driver ?
Message-ID: <f9bfab32-2dd3-6b86-9ca1-5fca7fff84e7@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to use the touch capability of Adafruit's PiTFT 2.8" on a 
RPi2, BR 2016.05. When I modprobe ft6236, nothing happens : no message 
in dmesg, no device created in /dev/input. i2cdetect detects it at 
address 38h.

I did load i2c_bcm2708, i2c-dev. I2C works (tested with a RTCC).

I tried :
# echo ft6236 0x38 > /sys/class/i2c-adapter/i2c-1/new_device

and I got something in dmesg :
ft6236 1-0038: irq is missing
ft6236: probe of 1-0038 failed with error -22
i2c i2c-1: new_device: Instantiated device ft6236 at 0x38

But still no entry in /dev/input.

Any idea ?
David.
