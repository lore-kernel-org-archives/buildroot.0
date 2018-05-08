From: nikh <nikhkkv@gmail.com>
Date: Mon, 7 May 2018 23:06:57 -0700 (MST)
Subject: [Buildroot] ubi filesytem issue
Message-ID: <1525759617076-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am nikh,

I am trying to build rootfs in ubi format using buildroot. I am using
sama5d3_xplained board.
I am using nand flash based booting.
I build a root file system based on the information from the following site,
http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_Buildroot_for_AT91

I successfully got the ubi format rootfs image. I used a demo script to
flash at91 bootstrap, u-boot, u-bootenv, device tree, zImage and root file
system.
After that while booting i got several errors because of root file system.
below i can paste my debug messages,


RomBOOT


AT91Bootstrap 3.8.9-00028-g89c8ba7 (Tue Feb 27 10:23:22 IST 2018)

NAND: ONFI flash detected
NAND: Manufacturer ID: 0x2c Chip ID: 0xda
NAND: Page Bytes: 2048, Spare Bytes: 64
NAND: ECC Correctability Bits: 4, ECC Sector Bytes: 512
NAND: Disable On-Die ECC
NAND: Initialize PMECC params, cap: 4, sector: 512
NAND: Image: Copy 0xa0000 bytes from 0x40000 to 0x26f00000
NAND: Done to load image
<debug_uart> 

U-Boot 2017.03-linux4sam_5.7-00018-gadb5999 (Mar 19 2018 - 17:50:31 +0530)

CPU: SAMA5D36
Crystal frequency:       12 MHz
CPU clock        :      528 MHz
Master clock     :      132 MHz
DRAM:  256 MiB
NAND:  256 MiB
MMC:   Atmel mci: 0, Atmel mci: 1
In:    serial at ffffee00
Out:   serial at ffffee00
Err:   serial at ffffee00
Net:   
Error: ethernet at f0028000 address not set.
No ethernet found.
Hit any key to stop autoboot:  0 

NAND read: device 0 offset 0x180000, size 0x8b0d
 35597 bytes read: OK

NAND read: device 0 offset 0x200000, size 0x393580
 3749248 bytes read: OK
