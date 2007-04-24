From: Paul Kavan <pkavan@gmail.com>
Date: Tue, 24 Apr 2007 16:10:02 -0500
Subject: [Buildroot] i2c-at91 Driver
Message-ID: <61c0054e0704241410ga495506sed2d4859a16cf6f8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all:

I am having some difficulties determining how to utilize the i2c-at91
driver. Has anyone had experience getting this driver to work correctly? If
so, do you mind giving me some pointers on how you did so? I have tried to
use

open("/dev/i2c", O_RDWR)

with the i2c dev driver....to no avail. I am looking at the source code for
i2c-at91.c and it does not appear to be similar to the gpio driver where it
exports symbols that I can use in another driver. As such, I am a little
unsure what to do from here.

One other point of concern. I have my kernel configured with

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_CHARDEV=y

#
# I2C Algorithms
#
# CONFIG_I2C_ALGOBIT is not set
# CONFIG_I2C_ALGOPCF is not set
# CONFIG_I2C_ALGOPCA is not set

#
# I2C Hardware Bus support
#
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_CLOCKRATE=100000
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_PCA_ISA is not set

#
# Miscellaneous I2C Chip support
#
# CONFIG_SENSORS_DS1337 is not set
# CONFIG_SENSORS_DS1374 is not set
# CONFIG_SENSORS_EEPROM is not set
# CONFIG_SENSORS_PCF8574 is not set
# CONFIG_SENSORS_PCA9539 is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_SENSORS_MAX6875 is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# CONFIG_I2C_DEBUG_CHIP is not set

Is there something I am missing in the configuration as well?

I would appreciate any pointers or tips on how to get the twi operating as
an i2c.

Thanks.

Paul
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070424/98d7c904/attachment.htm 
