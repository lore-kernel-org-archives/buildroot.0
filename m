From: Luisa Posani <lposani@yahoo.it>
Date: Wed, 17 Apr 2013 09:42:19 +0100 (BST)
Subject: [Buildroot] I: Configure buildroot for xen
Message-ID: <1366188139.51067.YahooMailClassic@web171906.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



--- Mer 17/4/13, Luisa Posani <lposani@yahoo.it> ha scritto:

Da: Luisa Posani <lposani@yahoo.it>
Oggetto: Configure buildroot for xen
A: buildroot at busybox.net
Data: Mercoled? 17 Aprile 2013, 10:37

Hi

It is my first experience with buildroot.
I would like to configure the buildroot to create a virtual machine with XEN.
I need a filesystem, a kernel and an initrd.

I configured on buildroot

BR_TARGET_ROOTFS_TAR
BR_TARGET_ROOTFS_CPIO
BR_TARGET_ROOTFS_INITRAMFS


xen and I launched with the command

xen-create-image --fs=ext3 --initrd=rootfs.cpio --kernel = bzImage --install-method = tar --install-source = rootfs.tar -- hostname = test -- verbose --force



xen generates two files disk.img and swap.img

When
 I run the machine with the command

xen create / etc / xen / test.cfg

gives me the following tracks..

Where did I go wrong?

Thanks to those who can help me

Luisa


Linux version 3.7.8 (root at asslx0107) (gcc version 4.6.3 (Buildroot 2013.02) ) #36 SMP Wed Apr 17 10:24:15 CEST 2013
ACPI in unprivileged domain disabled
e820: BIOS-provided physical RAM map:
Xen: [mem 0x0000000000000000-0x000000000009ffff] usable
Xen: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Xen: [mem 0x0000000000100000-0x00000000087fffff] usable
NX (Execute Disable) protection: active
DMI not present or invalid.
e820: last_pfn = 0x8800 max_arch_pfn = 0x1000000
init_memory_mapping: [mem 0x00000000-0x087fffff]
RAMDISK: [mem 0x01704000-0x01afffff]
0MB HIGHMEM available.
136MB LOWMEM available.
? mapped low ram: 0 - 08800000
? low ram: 0 - 08800000
Zone ranges:
? DMA????? [mem 0x00010000-0x00ffffff]
? Normal?? [mem 0x01000000-0x087fffff]
? HighMem? empty
Movable zone start for each node
Early memory node ranges
? node?? 0: [mem 0x00010000-0x0009ffff]
? node?? 0: [mem 0x00100000-0x087fffff]
Using APIC driver default
smpboot: Allowing 1 CPUs, 0 hotplug CPUs
Local APIC disabled by BIOS -- you can enable it with "lapic"
APIC: disable apic facility
APIC: switched to apic NOOP
e820: [mem 0x08800000-0xffffffff] available for PCI devices
Booting paravirtualized kernel on Xen
Xen version: 4.0.1 (preserve-AD)
setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:1 nr_node_ids:1
PERCPU: Embedded 12 pages/cpu @c7ee0000 s27616 r0 d21536 u49152
Built 1 zonelists in Zone order, mobility grouping on.? Total pages: 34432
Kernel command line: root=/dev/xvda2 rw ip=:127.0.255.255::::eth0:dhcp 
PID hash table entries: 1024
 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
__ex_table already sorted, skipping sort
Initializing CPU#0
Initializing HighMem for node 0 (00000000:00000000)
Memory: 119948k/139264k available (3057k kernel code, 18868k reserved, 992k data, 432k init, 0k highmem)
virtual kernel memory layout:
??? fixmap? : 0xf5717000 - 0xf57ff000?? ( 928 kB)
??? pkmap?? : 0xf5400000 - 0xf5600000?? (2048 kB)
??? vmalloc : 0xc9000000 - 0xf53fe000?? ( 707 MB)
??? lowmem? : 0xc0000000 - 0xc8800000?? ( 136 MB)
????? .init : 0xc13f5000 - 0xc1461000?? ( 432 kB)
????? .data : 0xc12fc627 - 0xc13f48a0?? ( 992 kB)
????? .text : 0xc1000000
 - 0xc12fc627?? (3057 kB)
