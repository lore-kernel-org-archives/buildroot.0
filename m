From: Barry Bridges <barry@disignconsultants.com>
Date: Wed, 17 Feb 2010 16:06:05 -0000
Subject: [Buildroot] Issues with network interface eth0
Message-ID: <000301caafeb$1bf3fa70$53dbef50$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I?m using an ATMEL SAM9263-ek ARM9 and have successfully build everything
with the 2009.11 build.

 

I am however experiencing problems with setting up the eth0 interface.

I wanted to set the interface address via dhcp so i set the
/etc/network/interfaces file to

 

#-------------------------------------------

# Configure Loopback

auto lo

iface lo inet loopback

 

auto eth0

iface eth0 inet dhcp

 

#-------------------------------------------

 

This did nothing and i still had to set the address manually. So i tried to
set is manually at startup with

#--------------------------------------------

# Configure Loopback

auto lo

iface lo inet loopback

 

auto eth0

iface eth0 inet static

address 192.168.11.3

netmask 255.255.255.0

network 192.168.11.0

broadcast 192.168.11.255

gateway 192.168.11.1

 

#--------------------------------------------

 

Again no joy. However if i use dhclient i get an address via dhcp.

A liitle lost right now, am i missing something in the build or is it my
config?

Boot output below

 

U-Boot 1.3.4 (Sep 24 2009 - 16:54:57)

auto eth0

DRAM:  64 MBnet static

NAND:  256 MiB8.11.3

In:    serial55.255.0

Out:   serial68.11.0

Err:   serial.168.11.255

Net:   macb0168.11.1

macb0: Starting autonegotiation...

macb0: Autonegotiation complete

macb0: link up, 100Mbps full-duplex (lpa: 0x41e1)

Hit any key to stop autoboot:  0

 

NAND read: device 0 offset 0x200000, size 0x17ac1c

 1551388 bytes read: OK

## Booting kernel from Legacy Image at 22200000 ...

   Image Name:   linux-2.6 (7%), col 1/21 (4%), char 0/197 (0%) ]

   Image Type:   ARM Linux Kernel Image (uncompressed) Cut Text  ^C Cur Pos

   Data Size:    1551324 Bytes =  1.5 MBV Next Page ^U UnCut Text^T To Spell

   Load Address: 20008000

   Entry Point:  20008000

   Verifying Checksum ... OK

   Loading Kernel Image ... OK

OK

 

Starting kernel ...

 

Uncompressing
Linux.......................................................................
.............................. done, booting the kernel.

Linux version 2.6.27 (nferre at bendor) (gcc version 4.2.0 20070413
(prerelease) (CodeSourcery Sourcery G++ Lite 2007q1-10)) #1 Thu Sep 24
17:13:57 CEST 2009

CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177

Machine: Atmel AT91SAM9263-EK

Ignoring unrecognised tag 0x54410008

Memory policy: ECC disabled, Data cache writeback

Clocks: CPU 199 MHz, master 99 MHz, main 16.367 MHz

CPU0: D VIVT write-back cache

CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets

CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets

Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256

Kernel command line: mem=64M console=ttyS0,115200 root=/dev/mtdblock1 rw
rootfstype=jffs2

AT91: 160 gpio irqs in 5 banks

PID hash table entries: 256 (order: 8, 1024 bytes)

Console: colour dummy device 80x30

console [ttyS0] enabled

Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)

Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)

Memory: 64MB = 64MB total

Memory: 61632KB available (2864K code, 234K data, 124K init)

Calibrating delay loop... 99.73 BogoMIPS (lpj=498688)

Mount-cache hash table entries: 512

CPU: Testing write buffer coherency: ok

net_namespace: 288 bytes

NET: Registered protocol family 16

AT91: Power Management

AT91: Starting after user reset

SCSI subsystem initialized

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

NET: Registered protocol family 2

IP route cache hash table entries: 1024 (order: 0, 4096 bytes)

TCP established hash table entries: 2048 (order: 2, 16384 bytes)

TCP bind hash table entries: 2048 (order: 1, 8192 bytes)

TCP: Hash tables configured (established 2048 bind 2048)

