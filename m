From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 22 Apr 2008 14:34:08 +0200
Subject: [Buildroot] Failing NFS root mount
Message-ID: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
so I have an operational system when using a local CF card partition for my 
kernel and my root filesystem. I can use the network fine.

I'm now trying to use a local kernel but an NFS mount for the root 
filesystem.

loaded at:     00400000 0051A59C
board data at: 00518520 0051859C
relocated to:  0040505C 004050D8
zimage at:     00405E48 00517277
avail ram:     0051B000 08000000

Linux/PPC load: console=ttyUL0,115200 rw root=/dev/nfs ip=dhcp
Uncompressing Linux...done.
Now booting the kernel
[    0.000000] Linux version 2.6.24-rc8-xlnx (guinevere at lpsc6185x.in2p3.fr) 
(gcc version 4.1.2)
#12 Mon Apr 21 18:11:51 CEST 2008
[    0.000000] Xilinx Generic PowerPC board support package (Xilinx ML405) 
(Virtex-4 FX)
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA             0 ->    32768
[    0.000000]   Normal      32768 ->    32768
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[1] active PFN ranges
[    0.000000]     0:        0 ->    32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total 
pages: 32512
[    0.000000] Kernel command line: console=ttyUL0,115200 rw root=/dev/nfs 
ip=dhcp
[    0.000000] Xilinx INTC #0 at 0x81800000 mapped to 0xFDFFF000
[    0.000000] PID hash table entries: 512 (order: 9, 2048 bytes)
[    0.000223] Console: colour dummy device 80x25
[    0.001398] Dentry cache hash table entries: 16384 (order: 4, 65536 
bytes)
[    0.003160] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.039091] Memory: 127488k available (1748k kernel code, 580k data, 76k 
init, 0k highmem)
[    0.132604] Mount-cache hash table entries: 512
[    0.138336] net_namespace: 64 bytes
[    0.142296] NET: Registered protocol family 16
[    0.146217] Registering device uartlite:0
[    0.147224] Registering device xsysace:0
[    0.148357] Fixup MAC address for xilinx_lltemac:0
[    0.148401] Registering device xilinx_lltemac:0
[    0.149377] Registering device xilinx_iic:0
[    0.190854] NET: Registered protocol family 2
[    0.224923] IP route cache hash table entries: 1024 (order: 0, 4096 
bytes)
[    0.228135] TCP established hash table entries: 4096 (order: 3, 32768 
bytes)
[    0.228786] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.229146] TCP: Hash tables configured (established 4096 bind 4096)
[    0.229179] TCP reno registered
[    0.240639] sysctl table check failed: /kernel/l2cr .1.31 Missing 
strategy
[    0.240722] Call Trace:
[    0.240743] [c7c17eb0] [c0008148] show_stack+0x50/0x184 (unreliable)
[    0.240842] [c7c17ed0] [c002fb00] set_fail+0x50/0x68
[    0.240915] [c7c17ef0] [c0030168] sysctl_check_table+0x650/0x698
[    0.240965] [c7c17f20] [c0030178] sysctl_check_table+0x660/0x698
[    0.241011] [c7c17f50] [c001e188] register_sysctl_table+0x64/0xb4
[    0.241077] [c7c17f70] [c02345a0] register_ppc_htab_sysctl+0x18/0x2c
[    0.241143] [c7c17f80] [c02331e4] kernel_init+0xc8/0x284
[    0.241181] [c7c17ff0] [c0004b18] kernel_thread+0x44/0x60
[    0.248849] io scheduler noop registered
[    0.248906] io scheduler anticipatory registered (default)
[    0.248935] io scheduler deadline registered
[    0.249135] io scheduler cfq registered
[    0.328474] uartlite.0: ttyUL0 at MMIO 0x84000003 (irq = 8) is a uartlite
[    0.328551] console [ttyUL0] enabled
[    0.584278] loop: module loaded
[    0.588752] xsysace xsa: Xilinx SystemACE revision 1.0.12
[    0.594601] xsysace xsa: capacity: 1014048 sectors
[    0.598614]  xsa: xsa1 xsa2
[    0.605997] Xilinx SystemACE device driver, major=254
[    0.609910] tun: Universal TUN/TAP device driver, 1.6
[    0.614830] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.623026] xilinx_lltemac xilinx_lltemac.0: MAC address is now  0: a:35: 
1: 2: 3
[    0.629315] xilinx_lltemac xilinx_lltemac.0: XLlTemac: using DMA mode.
[    0.635822] XLlTemac: Dma base address: phy: 0x84600100, virt: 0xc9008100
[    0.642515] XLlTemac: buffer descriptor size: 32768 (0x8000)
[    0.648101] XLlTemac: Allocating DMA descriptors with kmalloc<6>XLlTemac: 
(buffer_descriptor_
init) phy: 0x7c88000, virt: 0xc7c88000, size: 0x8000
[    0.667177] XTemac: PHY detected at address 7.
[    0.670495] eth0: Dropping NETIF_F_SG since no checksum feature.
[    0.679776] xilinx_lltemac xilinx_lltemac.0: eth0: Xilinx TEMAC at 
0x81C00000 mapped to 0xC90
04000, irq=2
[    0.689318] mice: PS/2 mouse device common for all mice
[    0.695515] xilinx_iic.0 #0 at 0x81600000 mapped to 0xC9020000, irq=4
[    0.701021] TCP cubic registered
[    0.704170] NET: Registered protocol family 1
[    0.708380] NET: Registered protocol family 17
[    0.713739] RPC: Registered udp transport module.
[    0.717344] RPC: Registered tcp transport module.
[    1.224897] eth0: XLlTemac: Options: 0x3fa
[    1.227770] eth0: XLlTemac: allocating interrupt 0 for dma mode tx.
[    1.234053] eth0: XLlTemac: allocating interrupt 1 for dma mode rx.
[    3.254855] eth0: XLlTemac: speed set to 100Mb/s
[    3.258249] eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
[    3.264726] eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 
254
[    4.275661] Sending DHCP requests ., OK
[    4.299661] IP-Config: Got DHCP answer from 0.0.0.0, my address is 
192.168.1.200
[    4.306293] IP-Config: Complete:
[    4.308849]       device=eth0, addr=192.168.1.200, mask=255.255.255.0, 
gw=192.168.1.185,
[    4.316768]      host=genepy_t, domain=, nis-domain=(none),
[    4.322298]      bootserver=0.0.0.0, rootserver=192.168.1.185, 
rootpath=/home/guinevere/Min_U
artLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root
[    4.337448] Looking up port of RPC 100003/2 on 192.168.1.185
[    4.349735] Looking up port of RPC 100005/1 on 192.168.1.185
[    4.389172] VFS: Mounted root (nfs filesystem).
[    4.392920] Freeing unused kernel memory: 76k init
168.1.200, mask=255.255.255.0, gw=192.168.1.185,
[    4.316768]      host=genepy_t, domain=, nis-domain=(none),
[    4.322298]      bootserver=0.0.0.0, rootserver=192.168.1.185, 
rootpath=/home/guinevere/Min_U
artLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root
[    4.337448] Looking up port of RPC 100003/2 on 192.168.1.185
[    4.349735] Looking up port of RPC 100005/1 on 192.168.1.185
[    4.389172] VFS: Mounted root (nfs filesystem).
[    4.392920] Freeing unused kernel memory: 76k init

And then it hangs.
If I boot from /dev/xsa2, it then carries on with:

init started: BusyBox v1.10.0 (2008-04-21 14:17:09 CEST)
Starting portmap: done
Initializing random number generator... done.
Starting network...
RTNETLINK answers: File exists
Starting dropbear sshd: OK
Welcome
genepy login:



A few additional hints that may be related (but then again, they may not):
If I log from the local partition, I can mount the remote root by NFS fine, 
for instance:

# mount -t nfs 
192.168.1.185:/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root 
/mount

And then manipulate files both ways fine.

But if I try to chroot /mount while being in bash (an independant 
executable) I get an endless loop:
[   61.617885]   Code:   30001
[   61.617896]   Addr:   7ffce003
[   61.627400]   Signal: b
[   61.627410]   Code:   30001
[   61.627421]   Addr:   7ffce003
[   61.636840]   Signal: b

If I'm using ash (linked to busybox), then I can chroot okay (problems with 
/proc but I can run executables).


Question: if booting off NFS, do I need to change the /etc/fstab ?
/dev/root       /              ext2     rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0      0
tmpfs           /tmp           tmpfs    defaults          0      0

Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/