SLUB: Genslabs=15, HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Hierarchical RCU implementation.
??? RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
NR_IRQS:2304 nr_irqs:256 16
Console: colour dummy device 80x25
console [tty0] enabled
console [hvc0] enabled
installing Xen timer for CPU 0
tsc: Detected 2793.074 MHz processor
Calibrating delay loop (skipped), value calculated using timer frequency.. 5586.14 BogoMIPS (lpj=11172296)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32
tlb_flushall_shift: -1
Freeing SMP alternatives: 16k freed
cpu 0 spinlock event irq 17
Performance Events: unsupported p6 CPU model 23 no PMU driver, software events only.
Brought up 1 CPUs
Grant tables using version 2 layout.
Grant table initialized
NET: Registered protocol family 16
PCI: setting up Xen PCI frontend stub
bio:
 create slab <bio-0> at 0
ACPI: Interpreter disabled.
xen/balloon: Initialising balloon driver.
xen-balloon: Initialising balloon driver.
vgaarb: loaded
PCI: System does not support PCI
PCI: System does not support PCI
Switching to clocksource xen
pnp: PnP ACPI: disabled
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP: reno registered
UDP hash table entries: 256 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
NET: Registered protocol family 1
Unpacking initramfs...
Freeing initrd memory: 4080k freed
platform rtc_cmos: registered platform RTC device (no PNP device found)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Event-channel device installed.
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
Initialising
 Xen virtual ethernet driver.
i8042: PNP: No PS/2 controller found. Probing ports directly.
i8042: No controller found
mousedev: PS/2 mouse device common for all mice
IPv4 over IPSec tunneling driver
TCP: cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET:
 Registered protocol family 17
NET: Registered protocol family 15
Using IPI No-Shortcut mode
blkfront: xvda2: barrier: enabled
Setting capacity to 8388608
xvda2: detected capacity change from 0 to 4294967296
blkfront: xvda1: barrier: enabled
Setting capacity to 262144
xvda1: detected capacity change from 0 to 134217728
Sending DHCP
 requests .., OK
IP-Config: Got DHCP answer from 0.0.0.0, my address is 172.22.213.101
IP-Config: Complete:
???? device=eth0, addr=172.22.213.101, mask=255.255.252.0, gw=172.22.212.253
???? host=172.22.213.101, domain=elsagsecurity.it, nis-domain=(none)
???? bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
???? nameserver0=172.22.212.1, nameserver1=172.22.212.26
,
 nameserver2=10.36.2.20
Freeing unused kernel memory: 432k freed
Starting logging: OK
Starting mdev...
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists

and the virtual machine is blocked..

only once managed to assemble (with errors of the disk read-only)
then no more


sing IPI No-Shortcut mode

blkfront: xvda2: barrier: enabled

Setting capacity to 8388608

xvda2: detected capacity change from 0 to 4294967296

blkfront: xvda1: barrier: enabled

Setting capacity to 262144

xvda1: detected capacity change from 0 to 134217728

Sending DHCP requests .., OK

IP-Config: Got DHCP answer from 0.0.0.0, my address is 172.22.213.101

IP-Config: Complete:

???? device=eth0, addr=172.22.213.101, mask=255.255.252.0, gw=172.22.212.253

???? host=172.22.213.101, domain=elsagsecurity.it, nis-domain=(none)

???? bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=

???? nameserver0=172.22.212.1, nameserver1=172.22.212.26

, nameserver2=10.36.2.20

kjournald starting.? Commit interval 5 seconds

EXT3-fs (xvda2): mounted filesystem with ordered data mode

VFS: Mounted root (ext3 filesystem) readonly on device 202:2.

Freeing unused kernel memory: 428k freed

Starting logging: OK

Starting mdev...

mdev: /sys/class: No such file or directory

Initializing random number generator... read-only file system detected...done

Starting network...

ip: RTNETLINK answers: File exists

ifup: can't open '/var/run/ifstate': Read-only file system




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130417/56823e15/attachment-0001.html>
