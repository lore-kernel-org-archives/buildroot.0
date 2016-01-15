From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Jan 2016 22:35:41 +0100
Subject: [Buildroot] SPI module on Raspberry Pi B+
In-Reply-To: <5698EEC2.7030806@yahoo.fr>
References: <5698EEC2.7030806@yahoo.fr>
Message-ID: <20160115223541.0c4cb053@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Fri, 15 Jan 2016 14:06:10 +0100, David Picard <davepiq@yahoo.fr> wrote:

> Hello,
> 
> I just switched from Buildroot 2015.08.1 to 2015.11.1, and tried to keep 
> the same configuration. SPI was working well, before the switch.
> 
> Now, I am having some trouble with the SPI driver, namely spi_bcm2835 : 
> when I insert the module, there is no log in dmesg output, and nothing 
> is created in /sys/bus/spi/devices.
> 

Did you try with a fresh build using the 2015.11.1 configs/raspberrypi_defconfig?

Did you enable spi support (on the target SD card) in the config.txt file?

I use the following for hifiberry-dac+ support (and Adafruit PiTFT):

diff -u config.txt_orig config.txt
--- config.txt_orig     2015-09-29 21:11:00.000000000 +0200
+++ config.txt  2015-10-01 21:22:14.000000000 +0200
@@ -18,3 +18,30 @@
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+#
+# from https://www.raspberrypi.org/documentation/configuration/device-tree.md
+#
+dtdebug=1
+
+# Uncomment some or all of these to enable the optional hardware interfaces
+dtparam=i2c_arm=on
+dtparam=i2s=on
+dtparam=spi=on
+dtoverlay=hifiberry-dacplus

Regards,
Peter

> I could make it work by loading spi_bcm2708 instead, despite the 
> deprecated warning. In this case, I get some logging messages and 
> /sys/bus/spi/devices/spi0.0 and /sys/bus/spi/devices/spi0.1 appear.
> 
> Any idea ?
> 
> David.
> 
> ------------------
> Board : Raspberry Pi B+
> Buildroot : 2015.11.1
> SPI peripheral : Adafruit PiTFT 2.8"
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
