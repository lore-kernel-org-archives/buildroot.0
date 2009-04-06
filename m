From: Daniel.Li <lida_mail@163.com>
Date: Mon, 06 Apr 2009 15:40:07 +0800
Subject: [Buildroot] arm platform halt during boot. Help!
In-Reply-To: <20090404125347.GA11896@cloud.net.au>
References: <AC4CD65049C54EDC9F34A00769C5A81F@apexjs>
	<20090404125347.GA11896@cloud.net.au>
Message-ID: <1239003607.16274.2.camel@daniel-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear List,
I have compiled a default rootfs for arm platform.
But it halted at "ip: sendto: Invalid argument"

Any ideas? Thanks in advance.

## Booting image at ffc00000 ...
   Image Name:   Linux-2.6.12.6-arm1
   Created:      2008-10-09  14:16:12 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1987700 Bytes =  1.9 MB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing
Linux............................................................................................................................... done, booting the kernel.
Linux version 2.6.12.6-arm1 (ardon at localhost.localdomain) (gcc version
3.4.4 (release) (CodeSourcery ARM 2005q3-2)) #12 Wed Oct 8 18:29:15 EDT
2008 (kernel-2.6.12-DHNSMR03/04-V-1.2.1.0)
CPU: ARM926EJ-Sid(wb) [41069260] revision 0 (ARMv5TEJ)
CPU0: D VIVT write-back cache
CPU0: I cache: 32768 bytes, associativity 1, 32 byte lines, 1024 sets
CPU0: D cache: 32768 bytes, associativity 1, 32 byte lines, 1024 sets
Machine: MV-88fxx81
Using UBoot passing parameters structure
Sys Clk = 200000000, Tclk = 166666667
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: root=/dev/sda4 rw console=ttyS0,115200
PID hash table entries: 1024 (order: 10, 16384 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 128MB 0MB 0MB 0MB = 128MB total
Memory: 125696KB available (3063K code, 883K data, 112K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
 config_device_cs Error : Unknown board 

CPU Interface
-------------
SDRAM_CS0 ....base 00000000, size 128MB 
SDRAM_CS1 ....disable
SDRAM_CS2 ....disable
SDRAM_CS3 ....disable
PEX0_MEM ....base e0000000, size 128MB 
PEX0_IO ....base f2000000, size   1MB 
PCI0_MEM ....base e8000000, size 128MB 
PCI0_IO ....base f2100000, size   1MB 
INTER_REGS ....base f1000000, size   1MB 
DEVICE_CS0 ....base fa000000, size   2MB 
DEVICE_CS1 ....base f4000000, size  32MB 
DEVICE_CS2 ....base fa800000, size   1MB 
DEV_BOOCS ....base ff800000, size   8MB 
CRYPTO ENG ....no such
usi debug: base ff800000, size 400000, bankwidth 1

  Marvell Development Board (LSP Version 1.10.3_DB_NAS)--
DB-88F5182-DHNSMR03  Soc: 88F5182 A2

 Detected Tclk 166666667 and SysClk 200000000 
Marvell USB EHCI Host controller #0: c055db00
Marvell USB EHCI Host controller #1: c055da40
pexBarOverlapDetect: winNum 2 overlap current 0
mvPexInit:Warning :Bar 2 size is illigal
it will be disabled
please check Pex and CPU windows configuration
PCI: bus0: Fast back to back transfers enabled
PCI: bus1: Fast back to back transfers enabled
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
use IDMA acceleration in copy to/from user buffers. used channels 2 and
3 
Done. 
mvCesaInit: sessions=640, queue=32, pSram=f0000000
cesadev_init(c0012070)
Fast Floating Point Emulator V0.9 (c) Peter Teichmann.
inotify device minor=63
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
NTFS driver 2.1.22 [Flags: R/W].
Initializing Cryptographic API
Serial: 8250/16550 driver $Revision: 1.1.1.1 $ 4 ports, IRQ sharing
disabled
ttyS0 at MMIO 0x0 (irq = 3) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Marvell Gigabit Ethernet Driver 'egiga':
  o Ethernet descriptors in DRAM
  o DRAM SW cache-coherency
  o Checksum offload enabled
  o Loading network interface 'eth0' 
Intergrated Sata device found
scsi0 : Marvell SCSI to SATA adapter
scsi1 : Marvell SCSI to SATA adapter
  Vendor: Seagate   Model: ST3250620AS       Rev: 3.AA
  Type:   Direct-Access                      ANSI SCSI revision: 03
SCSI device sda: 488397168 512-byte hdwr sectors (250059 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 488397168 512-byte hdwr sectors (250059 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
NFTL driver: nftlcore.c $Revision: 1.1.1.1 $, nftlmount.c $Revision:
1.1.1.1 $
Iomega834x: Probing for flash...
Flash: Found 1 x16 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
Flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Iomega834x: Flash found at location 0xff800000
Creating 2 MTD partitions on "Flash":
0x00000000-0x00380000 : "firmware"
0x00380000-0x00400000 : "bootloader"
ehci_platform ehci_platform.4523: EHCI Host Controller
ehci_platform ehci_platform.4523: new USB bus registered, assigned bus
number 1
ehci_platform ehci_platform.4523: irq 17, io mem 0x00000000
ehci_platform ehci_platform.4523: park 0
ehci_platform ehci_platform.4523: USB 0.0 initialized, EHCI 1.00, driver
10 Dec 2004
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
ehci_platform ehci_platform.16781: EHCI Host Controller
ehci_platform ehci_platform.16781: new USB bus registered, assigned bus
number 2
ehci_platform ehci_platform.16781: irq 12, io mem 0x00000000
ehci_platform ehci_platform.16781: park 0
ehci_platform ehci_platform.16781: USB 0.0 initialized, EHCI 1.00,
driver 10 Dec 2004
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   arm4regs  :   303.200 MB/sec
   8regs     :   215.200 MB/sec
   32regs    :   249.200 MB/sec
raid5: using function: arm4regs (303.200 MB/sec)
md: md driver 0.90.1 MAX_MD_DEVS=256, MD_SB_DISKS=27
device-mapper: 4.4.0-ioctl (2005-01-12) initialised: dm-devel at redhat.com
NET: Registered protocol family 2
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sda3 ...
md:  adding sda3 ...
md: created md2
md: bind<sda3>
md: running: <sda3>
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda4, internal journal
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem).
Freeing init memory: 112K
Initializing random number generator... done.
Starting network...
ip: sendto: Invalid argument


-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)
