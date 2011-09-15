From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 15 Sep 2011 09:12:16 +0100
Subject: [Buildroot] Deamon segfault in busybox
In-Reply-To: <4E711152.70603@signaturealpha.com>
References: <4E711152.70603@signaturealpha.com>
Message-ID: <D8745553069345E9AF7706E0EE07BFD8@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Marc Leclerc
> Sent: 14 September 2011 21:41
> 
> Hi,
> 
> Few problems here again. look near the end of the log.. S01logging,
> S40network, S50dropbear... all give errors when loaded in buildroot. any idea
> of what may cause this?

Kernel version / configuration?  As suggested previously, try with an older
kernel and the SoC manufacturers provided kernel config.  See
http://www.dmp.com.tw/tech/os-xlinux/.  While 2.6.29.6 is old it works (for me)
and will give you a starting point.  For what it is worth I have
buildroot2011.08 working with dropbear on vortex86dx without these problems.

> 
> Regards
> 
> Aug 22 08:23:38 buildroot syslog.info syslogd started: BusyBox v1.18.5
> Aug 22 08:23:38 buildroot kern.notice kernel: klogd started: BusyBox v1.18.5
> (2011-09-14 15:50:07 EDT)
> Aug 22 08:23:38 buildroot kern.notice kernel: Linux version 3.0.4
> (marc at Vostro-Linux) (gcc version 4.6.1 (Buildroot 2011.08) ) #1 PREEMPT Wed
> Sep 14 15:56:49 EDT 2011
> Aug 22 08:23:38 buildroot kern.err kernel: CPU: vendor_id 'Vortex86 SoC'
> unknown, using generic init.
> Aug 22 08:23:38 buildroot kern.err kernel: CPU: Your system may be unstable.
> Aug 22 08:23:38 buildroot kern.info kernel: BIOS-provided physical RAM map:
> Aug 22 08:23:38 buildroot kern.info kernel:  BIOS-e820: 0000000000000000 -
> 000000000009fc00 (usable)
> Aug 22 08:23:38 buildroot kern.info kernel:  BIOS-e820: 000000000009fc00 -
> 00000000000a0000 (reserved)
> Aug 22 08:23:38 buildroot kern.info kernel:  BIOS-e820: 00000000000e4000 -
> 0000000000100000 (reserved)
> Aug 22 08:23:38 buildroot kern.info kernel:  BIOS-e820: 0000000000100000 -
> 0000000020000000 (usable)
> Aug 22 08:23:38 buildroot kern.info kernel:  BIOS-e820: 00000000ff000000 -
> 0000000100000000 (reserved)
> Aug 22 08:23:38 buildroot kern.notice kernel: Notice: NX (Execute Disable)
> protection missing in CPU!
> Aug 22 08:23:38 buildroot kern.info kernel: DMI not present or invalid.
> Aug 22 08:23:38 buildroot kern.debug kernel: e820 update range:
> 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
> Aug 22 08:23:38 buildroot kern.debug kernel: e820 remove range:
> 00000000000a0000 - 0000000000100000 (usable)
> Aug 22 08:23:38 buildroot kern.info kernel: last_pfn = 0x20000 max_arch_pfn =
> 0x100000
> Aug 22 08:23:38 buildroot kern.debug kernel: initial memory mapped : 0 -
> 00800000
> Aug 22 08:23:38 buildroot kern.debug kernel: Base memory trampoline at
> [c009e000] 9e000 size 4096
> Aug 22 08:23:38 buildroot kern.info kernel: init_memory_mapping:
> 0000000000000000-0000000020000000
> Aug 22 08:23:38 buildroot kern.debug kernel:  0000000000 - 0020000000 page 4k
> Aug 22 08:23:38 buildroot kern.debug kernel: kernel direct mapping tables up
> to 20000000 @ 77d000-800000
> Aug 22 08:23:38 buildroot kern.notice kernel: 512MB LOWMEM available.
> Aug 22 08:23:38 buildroot kern.info kernel:   mapped low ram: 0 - 20000000
> Aug 22 08:23:38 buildroot kern.info kernel:   low ram: 0 - 20000000
> Aug 22 08:23:38 buildroot kern.warn kernel: Zone PFN ranges:
> Aug 22 08:23:38 buildroot kern.warn kernel:   DMA      0x00000010 ->
> 0x00001000
> Aug 22 08:23:38 buildroot kern.warn kernel:   Normal   0x00001000 ->
> 0x00020000
> Aug 22 08:23:38 buildroot kern.warn kernel: Movable zone start PFN for each
> node
> Aug 22 08:23:38 buildroot kern.warn kernel: early_node_map[2] active PFN
> ranges
> Aug 22 08:23:38 buildroot kern.warn kernel:     0: 0x00000010 -> 0x0000009f
> Aug 22 08:23:38 buildroot kern.warn kernel:     0: 0x00000100 -> 0x00020000
> Aug 22 08:23:38 buildroot kern.debug kernel: On node 0 totalpages: 130959
> Aug 22 08:23:38 buildroot kern.debug kernel: free_area_init_node: node 0,
> pgdat c03966e8, node_mem_map dfc00200
> Aug 22 08:23:38 buildroot kern.debug kernel:   DMA zone: 32 pages used for
> memmap
> Aug 22 08:23:38 buildroot kern.debug kernel:   DMA zone: 0 pages reserved
> Aug 22 08:23:38 buildroot kern.debug kernel:   DMA zone: 3951 pages, LIFO
> batch:0
> Aug 22 08:23:38 buildroot kern.debug kernel:   Normal zone: 992 pages used for
> memmap
> Aug 22 08:23:38 buildroot kern.debug kernel:   Normal zone: 125984 pages, LIFO
> batch:31
> Aug 22 08:23:38 buildroot kern.info kernel: Allocating PCI resources starting
> at 20000000 (gap: 20000000:df000000)
> Aug 22 08:23:38 buildroot kern.debug kernel: pcpu-alloc: s0 r0 d32768 u32768
> alloc=1*32768
> Aug 22 08:23:38 buildroot kern.debug kernel: pcpu-alloc: [0] 0
> Aug 22 08:23:38 buildroot kern.warn kernel: Built 1 zonelists in Zone order,
> mobility grouping on.  Total pages: 129935
> Aug 22 08:23:38 buildroot kern.notice kernel: Kernel command line: rw
> root=/dev/sda1 init=/linuxrc BOOT_IMAGE=bzImage
> Aug 22 08:23:38 buildroot kern.info kernel: PID hash table entries: 2048
> (order: 1, 8192 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: Dentry cache hash table entries:
> 65536 (order: 6, 262144 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: Inode-cache hash table entries:
> 32768 (order: 5, 131072 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: Initializing CPU#0
> Aug 22 08:23:38 buildroot kern.info kernel: Memory: 515780k/524288k available
> (1957k kernel code, 8056k reserved, 709k data, 232k init, 0k highmem)
> Aug 22 08:23:38 buildroot kern.info kernel: virtual kernel memory layout:
> Aug 22 08:23:38 buildroot kern.info kernel:     fixmap  : 0xfffe4000 -
> 0xfffff000   ( 108 kB)
> Aug 22 08:23:38 buildroot kern.info kernel:     vmalloc : 0xe0800000 -
> 0xfffe2000   ( 503 MB)
> Aug 22 08:23:38 buildroot kern.info kernel:     lowmem  : 0xc0000000 -
> 0xe0000000   ( 512 MB)
> Aug 22 08:23:38 buildroot kern.info kernel:       .init : 0xc039b000 -
> 0xc03d5000   ( 232 kB)
> Aug 22 08:23:38 buildroot kern.info kernel:       .data : 0xc02e945f -
> 0xc039a980   ( 709 kB)
> Aug 22 08:23:38 buildroot kern.info kernel:       .text : 0xc0100000 -
> 0xc02e945f   (1957 kB)
> Aug 22 08:23:38 buildroot kern.info kernel: Checking if this processor honours
> the WP bit even in supervisor mode...Ok.
> Aug 22 08:23:38 buildroot kern.info kernel: NR_IRQS:16
> Aug 22 08:23:38 buildroot kern.debug kernel: CPU 0 irqstacks, hard=df404000
> soft=df406000
> Aug 22 08:23:38 buildroot kern.info kernel: Console: colour VGA+ 80x25
> Aug 22 08:23:38 buildroot kern.info kernel: console [tty0] enabled
> Aug 22 08:23:38 buildroot kern.warn kernel: Fast TSC calibration using PIT
> Aug 22 08:23:38 buildroot kern.warn kernel: Detected 933.231 MHz processor.
> Aug 22 08:23:38 buildroot kern.info kernel: Calibrating delay loop (skipped),
> value calculated using timer frequency.. 1866.46 BogoMIPS (lpj=3732924)
> Aug 22 08:23:38 buildroot kern.info kernel: pid_max: default: 32768 minimum:
> 301
> Aug 22 08:23:38 buildroot kern.info kernel: Mount-cache hash table entries:
> 512
> Aug 22 08:23:38 buildroot kern.info kernel: CPU: Vortex86 SoC 05/02 stepping
> 02
> Aug 22 08:23:38 buildroot kern.info kernel: Performance Events:
> Aug 22 08:23:38 buildroot kern.info kernel: NET: Registered protocol family 16
> Aug 22 08:23:38 buildroot kern.info kernel: PCI: PCI BIOS revision 3.00 entry
> at 0xf0031, last bus=0
> Aug 22 08:23:38 buildroot kern.info kernel: PCI: Using configuration type 1
> for base access
> Aug 22 08:23:38 buildroot kern.info kernel: bio: create slab <bio-0> at 0
> Aug 22 08:23:38 buildroot kern.info kernel: vgaarb: loaded
> Aug 22 08:23:38 buildroot kern.notice kernel: SCSI subsystem initialized
> Aug 22 08:23:38 buildroot kern.debug kernel: libata version 3.00 loaded.
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver usbfs
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver hub
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new device
> driver usb
> Aug 22 08:23:38 buildroot kern.info kernel: pps_core: LinuxPPS API ver. 1
> registered
> Aug 22 08:23:38 buildroot kern.info kernel: pps_core: Software ver. 5.3.6 -
> Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> <mailto:giometti@linux.it>
> Aug 22 08:23:38 buildroot kern.info kernel: PTP clock support registered
> Aug 22 08:23:38 buildroot kern.warn kernel: PCI: Probing PCI hardware
> Aug 22 08:23:38 buildroot kern.debug kernel: PCI: Probing PCI hardware (bus
> 00)
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:00.0: [17f3:6021]
> type 0 class 0x000600
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: [18ca:0020]
> type 0 class 0x000300
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: reg 10: [mem
> 0xf8000000-0xfbffffff pref]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: reg 14: [mem
> 0xfefc0000-0xfeffffff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: reg 18: [io
> 0xef80-0xefff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: reg 30: [mem
> 0xfefb0000-0xfefb7fff pref]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: supports D1 D2
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:07.0: [17f3:6031]
> type 0 class 0x000601
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:08.0: [17f3:6040]
> type 0 class 0x000200
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:08.0: reg 10: [io
> 0xec00-0xecff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:08.0: reg 14: [mem
> 0xfefaf800-0xfefaf8ff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:08.0: reg 30: [mem
> 0xfef90000-0xfef9ffff pref]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0b.0: [17f3:6060]
> type 0 class 0x000c03
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0b.0: reg 10: [mem
> 0xfefae000-0xfefaefff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0b.1: [17f3:6061]
> type 0 class 0x000c03
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0b.1: reg 10: [mem
> 0xfefafc00-0xfefafcff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: [17f3:1011]
> type 0 class 0x000101
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: reg 10: [io
> 0xef00-0xef07]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: reg 14: [io
> 0xee80-0xee83]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: reg 18: [io
> 0xee00-0xee07]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: reg 1c: [io
> 0xed80-0xed83]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:0c.0: reg 20: [io
> 0xed00-0xed0f]
> Aug 22 08:23:38 buildroot kern.info kernel: vgaarb: device added:
> PCI:0000:00:03.0,decodes=io+mem,owns=io+mem,locks=none
> Aug 22 08:23:38 buildroot kern.info kernel: pci 0000:00:07.0: default IRQ
> router [17f3:6031]
> Aug 22 08:23:38 buildroot kern.debug kernel: PCI: pci_cache_line_size set to
> 32 bytes
> Aug 22 08:23:38 buildroot kern.debug kernel: reserve RAM buffer:
> 000000000009fc00 - 000000000009ffff
> Aug 22 08:23:38 buildroot kern.info kernel: Switching to clocksource pit
> Aug 22 08:23:38 buildroot kern.debug kernel: PCI: max bus depth: 0
> pci_try_num: 1
> Aug 22 08:23:38 buildroot kern.debug kernel: pci_bus 0000:00: resource 0 [io
> 0x0000-0xffff]
> Aug 22 08:23:38 buildroot kern.debug kernel: pci_bus 0000:00: resource 1 [mem
> 0x00000000-0xffffffff]
> Aug 22 08:23:38 buildroot kern.info kernel: NET: Registered protocol family 2
> Aug 22 08:23:38 buildroot kern.info kernel: IP route cache hash table entries:
> 4096 (order: 2, 16384 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: TCP established hash table
> entries: 16384 (order: 5, 131072 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: TCP bind hash table entries: 16384
> (order: 4, 65536 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: TCP: Hash tables configured
> (established 16384 bind 16384)
> Aug 22 08:23:38 buildroot kern.info kernel: TCP reno registered
> Aug 22 08:23:38 buildroot kern.info kernel: UDP hash table entries: 256
> (order: 0, 4096 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: UDP-Lite hash table entries: 256
> (order: 0, 4096 bytes)
> Aug 22 08:23:38 buildroot kern.info kernel: NET: Registered protocol family 1
> Aug 22 08:23:38 buildroot kern.debug kernel: pci 0000:00:03.0: Boot video
> device
> Aug 22 08:23:38 buildroot kern.debug kernel: PCI: CLS 16 bytes, default 32
> Aug 22 08:23:38 buildroot kern.info kernel: platform rtc_cmos: registered
> platform RTC device (no PNP device found)
> Aug 22 08:23:38 buildroot kern.info kernel: msgmni has been set to 1007
> Aug 22 08:23:38 buildroot kern.info kernel: Block layer SCSI generic (bsg)
> driver version 0.4 loaded (major 251)
> Aug 22 08:23:38 buildroot kern.info kernel: io scheduler noop registered
> Aug 22 08:23:38 buildroot kern.info kernel: io scheduler deadline registered
> (default)
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: Video ROM found
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb 0000:00:03.0: Z9 detected
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: Video RAM at 0xf8000000,
> mapped to 0xe0880000, size 32768k
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: MMIO at 0xfefc0000, mapped
> to 0xe2900000, size 256k
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: Memory heap starting at
> 32544K, size 32K
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: CRT1 DDC probing failed
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: Default mode is 800x600x8
> (60Hz)
> Aug 22 08:23:38 buildroot kern.debug kernel: sisfb: Initial vbflags 0x0
> Aug 22 08:23:38 buildroot kern.debug kernel: sisfb: Failed to add MTRRs
> Aug 22 08:23:38 buildroot kern.info kernel: Console: switching to colour frame
> buffer device 100x37
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: 2D acceleration is enabled,
> y-panning enabled (auto-max)
> Aug 22 08:23:38 buildroot kern.info kernel: fb0: XGI Z7 frame buffer device
> version 1.8.9
> Aug 22 08:23:38 buildroot kern.info kernel: sisfb: Copyright (C) 2001-2005
> Thomas Winischhofer
> Aug 22 08:23:38 buildroot kern.info kernel: Serial: 8250/16550 driver, 12
> ports, IRQ sharing enabled
> Aug 22 08:23:38 buildroot kern.info kernel: serial8250: ttyS0 at I/O 0x3f8
> (irq = 4) is a 16550A
> Aug 22 08:23:38 buildroot kern.info kernel: Switching to clocksource tsc
> Aug 22 08:23:38 buildroot kern.info kernel: serial8250: ttyS1 at I/O 0x2f8
> (irq = 3) is a 16550A
> Aug 22 08:23:38 buildroot kern.info kernel: serial8250: ttyS2 at I/O 0x3e8
> (irq = 10) is a 16550A
> Aug 22 08:23:38 buildroot kern.info kernel: serial8250: ttyS3 at I/O 0x2e8
> (irq = 11) is a 16550A
> Aug 22 08:23:38 buildroot kern.info kernel: parport0: PC-style at 0x278
> [PCSPP(,...)]
> Aug 22 08:23:38 buildroot kern.info kernel: parport0: irq 0 detected
> Aug 22 08:23:38 buildroot kern.info kernel: brd: module loaded
> Aug 22 08:23:38 buildroot kern.info kernel: loop: module loaded
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver ub
> Aug 22 08:23:38 buildroot kern.debug kernel: pata_rdc 0000:00:0c.0: version
> 0.01
> Aug 22 08:23:38 buildroot kern.info kernel: scsi0 : pata_rdc
> Aug 22 08:23:38 buildroot kern.info kernel: scsi1 : pata_rdc
> Aug 22 08:23:38 buildroot kern.info kernel: ata1: PATA max UDMA/100 cmd 0xef00
> ctl 0xee80 bmdma 0xed00 irq 14
> Aug 22 08:23:38 buildroot kern.info kernel: ata2: PATA max UDMA/100 cmd 0xee00
> ctl 0xed80 bmdma 0xed08 irq 14
> Aug 22 08:23:38 buildroot kern.debug kernel: ata2: port disabled. ignoring.
> Aug 22 08:23:38 buildroot kern.info kernel: r6040: RDC R6040 NAPI net
> driver,version 0.27 (23Feb2011)
> Aug 22 08:23:38 buildroot kern.info kernel: r6040_eth_mii: probed
> Aug 22 08:23:38 buildroot kern.info kernel: r6040 0000:00:08.0: attached PHY
> driver [Generic PHY] (mii_bus:phy_addr=0:01)
> Aug 22 08:23:38 buildroot kern.info kernel: ehci_hcd: USB 2.0 'Enhanced' Host
> Controller (EHCI) Driver
> Aug 22 08:23:38 buildroot kern.info kernel: ehci_hcd 0000:00:0b.1: EHCI Host
> Controller
> Aug 22 08:23:38 buildroot kern.info kernel: ehci_hcd 0000:00:0b.1: new USB bus
> registered, assigned bus number 1
> Aug 22 08:23:38 buildroot kern.info kernel: ehci_hcd 0000:00:0b.1: irq 9, io
> mem 0xfefafc00
> Aug 22 08:23:38 buildroot kern.info kernel: ehci_hcd 0000:00:0b.1: USB 2.0
> started, EHCI 1.00
> Aug 22 08:23:38 buildroot kern.info kernel: hub 1-0:1.0: USB hub found
> Aug 22 08:23:38 buildroot kern.info kernel: hub 1-0:1.0: 2 ports detected
> Aug 22 08:23:38 buildroot kern.info kernel: ohci_hcd: USB 1.1 'Open' Host
> Controller (OHCI) Driver
> Aug 22 08:23:38 buildroot kern.info kernel: ohci_hcd 0000:00:0b.0: OHCI Host
> Controller
> Aug 22 08:23:38 buildroot kern.info kernel: ohci_hcd 0000:00:0b.0: new USB bus
> registered, assigned bus number 2
> Aug 22 08:23:38 buildroot kern.info kernel: ohci_hcd 0000:00:0b.0: irq 15, io
> mem 0xfefae000
> Aug 22 08:23:38 buildroot kern.info kernel: ata1.00: CFA: InnoDisk Corp. -
> EDC4000 H 1GB, 081107, max UDMA/66
> Aug 22 08:23:38 buildroot kern.info kernel: ata1.00: 2047248 sectors, multi 0:
> LBA
> Aug 22 08:23:38 buildroot kern.warn kernel: ata1.00: limited to UDMA/33 due to
> 40-wire cable
> Aug 22 08:23:38 buildroot kern.info kernel: hub 2-0:1.0: USB hub found
> Aug 22 08:23:38 buildroot kern.info kernel: ata1.00: configured for UDMA/33
> Aug 22 08:23:38 buildroot kern.info kernel: hub 2-0:1.0: 2 ports detected
> Aug 22 08:23:38 buildroot kern.info kernel: Initializing USB Mass Storage
> driver...
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver usb-storage
> Aug 22 08:23:38 buildroot kern.info kernel: USB Mass Storage support
> registered.
> Aug 22 08:23:38 buildroot kern.notice kernel: scsi 0:0:0:0: Direct-Access
> ATA      InnoDisk Corp. - 0811 PQ: 0 ANSI: 5
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver libusual
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver ums-usbat
> Aug 22 08:23:38 buildroot kern.notice kernel: sd 0:0:0:0: [sda] 2047248 512-
> byte logical blocks: (1.04 GB/999 MiB)
> Aug 22 08:23:38 buildroot kern.notice kernel: sd 0:0:0:0: [sda] Write Protect
> is off
> Aug 22 08:23:38 buildroot kern.notice kernel: sd 0:0:0:0: Attached scsi
> generic sg0 type 0
> Aug 22 08:23:38 buildroot kern.debug kernel: sd 0:0:0:0: [sda] Mode Sense: 00
> 3a 00 00
> Aug 22 08:23:38 buildroot kern.notice kernel: sd 0:0:0:0: [sda] Write cache:
> disabled, read cache: enabled, doesn't support DPO or FUA
> Aug 22 08:23:38 buildroot kern.info kernel: i8042: PNP: No PS/2 controller
> found. Probing ports directly.
> Aug 22 08:23:38 buildroot kern.info kernel: serio: i8042 KBD port at 0x60,0x64
> irq 1
> Aug 22 08:23:38 buildroot kern.info kernel:  sda: sda1 sda2
> Aug 22 08:23:38 buildroot kern.info kernel: serio: i8042 AUX port at 0x60,0x64
> irq 12
> Aug 22 08:23:38 buildroot kern.notice kernel: sd 0:0:0:0: [sda] Attached SCSI
> disk
> Aug 22 08:23:38 buildroot kern.info kernel: mousedev: PS/2 mouse device common
> for all mice
> Aug 22 08:23:38 buildroot kern.info kernel: input: PC Speaker as
> /devices/platform/pcspkr/input/input0
> Aug 22 08:23:38 buildroot kern.info kernel: rtc_cmos rtc_cmos: rtc core:
> registered rtc_cmos as rtc0
> Aug 22 08:23:38 buildroot kern.info kernel: rtc0: alarms up to one day, 114
> bytes nvram
> Aug 22 08:23:38 buildroot kern.info kernel: pps_ldisc: PPS line discipline
> registered
> Aug 22 08:23:38 buildroot kern.info kernel: usbcore: registered new interface
> driver usbhid
> Aug 22 08:23:38 buildroot kern.info kernel: usbhid: USB HID core driver
> Aug 22 08:23:38 buildroot kern.info kernel: TCP cubic registered
> Aug 22 08:23:38 buildroot kern.info kernel: NET: Registered protocol family 17
> Aug 22 08:23:38 buildroot kern.info kernel: rtc_cmos rtc_cmos: setting system
> clock to 2008-08-22 08:23:38 UTC (1219393418)
> Aug 22 08:23:38 buildroot kern.warn kernel: Clocksource tsc unstable (delta =
> 68066204 ns)
> Aug 22 08:23:38 buildroot kern.info kernel: Switching to clocksource pit
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs: barriers not enabled
> Aug 22 08:23:38 buildroot kern.warn kernel: EXT3-fs (sda1): warning: maximal
> mount count reached, running e2fsck is recommended
> Aug 22 08:23:38 buildroot kern.info kernel: kjournald starting.  Commit
> interval 5 seconds
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs (sda1): using internal
> journal
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs (sda1): mounted filesystem
> with ordered data mode
> Aug 22 08:23:38 buildroot kern.info kernel: VFS: Mounted root (ext3
> filesystem) on device 8:1.
> Aug 22 08:23:38 buildroot kern.info kernel: Freeing unused kernel memory: 232k
> freed
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs: barriers not enabled
> Aug 22 08:23:38 buildroot kern.warn kernel: EXT3-fs (sda2): warning: mounting
> unchecked fs, running e2fsck is recommended
> Aug 22 08:23:38 buildroot kern.info kernel: kjournald starting.  Commit
> interval 5 seconds
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs (sda2): using internal
> journal
> Aug 22 08:23:38 buildroot kern.info kernel: usb 2-1: new low speed USB device
> number 2 using ohci_hcd
> Aug 22 08:23:38 buildroot kern.info kernel: EXT3-fs (sda2): mounted filesystem
> with ordered data mode
> Aug 22 08:23:38 buildroot kern.info kernel: S01logging[950]: segfault at 0 ip
> (null) sp bfe2c4dc error 4 in busybox[8048000+bd000]
> Aug 22 08:23:38 buildroot kern.info kernel: S40network[960]: segfault at 0 ip
> (null) sp bfa82a4c error 4 in busybox[8048000+bd000]
> Aug 22 08:23:38 buildroot kern.info kernel: input: Microsoft Comfort Curve
> Keyboard 2000 as /devices/pci0000:00/0000:00:0b.0/usb2/2-1/2-
> 1:1.0/input/input1
> Aug 22 08:23:38 buildroot kern.info kernel: generic-usb 0003:045E:00DD.0001:
> input: USB HID v1.11 Keyboard [Microsoft Comfort Curve Keyboard 2000] on usb-
> 0000:00:0b.0-1/input0
> Aug 22 08:23:38 buildroot kern.info kernel: input: Microsoft Comfort Curve
> Keyboard 2000 as /devices/pci0000:00/0000:00:0b.0/usb2/2-1/2-
> 1:1.1/input/input2
> Aug 22 08:23:38 buildroot kern.info kernel: generic-usb 0003:045E:00DD.0002:
> input: USB HID v1.11 Device [Microsoft Comfort Curve Keyboard 2000] on usb-
> 0000:00:0b.0-1/input1
> Aug 22 08:23:53 buildroot kern.info kernel: S50dropbear[982]: segfault at 0 ip
> (null) sp bff4cb3c error 4 in busybox[8048000+bd000]
> Aug 22 08:23:53 buildroot authpriv.info dropbear[994]: Running in background
> Aug 22 08:23:53 buildroot kern.info kernel: S70ntpd[995]: segfault at 0 ip
> (null) sp bfbaaffc error 4 in busybox[8048000+bd000]
> Aug 22 08:23:53 buildroot kern.info kernel: S70vsftpd[1000]: segfault at 0 ip
> (null) sp bf90dcdc error 4 in busybox[8048000+bd000]
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1003, tty
> '/dev/null': '/bin/touch /var/log/messages'
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1004, tty
> '/dev/tty1': '/sbin/getty 38400 tty1'
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1005, tty
> '/dev/tty2': '/sbin/getty 38400 tty2'
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1008, tty
> '/dev/ttyS0': '/sbin/getty -L ttyS0 115200 vt100 '
> Aug 22 08:23:53 buildroot kern.debug kernel: spurious 8259A interrupt: IRQ7.
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1009, tty
> '/dev/null': '/sbin/syslogd -n -m 0'
> Aug 22 08:23:53 buildroot syslog.info syslogd started: BusyBox v1.18.5
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1010, tty
> '/dev/null': '/sbin/klogd -n'
> Aug 22 08:23:53 buildroot kern.notice kernel: klogd started: BusyBox v1.18.5
> (2011-09-14 15:50:07 EDT)
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1011, tty
> '/dev/tty3': '/usr/bin/tail -f /var/log/messages'
> Aug 22 08:23:53 buildroot daemon.info linuxrc: starting pid 1014, tty
> '/dev/null': '/usr/sa/sa_watch_process.sh'
> Aug 22 08:28:06 buildroot auth.info login[1004]: root login on 'tty1'
> 
