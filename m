From: Wade Maxfield <wmaxfield@gmail.com>
Date: Tue, 9 Mar 2010 12:18:34 -0600
Subject: [Buildroot] Newbie: buildroot PPC failure to boot
Message-ID: <45a1b53e1003091018j3be70959y607d9ef9974ae8b4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  I apologize for bothering, but I've googled and searched the mailing list,
and I don't know what to look at/for next.

  I have a booting linux kernel with the initrd ram file system downloaded
from the xilinx wiki, and it works.  I tried to add an application to it and
it failed miserable.  I assumed that buildroot would probably give me enough
libraries and a build environment to create our own application.

  I downloaded buildroot, and the fun begins.

  I then ran buildroot make menuconfig (the "stable download" one
buildroot-2010.02.tar.gz) and created a power pc root file system.

  I unchecked wchar and unchecked "build shared libgcc" based on other
comments I'd read.

  I booted, and the system hung.  I then tried to do an init=/bin/bash boot,
and got the following (which is essentially identical to the boot without
the init line)

  My questions are:

  1) Is the "rootfs image is not initramfs" important?
  2) is the "RAMDISK: incomplete write" error important?
  3) What do I look at next, what appears to need fixing?  What files should
I look at? What did I forget to configure?

  I followed the "make menuconfig" gui to build the file system, taking
defaults for my first rattle out of the box. I'm cross building on Centos
5.  I was hoping the "default" build would be probably what I need.  This is
a powerpc 405 build, with _soft_fpu

  If you need any files, I'll need to know where they would probably be
located, I'm totally new to this buildroot thing and my head is still
spinning.

  Please help!

THANKS!!!

ML405 board, 128meg DDR ram, boot lines:
------------------------------------------------------------------------------------------------

Image starting: loaded at 0x00400000 (sp: 0x00785eb0)
Allocating 0x3967a8 bytes for kernel ...
gunzipping (0x00000000 <- 0x0040d000:0x005ac576)...done 0x374094 bytes
Attached initrd image at 0x005ad000-0x00784541
initrd head: 0x1f8b0808

Linux/PowerPC load: console=ttyS0 ip=192.168.1.243 root=/dev/ram rw
init=/bin/bash
Finalizing device tree... flat tree at 0x792300
Using Xilinx Virtex machine description
Linux version 2.6.32 (maxfield at localhost.localdomain) (gcc version 4.2.2) #1
PREEMPT Thu Feb 18 16:54:35 CST 2010
Found initrd@0xc05ad000:0xc0784541
Zone PFN ranges:
  DMA      0x00000000 -> 0x00008000
  Normal   0x00008000 -> 0x00008000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00008000
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyS0 ip=192.168.1.243 root=/dev/ram rw
init=/bin/bash
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 124200k/131072k available (3372k kernel code, 6712k reserved, 168k
data, 133k bss, 160k init)
Kernel virtual memory layout:
  * 0xffffe000..0xfffff000  : fixmap
  * 0xfde00000..0xfe000000  : consistent mem
  * 0xfde00000..0xfde00000  : early ioremap
  * 0xc9000000..0xfde00000  : vmalloc & ioremap
Hierarchical RCU implementation.
NR_IRQS:512
clocksource: timebase mult[d55555] shift[22] registered
Console: colour dummy device 80x25
Mount-cache hash table entries: 512
NET: Registered protocol family 16
PCI: Probing PCI hardware
bio: create slab <bio-0> at 0
vgaarb: loaded
Switching to clocksource timebase
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Trying to unpack rootfs image as initramfs...
rootfs image is not initramfs (no cpio magic); looks like an initrd
Freeing initrd memory: 1885k freed
Installing knfsd (copyright (C) 1996 okir at monad.swb.de).
ROMFS MTD (C) 2007 Red Hat, Inc.
msgmni has been set to 246
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
83e00000.serial: ttyS0 at MMIO 0x83e01003 (irq = 0) is a 16550
console [ttyS0] enabled
brd: module loaded
loop: module loaded
Device Tree Probing 'ethernet'
xilinx_lltemac 81c00000.ethernet: MAC address is now  0: a:35:16:91: 0
xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
XLlTemac: Dma base address: phy: 0x84600100, virt: 0xc9028100
XLlTemac: buffer descriptor size: 32768 (0x8000)
XLlTemac: Allocating DMA descriptors with kmalloc
XLlTemac: (buffer_descriptor_init) phy: 0x7888000, virt: 0xc7888000, size:
0x8000
XTemac: PHY detected at address 7.
eth0: Dropping NETIF_F_SG since no checksum feature.
xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at 0x81C00000 mapped to
0xC9024000, irq=16
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
TCP cubic registered
NET: Registered protocol family 17
eth0: XLlTemac: Options: 0x3fa
eth0: XLlTemac: allocating interrupt 18 for dma mode tx.
eth0: XLlTemac: allocating interrupt 17 for dma mode rx.
eth0: XLlTemac: speed set to 100Mb/s
eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 254
IP-Config: Guessing netmask 255.255.255.0
IP-Config: Complete:
     device=eth0, addr=192.168.1.243, mask=255.255.255.0,
gw=255.255.255.255,
     host=192.168.1.243, domain=, nis-domain=(none),
     bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
RAMDISK: gzip image found at block 0
RAMDISK: incomplete write (17796 != 32768)
write error
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing unused kernel memory: 160k init
Failed to execute /bin/bash.  Attempting defaults...
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100309/83e89c4b/attachment.htm>
