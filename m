From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 23 Mar 2011 14:43:12 -0700
Subject: [Buildroot] BeagleBoard-xM, booting 2.6.37, root=/dev/mmcblk0p2,
 kernel hangs
In-Reply-To: <201103232200.55266.tmohr@s.netic.de>
References: <201103232200.55266.tmohr@s.netic.de>
Message-ID: <4D8A6970.8080208@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/23/11 14:00, Torsten Mohr wrote:
> Hello,
>
> i've set up a micro SD card with VFAT on partition 1, EXT2 on partition 2.
>
> Partition 2 is buildroot's output/images/rootfs.ext2, copied with "dd" to the
> micro SD card.
>

Hi Torsten,

Are you sure you are doing the copy correctly?

sudo tar -xzf rootfs.tar.gz -C media/destination

Always works for me.

> On partition 1 i have u-boot and i start the kernel like this:
> mmc init
> mmc rescan 0
> run loaduimage
> bootm 0x82000000
>
> Then i see the kernel boot log and i see it hanging:
>
> [    1.215850] twl_rtc twl_rtc: setting system clock to 2000-01-01 00:05:25
> UTC (946685125)
> [    1.226806] Waiting for root device /dev/mmcblk0p2...
> [    1.369873] mmc0: host does not support reading read-only switch. assuming
> write-enable.
> [    1.389953] mmc0: new SDHC card at address e624
> --->  no more output
>
>
> I use buildroot-2011.02, the kernel is 2.6.37.
>
> In the kernel configuration i have set:
>
> TI OMAP Multimedia Card Interface support (MMC_OMAP)
> TI OMAP High Speed Multimedia Card Interface support (MMC_OMAP_HS)
>
>
> Can anybody give me a hint why the kernel does not continue to boot?

Thats a tough call with this little info. Here is part of my xm bootlog:

[    4.287384] mmc0: host does not support reading read-only switch. 
assuming wr
ite-enable.
[    4.298645] mmc0: new high speed SDHC card at address 1234
[    4.307037] mmcblk0: mmc0:1234 SA04G 3.67 GiB
[    4.318267]  mmcblk0: p1 p2 p3
[    4.512725] usb 1-2.1: new high speed USB device using ehci-omap and 
address
3
[    4.638244] usb 1-2.1: New USB device found, idVendor=0424, 
idProduct=ec00
[    4.645538] usb 1-2.1: New USB device strings: Mfr=0, Product=0, 
SerialNumber
=0
[    4.658721] smsc95xx v1.0.4
[    4.749145] smsc95xx 1-2.1:1.0: usb0: register 'smsc95xx' at 
usb-ehci-omap.0-
2.1, smsc95xx USB 2.0 Ethernet, 8e:bc:ee:cc:8a:9b

Regards, Steve
