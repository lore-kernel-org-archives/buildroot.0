From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 15 Mar 2012 13:17:06 +0100
Subject: [Buildroot] core file
In-Reply-To: <20120315080021.24349b77@skate>
References: <DC8F7388218A402C9FEADA4D9CC577B3@JohanW7>
 <20120315080021.24349b77@skate>
Message-ID: <B20373C250564070827FBAAEA65AE6B6@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

This is the result of  gdb /usr/bin/curl -c /root/core

The virtual memory error is strange since my board only has 64MB

# ulimit -c unlimited
# curl
ELF header=0x40074000
First Dynamic section entry=0x40083ef0
Scanning DYNAMIC section
Done scanning DYNAMIC section
About to do library loader relocations
Done relocating ldso; we can now use globals and make function calls!
_dl_get_ready_to_run:454: Cool, ldso survived making function calls
_dl_malloc:246: mmapping more memory
_dl_ldsopath_init:162: Lib Loader: (0x40074000) /lib/ld-uClibc.so.0: using path: /lib
_dl_get_ready_to_run:1042: Loading: (0x4009e000) /usr/lib/libcurl.so.4
_dl_get_ready_to_run:1042: Loading: (0x40110000) /usr/lib/libz.so.1
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x402a3000) /usr/lib/libssl.so.1.0.0
_dl_get_ready_to_run:1042: Loading: (0x4030e000) /usr/lib/libcrypto.so.1.0.0
_dl_get_ready_to_run:1042: Loading: (0x40110000) /usr/lib/libz.so.1
_dl_get_ready_to_run:1042: Loading: (0x4019b000) /lib/libgcc_s.so.1
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x4019b000) /lib/libgcc_s.so.1
_dl_get_ready_to_run:1042: Loading: (0x40074000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:1042: Loading: (0x4030e000) /usr/lib/libcrypto.so.1.0.0
_dl_get_ready_to_run:1042: Loading: (0x401e5000) /lib/libdl.so.0
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x401e5000) /lib/libdl.so.0
_dl_get_ready_to_run:1042: Loading: (0x4019b000) /lib/libgcc_s.so.1
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40208000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40074000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:1285: Beginning relocation fixups
transfering control to application @ 0x9748
Segmentation fault (core dumped)
# gdb /usr/bin/curl -c /root/core
ELF header=0x40024000
First Dynamic section entry=0x40033ef0
Scanning DYNAMIC section
Done scanning DYNAMIC section
About to do library loader relocations
Done relocating ldso; we can now use globals and make function calls!
_dl_get_ready_to_run:454: Cool, ldso survived making function calls
_dl_malloc:246: mmapping more memory
_dl_ldsopath_init:162: Lib Loader: (0x40024000) /lib/ld-uClibc.so.0: using path: /lib
_dl_get_ready_to_run:1042: Loading: (0x40049000) /usr/lib/libncurses.so.5
_dl_get_ready_to_run:1042: Loading: (0x400ec000) /lib/libm.so.0
_dl_get_ready_to_run:1042: Loading: (0x40111000) /lib/libdl.so.0
_dl_get_ready_to_run:1042: Loading: (0x40121000) /lib/libgcc_s.so.1
_dl_get_ready_to_run:1042: Loading: (0x40134000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40134000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40134000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40134000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40024000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40134000) /lib/libc.so.0
_dl_get_ready_to_run:1042: Loading: (0x40024000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:1285: Beginning relocation fixups
transfering control to application @ 0x3ffe0
GNU gdb (GDB) 7.1
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-unknown-linux-uclibcgnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/curl...done.
[New Thread 597]
Reading symbols from /usr/lib/libcurl.so.4...done.
Loaded symbols for /usr/lib/libcurl.so.4
Reading symbols from /usr/lib/libz.so.1...done.
Loaded symbols for /usr/lib/libz.so.1
Reading symbols from /lib/libc.so.0.../home/johan/buildroot/output/toolchain/gdb-7.1a/gdb/utils.c:1246: internal-error: virtual
memory exhausted: can't allocate 59954836 bytes.
A problem internal to GDB has been detected,
further debugging may prove unreliable.
Quit this debugging session? (y or n) n

/home/johan/buildroot/output/toolchain/gdb-7.1a/gdb/utils.c:1246: internal-error: virtual memory exhausted: can't allocate 59954836
bytes.
A problem internal to GDB has been detected,
further debugging may prove unreliable.
Create a core file of GDB? (y or n) n
# 

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: donderdag 15 maart 2012 8:00
Aan: Sagaert Johan
CC: buildroot at uclibc.org
Onderwerp: Re: [Buildroot] core file

Hello,

Please keep the Buildroot list in the loop.

Le Thu, 15 Mar 2012 03:02:29 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I have the core file  and gdb on the target.
>  
> What should i do with it, i never used gdb on the command line so far.

If you have gdb on the target, then:

gdb /usr/bin/curl -c /path/to/the/core/file

By the way, if you are using BR2_CCACHE, then please disable it and do a complete rebuild to see if it works better.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
