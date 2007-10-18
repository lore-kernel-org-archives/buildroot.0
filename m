From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 18 Oct 2007 13:57:08 +0200
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
In-Reply-To: <6090c5eb0710180456n1b9fb465j8377bf965fe66a24@mail.gmail.com>
References: <6090c5eb0710171505r739bd7b1le836930f308f5209@mail.gmail.com>
	<1192662314.17963.6.camel@c-f87ee255>
	<6090c5eb0710180456n1b9fb465j8377bf965fe66a24@mail.gmail.com>
Message-ID: <6090c5eb0710180457w63bfe76cv88d8d51c6c5b540b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Jorge S. <jorgesolla@gmail.com>
Date: 18-oct-2007 13:56
Subject: Re: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
jffs2 rootfs.
To: ulf at atmel.com

Hi All:

Ulf, as you sugested i'm now using MTD 20061007 and i get the same result,
here's my boot screenshot:



Linux version 2.6.22.9 (root at proton) (gcc version 4.2.1 ) #7 Thu Oct 11
19:47:03 CEST 2007
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
Machine: KB920x
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 180 MHz, master 60 MHz, main 10.000 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists.  Total pages: 8128
Kernel command line: console=/dev/ttyS0,115200 mtdparts=
AT45DB642.spi0:168960(boot),2162688(kernel),-(raiz)
root=/dev/mtdblock2 rootfstype=jffs2
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB = 32MB total
Memory: 28384KB available (3560K code, 368K data, 128K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
AT91: Power Management
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Bluetooth: Core ver 2.11
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 2, 20480 bytes)
TCP bind hash table entries: 1024 (order: 2, 20480 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
NetWinder Floating Point Emulator V0.97 (double precision)
audit: initializing netlink socket (disabled)
audit(0.580:1): initialized
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
NTFS driver 2.1.28 [Flags: R/W].
JFFS2 version 2.2. (NAND) (c) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
at91_spi: Baud rate set to 5000000
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffc0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffc4000 (irq = 7) is a ATMEL_SERIAL
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
loop: module loaded
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
at91_ether: Your bootloader did not configure a MAC address.
eth0: Link now 100-FullDuplex
eth0: AT91 ethernet at 0xfefbc000 int=24 100-FullDuplex (00:00:00:00:00:00)
eth0: National Semiconductor DP83848 PHY
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver zd1201
block2mtd: version $Revision: 1.30 $
at91_dataflash: AT45DB642 detected [spi0] (8650752 bytes)
3 cmdlinepart partitions found on MTD device AT45DB642.spi0
Creating 3 MTD partitions on "AT45DB642.spi0":
0x00000000-0x00029400 : "boot"
ftl_cs: FTL header not found.
0x00029400-0x00239400 : "kernel"
ftl_cs: FTL header corrupt!
0x00239400-0x00840000 : "raiz"
ftl_cs: FTL header corrupt!
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 23, io mem 0x00300000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver libusual
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb- serial.c: USB Serial Driver core
drivers/usb/serial/usb-serial.c: USB Serial support registered for pl2303
usbcore: registered new interface driver pl2303
drivers/usb/serial/pl2303.c: Prolific PL2303 USB to serial adaptor driver
mice: PS/2 mouse device common for all mice
at91_rtc at91_rtc: rtc core: registered at91_rtc as rtc0
AT91 Real Time Clock driver.
i2c /dev entries driver
 : oscillator started; SET TIME!
ds1307 0-0068: rtc core: registered ds1307 as rtc1
at91_i2c at91_i2c: AT91 i2c bus driver.
Driver for 1-wire Dallas network protocol.
Bluetooth: HCI USB driver ver 2.9
usbcore: registered new interface driver hci_usb
Bluetooth: Virtual HCI driver ver 1.2
Bluetooth: HCI UART driver ver 2.2
Bluetooth: HCI H4 protocol initialized
Bluetooth: HCI BCSP protocol initialized
Bluetooth: Broadcom Blutonium firmware driver ver 1.1
usbcore: registered new interface driver bcm203x
Bluetooth: Digianswer Bluetooth USB driver ver 0.8
usbcore: registered new interface driver bpa10x
Bluetooth: BlueFRITZ! USB driver ver 1.1
usbcore: registered new interface driver bfusb
AT91 MMC: 4 wire bus mode not supported by this driver - using 1 wire
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <
jketreno@linux.intel.com>
at91_rtc at91_rtc: setting the system clock to 1998-01-01 00:06:50
(883613210)
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae4:
0x2001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae8:
0x3c00 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223aec:
0x2000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af0:
0x2bf4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af4:
0x3000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af8:
0x3001 instead
...
...
 lots more of eraseblock(): ....
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00239400:
0x2320 instead
Further such events for this erase block will not be printed
Empty flash at 0x0023a400 ends at 0x0023a404
Empty flash at 0x0023a408 ends at 0x0023a40c
Empty flash at 0x0023a618 ends at 0x0023a61c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0023b500:
0x200a instead
..
..
 again...more eraseblock()

Further such events for this erase block will not be printed
JFFS2 error: (1) jffs2_build_inode_pass1: child dir "udhcpc" (ino #565) of
dir ino #433 appears to be a hard link
JFFS2 error: (1) jffs2_build_inode_pass1: child dir "pcmcia" (ino #576) of
dir ino #569 appears to be a hard link
JFFS2 error: (1) jffs2_build_inode_pass1: child dir "if-pre-up.d" (ino #360)
of dir ino #340 appears to be a hard link
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 128K
Warning: unable to open an initial console.
JFFS2 warning: (1) jffs2_do_read_inode_internal: Truncating ino #360 to
21168 bytes failed because it only had 4224 bytes to start with!
Kernel panic - not syncing: No init found.  Try passing init= option to
kernel.


(Ignore the machine-id, im using a modified version of the kb9202 files to
boot my custom hardware.)

Now i've a conclussion, the first "eraseblock" message is this one:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae4:
0x2001 instead

The address is 0x00223ae4, and my rootfs image size is 0x00223ae4 so it is
dropping errors from the
free (ie: non-flashed) area of the rootfs partition.

 My buildroot configuration creates a 0x00223ae4 bytes long jffs2 image, but
my rootfs MTD partition is bigger
 so the free space reamins "unflashed"/dirty, any idea?

 I'm using the last svn version of Buildroot, with my custom config. Does it
help if i post my .config file?

 Thanks for your help.



2007/10/18, Ulf Samuelsson <ulf@atmel.com>:
>
> tor 2007-10-18 klockan 00:05 +0200 skrev Jorge S.:
> > Dear all,
> >
> >  I'm still having problems with the rootfs on my AT91RM9200/Dataflash
> > (AT45DB642D) based system.
> >
> >  Now i'm trying to build a jffs2 rootfs and but getting tons of errors
> > from the kernel when it mounts the rootfs:
> >
> > ..
> > ..
>
> [snip]
>
> >   - Any ideas on how to solve this?
> >
>
> I suspect that you selected an bad version of the MTD.
> 20061007 should work.
>
> --
> Best Regards,
> Ulf Samuelsson
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071018/194533b5/attachment-0001.htm 
