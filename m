From: Jason Rennie <jason.rennie@rftechnology.com.au>
Date: Fri, 02 Aug 2013 09:49:21 +1000
Subject: [Buildroot] Problem with an MPC8272 build
Message-ID: <51FAF401.60702@rftechnology.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to get buildroot to work with an MPC8272 based device that we 
have. I've been trying for a while and using google to see if it can 
help but i'm getting nowhere so I thought I would try going to the source.

I think i've set up buildroot correctly and have it configured to be an 
mpc8272ads as the kernel defconfig. I know the kernel can be built (so 
it seems) because the device does have an old 2.6.18 kernel running on 
it at the moment that boots successfully, using U-Boot and an older 
version of buildroot to make the file system.

But now I can't get the kernel to boot at all. Or at least nothing shows 
when it comes to booting the kernel.

Buildroot does run successfully, and I have put the rootfs that is made 
on the device and it does boot successfully with the older kernel (well 
mostly, some networking stuff appears to be missing). But when I put the 
new kernel on the device I get nothing. I've tried enabling early kernel 
debugging but with no success (setting the CPM to the addresses 
suggested by the old kernels output). I also don't seem to be able to 
get U-Boot to work and I need to end up breaking out the BDI2000 anytime 
I try to update U-Boot with the newer version as I brick the device.

I have tried with the most basic possible build, not tweaking anything 
and basically just doing the stock buildroot build for the MPC8272 
through to poking and tweaking all sorts of thing.

Any tips? I've attached the old dmesg output if tht helps. I'm 
hopelessly confused and been beating my head against this for a month so 
any help would be greatly appreciated. I'm pretty much out of ideas.

Jason
-------------- next part --------------
Linux version 2.6.18 (dmytro at woomera) (gcc version 4.1.1) #51 PREEMPT Thu Dec 31 15:22:09 EST 2009
Motorola PQ2 ADS PowerPC port
On node 0 totalpages: 16384
  DMA zone: 16384 pages, LIFO batch:3
Built 1 zonelists.  Total pages: 16384
Kernel command line: console=ttyCPM0,115200 root=31:02 rw rootfstype=jffs2 mtdparts=physmap-flash.0:512K(U-Boot),1024k(Linux),-(root) ip=192.168.1.201:192.168.1.165::255.255.255.0:eclipse:eth0:on panic=1
PID hash table entries: 512 (order: 9, 2048 bytes)
Warning: real time clock seems stuck!
cpm_uart: console: compat mode
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 62720k available (1708k kernel code, 436k data, 92k init, 0k highmem)
Calibrating delay loop... 175.10 BogoMIPS (lpj=87552)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
mpc8272ads: Init
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 2048 bind 1024)
TCP reno registered
JFFS2 version 2.2. (C) 2001-2006 Red Hat, Inc.
fuse init (API version 7.7)
io scheduler noop registered
io scheduler deadline registered (default)
Generic RTC Driver v1.07
Software Watchdog Timer: 0.07 initialized. soft_noboot=0 soft_margin=60 sec (nowayout= 1)
Serial: CPM driver $Revision: 0.02 $
ttyCPM0 at MMIO 0xf0011a00 (irq = 40) is a CPM UART
ttyCPM1 at MMIO 0xf0011a60 (irq = 43) is a CPM UART
RAMDISK driver initialized: 16 RAM disks of 32768K size 1024 blocksize
physmap platform flash device: 01000000 at ff000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x8000,blocks=4
erase region 1: offset=0x20000,size=0x20000,blocks=127
3 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00080000 : "U-Boot"
0x00080000-0x00180000 : "Linux"
0x00180000-0x01000000 : "root"
eth0: FCC ENET Version 0.3, de:ad:be:ef:12:34
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
IP-Config: Complete:
      device=eth0, addr=192.168.1.201, mask=255.255.255.0, gw=255.255.255.255,
     host=eclipse, domain=, nis-domain=(none),
     bootserver=192.168.1.165, rootserver=192.168.1.165, rootpath=
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 92k init
