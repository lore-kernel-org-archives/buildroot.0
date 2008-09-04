From: Steven Woody <narkewoody@gmail.com>
Date: Thu, 4 Sep 2008 23:49:38 +0800
Subject: [Buildroot] Login exited
In-Reply-To: <20080904142912.GB28250@cloud.net.au>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
	<20080904020018.GC16933@cloud.net.au>
	<ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
	<20080904142912.GB28250@cloud.net.au>
Message-ID: <ed4892840809040849x7505c56ft98135e1535dc0fcc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 4, 2008 at 10:29 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Thu, Sep 04, 2008 at 01:34:14PM +0800, Steven Woody wrote:
>> On Thu, Sep 4, 2008 at 10:00 AM, Hamish Moffatt <hamish@cloud.net.au> wrote:
>> > Did you try booting with init=/bin/sh as I suggested two days ago? Or
>> > modify your inittab to present you with a shell without needing to
>> > login? This will help to break down the problem dramatically.
>>
>> I did init=/bin/sh as you suggested and reported the result to the
>> list.  Again, the result is:  there is nothing I can do after rootfs
>> was loaded by kernel.  I can type in characters can see the echo of
>> what I typed on the screen, but no any other outputs.  Does this has
>> something to do with my read-only file system type (cramfs)?
>
> I didn't see your posting. Do you get a prompt? Do you get any messages
> at all after the kernel loads, loads the RAM disk, etc? Please post the
> whole log.
>
> No I don't see how the root file system being read-only would be
> significant. cramfs is always read-only. I build cramfs here with
> buildroot and it works just fine.
>
> Hamish

Hi, Hamish

Below are the whole boot message, and I like to say sorry to other
peoples here for the reposting.

