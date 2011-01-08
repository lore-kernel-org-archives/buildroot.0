From: Divick Kishore <divick.kishore@gmail.com>
Date: Sat, 8 Jan 2011 18:32:31 +0530
Subject: [Buildroot] Linux kernel boot stops after NFS mount
Message-ID: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I am trying to build a custom root filesystem using build root, but the
build process stops after nfs mount. It seems that init process is not
launched. Could anyone please suggest how can I debug this problem? I have
searched the list and tried googling it but couldn't find much help.

The toolchain used for building rootfs is CodeSourcery G++ Lite 2010.09-50
(arm-none-linux-gnueabi-gcc-4.5.1). My board is able to boot using the
filesystem provided with the board. The uboot is the one that was provided
by the h/w vendor and I have built the Linux kernel using the above
mentioned toolchain.

Version of buildroot used is buildroot-2010.11.

The boot log is shown below and the config file for build root is attached
with the mail.

=============================================================
Darrell's loader - Thanks to the u-boot project
Version 1.0. Build Feb 22 2010 15:45:18
64MB?
32MB?
Writing...
Reading...
RAM:32MB

1: Upload Darrell's loader to Dataflash
2: Upload u-boot to Dataflash
3: Upload Kernel to Dataflash
4: Start u-boot
5: Upload Filesystem image
6: Memory test
DataFlash:AT45DB321
Dataflash read successful: Starting U-boot


U-Boot 1.1.6 (Oct 22 2007 - 10:35:14)

DRAM:  32 MB
Atmel: Flash:  0 kB
DataFlash:AT45DB321
Nb pages:   8192
Page Size:    528
Size= 4325376 bytes
Logical address: 0xC0000000
Area 0: C0000000 to C000317F (RO) Darrell loader
Area 1: C0003180 to C001F73F (RO) U-boot
Area 2: C001F740 to C002183F      Environment
Area 3: C0021840 to C01ACFFF      Kernel
Area 4: C01AD000 to C041FFFF (RO) Filesystem
In:    serial
Out:   serial
Err:   serial
I am checking if it is connected
Hit any key to stop autoboot:  0
I am checking if it is connected
TFTP from server 192.168.1.4; our IP address is 192.168.1.7
Filename 'newat91.img'.
Load address: 0x20200000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #########
done
Bytes transferred = 1709973 (1a1795 hex)
## Booting image at 20200000 ...
   Image Name:   Linux Kernel Image
   Image Type:   ARM Linux Kernel Image (gzip compressed)
   Data Size:    1709909 Bytes =  1.6 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK

Starting kernel ...

Linux version 2.6.21.6 (divkis01 at divkis01-pc) (gcc version 4.5.1 (Sourcery
G++ Lite 2010.09-50) ) #13 Sat Jan 8 18:06:30 IST 2011
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0003177
Machine: emQbit's ECB_AT91 V1
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 179 MHz, master 59 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists.  Total pages: 8128
Kernel command line: mem=32M rootfstype=ext3 root=/dev/nfs
nfsroot=192.168.1.4:/nfs ip=dhcp console=ttyS0
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB = 32MB total
Memory: 29140KB available (2968K code, 228K data, 104K init)
Security Framework v1.0.0 initialized
Capability LSM initialized
Failure registering Root Plug module with the kernel
Failure registering Root Plug  module with primary security module.
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Generic PHY: Registered new driver
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
NetWinder Floating Point Emulator V0.97 (double precision)
fuse init (API version 7.8)
JFS: nTxBlock = 227, nTxLock = 1821
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffc0000 (irq = 6) is a ATMEL_SERIAL
loop: loaded (max 8 devices)
at91_ether: phy_id1=0x0000ffff phy_id2=0x0000ffff
at91_ether: phy_id=0xffffffff
at91_ether: phy_id1=0x00000022 phy_id2=0x00001619
at91_ether: phy_id=0x00221619
eth0: Link now 100-FullDuplex
eth0: AT91 ethernet at 0xfefbc000 int=24 100-FullDuplex (00:00:00:00:00:5b)
eth0: Micrel KS8721 PHY
usbcore: registered new interface driver zd1201
st: Version 20070203, fixed bufsize 32768, s/g segs 256
SCSI Media Changer driver v0.25
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 23, io mem 0x00300000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
AT91 MMC: 4 wire bus mode not supported by this driver - using 1 wire
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <
jketreno@linux.intel.com>
eth0: Link now 100-FullDuplex
eth0: Link now 100-FullDuplex
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 192.168.1.1, my address is 192.168.1.8
IP-Config: Complete:
      device=eth0, addr=192.168.1.8, mask=255.255.255.0, gw=192.168.1.1,
     host=unknown00000000005b, domain=local.lan, nis-domain=(none),
     bootserver=192.168.1.1, rootserver=192.168.1.4, rootpath=
Looking up port of RPC 100003/2 on 192.168.1.4
Looking up port of RPC 100005/1 on 192.168.1.4
VFS: Mounted root (nfs filesystem).
Freeing init memory: 104K

=============================================================

... No output is seen after this.


Thanks in advance,
DivKis
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110108/e8ce14f8/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 17984 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110108/e8ce14f8/attachment-0001.obj>
