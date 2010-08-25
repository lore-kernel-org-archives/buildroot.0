From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 25 Aug 2010 11:16:03 +0200
Subject: [Buildroot] mini 2440 config nfs problems
In-Reply-To: <20100825090820.GE28629@jasper.tkos.co.il>
References: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
	<20100825090820.GE28629@jasper.tkos.co.il>
Message-ID: <AANLkTim=ebkMvT=kZTobqF_u6g6faWUCBDGTR4EW4eBn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Aug 25, 2010 at 11:08 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Belisko,
> On Wed, Aug 25, 2010 at 10:48:09AM +0200, Belisko Marek wrote:
>> playing with buildroot (2010.08_rc1) to build complete system for my
>> mini 2440 board.
>> I was able to build kernel and rootfs correctly but when I try to
>> mount rootfs over nfs it
>> always hangs with :
>>
>> Freeing init memory: 120K
>> Kernel panic - not syncing: Attempted to kill init!
>
> We need more info:
>
> 1. Your kernel command line
bootargs=console=ttySAC0,115200 noinitrd init=/bin/busybox
mini2440=0tb root=/dev/nfs rw
nfsroot=10.146.1.21:/home/open-nandra/rootfs
ip=10.146.1.195:10.146.1.21::255.255.255.0:mini2440:eth0
>
> 2. The full console output of the kernel
Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.34.1 (open-nandra at linux) (gcc version 4.3.5
(Buildroot 2010.08-rc1) ) #1 Tue Aug 24 15:48:46 CEST 2010
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
CPU: VIVT data cache, VIVT instruction cache
Machine: MINI2440
Memory policy: ECC disabled, Data cache writeback
CPU S3C2440A (id 0x32440001)
S3C24XX Clocks, Copyright 2004 Simtec Electronics
S3C244X: core 405.000 MHz, memory 101.250 MHz, peripheral 50.625 MHz
CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttySAC0,115200 noinitrd init=/bin/busybox
mini2440=0tb root=/dev/nfs rw
nfsroot=10.146.1.21:/home/open-nandra/rootfs
ip=10.146.1.195:10.146.1.21::255.255.255.0:m0
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 60612k/60612k available, 4924k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xc4800000 - 0xe0000000   ( 440 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc0026000   ( 120 kB)
      .text : 0xc0026000 - 0xc03c3000   (3700 kB)
      .data : 0xc03da000 - 0xc0403240   ( 165 kB)
SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Hierarchical RCU implementation.
NR_IRQS:85
irq: clearing pending status 02000000
irq: clearing subpending status 00000002
Console: colour dummy device 80x30
console [ttySAC0] enabled
Calibrating delay loop... 201.93 BogoMIPS (lpj=504832)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
MINI2440: Option string mini2440=0tb
MINI2440: 't' ignored, touchscreen not compiled in
MINI2440: LCD [0:240x320] 1:800x480 2:1024x768
S3C2440: Initialising architecture
S3C2440: IRQ Support
S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electronics
DMA channel 0 at c4808000, irq 33
DMA channel 1 at c4808040, irq 34
DMA channel 2 at c4808080, irq 35
DMA channel 3 at c48080c0, irq 36
S3C244X: Clock Support, DVS off
bio: create slab <bio-0> at 0
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
s3c-i2c s3c2440-i2c: slave address 0x10
s3c-i2c s3c2440-i2c: bus frequency set to 98 KHz
s3c-i2c s3c2440-i2c: i2c-0: S3C I2C adapter
Advanced Linux Sound Architecture Driver Version 1.0.22.1.
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
JFFS2 version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
ROMFS MTD (C) 2007 Red Hat, Inc.
msgmni has been set to 118
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Console: switching to colour frame buffer device 60x53
fb0: s3c2410fb frame buffer device
s3c2440-uart.0: s3c2410_serial0 at MMIO 0x50000000 (irq = 70) is a S3C2440
s3c2440-uart.1: s3c2410_serial1 at MMIO 0x50004000 (irq = 73) is a S3C2440
s3c2440-uart.2: s3c2410_serial2 at MMIO 0x50008000 (irq = 76) is a S3C2440
brd: module loaded
at24 0-0050: 1024 byte 24c08 EEPROM (writable)
S3C24XX NAND Driver, (c) 2004 Simtec Electronics
s3c24xx-nand s3c2440-nand: Tacls=1, 9ns Twrph0=3 29ns, Twrph1=2 19ns
s3c24xx-nand s3c2440-nand: NAND soft ECC
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit)
Creating 4 MTD partitions on "NAND 256MiB 3,3V 8-bit":
0x000000000000-0x000000040000 : "u-boot"
ftl_cs: FTL header not found.
0x000000040000-0x000000060000 : "u-boot-env"
ftl_cs: FTL header not found.
0x000000060000-0x000000560000 : "kernel"
ftl_cs: FTL header not found.
0x000000560000-0x000010000000 : "root"
ftl_cs: FTL header not found.
dm9000 Ethernet Driver, V1.31
eth0: dm9000e at c486e300,c4872304 IRQ 51 MAC: 08:08:11:18:12:27 (chip)
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
s3c2410-ohci s3c2410-ohci: S3C24XX OHCI
s3c2410-ohci s3c2410-ohci: new USB bus registered, assigned bus number 1
s3c2410-ohci s3c2410-ohci: irq 42, io mem 0x49000000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usbcore: registered new interface driver libusual
s3c2440-usbgadget s3c2440-usbgadget: S3C2440: increasing FIFO to 128 bytes
mice: PS/2 mouse device common for all mice
input: gpio-keys as /devices/platform/gpio-keys/input/input0
S3C24XX RTC, (c) 2004,2006 Simtec Electronics
s3c2410-rtc s3c2410-rtc: rtc disabled, re-enabling
s3c2410-rtc s3c2410-rtc: rtc core: registered s3c as rtc0
i2c /dev entries driver
S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics
s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabled, irq enabled
cpuidle: using governor ladder
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
s3c-sdi s3c2440-sdi: powered down.
s3c-sdi s3c2440-sdi: mmc0 - using pio, sw SDIO IRQ
s3c-sdi s3c2440-sdi: running at 0kHz (requested: 0kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 398kHz (requested: 400kHz).
s3c-sdi s3c2440-sdi: running at 16875kHz (requested: 25000kHz).
s3c-sdi s3c2440-sdi: running at 16875kHz (requested: 25000kHz).
mmc0: new SD card at address b368
usbcore: registered new interface driver hiddev
mmcblk0: mmc0:b368 SMI   486 MiB
 mmcblk0:
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
 p1 p2 p3
No device for DAI UDA134X
No device for DAI s3c24xx-i2s
S3C24XX_UDA134X SoC Audio driver
UDA134X SoC Audio Codec
asoc: UDA134X <-> s3c24xx-i2s mapping ok
ALSA device list:
  #0: S3C24XX_UDA134X (UDA134X)
TCP cubic registered
NET: Registered protocol family 17
s3c2410-rtc s3c2410-rtc: setting system clock to 2157-02-25 02:38:58
UTC (1611000642)
eth0: link down
IP-Config: Complete:
     device=eth0, addr=10.146.1.195, mask=255.255.255.0, gw=255.255.255.255,
     host=mini2440, domain=, nis-domain=(none),
     bootserver=10.146.1.21, rootserver=10.146.1.21, rootpath=
Looking up port of RPC 100003/2 on 10.146.1.21
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Looking up port of RPC 100005/1 on 10.146.1.21
VFS: Mounted root (nfs filesystem) on device 0:13.
Freeing init memory: 120K
Kernel panic - not syncing: Attempted to kill init!
[<c002b748>] (unwind_backtrace+0x0/0xec) from [<c02ea548>] (panic+0x38/0xcc)
[<c02ea548>] (panic+0x38/0xcc) from [<c003caa0>] (do_exit+0x60/0x588)
[<c003caa0>] (do_exit+0x60/0x588) from [<c003d04c>] (do_group_exit+0x84/0xb8)
[<c003d04c>] (do_group_exit+0x84/0xb8) from [<c004704c>]
(get_signal_to_deliver+0x2f4/0x330)
[<c004704c>] (get_signal_to_deliver+0x2f4/0x330) from [<c0029044>]
(do_notify_resume+0x6c/0x5c4)
[<c0029044>] (do_notify_resume+0x6c/0x5c4) from [<c0026f2c>]
(work_pending+0x1c/0x20)
>
> 3. The /etc/exports file on your NFS server
/home/open-nandra	192.168.2.0/3(rw,sync,no_root_squash,no_subtree_check)
10.146.1.0/3(rw,sync,no_root_squash,no_subtree_check)
>
> baruch
>
>> Is there anything what I can check? This is not related to some EABI
>> tweaking?
>>
>> Thanks for replies,
>>
>> Marek
>
> --
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ~. .~ ? Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
> ? - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