---------------
Freeing init memory: 84K
mount: mounting configfs on /config failed: No such device
Error -3 while decompressing!
c021ac2c(-8656788)->c3e6e000(4096)
Dec 31 17:00:02 nlmt syslog.info syslogd started: BusyBox v1.12.0
Dec 31 17:00:02 nlmt daemon.info init: init: starting pid 205, tty
'/dev/null': '/sbin/klogd -n'
Dec 31 17:00:02 nlmt user.notice kernel: klogd started: BusyBox
v1.12.0 (2008-09-02 20:51:05 CST)
Dec 31 17:00:02 nlmt user.notice kernel: Linux version 2.6.16.4
(root at haohuibin) (gcc version 3.3) #638 Mon Aug 4 11:59:45 CST 2008
Dec 31 17:00:02 nlmt user.warn kernel: CPU: ARM920Tid(wb) [41129200]
revision 0 (ARMv4T)
Dec 31 17:00:02 nlmt user.warn kernel: Machine: LMT
Dec 31 17:00:02 nlmt user.debug kernel: Converting old-style param
struct to taglist
Dec 31 17:00:02 nlmt user.warn kernel: Memory policy: ECC disabled,
Data cache writeback
Dec 31 17:00:02 nlmt user.debug kernel: On node 0 totalpages: 16384
Dec 31 17:00:02 nlmt user.debug kernel:   DMA zone: 16384 pages, LIFO batch:3
Dec 31 17:00:02 nlmt user.debug kernel:   DMA32 zone: 0 pages, LIFO batch:0
Dec 31 17:00:02 nlmt user.debug kernel:   Normal zone: 0 pages, LIFO batch:0
Dec 31 17:00:02 nlmt user.debug kernel:   HighMem zone: 0 pages, LIFO batch:0
Dec 31 17:00:02 nlmt user.warn kernel: CPU S3C2440A (id 0x32440001)
Dec 31 17:00:02 nlmt user.warn kernel: S3C2440: core 399.651 MHz,
memory 99.912 MHz, peripheral 49.956 MHz
Dec 31 17:00:02 nlmt user.info kernel: S3C2410 Clocks, (c) 2004 Simtec
Electronics
Dec 31 17:00:02 nlmt user.warn kernel: CLOCK: Slow mode (2.116 MHz),
fast, MPLL on, UPLL on
Dec 31 17:00:02 nlmt user.warn kernel: CPU0: D VIVT write-back cache
Dec 31 17:00:02 nlmt user.warn kernel: CPU0: I cache: 16384 bytes,
associativity 64, 32 byte lines, 8 sets
Dec 31 17:00:02 nlmt user.warn kernel: CPU0: D cache: 16384 bytes,
associativity 64, 32 byte lines, 8 sets
Dec 31 17:00:02 nlmt user.warn kernel: Built 1 zonelists
Dec 31 17:00:02 nlmt user.notice kernel: Kernel command line:
root=/dev/mtdblock3 console=ttyS0
Dec 31 17:00:02 nlmt user.warn kernel: irq: clearing pending ext status 00000020
Dec 31 17:00:02 nlmt user.warn kernel: irq: clearing subpending status 00000003
Dec 31 17:00:02 nlmt user.warn kernel: irq: clearing subpending status 00000002
Dec 31 17:00:02 nlmt user.warn kernel: PID hash table entries: 512
(order: 9, 8192 bytes)
Dec 31 17:00:02 nlmt user.warn kernel: timer tcon=00500000, tcnt a29d,
tcfg 00000200,00000000, usec 00001ebf
Dec 31 17:00:02 nlmt user.warn kernel: Console: colour dummy device 80x30
Dec 31 17:00:02 nlmt user.warn kernel: Dentry cache hash table
entries: 16384 (order: 4, 65536 bytes)
Dec 31 17:00:02 nlmt user.warn kernel: Inode-cache hash table entries:
8192 (order: 3, 32768 bytes)
Dec 31 17:00:02 nlmt user.info kernel: Memory: 64MB = 64MB total
Dec 31 17:00:02 nlmt user.notice kernel: Memory: 62604KB available
(1880K code, 230K data, 84K init)
Dec 31 17:00:02 nlmt user.debug kernel: Calibrating delay loop...
199.47 BogoMIPS (lpj=498688)
Dec 31 17:00:02 nlmt user.warn kernel: Mount-cache hash table entries: 512
Dec 31 17:00:02 nlmt user.info kernel: CPU: Testing write buffer coherency: ok
Dec 31 17:00:02 nlmt user.info kernel: NET: Registered protocol family 16
Dec 31 17:00:02 nlmt user.warn kernel: S3C2440: Initialising architecture
Dec 31 17:00:02 nlmt user.warn kernel: S3C2440: IRQ Support
Dec 31 17:00:02 nlmt user.warn kernel: S3C2440: Clock Support, UPLL
47.980 MHz, DVS off
Dec 31 17:00:02 nlmt user.notice kernel: SCSI subsystem initialized
Dec 31 17:00:02 nlmt user.info kernel: usbcore: registered new driver usbfs
Dec 31 17:00:02 nlmt user.info kernel: usbcore: registered new driver hub
Dec 31 17:00:02 nlmt user.warn kernel: S3C2410 DMA Driver, (c)
2003-2004 Simtec Electronics
Dec 31 17:00:02 nlmt user.warn kernel: DMA channel 0 at c4800000, irq 33
Dec 31 17:00:02 nlmt user.warn kernel: DMA channel 1 at c4800040, irq 34
Dec 31 17:00:02 nlmt user.warn kernel: DMA channel 2 at c4800080, irq 35
Dec 31 17:00:02 nlmt user.warn kernel: DMA channel 3 at c48000c0, irq 36
Dec 31 17:00:02 nlmt user.warn kernel: yaffs Aug  4 2008 11:57:59 Installing.
Dec 31 17:00:02 nlmt user.info kernel: io scheduler noop registered (default)
Dec 31 17:00:02 nlmt user.warn kernel: Console: switching to mono
frame buffer device 20x20
Dec 31 17:00:02 nlmt user.info kernel: fb0: s3c2410fb frame buffer device
Dec 31 17:00:02 nlmt user.warn kernel: S3C2410 RTC, (c) 2004 Simtec Electronics
Dec 31 17:00:02 nlmt user.info kernel: s3c2410-rtc s3c2410-rtc: rtc
disabled, re-enabling
Dec 31 17:00:02 nlmt user.info kernel: Serial: 8250/16550 driver
$Revision: 1.90 $ 2 ports, IRQ sharing disabled
Dec 31 17:00:02 nlmt user.info kernel: serial8250: tts0 at MMIO
0xe1500000 (irq = 18) is a 16550A
Dec 31 17:00:02 nlmt user.info kernel: serial8250: tts1 at MMIO
0xe1500008 (irq = 19) is a 16550A
Dec 31 17:00:02 nlmt user.info kernel: s3c2440-uaDec 31 17:00:02 nlmt
user.info kernel: s3c2440-uDec 31 17:00:02 nlmt user.notice kernel:
cmdlineDec 31 17:00:02 nlmt user.notice kernel: RedBootDec 31 17:00:02
nlmt user.info kernel: Scanning Dec 31 17:00:02 nlmt user.info kernel:
s3c2410-oDec 31 17:00:02 nlmt user.info kernel: usbcore: Dec 31
17:00:02 nlmt user.info kernel: NET: RegiDec 31 17:00:02 nlmt
user.info kernel: TCP reno Dec 31 17:00:02 nlmt user.info kernel: usb
1-1: Dec 31 17:00:02 nlmt user.warn kernel: Error -3


