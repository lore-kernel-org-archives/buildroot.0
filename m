From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Mon, 14 Apr 2008 19:00:09 +0530 (IST)
Subject: [Buildroot] Mount_filesystem_s3c2440
Message-ID: <659459.61809.qm@web94107.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have ported the latest linux kernel to s3c2440 (linux-2.6.24..4).  And I used the latest snapshot of buildroot to make a cpio filesystem.. But the shell prompt does not come. The compilers used for building the kernel and the filesystem are different. The one used for buildroot is a uclibc version. Following is the whole output.

DRAM:  128 MB
Flash: 32 MB
Using default environment

In:    serial
Out:   serial
Err:   serial
DPB2440 # bootm
## Booting image at 33000000 ...
   Image Name:   Linux-2.6.24.4-default
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2289776 Bytes =  2.2 MB
   Load Address: 30008000
   Entry Point:  30008000
   Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing Linux............................................................................................
Linux version 2.6.24.4-default (tiju at tiju) (gcc version 4.2.1) #52 Mon Apr 14 15:54:37 IST 2008
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=00007177
Machine: DPB2440
Warning: bad configuration page, trying to continue
Memory policy: ECC disabled, Data cache writeback
CPU S3C2440A (id 0x32440001)
S3C244X: core 405.000 MHz, memory 101.250 MHz, peripheral 50.625 MHz
S3C24XX Clocks, (c) 2004 Simtec Electronics
CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 4064
Kernel command line: root=/dev/ram0 rw console=ttySAC0,115200 init=/init
irq: clearing pending ext status 00000b00
irq: clearing subpending status 00000003
irq: clearing subpending status 00000002
PID hash table entries: 64 (order: 6, 256 bytes)
timer tcon=00500000, tcnt a4ca, tcfg 00000200,00000000, usec 00001e57
Console: colour dummy device 80x30
console [ttySAC0] enabled
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 16MB = 16MB total
Memory: 12500KB available (2184K code, 342K data, 1148K init)
Security Framework initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 64 bytes
NET: Registered protocol family 16
S3C2440: Initialising architecture
S3C2440: IRQ Support
S3C2440: Clock Support, DVS off
S3C24XX DMA Driver, (c) 2003-2004,2006 Simtec Electronics
DMA channel 0 at c1800000, irq 33
DMA channel 1 at c1800040, irq 34
DMA channel 2 at c1800080, irq 35
DMA channel 3 at c18000c0, irq 36
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP reno registered
audit: initializing netlink socket (disabled)
audit(2.135:1): initialized
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
s3c2440-uart.0: s3c2410_serial0 at MMIO 0x50000000 (irq = 70) is a S3C2440
s3c2440-uart.1: s3c2410_serial1 at MMIO 0x50004000 (irq = 73) is a S3C2440
s3c2440-uart.2: s3c2410_serial2 at MMIO 0x50008000 (irq = 76) is a S3C2440
mice: PS/2 mouse device common for all mice
S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics
s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabled, irq enabled
NET: Registered protocol family 1
NET: Registered protocol family 17
registered taskstats version 1
Freeing init memory: 1148K
Cannot run '/etc/init.d/rcS': No such file or directory

Please press Enter to activate this console.


When I hit the Enter key, nothing else appears. But the keyboard is active.
What could be the problem?

Regards
Tiju



      Get the freedom to save as many mails as you wish. To know how, go to http://help.yahoo.com/l/in/yahoo/mail/yahoomail/tools/tools-08.html
