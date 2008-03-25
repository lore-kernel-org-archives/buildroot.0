From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 25 Mar 2008 12:20:20 +0000
Subject: [Buildroot] rpm & buildroot
In-Reply-To: <46a136670803240437k1bb9234fm7643e2d410ee1c99@mail.gmail.com>
References: <1206343539.3605.1.camel@nigel-x60>
	<46a136670803240332w469c8e59s169b3ba1ccfe2c1e@mail.gmail.com>
	<1206355410.3605.5.camel@nigel-x60>
	<46a136670803240437k1bb9234fm7643e2d410ee1c99@mail.gmail.com>
Message-ID: <1206447620.3605.88.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Guys,

> I just assume most people use buildroot for embedded devices, but I
> guess it's not restricted to that alone :) 
> 
> Did you try using strace or maybe run it in a gdbserver? I use Eclipse
> with the RSE (Remote System Explorer) plugins. You can easily debug
> over ethernet this way. I wrote a quick how-to for AVR32 but it will
> work just the same for x86.
> 
> http://avr32linux.org/twiki/bin/view/Main/RemoteDebugging
> 

I chroot'ed into the rootfs and gdb'd rpm.

Below backtrace .... is it because its using -fPIC?



GNU gdb 6.6
Copyright (C) 2006 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you
are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for
details.
This GDB was configured as "i586-linux-uclibc"...
Using host libthread_db library "/lib/libthread_db.so.1".
(gdb) run
Starting program: /bin/rpm 
argc=1 argv=0xbfc4a164 envp=0xbfc4a16c
ELF header=0xb7f70000
First Dynamic section entry=0xb7f7befc
Scanning DYNAMIC section
Done scanning DYNAMIC section
About to do library loader relocations
Done relocating ldso; we can now use globals and make function calls!
_dl_get_ready_to_run:169: Cool, ldso survived making function calls
_dl_get_ready_to_run:261: Position Independent Executable:
app_tpnt->loadaddr=0x80000000
_dl_malloc:892: mmapping more memory
_dl_get_ready_to_run:340: Lib Loader: (0xb7f70000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:286: calling mprotect on the application program

Program received signal SIGSEGV, Segmentation fault.
0xb7f74835 in _dl_get_ready_to_run (tpnt=0xbfc49da0,
load_addr=3086417920, auxvt=0xbfc49d28, envp=0xbfc4a16c,
argv=0xbfc4a164) at ldso/ldso/ldso.c:577
577	ldso/ldso/ldso.c: No such file or directory.
	in ldso/ldso/ldso.c
(gdb) 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080325/9da4b20e/attachment.pgp 
