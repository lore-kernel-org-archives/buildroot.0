From: Kaspar Emanuel <kaspar.emanuel@gmail.com>
Date: Thu, 30 Jan 2014 10:08:40 +0000
Subject: [Buildroot] jffs2 errors on ubifs rootfs
Message-ID: <CAB+dmji48fxFuUPJrq7EhL4QC+Amw4ZiNRe=oiBArPeCPPw-Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I am trying to boot a Buildroot generated .ubi rootfs on a Karo TX53
SoM [1]. I am seeing a lot of jffs2 errors even though the rootfs is
ubifs ubi image. The errors look like this:

jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x00000000: 0x0527 instead

There are a lot of these. Full log is attached. I can boot Karo's ubi
rootfs without seeing these errors, using the same kernel and dtb. I
boot the kernel with these arguments:

rootfstype=ubifs ubi.mtd=3,512 root=ubi0:rootfs

I have have made sure the ubifs LEBs, min i/o size and the ubi image
erase block and sub-page size etc. are all set correcty in Buildroot.
The rootfs _does_ actually seem to mount correctly and I can login,
but I just don't get where these jffs2 errors could be coming from.

Any help very much appreciated.

Ciao,

Kaspar

[1] http://www.karo-electronics.com/tx53.html
-------------- next part --------------
Hit any key to stop autoboot:  0 
                                 
Loading from nand0, offset 0x160000
   Image Name:   Linux-3.13.0-rc7-next-20140109-k
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3625984 Bytes = 3.5 MiB              
   Load Address: 70008000               
   Entry Point:  70008000
## Booting kernel from Legacy Image at 78000000 ...
   Image Name:   Linux-3.13.0-rc7-next-20140109-k  
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3625984 Bytes = 3.5 MiB              
   Load Address: 70008000               
   Entry Point:  70008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 71000000
   Booting using the fdt blob at 0x71000000
   Loading Kernel Image ... OK             
   Loading Device Tree to 8efde000, end 8efe722a ... OK
                                                       
Starting kernel ...
                   
Enabling L2 cache
Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Linux version 3.13.0-rc7-next-20140109-karo (kaspar at x201) (gcc version 4.7.3 20130102 (prerelease) (crosstool-NG linaro-1.13.1-4.7-2013.01-20130125 - Linaro GCC 2013.01) ) #1 PREEMPT Wed Jan 29 14:40:13 GMT 2014
CPU: ARMv7 Processor [412fc085] revision 5 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine model: Ka-Ro electronics TX53 module (LVDS)
Memory policy: Data cache writeback
On node 0 totalpages: 262144
free_area_init_node: node 0, pgdat 806ea1dc, node_mem_map 80c47000
  Normal zone: 3072 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 262144 pages, LIFO batch:31