Welcome to the Erik's uClibc development environment.
nlmt login:   Vendor: Teclast   Model: CoolFlash         Rev: 0.00
 Type:   Direct-Access                      ANSI SCSI revision: 02
Dec 31 17:00:06 nlmt user.notice kernel:   Vendor: Teclast   Model:
CoolFlash SCSI device sda: 1007616 512-byte hdwr sectors (516 MB)
       Rev: 0.00
Dec 31 17:00:06 nlmt user.notsda: Write Protect is off
sda: assuming drive cache: write through
ice kernel:   Type:   Direct-Access                      ANSI SCSI revision: 02
Dec 31 17:00:06 nlmt user.notice kernel: SCSI device sda: 10076SCSI
device sda: 1007616 512-byte hdwr sectors (516 MB)
16 512-byte hdwr sectors (516 MB)
Dec 31 17:00:sda: Write Protect is off
sda: assuming drive cache: write through
 sda:06 nlmt user.notice kernel: sda: Write Protect is off
Dec 31 17:00:06 nlmt user.debug kernel: sda: Mode Sense: 00 00 00 00
Dec 31 17:00:06 nlmt user.err kernel: sda: assuming drive cache: write through
Dec 31 17:00:06 nlmt user.notice kernel: SCSI device sda: 1007616
512-byte hdwr sectors (516 MB)
Dec 31 17:00:06 nlmt user.notice kernel: sda: Write Protect is off
Dec 31 17:00:06 nlmt user.debug kernel: sda: Mode Sense: 00 00 00 00
Dec 31 17:00:06 nlmt user.err kernel: sda: assuming drive cache: write through
Dec 31 17:00:06 nlmt user.info kernel:  sda:
 sda1
sd 0:0:0:0: Attached scsi removable disk sda
Dec 31 17:00:06 nlmt user.info kernel:  sda1
Dec 31 17:00:06 nlmt user.notice kernel: sd 0:0:0:0: Attached scsi
removable disk sda
Dec 31 17:00:06 nlmt user.debug kernel: usb-storage: device scan complete



Welcome to the Erik's uClibc development environment.
nlmt login: root
Dec 31 17:00:29 nlmt auth.info login[203]: root login on 'ttyS0'
Dec 31 17:00:29 nlmt daemon.info init: init: process '/sbin/getty -L
ttyS0 115200 vt100' (pid 203) exited. Scheduling for restart.
Dec 31 17:0


Welcome to the Erik's uClibc development environment.
nlmt login
