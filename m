From: Ajay Sharma <linuxnajay@gmail.com>
Date: Mon, 14 May 2007 17:17:24 -0700
Subject: [Buildroot] Busybox console wont show up
Message-ID: <1b0abb4c0705141717m43eeef65r4e0a593e21dc87e7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
I have built successfully kernel and file system  image  for IXP425
development board. When I try to boot the system, it boots till it shows
this screen and does not show the Busybox prompt on the screen .
I am trying to see that on the Serial Console.
I have also changed the line

#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100

to

ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100

in /etc/inittab

to make the get the busybox on the serial console.
Please can any one help in this regard?

Thanks
-Ajay

-------------------------------------xxx----------------------------------------------------------------

Platform: IXDP425 Development Platform (IXP42X 533MHz) BE
Copyright (C) 2000, 2001, 2002, 2003, 2004, 2007 Free Software Foundation,
Inc.

RAM: 0x00000000-0x10000000, [0x00029f48-0x0ffc1000] available
FLASH: 0x50000000 - 0x51000000, 128 blocks of 0x00020000 bytes each.
== Executing boot script in 3.000 seconds - enter ^C to abort
RedBoot> fis load -b %{FREEMEMLO} kernel
RedBoot> exec -c "console=ttyS0,115200 rootfstype=jffs2 root=/dev/mtdblock3"
Using base address 0x0002a000 and length 0x00180000
Uncompressing
Linux.............................................................
............ done, booting the kernel.
Linux version 2.6.20.4 (ajay at workbenchlinux) (gcc version 4.1.2 ) #4 PREEMPT
Mon
May 14 15:58:20 PDT 2007
CPU: XScale-IXP42x Family [690541c1] revision 1 (ARMv5TE), cr=000039ff
Machine: Intel IXDP425 Development Platform
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists.  Total pages: 65024
Kernel command line: console=ttyS0,115200 rootfstype=jffs2
root=/dev/mtdblock3
PID hash table entries: 1024 (order: 10, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 256MB = 256MB total
Memory: 257408KB available (2040K code, 146K data, 84K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
IXP4xx: Using 16MiB expansion bus window size
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 8192 bind 4096)
TCP reno registered
NetWinder Floating Point Emulator V0.97 (double precision)
audit: initializing netlink socket (disabled)
audit(0.390:1): initialized
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xc8000000 (irq = 15) is a XScale
serial8250.0: ttyS1 at MMIO 0xc8001000 (irq = 13) is a XScale
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
Ethernet Channel Bonding Driver: v3.1.1 (September 26, 2006)
bonding: Warning: either miimon or arp_interval and arp_ip_target module
paramet
ers must be specified, otherwise bonding will not detect link failures! see
bond
ing.txt for details.
netconsole: not configured, aborting
IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Searching for RedBoot partition table in IXP4XX-Flash.0 at offset 0xfe0000
7 RedBoot partitions found on MTD device IXP4XX-Flash.0
Creating 7 MTD partitions on "IXP4XX-Flash.0":
0x00000000-0x00080000 : "RedBoot"
0x00080000-0x00200000 : "kernel"
0x00200000-0x00220000 : "unallocated"
0x00220000-0x00fc0000 : "jffs2"
0x00fc0000-0x00fe0000 : "unallocated"
0x00fe0000-0x00fff000 : "FIS directory"
0x00fff000-0x01000000 : "RedBoot config"
mice: PS/2 mouse device common for all mice
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 17
XScale DSP coprocessor detected.
Time: OSTS clocksource has been installed.
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8a8:
0x67fa in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8ac:
0x56fe in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8b0:
0x6eee in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8b4:
0x57ec in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8b8:
0x55a7 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8bc:
0xeecf in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8c0:
0xf7fe in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8c4:
0x3376 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8c8:
0x73cf in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002ee8cc:
0x7f7a in
stead
Further such events for this erase block will not be printed
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 84K


----------------------------------xx---------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070514/1aec39c0/attachment.htm 
