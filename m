From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 May 2019 20:09:49 +0200
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
In-Reply-To: <1558005190987-0.post@n4.nabble.com> (muhammet's message of "Thu, 
 16 May 2019 06:13:10 -0500 (CDT)")
References: <1557981319043-0.post@n4.nabble.com>
 <20190516080159.6d844d12@windsurf>
 <1557988831153-0.post@n4.nabble.com>
 <20190516085647.7a861d60@windsurf>
 <1558005190987-0.post@n4.nabble.com>
Message-ID: <8736lez2xe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "muhammet" == muhammet  <mk61@hotmail.com> writes:

 > Hello,
 > There are
 > /sys/bus/platform/drivers/i2c-sunxi-pwi
 > /sys/bus/platform/drivers/mv64xxx_i2c
 > /sys/bus/i2c
 > /sys/bus/i2c/drivers/axp20x-i2c

 > but no
 > /sys/bus/i2c/devices/

 > what am i missing?

Nothing. The zero does not have any on board I2C devices, so
sun8i-h2-plus-orangepi-zero.dts does not enable any of the I2C
controllers or describe any I2C devices.

-- 
Bye, Peter Korsgaard
