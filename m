From: Saurav Kumar Barik <sauravb@aztecsoft.com>
Date: Thu, 11 Oct 2007 20:59:53 +0530
Subject: [Buildroot] Unable to boot with ramdisk of size > 8 Mb (16MB)
Message-ID: <A1286843C9B74E46B0063D92B7844C283751FD@azindbaex01.aztec.soft>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi all,

I am unable to boot ramdisk of size 16Mb.
The board crashes in the middle of booting.
The image is generated successfully from a successful build.
My setup is :
		GWIXP425
		Redboot-2.04
		GW SDK 0.7

However ramdisk of size 8Mb boots fine without any issue.

Could anybody share any pointer on how to successfully boot ramdisk of
size 16Mb?

Please see below the panic logs.

Thanks for your time.
Saurav

************************************************************************
***************************

RedBoot> load hda1:/ramdisk.gz -r -b 0x800000 -m disk
Raw file loaded 0x00800000-0x00caf5e2, assumed entry at 0x00800000
RedBoot> load hda1:/zImage -r -b 0x600000 -m disk
Raw file loaded 0x00600000-0x0074611f, assumed entry at 0x00600000
RedBoot> exec -c "console=ttyS0,115200 root=/dev/ram0 rw
initrd=0x00800000,16M boot=/dev/hda1,ext2 tmp=/dev/mtdblock1
PKGPATH=/dev/hda1 init=/linuxrc mem=64M at 0x00000000" 0x600000
Using base address 0x00600000 and length 0x00146120
Uncompressing
Linux...................................................................
..................... done, booting the kernel.
Linux version 2.6.21.4 (root at debian) (gcc version 4.2.0) #8 Thu Sep 27
15:24:27 UTC 2007
CPU: XScale-IXP42x Family [690541c1] revision 1 (ARMv5TE), cr=000039ff
Machine: Gateworks Avila Network Platform
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists.  Total pages: 16256
Kernel command line: console=ttyS0,115200 root=/dev/ram0 rw
initrd=0x00800000,16M boot=/dev/hda1,ext2 tmp=/dev/mtdblock1
PKGPATH=/dev/hda1 init=/linuxrc mem=64M at 0x00000000
PID hash table entries: 256 (order: 8, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 45708KB available (2484K code, 168K data, 124K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
IXP4xx: Using 16MiB expansion bus window size
PCI: IXP4xx is host
PCI: IXP4xx Using direct access for memory space
PCI: bus0: Fast back to back transfers enabled
dmabounce: registered device 0000:00:01.0 on pci bus
dmabounce: registered device 0000:00:02.0 on pci bus
SCSI subsystem initialized
NET: Registered protocol family 2
Time: OSTS clocksource has been installed.
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
checking if image is initramfs...it isn't (no cpio magic); looks like an
initrd
Freeing initrd memory: 16384K
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler cfq registered (default)
IXP4xx Watchdog Timer: heartbeat 60 sec
ixp425_gpio: IXP425 GPIO driver loaded
Serial: 8250/16550 driver $Revision: 1.90 $ 2 ports, IRQ sharing
disabled
serial8250.0: ttyS0 at MMIO 0xc8000000 (irq = 15) is a XScale
serial8250.0: ttyS1 at MMIO 0xc8001000 (irq = 13) is a XScale
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
loop: loaded (max 8 devices)
pata_ixp4xx_cf pata_ixp4xx_cf.0: version 0.1.2
ata1: PATA max PIO4 cmd 0xc4852000 ctl 0xc4854006 bmdma 0x00000000 irq
29
scsi0 : pata_ixp4xx_cf
libata xfer_mask: 39f
ata1.00: CFA: SanDisk SDCFB-256, HDX 3.13, max MWDMA2
ata1.00: 501760 sectors, multi 0: LBA
ata1.00: configured for PIO4
ata1.01: configured for PIO0
scsi 0:0:0:0: Direct-Access     ATA      SanDisk SDCFB-25 HDX  PQ: 0
ANSI: 5
SCSI device sda: 501760 512-byte hdwr sectors (257 MB)
sda: Write Protect is off
SCSI device sda: write cache: disabled, read cache: enabled, doesn't
support DPO or FUA
SCSI device sda: 501760 512-byte hdwr sectors (257 MB)
sda: Write Protect is off
SCSI device sda: write cache: disabled, read cache: enabled, doesn't
support DPO or FUA
 sda: sda1
sd 0:0:0:0: Attached scsi removable disk sda
IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Searching for RedBoot partition table in IXP4XX-Flash.0 at offset
0xfe0000
4 RedBoot partitions found on MTD device IXP4XX-Flash.0
Creating 4 MTD partitions on "IXP4XX-Flash.0":
0x00000000-0x01000000 : "flash"
0x00000000-0x00080000 : "RedBoot"
0x00080000-0x00fe0000 : "unallocated"
0x00fe0000-0x00fff000 : "FIS directory"
mtd: partition "FIS directory" doesn't end on an erase block -- force
read-only
i2c /dev entries driver
ds1672 0-0068: chip found, driver version 0.3
ds1672 0-0068: rtc core: registered ds1672 as rtc0
Registered led device: gw234x
Registered led device: gw2347
nf_conntrack version 0.5.0 (512 buckets, 4096 max)
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Bridge firewalling registered
Ebtables v2.0 registered
XScale DSP coprocessor detected.
ds1672 0-0068: setting the system clock to 2007-09-27 08:31:52
(1190881912)
RAMDISK: Compressed image found at block 0
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 805 [#1]
Modules linked in:
CPU: 0
PC is at pdflush_operation+0x4c/0xa8
LR is at 0xc029abe0
pc : [<c0063e58>]    lr : [<c029abe0>]    Not tainted
sp : c036b888  ip : c33eff98  fp : c036b8a0
r10: c02b0610  r9 : c02b0410  r8 : c02b0810
r7 : c036a000  r6 : 00000000  r5 : c0063664  r4 : a0000013
r3 : c33eff8c  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: 39FF
Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc036a250)
Stack: (0xc036b888 to 0xc036c000)
b880:                   00000100 c00631c0 c02afa08 c036b8b0 c036b8a4
c00631d8
b8a0: c0063e18 c036b8ec c036b8b4 c0044c0c c00631cc c036b8bc c02b0210
c036b8bc
b8c0: c036b8bc c02af804 00000011 0000000a c02af7c0 00000001 c02b1298
00000000
b8e0: c036b918 c036b8f0 c0040dd8 c0044aa8 00000005 c0296140 00000000
00000005
b900: 00007b83 00000000 000002eb c036b928 c036b91c c0041184 c0040d80
c036b944
b920: c036b92c c00283f8 c004114c ffffffff 0000001f 00000020 c036b9dc
c036b948
b940: c00276a4 c00283c0 00000009 c02a99ec 00000af1 0000002e 00000005
0000000c
b960: 0000016b 00000005 00007b83 00000000 000002eb c036b9dc 00000080
c036b990
b980: 00000001 c0009594 20000013 ffffffff 00000006 00000009 c1631408
c03d8008
b9a0: 000001ff 0000003f 00000000 00000005 00000009 00000005 00000000
0000001b
b9c0: 00000119 c036b9f4 00000006 00000137 c036bf1c c036b9e0 c000a590
c00094f0
b9e0: c0209a7a c03dc0a4 c036bee4 0000007f 0000001e 00000006 00000007
00000008
ba00: 00000008 00000008 0000000a 00000009 00000009 00000009 0000000a
00000009
ba20: 0000000a 00000008 0000000a 00000009 0000000a 00000007 00000009
0000000a
ba40: 0000000a 00000009 0000000d 0000000c 0000000b 0000000a 0000000a
0000000a
ba60: 00000008 0000000a 00000009 00000008 00000008 00000006 00000008
00000008
ba80: 00000007 00000007 00000008 00000008 00000008 00000008 00000008
00000008
baa0: 00000008 00000007 00000008 00000007 00000008 00000006 00000007
00000007
bac0: 00000008 00000007 00000008 00000007 00000008 00000007 00000007
00000008
bae0: 00000008 00000008 00000008 00000008 00000008 00000007 00000008
00000008
bb00: 00000007 00000008 00000007 00000008 00000008 00000007 00000007
00000007
bb20: 00000007 00000007 00000007 00000007 00000007 00000006 00000007
00000007
bb40: 00000007 00000007 00000007 00000007 00000007 00000007 00000007
00000007
bb60: 00000007 0000000c 0000000d 0000000c 00000009 00000009 00000009
0000000a
bb80: 0000000a 00000009 00000008 0000000a 0000000b 0000000c 00000009
0000000c
bba0: 0000000b 00000009 00000009 00000009 00000009 00000008 0000000d
00000009
bbc0: 00000009 00000009 0000000a 0000000b 0000000b 0000000a 0000000b
0000000b
bbe0: 0000000d 0000000c 0000000c 0000000d 0000000c 00000009 00000009
0000000a
bc00: 00000009 00000009 0000000a 00000009 00000009 0000000a 0000000a
0000000b
bc20: 0000000b 0000000a 0000000a 00000009 0000000a 00000009 0000000a
0000000c
bc40: 0000000d 00000009 0000000c 0000000c 0000000c 0000000a 0000000b
0000000d
bc60: 0000000c 0000000b 0000000b 0000000c 00000008 00000007 0000000c
0000000c
bc80: 0000000d 0000000c 0000000d 0000000d 0000000d 0000000d 0000000d
0000000d
bca0: 0000000c 0000000c 0000000d 0000000c 0000000d 0000000a 0000000d
0000000d
bcc0: 0000000d 0000000b 0000000d 0000000d 0000000d 0000000d 0000000d
0000000c
bce0: 0000000d 0000000b 0000000a 0000000d 0000000d 00000009 0000000a
0000000b
bd00: 0000000c 0000000b 0000000d 0000000c 0000000d 0000000b 0000000d
0000000d
bd20: 0000000c 0000000c 0000000b 0000000b 0000000d 0000000a 0000000d
0000000d
bd40: 0000000d 0000000d 0000000c 0000000d 0000000d 0000000d 0000000c
0000000c
bd60: 0000000c 0000000c 0000000d 0000000d 0000000d 00000007 00000007
00000008
bd80: 00000009 0000000a 00000007 0000000d 00000009 00000009 0000000a
0000000b
bda0: 0000000b 0000000a 0000000c 0000000b 0000000c 0000000a 0000000d
0000000d
bdc0: 0000000d 0000000b 0000000d 0000000d 0000000d 0000000c 0000000c
0000000c
bde0: 0000000d 0000000d 0000000d 0000000b 00000009 0000000c 00000005
00000005
be00: 00000006 00000006 00000002 00000008 00000009 00000009 00000008
00000009
be20: 00000007 0000000c 00000009 00000009 0000000a 0000000a 00000009
0000000d
be40: 0000000d 00000000 0000000b 0000000d 0000000d 0000000c 0000000a
00000000
be60: 00000000 00000005 0000000a 00000007 00000008 00000007 00000007
00000007
be80: 00000007 00000008 00000007 00000006 00000006 00000007 00000007
00000002
bea0: 00000001 00000007 00000006 00000006 00000006 00000006 00000007
00000009
bec0: 00000009 00000006 00000009 00000006 00000005 00000005 00000005
00000004
bee0: 00000005 00000006 00000009 c1631408 c03d8008 00000009 000000e2
c02a99ec
bf00: c02a99f4 c02a99f8 00000001 00000000 c036bf64 c036bf20 c000af90
c0009fb0
bf20: c0255b88 00000000 00000080 c036bf38 7c2f2d5c 00100000 c02a99e8
00100000
bf40: c02a99e8 c036a000 00000000 c036bfa4 00000000 c0023184 c036bf84
c036bf68
bf60: c000b8a4 c000a7ac c00235f0 00100000 c02a99e8 c036a000 c036bfa0
c036bf88
bf80: c0009220 c000b870 c036bf94 c02a99d8 c0022ca8 c036bff4 c036bfa4
c0008848
bfa0: c0009164 c036bfb0 c0027aa4 c0038f74 00000000 00000000 c00086dc
c003eb98
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
bfe0: 00000000 00000000 00000000 c036bff8 c003eb98 c00086e8 ffffffff
ffffffff
Backtrace:
[<c0063e0c>] (pdflush_operation+0x0/0xa8) from [<c00631d8>]
(wb_timer_fn+0x18/0x44)
 r6 = C02AFA08  r5 = C00631C0  r4 = 00000100
[<c00631c0>] (wb_timer_fn+0x0/0x44) from [<c0044c0c>]
(run_timer_softirq+0x170/0x1ec)
[<c0044a9c>] (run_timer_softirq+0x0/0x1ec) from [<c0040dd8>]
(__do_softirq+0x64/0xcc)
[<c0040d74>] (__do_softirq+0x0/0xcc) from [<c0041184>]
(irq_exit+0x44/0x4c)
[<c0041140>] (irq_exit+0x0/0x4c) from [<c00283f8>]
(asm_do_IRQ+0x44/0x5c)
[<c00283b4>] (asm_do_IRQ+0x0/0x5c) from [<c00276a4>]
(__irq_svc+0x24/0x60)
 r6 = 00000020  r5 = 0000001F  r4 = FFFFFFFF
[<c00094e4>] (inflate_codes+0x0/0x4d0) from [<c000a590>]
(inflate_dynamic+0x5ec/0x65c)
[<c0009fa4>] (inflate_dynamic+0x0/0x65c) from [<c000af90>]
(rd_load_image+0x7f0/0xfec)
[<c000a7a0>] (rd_load_image+0x0/0xfec) from [<c000b8a4>]
(initrd_load+0x40/0x320)
[<c000b864>] (initrd_load+0x0/0x320) from [<c0009220>]
(prepare_namespace+0xc8/0x154)
 r6 = C036A000  r5 = C02A99E8  r4 = 00100000
[<c0009158>] (prepare_namespace+0x0/0x154) from [<c0008848>]
(init+0x16c/0x1b8)
 r5 = C0022CA8  r4 = C02A99D8
[<c00086dc>] (init+0x0/0x1b8) from [<c003eb98>] (do_exit+0x0/0x79c)
Code: e89da870 e24c300c e593200c e5930010 (e5802000)
Kernel panic - not syncing: Aiee, killing interrupt handler!


The information contained in, or attached to, this e-mail, contains confidential information and is intended solely for the use of the individual or entity to whom they are addressed and is subject to legal privilege. If you have received this e-mail in error you should notify the sender immediately by reply e-mail, delete the message from your system and notify your system manager. Please do not copy it for any purpose, or disclose its contents to any other person. The views or opinions presented in this e-mail are solely those of the author and do not necessarily represent those of the company. The recipient should check this e-mail and any attachments for the presence of viruses. The company accepts no liability for any damage caused, directly or indirectly, by any virus transmitted in this email.

www.aztecsoft.com
