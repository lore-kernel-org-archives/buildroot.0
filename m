From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  8 Jan 2015 21:09:55 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch RPi
	LCD (B) V3 touch controller
Message-ID: <1420747796-28272-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This kernel module enables the (easy?) using of the ADS7846 SPI touch controller
on Waveshare 3.2 LCD (B) modules.

Alternatives would be:
- the old way: add device definition/register call to arch/arm/mach-bcm2708/bcm2708.c
- the new way: use device tree support and add an entrie for ads7846

Peter Seiderer (1):
  ads7846-device: new package

 linux/linux.mk                           |  6 ++++++
 package/Config.in                        |  1 +
 package/ads7846-device/Config.in         | 11 +++++++++++
 package/ads7846-device/ads7846-device.mk | 21 +++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/ads7846-device/Config.in
 create mode 100644 package/ads7846-device/ads7846-device.mk

-- 
2.1.2