TCP reno registered

NET: Registered protocol family 1

NetWinder Floating Point Emulator V0.97 (double precision)

JFFS2 version 2.2. (NAND) (SUMMARY)  ?? 2001-2006 Red Hat, Inc.

msgmni has been set to 120

io scheduler noop registered

io scheduler anticipatory registered (default)

atmel_lcdfb atmel_lcdfb.0: 150KiB frame buffer at 23940000 (mapped at
ffc00000)

Console: switching to colour frame buffer device 30x40

atmel_lcdfb atmel_lcdfb.0: fb0: Atmel LCDC at 0x00700000 (mapped at
c485c000), irq 26

atmel_usart.0: ttyS0 at MMIO 0xfeffee00 (irq = 1) is a ATMEL_SERIAL

atmel_usart.1: ttyS1 at MMIO 0xfff8c000 (irq = 7) is a ATMEL_SERIAL

brd: module loaded

loop: module loaded

MACB_mii_bus: probed

eth0: Atmel MACB at 0xfffbc000 irq 21 (3a:1f:34:08:54:54)

eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=ffffffff:00,
irq=-1)

Driver 'sd' needs updating - please use bus_type methods

NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 3,3V
8-bit)

AT91 NAND: 8-bit, Software ECC

Scanning device for bad blocks

Bad eraseblock 543 at 0x043e0000

Bad eraseblock 1237 at 0x09aa0000

Bad eraseblock 1260 at 0x09d80000

Bad eraseblock 2003 at 0x0fa60000

Creating 3 MTD partitions on "atmel_nand":

0x00000000-0x00400000 : "Bootstrap"

0x00400000-0x04000000 : "Partition 1"

0x04000000-0x10000000 : "Partition 2"

atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffa4000 (irq 14)

usbmon: debugfs is not available

at91_ohci at91_ohci: AT91 OHCI

at91_ohci at91_ohci: new USB bus registered, assigned bus number 1

at91_ohci at91_ohci: irq 29, io mem 0x00a00000

usb usb1: configuration #1 chosen from 1 choice

hub 1-0:1.0: USB hub found

hub 1-0:1.0: 2 ports detected

Initializing USB Mass Storage driver...

usbcore: registered new interface driver usb-storage

USB Mass Storage support registered.

udc: at91_udc version 3 May 2006

mice: PS/2 mouse device common for all mice

input: gpio-keys as /class/input/input0

ads7846 spi0.3: touchscreen, irq 31

input: ADS784x Touchscreen as /class/input/input1

rtc-at91sam9 at91_rtt.0: rtc core: registered at91_rtt as rtc0

rtc-at91sam9 at91_rtt.0: rtc0: SET TIME!

Registered led device: ds1

Registered led device: ds2

Registered led device: ds3

usbcore: registered new interface driver usbhid

usbhid: v2.6:USB HID core driver

Advanced Linux Sound Architecture Driver Version 1.0.17.

AC97C regs = FFFA0000

AC97C irq  = 18

at91-ac97: codec write timeout

<4>at91-ac97: codec write timeout

<4>at91-ac97: codec write timeout

<4>at91-ac97: codec write timeout

<6>ALSA device list:

  #0: Atmel AC97 Controller at 0xfffa0000, irq 18

TCP cubic registered

NET: Registered protocol family 17

RPC: Registered udp transport module.

RPC: Registered tcp transport module.

rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock

Empty flash at 0x00fe6848 ends at 0x00fe7000

Empty flash at 0x00ff3754 ends at 0x00ff3800

Empty flash at 0x00ffdbb8 ends at 0x00ffe000

Empty flash at 0x013e3a90 ends at 0x013e4000

VFS: Mounted root (jffs2 filesystem).

Freeing init memory: 124K

mmc0: new SD card at address cb87

mmcblk0: mmc0:cb87 SD02G 1921024KiB (ro)

 mmcblk0: p1

done

Starting portmap: done

Initializing random number generator... done.

Starting network...

ifup: interface lo already configured

ifup: interface eth0 already configured

 thttpd

 

Welcome to Buildroot

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100217/3a092a09/attachment.htm>
