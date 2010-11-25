From: Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com>
Date: Thu, 25 Nov 2010 14:07:13 +0100
Subject: [Buildroot] AT91SAM9G20 Buildroot Hangs
In-Reply-To: <AANLkTikmMd6z05CAzXN+e4AM5R4FvcinKgsDJZEOC1Lo@mail.gmail.com>
References: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
	<AANLkTikmMd6z05CAzXN+e4AM5R4FvcinKgsDJZEOC1Lo@mail.gmail.com>
Message-ID: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A6631@ex01-ubitronix.ubitronix.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Paulius,

Attaching the /etc/inittab

Thanks,
Abhi

-----Original Message-----
From: Paulius Zaleckas [mailto:paulius.zaleckas at gmail.com]
Sent: Donnerstag, 25. November 2010 13:50
To: Abhishek Ashtekar
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] AT91SAM9G20 Buildroot Hangs

On Thu, Nov 25, 2010 at 2:38 PM, Abhishek Ashtekar
<Abhishek.Ashtekar@ubitronix.com> wrote:
> Hello,
>
>
>
> With the AT91sam9G20ek board and buildroot-2010.08, I am able to mount the
> rootfs jffs2 onto the Nand.
>
> But I am unable to get the uClibc (Erik's uClibc development platform) login
> prompt and the boot process hangs after Starting Network and Starting
> dropbear sshd:
>
>
>
> What could be the possible cause? and workaround of course ?
>

Please send your /etc/inittab

>
> For reference, pasted below is the Boot Log
>
>
>
> Thanks,
>
> Abhi
>
>
>
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>
> U-Boot 1.3.4 (Sep 24 2009 - 16:58:45)
>
>
>
> DRAM:  64 MB
>
> NAND:  256 MiB
>
> In:    serial
>
> Out:   serial
>
> Err:   serial
>
> Net:   macb0
>
> macb0: Starting autonegotiation...
>
> macb0: Autonegotiation complete
>
> macb0: link up, 100Mbps full-duplex (lpa: 0x45e1)
>
> Hit any key to stop autoboot:  0
>
> U-Boot> setenv bootargs 'mem=64M console=ttyS0,115200 init=/sbin/init
> root=/dev/mtdblock2 rw rootfstype=jffs2'
>
> U-Boot> saveenv
>
> Saving Environment to NAND...
>
> Erasing redundant Nand...
>
> Erasing at 0x80000 -- 100% complete.
>
> Writing to redundant Nand... done
>
> U-Boot> boot
>
>
>
> NAND read: device 0 offset 0x200000, size 0x30f924
>
>  3209508 bytes read: OK
>
> ## Booting kernel from Legacy Image at 22200000 ...
>
>    Image Name:   Linux-2.6.36
>
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>
>    Data Size:    3209444 Bytes =  3.1 MB
>
>    Load Address: 20008000
>
>    Entry Point:  20008000
>
>    Verifying Checksum ... OK
>
>    Loading Kernel Image ... OK
>
> OK
>
>
>
> Starting kernel ...
>
>
>
> Uncompressing Linux... done, booting the kernel.
>
> Linux version 2.6.36 (root at abhi-desktop) (gcc version 4.4.4 (Buildroot
> 2010.08) ) #14 Wed Nov 24 16:54:14 CET 2010
>
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
>
> CPU: VIVT data cache, VIVT instruction cache
>
> Machine: Atmel AT91SAM9G20-EK
>
> Memory policy: ECC disabled, Data cache writeback
>
> Clocks: CPU 396 MHz, master 132 MHz, main 18.432 MHz
>
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
>
> Kernel command line: mem=64M console=ttyS0,115200 init=/sbin/init
> root=/dev/mtdblock2 rw rootfstype=jffs2
>
> PID hash table entries: 256 (order: -2, 1024 bytes)
>
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
>
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
>
> Memory: 64MB = 64MB total
>
> Memory: 58416k/58416k available, 7120k reserved, 0K highmem
>
> Virtual kernel memory layout:
>
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>
>     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>
>     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
>
>     vmalloc : 0xc4800000 - 0xfee00000   ( 934 MB)
>
>     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
>
>     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
>
>     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
>
>       .init : 0xc0008000 - 0xc03e9000   (3972 kB)
>
>       .text : 0xc03e9000 - 0xc062a000   (2308 kB)
>
>       .data : 0xc063a000 - 0xc0651340   (  93 kB)
>
> Hierarchical RCU implementation.
>
>         Verbose stalled-CPUs detection is disabled.
>
> NR_IRQS:192
>
> AT91: 96 gpio irqs in 3 banks
>
> Console: colour dummy device 80x30
>
> console [ttyS0] enabled
>
> Calibrating delay loop... 197.83 BogoMIPS (lpj=989184)
>
> pid_max: default: 32768 minimum: 301
>
> Mount-cache hash table entries: 512
>
> CPU: Testing write buffer coherency: ok
>
> NET: Registered protocol family 16
>
> bio: create slab <bio-0> at 0
>
> Switching to clocksource pit
>
> NET: Registered protocol family 2
>
> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
>
> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
>
> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
>
> TCP: Hash tables configured (established 2048 bind 2048)
>
> TCP reno registered
>
> UDP hash table entries: 256 (order: 0, 4096 bytes)
>
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>
> NET: Registered protocol family 1
>
> NetWinder Floating Point Emulator V0.97 (extended precision)
>
> JFFS2 version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
>
> msgmni has been set to 114
>
> io scheduler noop registered (default)
>
> atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
>
> atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
>
> atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
>
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V
> 8-bit)
>
> Scanning device for bad blocks
>
> Bad eraseblock 220 at 0x000001b80000
>
> Creating 3 MTD partitions on "atmel_nand":
>
> 0x000000000000-0x000000400000 : "Bootstrap"
>
> mtd: Giving out device 0 to Bootstrap
>
> 0x000000400000-0x000004000000 : "Partition 1"
>
> mtd: Giving out device 1 to Partition 1
>
> 0x000004000000-0x000010000000 : "Partition 2"
>
> mtd: Giving out device 2 to Partition 2
>
> GPIO NAND driver, ? 2004 Simtec Electronics
>
> atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
>
> MACB_mii_bus: probed
>
> eth0: Atmel MACB at 0xfffc4000 irq 21 (66:22:00:04:16:15)
>
> eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=ffffffff:00,
> irq=-1)
>
> mice: PS/2 mouse device common for all mice
>
> input: gpio-keys as /devices/platform/gpio-keys/input/input0
>
> TCP cubic registered
>
> NET: Registered protocol family 17
>
> NET: Registered protocol family 33
>
> RxRPC: Registered security type 2 'rxkad'
>
> Freeing init memory: 3972K
>
> Initializing random number generator... done.
>
> Starting network...
>
> Starting dropbear sshd: generating rsa key... generating dsa key... OK
>
> __________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5647
> (20101125) __________
>
> E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.
>
> http://www.eset.com
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5647 (20101125) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5647 (20101125) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com

-------------- next part --------------
A non-text attachment was scrubbed...
Name: inittab
Type: application/octet-stream
Size: 1353 bytes
Desc: inittab
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101125/2184bc6f/attachment.obj>
