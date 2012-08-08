From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 8 Aug 2012 15:37:18 -0700
Subject: [Buildroot] Noobie hat for a day
Message-ID: <CALo-6+hK=t54u992+DVMba1g_n0VYCpVyoZM6L2xPvdmh=hiLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Putting on my 'noobie' hat again for a day, I am bolloxed as to why I
compile the same kernel with two different toolchains and one works
and the other dies.

Here are two boots. Earlyprintk is compiled in and earlyprintk is on
the kernel command line. The same source is used in both cases. The
non-functioning one is is compiled with Sourcery CodeBench 2011.09-70
and it dies early. The functioning one is compiled with the
CodeSourcery 2010.09-50 toolchain.

Clearly earlyprintk does show a difference (Thank you for that
suggestion last week). But as to why the kernel for this TI AM3517EVM
dies with the newer Sourcery Codebench is a question I am hoping
someone can answer.

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.37+ (ckrinke at dellx) (gcc version 4.6.1 (Sourcery
CodeBench Lite 2011.09-70) ) #5 Wed Aug 8 15:25:02 PDT 2012
CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3517/AM3517 EVM
bootconsole [earlycon0] enabled
Reserving 4194304 bytes SDRAM for VRAM
Memory policy: ECC disabled, Data cache writeback
AM3517 ES1.1 (l2cache iva sgx neon isp )
SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x10000
Unhandled fault: alignment exception (0x001) at 0xc04ee62b
Internal error: : 1 [#1]

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.37+ (ckrinke at dellx) (gcc version 4.5.1 (Sourcery G++
Lite 2010.09-50) ) #3 Wed Aug 8 12:43:27 PDT2
CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3517/AM3517 EVM
Reserving 4194304 bytes SDRAM for VRAM
Memory policy: ECC disabled, Data cache writeback
AM3517 ES1.1 (l2cache iva sgx neon isp )
SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x10000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 64000
Kernel command line: console=ttyO2,115200n8 earlyprintk
root=/dev/mtdblock4 rw rootfstype=jffs2
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 252MB = 252MB total
Memory: 243656k/243656k available, 18488k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
    lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc003a000   ( 200 kB)
      .text : 0xc003a000 - 0xc05959c4   (5487 kB)
      .data : 0xc0596000 - 0xc074ce60   (1756 kB)

-- 
Charles
