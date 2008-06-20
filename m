From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Fri, 20 Jun 2008 10:03:08 -0500
Subject: [Buildroot] can't find root fs kernel panic
In-Reply-To: <mailman.1147.1213963958.1345.buildroot@uclibc.org>
References: <mailman.1147.1213963958.1345.buildroot@uclibc.org>
Message-ID: <485BC6AC.1090301@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm hoping someone can help me with this.
I'm using this morning buildroot (How do I determine the rev #?)
Built for an Atmel at91sam9260 processor and eval board.
I've tried using the ext2, ext2.gz and jffs root filesystems with the 
same results.
Below is an abridged capture from the kernel during boot.
I've tried google, but everything I saw was related to the bootloader 
pointing to the wrong disk.
My u-boot invocation is:
bootp 21500000 linux.gz; bootp 20410000 rootfs.ext2.gz; bootm 21500000
Is the Kernel command line correct?
(I've tried 2 different boards, so I don't think it's h/w.)

Regards,
Joe

Starting kernel ...

Uncompressing 
Linux....................................................................................................
Linux version 2.6.24.4 (JoeB at elab14_linux.localdomain) (gcc version 
4.2.1) #2 Fri Jun 20 10:07:40 EDT 2008
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 199 MHz, master 99 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: mem=64M console=ttyS0,115200 
initrd=0x20410000,3145728 root=/dev/ram0 rw

Memory: 64MB = 64MB total
Memory: 58056KB available (3352K code, 238K data, 140K init)

checking if image is initramfs...it isn't (bad gzip magic numbers); 
looks like an initrd
Freeing initrd memory: 3072K
NetWinder Floating Point Emulator V0.97 (double precision)
DLM (built Jun 20 2008 09:40:47) installed
JFS: nTxBlock = 478, nTxLock = 3824

RAMDISK driver initialized: 16 RAM disks of 15360K size 1024 blocksize

RAMDISK: Couldn't find valid RAM disk image starting at 0.
List of all partitions:
No filesystem could mount root, tried:  ext2 cramfs msdos vfat jfs
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(1,0)
