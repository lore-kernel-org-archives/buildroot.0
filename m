From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Fri, 09 Sep 2011 16:29:43 -0400
Subject: [Buildroot] Fwd: Unable to mount root fs on unknown-block(0,0)
In-Reply-To: <4E69B219.8080801@visionsystems.de>
References: <4E69399D.7050209@videotron.ca>
 <4E6939CA.1020003@signaturealpha.com> <4E69B219.8080801@visionsystems.de>
Message-ID: <4E6A7737.1020102@signaturealpha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've managed to boot the system by changing the ide mode in the bios and 
playing with the ATA suport in the kernel  but i am getting weird 
warnings about ide in the boot log. I am aware that this may not be the 
group to post this to but I have attached the log in any case and if 
anyone knows where I could post this to please let me know.

Thank you for our time

Marc

Aug 17 08:12:12 buildroot syslog.info syslogd started: BusyBox v1.18.5
Aug 17 08:12:12 buildroot user.notice kernel: klogd started: BusyBox 
v1.18.5 (2011-09-08 16:26:33 EDT)
Aug 17 08:12:12 buildroot user.notice kernel: Linux version 3.0.4 
(marc at Vostro-Linux) (gcc version 4.4.3 (crosstool-NG 1.12.1 - buildroot 
2011.08) ) #2 Thu Sep 8 17:01:01 EDT 2011
Aug 17 08:12:12 buildroot user.err kernel: CPU: vendor_id 'Vortex86 SoC' 
unknown, using generic init.
Aug 17 08:12:12 buildroot user.err kernel: CPU: Your system may be unstable.
Aug 17 08:12:12 buildroot user.info kernel: BIOS-provided physical RAM map:
Aug 17 08:12:12 buildroot user.info kernel:  BIOS-e820: 0000000000000000 
- 000000000009fc00 (usable)
Aug 17 08:12:12 buildroot user.info kernel:  BIOS-e820: 000000000009fc00 
- 00000000000a0000 (reserved)
Aug 17 08:12:12 buildroot user.info kernel:  BIOS-e820: 00000000000e4000 
- 0000000000100000 (reserved)
Aug 17 08:12:12 buildroot user.info kernel:  BIOS-e820: 0000000000100000 
- 0000000020000000 (usable)
Aug 17 08:12:12 buildroot user.info kernel:  BIOS-e820: 00000000ff000000 
- 0000000100000000 (reserved)
Aug 17 08:12:12 buildroot user.notice kernel: Notice: NX (Execute 
Disable) protection missing in CPU!
Aug 17 08:12:12 buildroot user.info kernel: DMI not present or invalid.
Aug 17 08:12:12 buildroot user.debug kernel: e820 update range: 
0000000000000000 - 0000000000010000 (usable) ==> (reserved)
Aug 17 08:12:12 buildroot user.debug kernel: e820 remove range: 
00000000000a0000 - 0000000000100000 (usable)
Aug 17 08:12:12 buildroot user.info kernel: last_pfn = 0x20000 
max_arch_pfn = 0x100000
Aug 17 08:12:12 buildroot user.debug kernel: initial memory mapped : 0 - 
00800000
Aug 17 08:12:12 buildroot user.debug kernel: Base memory trampoline at 
[c009e000] 9e000 size 4096
Aug 17 08:12:12 buildroot user.info kernel: init_memory_mapping: 
0000000000000000-0000000020000000
Aug 17 08:12:12 buildroot user.debug kernel:  0000000000 - 0020000000 
page 4k
Aug 17 08:12:12 buildroot user.debug kernel: kernel direct mapping 
tables up to 20000000 @ 77d000-800000
Aug 17 08:12:12 buildroot user.notice kernel: 512MB LOWMEM available.
Aug 17 08:12:12 buildroot user.info kernel:   mapped low ram: 0 - 20000000
Aug 17 08:12:12 buildroot user.info kernel:   low ram: 0 - 20000000
Aug 17 08:12:12 buildroot user.warn kernel: Zone PFN ranges:
Aug 17 08:12:12 buildroot user.warn kernel:   DMA      0x00000010 -> 
0x00001000
Aug 17 08:12:12 buildroot user.warn kernel:   Normal   0x00001000 -> 
0x00020000
Aug 17 08:12:12 buildroot user.warn kernel: Movable zone start PFN for 
each node
Aug 17 08:12:12 buildroot user.warn kernel: early_node_map[2] active PFN 
ranges
Aug 17 08:12:12 buildroot user.warn kernel:     0: 0x00000010 -> 0x0000009f
Aug 17 08:12:12 buildroot user.warn kernel:     0: 0x00000100 -> 0x00020000
Aug 17 08:12:12 buildroot user.debug kernel: On node 0 totalpages: 130959
Aug 17 08:12:12 buildroot user.debug kernel: free_area_init_node: node 
0, pgdat c03eb748, node_mem_map dfc00200
Aug 17 08:12:12 buildroot user.debug kernel:   DMA zone: 32 pages used 
for memmap
Aug 17 08:12:12 buildroot user.debug kernel:   DMA zone: 0 pages reserved
Aug 17 08:12:12 buildroot user.debug kernel:   DMA zone: 3951 pages, 
LIFO batch:0
Aug 17 08:12:12 buildroot user.debug kernel:   Normal zone: 992 pages 
used for memmap
Aug 17 08:12:12 buildroot user.debug kernel:   Normal zone: 125984 
pages, LIFO batch:31
Aug 17 08:12:12 buildroot user.info kernel: Allocating PCI resources 
starting at 20000000 (gap: 20000000:df000000)
Aug 17 08:12:12 buildroot user.debug kernel: pcpu-alloc: s0 r0 d32768 
u32768 alloc=1*32768
Aug 17 08:12:12 buildroot user.debug kernel: pcpu-alloc: [0] 0
Aug 17 08:12:12 buildroot user.warn kernel: Built 1 zonelists in Zone 
order, mobility grouping on.  Total pages: 129935
Aug 17 08:12:12 buildroot user.notice kernel: Kernel command line: rw 
root=/dev/hda1 init=/linuxrc BOOT_IMAGE=bzImage
Aug 17 08:12:12 buildroot user.info kernel: PID hash table entries: 2048 
(order: 1, 8192 bytes)
Aug 17 08:12:12 buildroot user.info kernel: Dentry cache hash table 
entries: 65536 (order: 6, 262144 bytes)
Aug 17 08:12:12 buildroot user.info kernel: Inode-cache hash table 
entries: 32768 (order: 5, 131072 bytes)
Aug 17 08:12:12 buildroot user.info kernel: Initializing CPU#0
Aug 17 08:12:12 buildroot user.info kernel: Memory: 515428k/524288k 
available (2112k kernel code, 8408k reserved, 894k data, 232k init, 0k 
highmem)
Aug 17 08:12:12 buildroot user.info kernel: virtual kernel memory layout:
Aug 17 08:12:12 buildroot user.info kernel:     fixmap  : 0xfffe4000 - 
0xfffff000   ( 108 kB)
Aug 17 08:12:12 buildroot user.info kernel:     vmalloc : 0xe0800000 - 
0xfffe2000   ( 503 MB)
Aug 17 08:12:12 buildroot user.info kernel:     lowmem  : 0xc0000000 - 
0xe0000000   ( 512 MB)
Aug 17 08:12:12 buildroot user.info kernel:       .init : 0xc03f0000 - 
0xc042a000   ( 232 kB)
Aug 17 08:12:12 buildroot user.info kernel:       .data : 0xc03102f6 - 
0xc03efc00   ( 894 kB)
Aug 17 08:12:12 buildroot user.info kernel:       .text : 0xc0100000 - 
0xc03102f6   (2112 kB)
Aug 17 08:12:12 buildroot user.info kernel: Checking if this processor 
honours the WP bit even in supervisor mode...Ok.
Aug 17 08:12:12 buildroot user.info kernel: NR_IRQS:16
Aug 17 08:12:12 buildroot user.debug kernel: CPU 0 irqstacks, 
hard=df404000 soft=df406000
Aug 17 08:12:12 buildroot user.info kernel: Console: colour VGA+ 80x25
Aug 17 08:12:12 buildroot user.info kernel: console [tty0] enabled
Aug 17 08:12:12 buildroot user.warn kernel: Fast TSC calibration using PIT
Aug 17 08:12:12 buildroot user.warn kernel: Detected 933.292 MHz processor.
Aug 17 08:12:12 buildroot user.info kernel: Calibrating delay loop 
(skipped), value calculated using timer frequency.. 1866.58 BogoMIPS 
(lpj=3733168)
Aug 17 08:12:12 buildroot user.info kernel: pid_max: default: 32768 
minimum: 301
Aug 17 08:12:12 buildroot user.info kernel: Mount-cache hash table 
entries: 512
Aug 17 08:12:12 buildroot user.info kernel: CPU: Vortex86 SoC 05/02 
stepping 02
Aug 17 08:12:12 buildroot user.info kernel: Performance Events:
Aug 17 08:12:12 buildroot user.info kernel: NET: Registered protocol 
family 16
Aug 17 08:12:12 buildroot user.info kernel: PCI: PCI BIOS revision 3.00 
entry at 0xf0031, last bus=0
Aug 17 08:12:12 buildroot user.info kernel: PCI: Using configuration 
type 1 for base access
Aug 17 08:12:12 buildroot user.info kernel: bio: create slab <bio-0> at 0
Aug 17 08:12:12 buildroot user.info kernel: vgaarb: loaded
Aug 17 08:12:12 buildroot user.notice kernel: SCSI subsystem initialized
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver usbfs
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver hub
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
device driver usb
Aug 17 08:12:12 buildroot user.info kernel: pps_core: LinuxPPS API ver. 
1 registered
Aug 17 08:12:12 buildroot user.info kernel: pps_core: Software ver. 
5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Aug 17 08:12:12 buildroot user.info kernel: PTP clock support registered
Aug 17 08:12:12 buildroot user.warn kernel: PCI: Probing PCI hardware
Aug 17 08:12:12 buildroot user.debug kernel: PCI: Probing PCI hardware 
(bus 00)
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:00.0: 
[17f3:6021] type 0 class 0x000600
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: 
[18ca:0020] type 0 class 0x000300
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: reg 10: 
[mem 0xf8000000-0xfbffffff pref]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: reg 14: 
[mem 0xfefc0000-0xfeffffff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: reg 18: 
[io  0xef80-0xefff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: reg 30: 
[mem 0xfefb0000-0xfefb7fff pref]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: supports 
D1 D2
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:07.0: 
[17f3:6031] type 0 class 0x000601
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:08.0: 
[17f3:6040] type 0 class 0x000200
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:08.0: reg 10: 
[io  0xec00-0xecff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:08.0: reg 14: 
[mem 0xfefaf800-0xfefaf8ff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:08.0: reg 30: 
[mem 0xfef90000-0xfef9ffff pref]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0b.0: 
[17f3:6060] type 0 class 0x000c03
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0b.0: reg 10: 
[mem 0xfefae000-0xfefaefff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0b.1: 
[17f3:6061] type 0 class 0x000c03
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0b.1: reg 10: 
[mem 0xfefafc00-0xfefafcff]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: 
[8086:24db] type 0 class 0x000101
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: reg 10: 
[io  0xef00-0xef07]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: reg 14: 
[io  0xee80-0xee83]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: reg 18: 
[io  0xee00-0xee07]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: reg 1c: 
[io  0xed80-0xed83]
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:0c.0: reg 20: 
[io  0xed00-0xed0f]
Aug 17 08:12:12 buildroot user.info kernel: vgaarb: device added: 
PCI:0000:00:03.0,decodes=io+mem,owns=io+mem,locks=none
Aug 17 08:12:12 buildroot user.info kernel: pci 0000:00:07.0: default 
IRQ router [17f3:6031]
Aug 17 08:12:12 buildroot user.debug kernel: PCI: pci_cache_line_size 
set to 32 bytes
Aug 17 08:12:12 buildroot user.debug kernel: reserve RAM buffer: 
000000000009fc00 - 000000000009ffff
Aug 17 08:12:12 buildroot user.info kernel: Switching to clocksource pit
Aug 17 08:12:12 buildroot user.debug kernel: PCI: max bus depth: 0 
pci_try_num: 1
Aug 17 08:12:12 buildroot user.debug kernel: pci_bus 0000:00: resource 0 
[io  0x0000-0xffff]
Aug 17 08:12:12 buildroot user.debug kernel: pci_bus 0000:00: resource 1 
[mem 0x00000000-0xffffffff]
Aug 17 08:12:12 buildroot user.info kernel: NET: Registered protocol 
family 2
Aug 17 08:12:12 buildroot user.info kernel: IP route cache hash table 
entries: 4096 (order: 2, 16384 bytes)
Aug 17 08:12:12 buildroot user.info kernel: TCP established hash table 
entries: 16384 (order: 5, 131072 bytes)
Aug 17 08:12:12 buildroot user.info kernel: TCP bind hash table entries: 
16384 (order: 4, 65536 bytes)
Aug 17 08:12:12 buildroot user.info kernel: TCP: Hash tables configured 
(established 16384 bind 16384)
Aug 17 08:12:12 buildroot user.info kernel: TCP reno registered
Aug 17 08:12:12 buildroot user.info kernel: UDP hash table entries: 256 
(order: 0, 4096 bytes)
Aug 17 08:12:12 buildroot user.info kernel: UDP-Lite hash table entries: 
256 (order: 0, 4096 bytes)
Aug 17 08:12:12 buildroot user.info kernel: NET: Registered protocol 
family 1
Aug 17 08:12:12 buildroot user.info kernel: RPC: Registered named UNIX 
socket transport module.
Aug 17 08:12:12 buildroot user.info kernel: RPC: Registered udp 
transport module.
Aug 17 08:12:12 buildroot user.info kernel: RPC: Registered tcp 
transport module.
Aug 17 08:12:12 buildroot user.info kernel: RPC: Registered tcp NFSv4.1 
backchannel transport module.
Aug 17 08:12:12 buildroot user.debug kernel: pci 0000:00:03.0: Boot 
video device
Aug 17 08:12:12 buildroot user.debug kernel: PCI: CLS 16 bytes, default 32
Aug 17 08:12:12 buildroot user.info kernel: platform rtc_cmos: 
registered platform RTC device (no PNP device found)
Aug 17 08:12:12 buildroot user.info kernel: Installing knfsd (copyright 
(C) 1996 okir at monad.swb.de).
Aug 17 08:12:12 buildroot user.info kernel: msgmni has been set to 1006
Aug 17 08:12:12 buildroot user.info kernel: Block layer SCSI generic 
(bsg) driver version 0.4 loaded (major 251)
Aug 17 08:12:12 buildroot user.info kernel: io scheduler noop registered
Aug 17 08:12:12 buildroot user.info kernel: io scheduler deadline 
registered (default)
Aug 17 08:12:12 buildroot user.info kernel: sisfb: Video ROM found
Aug 17 08:12:12 buildroot user.info kernel: sisfb 0000:00:03.0: Z9 detected
Aug 17 08:12:12 buildroot user.info kernel: sisfb: Video RAM at 
0xf8000000, mapped to 0xe0880000, size 32768k
Aug 17 08:12:12 buildroot user.info kernel: sisfb: MMIO at 0xfefc0000, 
mapped to 0xe2900000, size 256k
Aug 17 08:12:12 buildroot user.info kernel: sisfb: Memory heap starting 
at 32544K, size 32K
Aug 17 08:12:12 buildroot user.info kernel: sisfb: CRT1 DDC probing failed
Aug 17 08:12:12 buildroot user.info kernel: sisfb: Default mode is 
800x600x8 (60Hz)
Aug 17 08:12:12 buildroot user.debug kernel: sisfb: Initial vbflags 0x0
Aug 17 08:12:12 buildroot user.debug kernel: sisfb: Failed to add MTRRs
Aug 17 08:12:12 buildroot user.info kernel: Console: switching to colour 
frame buffer device 100x37
Aug 17 08:12:12 buildroot user.info kernel: sisfb: 2D acceleration is 
enabled, y-panning enabled (auto-max)
Aug 17 08:12:12 buildroot user.info kernel: fb0: XGI Z7 frame buffer 
device version 1.8.9
Aug 17 08:12:12 buildroot user.info kernel: sisfb: Copyright (C) 
2001-2005 Thomas Winischhofer
Aug 17 08:12:12 buildroot user.info kernel: isapnp: Scanning for PnP 
cards...
Aug 17 08:12:12 buildroot user.info kernel: isapnp: No Plug & Play 
device found
Aug 17 08:12:12 buildroot user.info kernel: Serial: 8250/16550 driver, 
12 ports, IRQ sharing enabled
Aug 17 08:12:12 buildroot user.info kernel: Switching to clocksource tsc
Aug 17 08:12:12 buildroot user.info kernel: serial8250: ttyS0 at I/O 
0x3f8 (irq = 4) is a 16550A
Aug 17 08:12:12 buildroot user.info kernel: serial8250: ttyS1 at I/O 
0x2f8 (irq = 3) is a 16550A
Aug 17 08:12:12 buildroot user.info kernel: serial8250: ttyS2 at I/O 
0x3e8 (irq = 10) is a 16550A
Aug 17 08:12:12 buildroot user.info kernel: serial8250: ttyS3 at I/O 
0x2e8 (irq = 11) is a 16550A
Aug 17 08:12:12 buildroot user.info kernel: parport0: PC-style at 0x278 
[PCSPP(,...)]
Aug 17 08:12:12 buildroot user.info kernel: parport0: irq 0 detected
Aug 17 08:12:12 buildroot user.info kernel: brd: module loaded
Aug 17 08:12:12 buildroot user.info kernel: loop: module loaded
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver ub
Aug 17 08:12:12 buildroot user.info kernel: Uniform Multi-Platform E-IDE 
driver
Aug 17 08:12:12 buildroot user.info kernel: piix 0000:00:0c.0: IDE 
controller (0x8086:0x24db rev 0x01)
Aug 17 08:12:12 buildroot user.info kernel: piix 0000:00:0c.0: IDE port 
disabled
Aug 17 08:12:12 buildroot user.info kernel: piix 0000:00:0c.0: 100% 
native mode on irq 14
Aug 17 08:12:12 buildroot user.info kernel:     ide0: BM-DMA at 
0xed00-0xed07
Aug 17 08:12:12 buildroot user.debug kernel: Probing IDE interface ide0...
Aug 17 08:12:12 buildroot user.info kernel: hda: InnoDisk Corp. - 
EDC4000 H 1GB, CFA DISK drive
Aug 17 08:12:12 buildroot user.debug kernel: hda: host max PIO4 wanted 
PIO255(auto-tune) selected PIO4
Aug 17 08:12:12 buildroot user.warn kernel: hda: host side 80-wire cable 
detection failed, limiting max speed to UDMA33
Aug 17 08:12:12 buildroot user.info kernel: hda: UDMA/33 mode selected
Aug 17 08:12:12 buildroot user.info kernel: ide0 at 0xef00-0xef07,0xee82 
on irq 14
Aug 17 08:12:12 buildroot user.info kernel: ide_generic: please use 
"probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
Aug 17 08:12:12 buildroot user.debug kernel: Probing IDE interface ide1...
Aug 17 08:12:12 buildroot user.err kernel: ide1: disabled, unable to get 
IRQ 14
Aug 17 08:12:12 buildroot user.info kernel: ide1: failed to initialize 
IDE interface
Aug 17 08:12:12 buildroot user.info kernel: ide1: disabling port
Aug 17 08:12:12 buildroot user.debug kernel: Probing IDE interface ide1...
Aug 17 08:12:12 buildroot user.warn kernel: ------------[ cut here 
]------------
Aug 17 08:12:12 buildroot user.warn kernel: WARNING: at 
fs/sysfs/dir.c:455 sysfs_add_one+0x65/0x7a()
Aug 17 08:12:12 buildroot user.warn kernel: sysfs: cannot create 
duplicate filename '/devices/ide1/ide_port/ide1'
Aug 17 08:12:12 buildroot user.warn kernel: Modules linked in:
Aug 17 08:12:12 buildroot user.warn kernel: Pid: 1, comm: swapper Not 
tainted 3.0.4 #2
Aug 17 08:12:12 buildroot user.warn kernel: Call Trace:
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0117d6c>] 
warn_slowpath_common+0x65/0x7a
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0193c33>] ? 
sysfs_add_one+0x65/0x7a
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0117de5>] 
warn_slowpath_fmt+0x26/0x2a
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0193c33>] 
sysfs_add_one+0x65/0x7a
Aug 17 08:12:12 buildroot user.warn kernel:  [<c019435c>] 
create_dir+0x56/0x88
Aug 17 08:12:12 buildroot user.warn kernel:  [<c019440d>] 
sysfs_create_dir+0x7f/0x94
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e7371>] 
kobject_add_internal+0x9a/0x167
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e74ef>] 
kobject_add_varg+0x31/0x3d
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e7565>] 
kobject_add+0x43/0x49
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023ddd7>] 
device_add+0x8f/0x470
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e70ef>] ? 
kobject_init+0x36/0x70
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e1ca>] 
device_register+0x12/0x15
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e23f>] 
device_create_vargs+0x72/0x99
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e281>] 
device_create+0x1b/0x1d
Aug 17 08:12:12 buildroot user.warn kernel:  [<c024a281>] 
ide_host_register+0x28b/0x4cc
Aug 17 08:12:12 buildroot user.warn kernel:  [<c024a4e8>] 
ide_host_add+0x26/0x4e
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0404746>] 
ide_generic_init+0x1e6/0x227
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0101070>] 
do_one_initcall+0x70/0x112
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0404560>] ? 
sis5513_ide_init+0x16/0x16
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f01df>] 
kernel_init+0x6b/0xe4
Aug 17 08:12:12 buildroot user.warn kernel:  [<c030f7b6>] 
kernel_thread_helper+0x6/0xd
Aug 17 08:12:12 buildroot user.warn kernel: ---[ end trace 
6007971bba41140e ]---
Aug 17 08:12:12 buildroot user.err kernel: kobject_add_internal failed 
for ide1 with -EEXIST, don't try to register things with the same name 
in the same directory.
Aug 17 08:12:12 buildroot user.warn kernel: Pid: 1, comm: swapper 
Tainted: G        W   3.0.4 #2
Aug 17 08:12:12 buildroot user.warn kernel: Call Trace:
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e742b>] 
kobject_add_internal+0x154/0x167
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e74ef>] 
kobject_add_varg+0x31/0x3d
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e7565>] 
kobject_add+0x43/0x49
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023ddd7>] 
device_add+0x8f/0x470
Aug 17 08:12:12 buildroot user.warn kernel:  [<c01e70ef>] ? 
kobject_init+0x36/0x70
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e1ca>] 
device_register+0x12/0x15
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e23f>] 
device_create_vargs+0x72/0x99
Aug 17 08:12:12 buildroot user.warn kernel:  [<c023e281>] 
device_create+0x1b/0x1d
Aug 17 08:12:12 buildroot user.warn kernel:  [<c024a281>] 
ide_host_register+0x28b/0x4cc
Aug 17 08:12:12 buildroot user.warn kernel:  [<c024a4e8>] 
ide_host_add+0x26/0x4e
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0404746>] 
ide_generic_init+0x1e6/0x227
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0101070>] 
do_one_initcall+0x70/0x112
Aug 17 08:12:12 buildroot user.warn kernel:  [<c0404560>] ? 
sis5513_ide_init+0x16/0x16
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f0174>] ? 
parse_early_options+0x1c/0x1c
Aug 17 08:12:12 buildroot user.warn kernel:  [<c03f01df>] 
kernel_init+0x6b/0xe4
Aug 17 08:12:12 buildroot user.warn kernel:  [<c030f7b6>] 
kernel_thread_helper+0x6/0xd
Aug 17 08:12:12 buildroot user.info kernel: ide1: disabling port
Aug 17 08:12:12 buildroot user.info kernel: ide-gd driver 1.18
Aug 17 08:12:12 buildroot user.info kernel: hda: max request size: 128KiB
Aug 17 08:12:12 buildroot user.info kernel: hda: 2047248 sectors (1048 
MB) w/0KiB Cache, CHS=2031/16/63
Aug 17 08:12:12 buildroot user.info kernel: hda: cache flushes supported
Aug 17 08:12:12 buildroot user.info kernel:  hda: hda1 hda2
Aug 17 08:12:12 buildroot user.info kernel: r6040: RDC R6040 NAPI net 
driver,version 0.27 (23Feb2011)
Aug 17 08:12:12 buildroot user.info kernel: r6040_eth_mii: probed
Aug 17 08:12:12 buildroot user.info kernel: r6040 0000:00:08.0: attached 
PHY driver [Generic PHY] (mii_bus:phy_addr=0:01)
Aug 17 08:12:12 buildroot user.info kernel: ehci_hcd: USB 2.0 'Enhanced' 
Host Controller (EHCI) Driver
Aug 17 08:12:12 buildroot user.info kernel: ehci_hcd 0000:00:0b.1: EHCI 
Host Controller
Aug 17 08:12:12 buildroot user.info kernel: ehci_hcd 0000:00:0b.1: new 
USB bus registered, assigned bus number 1
Aug 17 08:12:12 buildroot user.info kernel: ehci_hcd 0000:00:0b.1: irq 
9, io mem 0xfefafc00
Aug 17 08:12:12 buildroot user.info kernel: ehci_hcd 0000:00:0b.1: USB 
2.0 started, EHCI 1.00
Aug 17 08:12:12 buildroot user.info kernel: hub 1-0:1.0: USB hub found
Aug 17 08:12:12 buildroot user.info kernel: hub 1-0:1.0: 2 ports detected
Aug 17 08:12:12 buildroot user.info kernel: ohci_hcd: USB 1.1 'Open' 
Host Controller (OHCI) Driver
Aug 17 08:12:12 buildroot user.info kernel: ohci_hcd 0000:00:0b.0: OHCI 
Host Controller
Aug 17 08:12:12 buildroot user.info kernel: ohci_hcd 0000:00:0b.0: new 
USB bus registered, assigned bus number 2
Aug 17 08:12:12 buildroot user.info kernel: ohci_hcd 0000:00:0b.0: irq 
15, io mem 0xfefae000
Aug 17 08:12:12 buildroot user.info kernel: hub 2-0:1.0: USB hub found
Aug 17 08:12:12 buildroot user.info kernel: hub 2-0:1.0: 2 ports detected
Aug 17 08:12:12 buildroot user.info kernel: Initializing USB Mass 
Storage driver...
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver usb-storage
Aug 17 08:12:12 buildroot user.info kernel: USB Mass Storage support 
registered.
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver libusual
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver ums-usbat
Aug 17 08:12:12 buildroot user.info kernel: i8042: PNP: No PS/2 
controller found. Probing ports directly.
Aug 17 08:12:12 buildroot user.info kernel: serio: i8042 KBD port at 
0x60,0x64 irq 1
Aug 17 08:12:12 buildroot user.info kernel: serio: i8042 AUX port at 
0x60,0x64 irq 12
Aug 17 08:12:12 buildroot user.info kernel: mousedev: PS/2 mouse device 
common for all mice
Aug 17 08:12:12 buildroot user.info kernel: input: PC Speaker as 
/devices/platform/pcspkr/input/input0
Aug 17 08:12:12 buildroot user.info kernel: rtc_cmos rtc_cmos: rtc core: 
registered rtc_cmos as rtc0
Aug 17 08:12:12 buildroot user.info kernel: rtc0: alarms up to one day, 
114 bytes nvram
Aug 17 08:12:12 buildroot user.info kernel: pps_ldisc: PPS line 
discipline registered
Aug 17 08:12:12 buildroot user.info kernel: usbcore: registered new 
interface driver usbhid
Aug 17 08:12:12 buildroot user.info kernel: usbhid: USB HID core driver
Aug 17 08:12:12 buildroot user.info kernel: TCP cubic registered
Aug 17 08:12:12 buildroot user.info kernel: NET: Registered protocol 
family 17
Aug 17 08:12:12 buildroot user.info kernel: rtc_cmos rtc_cmos: setting 
system clock to 2008-08-17 08:12:12 UTC (1218960732)
Aug 17 08:12:12 buildroot user.info kernel: EXT3-fs: barriers not enabled
Aug 17 08:12:12 buildroot user.info kernel: kjournald starting.  Commit 
interval 5 seconds
Aug 17 08:12:12 buildroot user.info kernel: EXT3-fs (hda1): using 
internal journal
Aug 17 08:12:12 buildroot user.info kernel: EXT3-fs (hda1): mounted 
filesystem with ordered data mode
Aug 17 08:12:12 buildroot user.info kernel: VFS: Mounted root (ext3 
filesystem) on device 3:1.
Aug 17 08:12:12 buildroot user.info kernel: Freeing unused kernel 
memory: 232k freed
Aug 17 08:12:12 buildroot user.warn kernel: EXT2-fs (hda2): warning: 
mounting ext3 filesystem as ext2
Aug 17 08:12:12 buildroot user.info kernel: usb 2-1: new low speed USB 
device number 2 using ohci_hcd
Aug 17 08:12:12 buildroot user.info kernel: input: Microsoft Comfort 
Curve Keyboard 2000 as 
/devices/pci0000:00/0000:00:0b.0/usb2/2-1/2-1:1.0/input/input1
Aug 17 08:12:12 buildroot user.info kernel: generic-usb 
0003:045E:00DD.0001: input: USB HID v1.11 Keyboard [Microsoft Comfort 
Curve Keyboard 2000] on usb-0000:00:0b.0-1/input0
Aug 17 08:12:13 buildroot user.info kernel: input: Microsoft Comfort 
Curve Keyboard 2000 as 
/devices/pci0000:00/0000:00:0b.0/usb2/2-1/2-1:1.1/input/input2
Aug 17 08:12:13 buildroot user.info kernel: generic-usb 
0003:045E:00DD.0002: input: USB HID v1.11 Device [Microsoft Comfort 
Curve Keyboard 2000] on usb-0000:00:0b.0-1/input1
Aug 17 08:12:13 buildroot authpriv.info dropbear[983]: Running in background
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 988, tty 
'/dev/null': '/bin/touch /var/log/messages'
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 989, tty 
'/dev/tty1': '/sbin/getty 38400 tty1'
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 990, tty 
'/dev/tty2': '/sbin/getty 38400 tty2'
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 993, tty 
'/dev/ttyS0': '/sbin/getty -L ttyS0 115200 vt100 '
Aug 17 08:12:13 buildroot user.debug kernel: spurious 8259A interrupt: IRQ7.
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 994, tty 
'/dev/null': '/sbin/syslogd -n -m 0'
Aug 17 08:12:13 buildroot syslog.info syslogd started: BusyBox v1.18.5
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 995, tty 
'/dev/null': '/sbin/klogd -n'
Aug 17 08:12:13 buildroot user.notice kernel: klogd started: BusyBox 
v1.18.5 (2011-09-08 16:26:33 EDT)
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 996, tty 
'/dev/tty3': '/usr/bin/tail -f /var/log/messages'
Aug 17 08:12:13 buildroot daemon.info linuxrc: starting pid 999, tty 
'/dev/null': '/usr/sa/sa_watch_process.sh'
Aug 17 08:12:13 buildroot daemon.notice ntpd[987]: ntpd 4.2.6p3 at 1.2290 
Thu Sep  8 20:28:44 UTC 2011 (1)
Aug 17 08:12:13 buildroot daemon.debug ntpd[987]: set_process_priority: 
Leave priority alone: priority_done is <2>
Aug 17 08:12:13 buildroot daemon.notice ntpd[987]: proto: precision = 
2.053 usec
Aug 17 08:12:13 buildroot daemon.debug ntpd[987]: ntp_io: estimated max 
descriptors: 1024, initial socket boundary: 16
Aug 17 08:12:13 buildroot daemon.info ntpd[987]: Listen and drop on 0 
v4wildcard 0.0.0.0 UDP 123
Aug 17 08:12:13 buildroot daemon.info ntpd[987]: Listen normally on 1 lo 
127.0.0.1 UDP 123
Aug 17 08:12:13 buildroot daemon.info ntpd[987]: Listen normally on 2 
eth0 192.168.2.23 UDP 123
Aug 17 08:12:13 buildroot daemon.info ntpd[987]: peers refreshed
Aug 17 08:12:13 buildroot daemon.err ntpd[987]: refclock_open /dev/gps0: 
No such file or directory
Aug 17 08:12:13 buildroot daemon.info ntpd[987]: 127.127.20.0 interface 
127.0.0.1 -> (none)
Aug 17 08:15:43 buildroot auth.info login[989]: root login on 'tty1'
Aug 17 08:15:53 buildroot auth.info passwd: Password for root changed by 
root


On 2011-09-09 02:28, Yegor Yefremov wrote:
> Hi Marc,
>
> Am 08.09.2011 23:55, schrieb Marc Leclerc:
>> Hi just moved from 2010-11 to 2011-08 with kernel 3.0.2 and the boot stops at the message in the subject. my fstab remains the same as much of the settings. anyone has a clue where i should start looking?
> Please provide the full bootlog.
>
> Yegor
>
>
>
