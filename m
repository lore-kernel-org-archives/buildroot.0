From: Ryan Ordway <ryan.ordway@oregonstate.edu>
Date: Thu, 03 May 2007 15:43:44 -0700
Subject: [Buildroot] Problem with buildroot on ARM
Message-ID: <C25FB3B0.C618%ryan.ordway@oregonstate.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm having some issues with a rootfs image built through buildroot for an
ARM board. Here is some basic info:


Board: Atmel AT91SAM9260-EK
CPU: ARM926EJ-S rev 5 (v5l)
Kernel: 2.6.21.1 (latest stable)

I'm using the latest buildroot from subversion, r18550.

All is well until after the ramdisk is loaded, then I get a kernel panic.
Any ideas what might be causing this?






Uncompressing 
Linux.............................................................
................... done, booting the kernel.
Linux version 2.6.21.1-pml1 (rordway at alpha.powermand.com) (gcc version
4.1.2) #2
 Thu May 3 13:47:43 PDT 2007
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists.  Total pages: 16256
Kernel command line: ram=64M console=ttyS0,115200 initrd=0x21000000
root=/dev/ram0 init=/linuxrc rw
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 59312KB available (2224K code, 330K data, 104K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Generic PHY: Registered new driver
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 3, 40960 bytes)
TCP bind hash table entries: 2048 (order: 3, 40960 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
checking if image is initramfs...it isn't (no cpio magic); looks like an
initrd 
Freeing initrd memory: 2888K
NetWinder Floating Point Emulator V0.97 (extended precision)
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered (default)
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
loop: loaded (max 8 devices)
Davicom DM9161E: Registered new driver
Davicom DM9131: Registered new driver
dm9000 Ethernet Driver
macb macb: detected PHY at address 0 (ID 0181:b8a0)
eth0: Atmel MACB at 0xfffc4000 irq 21 (02:03:04:05:06:07)
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
SSFDC read-only Flash Translation layer
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V
8-bi
t)                 
NAND bus width 16 instead 8 bit
No NAND device found!!!
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
drivers/usb/serial/usb-serial.c: USB Serial support registered for cp2101
usbcore: registered new interface driver cp2101
drivers/usb/serial/cp2101.c: Silicon Labs CP2101/CP2102 RS232 serial adaptor
dri
ver v0.07          
udc: at91_udc version 3 May 2006
ether gadget: using random self ethernet address
ether gadget: using random host ethernet address
usb0: Ethernet Gadget, version: May Day 2005
usb0: using at91_udc, OUT ep2 IN ep1 STATUS ep4
usb0: MAC da:af:79:f3:97:1e
usb0: HOST MAC ee:9f:94:c8:5d:22
mice: PS/2 mouse device common for all mice
AT91 MMC: 4 wire bus mode not supported by this driver - using 1 wire
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 17
NET: Registered protocol family 15
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 104K
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000     
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in: 
CPU: 0             
PC is at init_dev+0x28/0x4e8
LR is at tty_open+0x120/0x304
pc : [<c00f8a18>]    lr : [<c00fbce4>]    Not tainted
sp : c12e1e08  ip : c12e1e50  fp : c12e1e4c
r10: 00000002  r9 : 00000000  r8 : c12e0000
r7 : 00000001  r6 : c1237c00  r5 : c0299c38  r4 : c12fb8a0
r3 : 00000000  r2 : c12e1e54  r1 : 00000000  r0 : c1237c00
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 5317F     
Table: 20004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc12e0258)
Stack: (0xc12e1e08 to 0xc12e2000)
1e00:                   c12e1e54 c025fce8 c12e1e50 c1237c00 00000000
c12e0000   
1e20: c12e1e4c c12fb8a0 c0299c38 00500001 00000001 c12e0000 00000000
00000002   
1e40: c12e1e7c c12e1e50 c00fbce4 c00f8a00 00000000 c3d78a40 00000000
c0299c38   
1e60: c3d78a40 c12fb8a0 c1257bc8 00000000 c12e1ea4 c12e1e80 c0080d7c
c00fbbd4   
1e80: c12e1ea4 00000000 c12fb8a0 c3d78a40 c0080c2c c12d3220 c12e1ecc
c12e1ea8   
1ea0: c007c758 c0080c3c c12fb8a0 c12e1ef8 c03a4000 00000000 ffffff9c
00000000   
1ec0: c12e1eec c12e1ed0 c007c8f4 c007c674 00000000 ffffff9c 00000000
00000002   
1ee0: c12e1f5c c12e1ef0 c007c950 c007c8d0 c12e1ef8 c00ef830 c1257bc8
c12d3220   
1f00: c0065970 00000002 c12e0000 00000101 00000001 00000000 c12e1f34
c12e1f28   
1f20: c01d74f0 c00ef830 c12e1f5c c12e1f38 c007c658 c01d74f0 00000002
00000003   
1f40: 00000000 c12fb8a0 00000002 00000000 c12e1f84 c12e1f60 c007c9ac
c007c91c   
1f60: c0029be8 c0269f98 c001f87c c12e0000 00000000 00000000 c12e1f94
c12e1f88   
1f80: c007ca28 c007c968 c12e1fac c12e1f98 c002205c c007ca14 c0269f98
c0269f98   
1fa0: c12e1ff4 c12e1fb0 c000886c c002203c 00000000 00000000 c00086fc
c00406bc   
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000   
1fe0: 00000000 00000000 00000000 c12e1ff8 c00406bc c000870c 00220008
00020015   
Backtrace:         
[<c00f89f0>] (init_dev+0x0/0x4e8) from [<c00fbce4>] (tty_open+0x120/0x304)
[<c00fbbc4>] (tty_open+0x0/0x304) from [<c0080d7c>]
(chrdev_open+0x150/0x1a0)
[<c0080c2c>] (chrdev_open+0x0/0x1a0) from [<c007c758>]
(__dentry_open+0xf4/0x1e4)
 r7 = C12D3220  r6 = C0080C2C  r5 = C3D78A40  r4 = C12FB8A0
[<c007c664>] (__dentry_open+0x0/0x1e4) from [<c007c8f4>]
(nameidata_to_filp+0x34/0x4c)
[<c007c8c0>] (nameidata_to_filp+0x0/0x4c) from [<c007c950>]
(do_filp_open+0x44/0x4c)
 r4 = 00000002     
[<c007c90c>] (do_filp_open+0x0/0x4c) from [<c007c9ac>]
(do_sys_open+0x54/0x98)
 r5 = 00000000  r4 = 00000002
[<c007c958>] (do_sys_open+0x0/0x98) from [<c007ca28>] (sys_open+0x24/0x28)
 r8 = 00000000  r7 = 00000000  r6 = C12E0000  r5 = C001F87C
 r4 = C0269F98     
[<c007ca04>] (sys_open+0x0/0x28) from [<c002205c>] (init_post+0x30/0xe8)
[<c002202c>] (init_post+0x0/0xe8) from [<c000886c>] (init+0x170/0x1b8)
 r4 = C0269F98     
[<c00086fc>] (init+0x0/0x1b8) from [<c00406bc>] (do_exit+0x0/0x808)
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: e3130010 059030c8 e1a06000 e1a09001 (07935101)
Kernel panic - not syncing: Attempted to kill init!




-- 
Ryan Ordway                          E-mail:   rordway at oregonstate.edu
Unix Systems Administrator             rordway at library.oregonstate.edu
OSU Libraries, Corvallis, OR 97370        Office: Valley Library #4657
