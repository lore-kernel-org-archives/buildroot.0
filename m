From: Joo Aun Saw <jasaw81@yahoo.com.au>
Date: Thu, 24 Dec 2009 19:42:19 -0800 (PST)
Subject: [Buildroot] Buildroot boot failure on IXDP425
Message-ID: <538064.69303.qm@web52402.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I want to run Linux on ixdp425 board. This board has redboot bootloader. I'm using buildroot version 2009.08 and want to run kernel 2.6.30, and run rootfs from ramdisk. I managed to boot the kernel but it stops before it's able to load the rootfs. I've attached the boot log below. Does anyone know what is next thing the kernel is supposed to do or what is wrong here? 

Any help is greatly appreciated. Thanks and happy holidays.

Regards,
JA.



Linux version 2.6.30 (jooaun at draco-ubuntu-vm) (gcc version 4.4.1 (GCC) ) #5 Fri Dec 25 13:10:25 EST 2009
CPU: XScale-IXP42x Family [690541c1] revision 1 (ARMv5TE), cr=000039ff
CPU: VIVT data cache, VIVT instruction cache
Machine: Intel IXDP425 Development Platform
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttyS0,115200 root=/dev/ram0 initrd=0x800000,16M printk.time=1
[    0.000000] NR_IRQS:32
[    0.000000] PID hash table entries: 256 (order: 8, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 64MB = 64MB total
[    0.000000] Memory: 45152KB available (3024K code, 189K data, 116K init, 0K highmem)
[    0.000000] Calibrating delay loop... 532.48 BogoMIPS (lpj=2662400)
[    0.250000] Mount-cache hash table entries: 512
[    0.250000] CPU: Testing write buffer coherency: ok
[    0.250000] net_namespace: 716 bytes
[    0.250000] NET: Registered protocol family 16
[    0.250000] IXP4xx: Using 16MiB expansion bus window size
[    0.250000] PCI: IXP4xx is host
[    0.250000] PCI: IXP4xx Using direct access for memory space
[    0.250000] pci 0000:00:01.0: PME# supported from D0 D3hot
[    0.250000] pci 0000:00:01.0: PME# disabled
[    0.250000] pci 0000:00:05.0: PME# supported from D1 D3hot D3cold
[    0.250000] pci 0000:00:05.0: PME# disabled
[    0.260000] pci 0000:00:05.1: PME# supported from D1 D3hot D3cold
[    0.260000] pci 0000:00:05.1: PME# disabled
[    0.260000] pci 0000:00:05.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.260000] pci 0000:00:05.2: PME# disabled
[    0.260000] PCI: bus0: Fast back to back transfers disabled
[    0.260000] pci 0000:00:01.0: dmabounce: registered device
[    0.260000] pci 0000:00:02.0: dmabounce: registered device
[    0.260000] pci 0000:00:05.0: dmabounce: registered device
[    0.260000] pci 0000:00:05.1: dmabounce: registered device
[    0.260000] pci 0000:00:05.2: dmabounce: registered device
[    0.270000] bio: create slab <bio-0> at 0
[    0.270000] SCSI subsystem initialized
[    0.280000] NET: Registered protocol family 2
[    0.280000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.280000] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    0.280000] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    0.280000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.280000] TCP reno registered
[    0.280000] NET: Registered protocol family 1
[    0.280000] Trying to unpack rootfs image as initramfs...
[    0.290000] rootfs image is not initramfs (no cpio magic); looks like an initrd
[    0.470000] Freeing initrd memory: 16384K
[    0.470000] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.470000] msgmni has been set to 120
[    0.470000] io scheduler noop registered
[    0.470000] io scheduler cfq registered (default)
[    0.880000] Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
[    0.890000] serial8250.0: ttyS0 at MMIO 0xc8000000 (irq = 15) is a XScale
[    0.890000] console [ttyS0] enabled
[    0.910000] serial8250.0: ttyS1 at MMIO 0xc8001000 (irq = 13) is a XScale
[    0.920000] brd: module loaded
[    0.920000] Driver 'sd' needs updating - please use bus_type methods
[    0.930000] IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
[    0.940000]  Intel/Sharp Extended Query Table at 0x0031
[    0.940000] Using buffer write method
[    0.940000] cfi_cmdset_0001: Erase suspend on write enabled
[    0.950000] Searching for RedBoot partition table in IXP4XX-Flash.0 at offset 0xfe0000
[    1.080000] 7 RedBoot partitions found on MTD device IXP4XX-Flash.0
[    1.080000] Creating 7 MTD partitions on "IXP4XX-Flash.0":
[    1.090000] 0x000000000000-0x000000080000 : "RedBoot"
[    1.100000] 0x000000080000-0x000000480000 : "ramdisk-01"
[    1.100000] 0x000000480000-0x000000680000 : "zImage-01"
[    1.110000] 0x000000680000-0x000000a80000 : "ramdisk-02"
[    1.120000] 0x000000a80000-0x000000c80000 : "zImage-02"
[    1.130000] 0x000000fe0000-0x000000fff000 : "FIS directory"
[    1.130000] mtd: partition "FIS directory" doesn't end on an erase block -- force read-only
[    1.140000] 0x000000fff000-0x000001000000 : "RedBoot config"
[    1.150000] mtd: partition "RedBoot config" doesn't start on an erase block boundary -- force read-only


      __________________________________________________________________________________
See what's on at the movies in your area. Find out now: http://au.movies.yahoo.com/session-times/