CPU: All CPU(s) started in SVC mode.
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 259072
Kernel command line: console=ttymxc0,115200 ro debug panic=1 rootfstype=ubifs ubi.mtd=3,512 root=ubi0:rootfs
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1026832K/1048576K available (4927K kernel code, 250K rwdata, 1672K rodata, 194K init, 5488K bss, 21744K reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xe0800000 - 0xff000000   ( 488 MB)
    lowmem  : 0x80000000 - 0xe0000000   (1536 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x80679f74   (6600 kB)
      .init : 0x8067a000 - 0x806aa87c   ( 195 kB)
      .data : 0x806ac000 - 0x806eaac0   ( 251 kB)
       .bss : 0x806eaacc - 0x80c46e90   (5489 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
        Additional per-CPU info printed with stalls.
NR_IRQS:16 nr_irqs:16 16
TrustZone Interrupt Controller (TZIC) initialized
CPU identified as i.MX53, silicon rev 2.1
sched_clock: 32 bits at 40MHz, resolution 25ns, wraps every 107374182375ns
Console: colour dummy device 80x30
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8191
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     16384
... MAX_LOCKDEP_CHAINS:      32768
... CHAINHASH_SIZE:          16384
 memory used by lock dependency info: 3695 kB
 per task-struct memory footprint: 1152 bytes
Calibrating delay loop... 1196.85 BogoMIPS (lpj=5984256)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x704d5c18 - 0x704d5c70
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 2
pinctrl core: initialized pinctrl subsystem
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
syscon 53fa8000.iomuxc-gpr: regmap [mem 0x53fa8000-0x53fa800b] registered
imx53-pinctrl 53fa8000.iomuxc: initialized IMX pinctrl driver
bio: create slab <bio-0> at 0
2V5: 2500 mV 
3V3: 3300 mV 
CAN XCVR: 3300 mV 
usbh1_vbus: 5000 mV 
LVDS0 POWER: 3300 mV 
LVDS1 POWER: 3300 mV 
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
usbphy.1 supply vcc not found, using dummy regulator
usbphy.2 supply vcc not found, using dummy regulator
i2c i2c-2: IMX I2C adapter registered
i2c i2c-1: IMX I2C adapter registered
i2c i2c-0: IMX I2C adapter registered
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
Advanced Linux Sound Architecture Driver Initialized.
Switched to clocksource mxc_timer1
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP: reno registered
UDP hash table entries: 512 (order: 3, 40960 bytes)
UDP-Lite hash table entries: 512 (order: 3, 40960 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
jffs2: version 2.2. (NAND) (SUMMARY)  ? 2001-2006 Red Hat, Inc.
fuse init (API version 7.22)
msgmni has been set to 2005
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
imx-sdma 63fb0000.sdma: Direct firmware load failed with error -2
imx-sdma 63fb0000.sdma: Falling back to user helper
imx-sdma 63fb0000.sdma: initialized
Serial: IMX driver
5000c000.serial: ttymxc2 at MMIO 0x5000c000 (irq = 49, base_baud = 2250000) is a IMX
53fbc000.serial: ttymxc0 at MMIO 0x53fbc000 (irq = 47, base_baud = 2250000) is a IMX
console [ttymxc0] enabled
53fc0000.serial: ttymxc1 at MMIO 0x53fc0000 (irq = 48, base_baud = 2250000) is a IMX
[drm] Initialized drm 1.1.0 20060810
brd: module loaded
loop: module loaded
ahci ahci: SSS flag set, parallel bus scan disabled
ahci ahci: AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl platform mode
ahci ahci: flags: ncq sntf stag pm led clo only pmp pio slum part ccc 
scsi0 : ahci_platform
ata1: SATA max UDMA/133 mmio [mem 0x10000000-0x10000fff] port 0x100 irq 44
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xf1
nand: Samsung NAND 128MiB 3,3V 8-bit
nand: 128MiB, SLC, page size: 2048, OOB size: 64
Bad block table found at page 65472, version 0x01
Bad block table found at page 65408, version 0x01
nand_read_bbt: bad block at 0x000006fa0000
7 ofpart partitions found on MTD device mxc_nand
Creating 7 MTD partitions on "mxc_nand":
0x000000000000-0x000000100000 : "u-boot"
0x000000100000-0x000000160000 : "env"
0x000000160000-0x000000560000 : "linux"
0x000000560000-0x000004160000 : "rootfs"
0x000004160000-0x000004260000 : "userfs"
0x000007f40000-0x000007f80000 : "dtb"
0x000007f80000-0x000008000000 : "bbt"
spi_imx 50010000.ecspi: probed
vcan: Virtual CAN interface driver
CAN device driver interface
flexcan 53fc8000.can: device registered (reg_base=f57c8000, irq=98)
flexcan 53fcc000.can: device registered (reg_base=f57cc000, irq=99)
63fec000.ethernet supply phy not found, using dummy regulator
libphy: fec_enet_mii_bus: probed
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
usbcore: registered new interface driver usb-storage
usbcore: registered new interface driver ums-datafab
usbcore: registered new interface driver ums-realtek
usbcore: registered new interface driver ums-sddr09
usbcore: registered new interface driver ums-sddr55
ci_hdrc ci_hdrc.1: doesn't support gadget
ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 3.13.0-rc7-next-20140109-karo ehci_hcd
usb usb1: SerialNumber: ci_hdrc.1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
mousedev: PS/2 mouse device common for all mice
usbcore: registered new interface driver usbtouchscreen
rtc-ds1307 0-0068: SET TIME!
rtc-ds1307 0-0068: rtc core: registered ds1339 as rtc0
i2c /dev entries driver
imx2-wdt 53f98000.wdog: IMX2+ Watchdog Timer enabled. timeout=60s (nowayout=1)
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
mmc0: no vqmmc regulator found
mmc0: no vmmc regulator found
ata1: SATA link down (SStatus 0 SControl 300)
mmc0: SDHCI controller on 50004000.esdhc [50004000.esdhc] using ADMA
mmc1: no vqmmc regulator found
mmc1: no vmmc regulator found
mmc1: SDHCI controller on 50008000.esdhc [50008000.esdhc] using ADMA
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
[drm] Initialized imx-drm 1.0.0 20120507 on minor 0
imx-ipuv3 18000000.ipu: IPUv3M probed
sgtl5000: probe of 2-000a failed with error -5
fsl-ssi-dai 63fcc000.ssi: could not get baud clock: -2
imx-sgtl5000 sound.6: ASoC: CODEC (null) not registered
imx-sgtl5000 sound.6: snd_soc_register_card failed (-517)
platform sound.6: Driver imx-sgtl5000 requests probe deferral
TCP: cubic registered
NET: Registered protocol family 17
can: controller area network core (rev 20120528 abi 9)
NET: Registered protocol family 29
can: raw protocol (rev 20120528)
can: broadcast manager protocol (rev 20120528 t)
Key type dns_resolver registered
imx-sgtl5000 sound.6: ASoC: CODEC (null) not registered
imx-sgtl5000 sound.6: snd_soc_register_card failed (-517)
platform sound.6: Driver imx-sgtl5000 requests probe deferral
UBI: attaching mtd3 to ubi0
UBI: scanning is finished
UBI: attached mtd3 (name "rootfs", size 60 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 512 (aligned 512), data offset: 2048
UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1427817274
UBI: available PEBs: 0, total reserved PEBs: 480, PEBs reserved for bad PEB handling: 20
UBI: background thread "ubi_bgt0d" started, PID 788
input: gpio-keys.3 as /devices/gpio-keys.3/input/input0
imx-sgtl5000 sound.6: ASoC: CODEC (null) not registered
imx-sgtl5000 sound.6: snd_soc_register_card failed (-517)
rtc-ds1307 0-0068: setting system clock to 2000-01-01 03:22:00 UTC (946696920)
platform sound.6: Driver imx-sgtl5000 requests probe deferral
Console: switching to colour frame buffer device 128x48
imx-drm imx-drm: fb0:  frame buffer device
imx-drm imx-drm: registered panic notifier
ALSA device list:
  No soundcards found.
UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O mode
UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS: FS size: 31739904 bytes (30 MiB, 246 LEBs), journal size 4515840 bytes (4 MiB, 35 LEBs)
UBIFS: reserved for root: 0 bytes (0 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID 611F03A1-FB6D-4036-801E-39FD498BDAF8, small LPT model
VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 192K (8067a000 - 806aa000)
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x0527 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x1fa3 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0xe952 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 0x3700 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 0x0070 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0x0070 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0xdc61 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0x0205 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x694c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x2d78 instead
jffs2: Further such events for this erase block will not be printed
jffs2: Old JFFS2 bitmask found at 0x0000ee0c
jffs2: You cannot use older JFFS2 filesystems with newer kernels
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000: 0x0ed8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004: 0xb948 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008: 0x2ea7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002000c: 0x4dbe instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020010: 0xa3d1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020014: 0x498c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020018: 0xd472 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002001c: 0x7d70 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020020: 0xad4b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020024: 0x9731 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000: 0xf7b1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004: 0xe091 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008: 0xab35 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004000c: 0xdce1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040010: 0x589d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040014: 0xeb79 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040018: 0xc4e7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004001c: 0x3edf instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040020: 0x9191 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040024: 0x460d instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000: 0xeb4c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004: 0xe395 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060008: 0x4ee1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006000c: 0xa14c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060010: 0x3ed2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060014: 0x7467 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060018: 0x0551 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006001c: 0x682b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060020: 0x88d0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060024: 0x3513 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000: 0xe0f1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0xf06d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0xe64c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008000c: 0xae2c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080010: 0x8ca1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080014: 0x41cb instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080018: 0x4cff instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008001c: 0x4372 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080020: 0x080f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080024: 0x10e2 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0000: 0xdaa0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0004: 0x7c92 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0008: 0xb1f2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a000c: 0xc1b3 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0010: 0xbc81 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0014: 0xffc0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0018: 0x8879 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a001c: 0xf518 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0020: 0x34fc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0024: 0x9269 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0000: 0xa659 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0004: 0x5319 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0008: 0x5789 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c000c: 0xda73 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0010: 0xda3b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0014: 0xb3cc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0018: 0x387b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c001c: 0x5171 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0020: 0x5399 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0024: 0x5fd6 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0000: 0x7358 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0004: 0xcbba instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0008: 0xa09d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e000c: 0x24db instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0010: 0x5f40 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0014: 0x6826 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0018: 0x4f6c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e001c: 0x4673 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0020: 0x1c71 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0024: 0x9baa instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100000: 0xfca7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100004: 0xcef2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100008: 0x7c5d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0010000c: 0x7913 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100010: 0x8c33 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100014: 0x1a39 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100018: 0xfd23 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0010001c: 0xa0d8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100020: 0xb47d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100024: 0x3914 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120000: 0x1e7f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120004: 0xf65b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120008: 0xd267 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0012000c: 0xbd96 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120010: 0xfc7f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120014: 0xcea7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120018: 0xa93f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0012001c: 0xf876 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120020: 0xd7a2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120024: 0xe0ed instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140000: 0x4be8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140004: 0xee61 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140008: 0xfb9c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0014000c: 0x4ba8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140010: 0xa369 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140014: 0xdaa1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140018: 0xdb4d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0014001c: 0x6f84 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140020: 0xe98e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140024: 0x11f7 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160000: 0xcc5a instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160004: 0xf325 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160008: 0xeb8f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0016000c: 0x39f9 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160010: 0x7a16 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160014: 0xb591 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160018: 0x2eb8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0016001c: 0x795f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160020: 0x7dc8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160024: 0xefce instead
jffs2: Further such events for this erase block will not be printed
jffs2: Old JFFS2 bitmask found at 0x00161f00
jffs2: You cannot use older JFFS2 filesystems with newer kernels
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180000: 0x9f62 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180004: 0xc58f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180008: 0x2c77 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0018000c: 0x0bfa instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180010: 0x2a05 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180014: 0xe01c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180018: 0x8c8b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0018001c: 0xa61d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180020: 0x81ba instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180024: 0xe8f0 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0000: 0x35a1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0004: 0x783e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0008: 0xf2af instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a000c: 0x037a instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0010: 0xe947 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0014: 0x818a instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0018: 0x8f58 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a001c: 0x9732 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0020: 0x321d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0024: 0x02f3 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0000: 0xfda4 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0004: 0xeee3 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0008: 0x52e9 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c000c: 0x0bfa instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0010: 0x196d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0014: 0xe5b5 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0018: 0x67d6 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c001c: 0x14bc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0020: 0xf9e2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0024: 0xe185 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0000: 0x0db0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0004: 0xd3ec instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0008: 0x7c2e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e000c: 0x1476 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0010: 0xee81 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0014: 0xd865 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0018: 0x940d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e001c: 0xbdfa instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0020: 0xdbe9 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0024: 0x5bec instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200000: 0xef56 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200004: 0x3b78 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200008: 0x1bbe instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0020000c: 0xf964 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200010: 0xe2db instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200014: 0x1b36 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200018: 0x9196 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0020001c: 0x886b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200020: 0x92ed instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200024: 0xc6d8 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220000: 0x552d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220004: 0xbc9e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220008: 0x03bc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0022000c: 0x5ed8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220010: 0xff4f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220014: 0x8878 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220018: 0x0f20 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0022001c: 0x5e3d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220020: 0x1174 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220024: 0x0388 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240000: 0xac35 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240004: 0xc18b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240008: 0x6541 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0024000c: 0x5de1 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240010: 0x59c8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240014: 0xd5ad instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240018: 0x22ad instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0024001c: 0xbbf0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240020: 0x3758 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240024: 0xfc77 instead
jffs2: Further such events for this erase block will not be printed
jffs2: Old JFFS2 bitmask found at 0x00258aac
jffs2: You cannot use older JFFS2 filesystems with newer kernels
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260000: 0x4437 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260004: 0x9478 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260008: 0x36c2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0026000c: 0xff39 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260010: 0x9aff instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260014: 0xde7b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260018: 0xefff instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0026001c: 0x583d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260020: 0xa1ed instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260024: 0x7f98 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280000: 0xfa1c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280004: 0x3877 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280008: 0x014d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0028000c: 0xccda instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280010: 0x3a1e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280014: 0x79e0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280018: 0x0b99 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0028001c: 0x5a2b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280020: 0xeb47 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280024: 0xe046 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0000: 0xea71 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0004: 0xa773 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0008: 0x369b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a000c: 0x5fdc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0010: 0xaf32 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0014: 0xc583 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0018: 0xc311 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a001c: 0x3ae8 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0020: 0x9da7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0024: 0xfa30 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0000: 0x7336 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0004: 0x6ca6 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0008: 0x481c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c000c: 0x9b38 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0010: 0x7183 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0014: 0xdac2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0018: 0xf87f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c001c: 0x3bb0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0020: 0x24e0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0024: 0x6e72 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0000: 0xeb97 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0004: 0x1bca instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0008: 0xe1b7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e000c: 0x50bd instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0010: 0x3178 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0014: 0x3a15 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0018: 0x5def instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e001c: 0xe8e0 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0020: 0xa638 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0024: 0x6a18 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300000: 0x3e37 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300004: 0x42f6 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300008: 0x01b3 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0030000c: 0x78bc instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300010: 0x0f0c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300014: 0x6182 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300018: 0x1f92 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0030001c: 0x4f9a instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300020: 0xb1e2 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300024: 0x9627 instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320000: 0x87c4 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320004: 0x64cf instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320008: 0x5177 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0032000c: 0x0c2c instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320010: 0x0d5d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320014: 0x5f13 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320018: 0x1ab3 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0032001c: 0x8ece instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320020: 0xa4d7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320024: 0xc8ed instead
jffs2: Further such events for this erase block will not be printed
jffs2: Old JFFS2 bitmask found at 0x00331af8
jffs2: You cannot use older JFFS2 filesystems with newer kernels
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340000: 0xd5cb instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340004: 0x9b9b instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340008: 0x516f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0034000c: 0xfb29 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340010: 0x164d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340014: 0xa923 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340018: 0xfd84 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0034001c: 0x0918 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340020: 0x4a7f instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340024: 0x95fc instead
jffs2: Further such events for this erase block will not be printed
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360000: 0x8e90 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360004: 0x9439 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360008: 0xdcfa instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0036000c: 0xf9b7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360010: 0xa8c9 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360014: 0x6e9e instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360018: 0xfa17 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0036001c: 0xb11d instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360020: 0xa5c7 instead
jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360024: 0x5e39 instead
jffs2: Further such events for this erase block will not be printed
jffs2: Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
jffs2: empty_blocks 4, bad_blocks 0, c->nr_blocks 32
Starting logging: OK
Populating /dev using udev: udevd[809]: starting version 182
evbug: Connected device: input0 (gpio-keys.3 at gpio-keys/input0)
done
Initializing random number generator... read-only file system detected...done
Starting system message bus: random: dbus-uuidgen urandom read with 85 bits of entropy available
done
Starting network...
Starting dropbear sshd: OK