## Flattened Device Tree blob at 21000000
   Booting using the fdt blob at 0x21000000
   Loading Device Tree to 2fb21000, end 2fb2cb0c ... OK

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 4.9.83-02243-g077e4b5 (sfm at tspl-dev243) (gcc version 5.4.0
20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9) ) #1 Wed Mar 21 15:22:08 IST
2018
CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt:Machine model: Atmel SAMA5D3 Xplained TM7000B
cma: Reserved 64 MiB at 0x28000000
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 64960
Kernel command line: console=ttyS0,115200
mtdparts=atmel_nand:256k(bootstrap)ro,768k(uboot)ro,256k(env_redundant),256k(env),512k(dtb),6M(kernel)ro,-(rootfs)
rootfstype=ubifs ubi.mtd=6 root=ubi0:rootfs rw6
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 184124K/262144K available (6144K kernel code, 209K rwdata, 1068K
rodata, 1024K init, 195K bss, 12484K reserved, 65536K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xd0800000 - 0xff800000   ( 752 MB)
    lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc0700000   (7136 kB)
      .init : 0xc0900000 - 0xc0a00000   (1024 kB)
      .data : 0xc0a00000 - 0xc0a34420   ( 210 kB)
       .bss : 0xc0a34420 - 0xc0a652f8   ( 196 kB)
NR_IRQS:16 nr_irqs:16 16
clocksource: pit: mask: 0xfffffff max_cycles: 0xfffffff, max_idle_ns:
14479245754 ns
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
21474836475000000ns
Console: colour dummy device 80x30
Calibrating delay loop... 351.43 BogoMIPS (lpj=1757184)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x20100000 - 0x20100058
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
pinctrl core: initialized pinctrl subsystem
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor menu
AT91: PM: standby: standby, suspend: ulp0
gpio-at91 fffff200.gpio: at address d0814200
gpio-at91 fffff400.gpio: at address d0816400
gpio-at91 fffff600.gpio: at address d0818600
gpio-at91 fffff800.gpio: at address d081a800
gpio-at91 fffffa00.gpio: at address d081ca00
pinctrl-at91 ahb:apb:pinctrl at fffff200: initialized AT91 pinctrl driver
clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 115833966437 ns
at_hdmac ffffe600.dma-controller: Atmel AHB DMA Controller ( cpy set slave
sg-cpy ), 8 channels
at_hdmac ffffe800.dma-controller: Atmel AHB DMA Controller ( cpy set slave
sg-cpy ), 8 channels
AT91: Detected SoC family: sama5d3
AT91: Detected SoC: sama5d36, revision 2
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
at91_i2c f0014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA
transfers
at91_i2c f0014000.i2c: AT91 i2c bus driver (hw version: 0x402).
at91_i2c f0018000.i2c: using dma0chan2 (tx) and dma0chan3 (rx) for DMA
transfers
at91_i2c f0018000.i2c: AT91 i2c bus driver (hw version: 0x402).
at91_i2c f801c000.i2c: can't get DMA channel, continue without DMA support
at91_i2c f801c000.i2c: AT91 i2c bus driver (hw version: 0x402).
media: Linux media interface: v0.10
Linux video capture interface: v2.00
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource tcb_clksrc
NET: Registered protocol family 2
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
workingset: timestamp_bits=14 max_order=16 bucket_order=2
io scheduler noop registered (default)
VCC_1V8: failed to get the current voltage(-121)
act8865 1-005b: failed to register DCDC_REG1
act8865: probe of 1-005b failed with error -121
f001c000.serial: ttyS1 at MMIO 0xf001c000 (irq = 23, base_baud = 4125000) is
a ATMEL_SERIAL
f0020000.serial: ttyS2 at MMIO 0xf0020000 (irq = 24, base_baud = 4125000) is
a ATMEL_SERIAL
f0024000.serial: ttyS5 at MMIO 0xf0024000 (irq = 25, base_baud = 4125000) is
a ATMEL_SERIAL
ffffee00.serial: ttyS0 at MMIO 0xffffee00 (irq = 37, base_baud = 8250000) is
a ATMEL_SERIAL
console [ttyS0] enabled
[drm] Initialized
brd: module loaded
loop: module loaded
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to create HLCDC
outputs: -517
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to initialize mode
setting
atmel_nand_nfc 70000000.nfc: NFC is probed.
atmel_nand 60000000.nand: Using dma0chan4 for DMA transfers.
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
atmel_nand 60000000.nand: Use On Flash BBT
atmel_nand 60000000.nand: minimum ECC: 4 bits in 512 bytes
atmel_nand 60000000.nand: Initialize PMECC params, cap: 4, sector: 512
atmel_nand 60000000.nand: Using NFC Sram read 
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
nand_read_bbt: bad block at 0x000000c80000
nand_read_bbt: bad block at 0x000000ca0000
7 cmdlinepart partitions found on MTD device atmel_nand
Creating 7 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "bootstrap"
0x000000040000-0x000000100000 : "uboot"
0x000000100000-0x000000140000 : "env_redundant"
0x000000140000-0x000000180000 : "env"
0x000000180000-0x000000200000 : "dtb"
0x000000200000-0x000000800000 : "kernel"
0x000000800000-0x000010000000 : "rootfs"
atmel_spi f0004000.spi: Using dma0chan5 (tx) and dma0chan6 (rx) for DMA
transfers
atmel_spi f0004000.spi: Atmel SPI Controller version 0x213 at 0xf0004000
(irq 19)
atmel_spi f8008000.spi: Using dma1chan0 (tx) and dma1chan1 (rx) for DMA
transfers
atmel_spi f8008000.spi: Atmel SPI Controller version 0x213 at 0xf8008000
(irq 28)
libphy: Fixed MDIO Bus: probed
CAN device driver interface
at91_can f000c000.can: device registered (reg_base=d08db000, irq=44)
macb f802c000.ethernet: invalid hw address, using random
libphy: MACB_mii_bus: probed
Micrel KSZ8081 or KSZ8091 f802c000.ethernet-ffffffff:01: attached PHY driver
[Micrel KSZ8081 or KSZ8091] (mii_bus:phy_addr=f802c000.ethernet-ffffffff:01,
irq=-1)
macb f802c000.ethernet eth0: Cadence MACB rev 0x0001010c at 0xf802c000 irq
45 (3e:3a:1f:56:86:62)
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-atmel: EHCI Atmel driver
atmel-ehci 700000.ehci: EHCI Host Controller
atmel-ehci 700000.ehci: new USB bus registered, assigned bus number 1
atmel-ehci 700000.ehci: irq 49, io mem 0x00700000
atmel-ehci 700000.ehci: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 4.9.83-02243-g077e4b5 ehci_hcd
usb usb1: SerialNumber: 700000.ehci
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-atmel: OHCI Atmel driver
at91_ohci 600000.ohci: failed to find sfr node
at91_ohci 600000.ohci: USB Host Controller
at91_ohci 600000.ohci: new USB bus registered, assigned bus number 2
at91_ohci 600000.ohci: irq 49, io mem 0x00600000
usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: USB Host Controller
usb usb2: Manufacturer: Linux 4.9.83-02243-g077e4b5 ohci_hcd
usb usb2: SerialNumber: at91
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
usbcore: registered new interface driver usb-storage
usbcore: registered new interface driver usbserial
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial support registered for generic
usbcore: registered new interface driver ftdi_sio
usbserial: USB Serial support registered for FTDI USB Serial Device
usbcore: registered new interface driver pl2303
usbserial: USB Serial support registered for pl2303
qt1070 1-001b: can not read register, returned -121
qt1070 1-001b: ID -121 not supported
atmel_mxt_ts 1-004a: __mxt_read_reg: i2c transfer failed (-121)
atmel_mxt_ts 1-004a: mxt_bootloader_read: i2c recv failed (-121)
atmel_mxt_ts 1-004a: Trying alternate bootloader address
atmel_mxt_ts 1-004a: mxt_bootloader_read: i2c recv failed (-121)
usb 1-2: new high-speed USB device number 2 using atmel-ehci
atmel_mxt_ts 1-004a: Try a second time to init maxtouch
atmel_mxt_ts 1-004a: __mxt_read_reg: i2c transfer failed (-121)
atmel_mxt_ts 1-004a: mxt_bootloader_read: i2c recv failed (-121)
atmel_mxt_ts 1-004a: Trying alternate bootloader address
atmel_mxt_ts 1-004a: mxt_bootloader_read: i2c recv failed (-121)
atmel_mxt_ts: probe of 1-004a failed with error -121
rtc rtc0: alarm rollover not handled
rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
at91_rtc fffffeb0.rtc: rtc core: registered fffffeb0.rtc as rtc0
at91_rtc fffffeb0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
AT91: Starting after user reset
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
atmel_mci f0000000.mmc: version: 0x505
atmel_mci f0000000.mmc: using dma0chan7 for DMA transfers
usb 1-2: New USB device found, idVendor=090c, idProduct=1000
usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-2: Product: USB DISK
usb 1-2: Manufacturer: SMI Corporation
usb 1-2: SerialNumber: CCYYMMDDHHmmSSMRRG4B
usb-storage 1-2:1.0: USB Mass Storage device detected
scsi host0: usb-storage 1-2:1.0
atmel_mci f0000000.mmc: Atmel MCI controller at 0xf0000000 irq 18, 1 slots
atmel_mci f8000000.mmc: version: 0x505
atmel_mci f8000000.mmc: using dma1chan2 for DMA transfers
atmel_mci f8000000.mmc: Atmel MCI controller at 0xf8000000 irq 27, 1 slots
sdhci-pltfm: SDHCI platform and OF driver helper
ledtrig-cpu: registered to indicate activity on CPUs
atmel_aes f8038000.aes: version: 0x135
atmel_aes f8038000.aes: Atmel AES - Using dma1chan3, dma1chan4 for DMA
transfers
atmel_sha f8034000.sha: version: 0x410
atmel_sha f8034000.sha: using dma1chan5 for DMA transfers
atmel_sha f8034000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
atmel_tdes f803c000.tdes: version: 0x701
atmel_tdes f803c000.tdes: using dma1chan6, dma1chan7 for DMA transfers
atmel_tdes f803c000.tdes: Atmel DES/TDES
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
iio iio:device0: Resolution used: 12 bits
iio iio:device0: ADC Touch screen is disabled.
NET: Registered protocol family 10
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
can: controller area network core (rev 20120528 abi 9)
NET: Registered protocol family 29
can: raw protocol (rev 20120528)
can: broadcast manager protocol (rev 20161123 t)
can: netlink gateway (rev 20130117) max_hops=1
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: DRM device successfully
registered
ubi0: default fastmap pool size: 95
ubi0: default fastmap WL pool size: 47
ubi0: attaching mtd6
ubi0 error: 0xc041cd7c: bad VID header offset 512, expected 2048
ubi0 error: 0xc041cd30: bad EC header
Erase counter header dump:
        magic          0x55424923
        version        1
        ec             0
        vid_hdr_offset 512
        data_offset    2048
        image_seq      1825409418
        hdr_crc        0x3358adb
erase counter header hexdump:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.83-02243-g077e4b5 #1
Hardware name: Atmel SAMA5
Function entered at [<c010ce68>] from [<c010a704>]
Function entered at [<c010a704>] from [<c041cd3c>]
Function entered at [<c041cd3c>] from [<c041d8d0>]
Function entered at [<c041d8d0>] from [<c042258c>]
Function entered at [<c042258c>] from [<c0423ba8>]
Function entered at [<c0423ba8>] from [<c0417824>]
Function entered at [<c0417824>] from [<c091dd88>]
Function entered at [<c091dd88>] from [<c0101734>]
Function entered at [<c0101734>] from [<c0900d10>]
Function entered at [<c0900d10>] from [<c0687500>]
Function entered at [<c0687500>] from [<c01074b0>]
ubi0 error: 0xc041d914: validation failed for PEB 0
ubi0 error: 0xc0417a24: failed to attach mtd6, error -22
UBI error: cannot attach mtd6input: gpio_keys as
/devices/platform/gpio_keys/input/input0
at91_rtc fffffeb0.rtc: setting system clock to 2014-08-27 11:25:24 UTC
(1409138724)
panel-power-supply: disabling
ALSA device list:
  No soundcards found.
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -19
Please append a correct "root=" boot option; here are the available
partitions:
0100            8192 ram0  (driver?)
0101            8192 ram1  (driver?)
0102            8192 ram2  (driver?)
0103            8192 ram3  (driver?)
1f00             256 mtdblock0  (driver?)
1f01             768 mtdblock1  (driver?)
1f02             256 mtdblock2  (driver?)
1f03             256 mtdblock3  (driver?)
1f04             512 mtdblock4  (driver?)
1f05            6144 mtdblock5  (driver?)
1f06          253952 mtdblock6  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.83-02243-g077e4b5 #1
Hardware name: Atmel SAMA5
Function entered at [<c010ce68>] from [<c010a704>]
Function entered at [<c010a704>] from [<c0173858>]
Function entered at [<c0173858>] from [<c0901190>]
Function entered at [<c0901190>] from [<c0901514>]
Function entered at [<c0901514>] from [<c0900d8c>]
Function entered at [<c0900d8c>] from [<c0687500>]
Function entered at [<c0687500>] from [<c01074b0>]
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
random: fast init done

I cant figure out the issue.
Any tips or information will be help full.

Regards
Nikh 



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
