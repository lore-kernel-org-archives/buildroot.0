From: Kelvin Chan <kelvinc@positronics.com>
Date: Mon, 16 Feb 2009 19:06:25 -0800
Subject: [Buildroot] kernel hangs after NET: Registered protocol family 16
Message-ID: <A2E63C94AB8EE543B8743CB1AD8F976159036534@NEWPOSISERVER.positronics.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm using a ALIX 2c3 and my kernel hangs after "NET: Registered protocol family 16"
I'm almost sure this is more of a kernel build config issue but not sure where to find answers. The dump looks like kernel is waiting for a subsystem or driver to init but that particular system/driver is not built. Can someone confirm that?

The kernel is built without network support, trying to make things easier. All I want to see is boot process make it to init into user space.

Buildroot is at latest svn trunk version. And here's the dump from kernel.

root   (hd0,0)
 Filesystem type is ext2fs, partition type 0x83
kernel   /boot/bzImage rw root=/dev/hda1 console=ttyS0,115200 noinitrd rootfsty
pe=ext2
   [Linux-bzImage, setup=0x3e00, size=0x12de40]

BIOS EBDA/lowmem at: 00000000/000a0000
Linux version 2.6.28.2 (kel at boxfish) (gcc version 4.3.2 (GCC) ) #1 PREEMPT Fri Feb 13 12:58:16 PST 2009
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
  NSC Geode by NSC
  Cyrix CyrixInstead
  Centaur CentaurHauls
  Transmeta GenuineTMx86
  Transmeta TransmetaCPU
  UMC UMC UMC UMC
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000010000000 (usable)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
DMI not present or invalid.
last_pfn = 0x10000 max_arch_pfn = 0x100000
0MB HIGHMEM available.
256MB LOWMEM available.
  mapped low ram: 0 - 10000000
  low ram: 00000000 - 10000000
  bootmap 00001000 - 00003000
(6 early reservations) ==> bootmem [0000000000 - 0010000000]
  #0 [0000000000 - 0000001000]   BIOS data page ==> [0000000000 - 0000001000]
  #1 [0000100000 - 000039e18c]    TEXT DATA BSS ==> [0000100000 - 000039e18c]
  #2 [000039f000 - 00003a1000]    INIT_PG_TABLE ==> [000039f000 - 00003a1000]
  #3 [000009f000 - 0000100000]    BIOS reserved ==> [000009f000 - 0000100000]
  #4 [0000007000 - 0000008000]          PGTABLE ==> [0000007000 - 0000008000]
  #5 [0000001000 - 0000003000]          BOOTMAP ==> [0000001000 - 0000003000]
Zone PFN ranges:
  DMA      0x00000000 -> 0x00001000
  Normal   0x00001000 -> 0x00010000
  HighMem  0x00010000 -> 0x00010000
Movable zone start PFN for each node
early_node_map[2] active PFN ranges
    0: 0x00000000 -> 0x000000a0
    0: 0x00000100 -> 0x00010000
Allocating PCI resources starting at 20000000 (gap: 10000000:eff00000)
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 64928
Kernel command line: rw root=/dev/hda1 console=ttyS0,115200 noinitrd rootfstype=ext2
Initializing CPU#0
PID hash table entries: 1024 (order: 10, 4096 bytes)
Fast TSC calibration using PIT
Detected 497.993 MHz processor.
Console: colour dummy device 80x25
console [ttyS0] enabled
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 256620k/262144k available (1866k kernel code, 4956k reserved, 423k data, 156k init, 0k highmem)
virtual kernel memory layout:
    fixmap  : 0xfffee000 - 0xfffff000   (  68 kB)
    pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
    vmalloc : 0xd0800000 - 0xff7fe000   ( 751 MB)
    lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
      .init : 0xc0340000 - 0xc0367000   ( 156 kB)
      .data : 0xc02d284a - 0xc033c63c   ( 423 kB)
      .text : 0xc0100000 - 0xc02d284a   (1866 kB)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
Calibrating delay loop (skipped), value calculated using timer frequency.. 995.98 BogoMIPS (lpj=1991972)
Mount-cache hash table entries: 512
CPU: L1 I Cache: 64K (32 bytes/line), D cache 64K (32 bytes/line)
CPU: L2 Cache: 128K (32 bytes/line)
CPU: Geode(TM) Integrated Processor by AMD PCS stepping 02
Checking 'hlt' instruction... OK.
Freeing SMP alternatives: 0k freed
net_namespace: 288 bytes
NET: Registered protocol family 16

Kelvin Chan               | Positronics Ent.
Product Development       |
                          | unit 272
604-628-9330 (direct)     | 8128 128th St.
604-585-2119 at 104 (main)   | Surrey, BC
604-585-3056 (fax)        | Canada, V3W 1R1
