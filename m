From: Rajeev Bansal <rbansal@proxim.com>
Date: Sat, 21 Feb 2009 22:44:29 -0800
Subject: [Buildroot] Toolchain error
Message-ID: <1E3D081C7B502B4A988F643E604CF9634721AD@INDEXCH.corp.proxim.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
 
This is my first experience with the Buildroot, I have used the latest
stable version "buildroot-2009.02.tar.bz2 to build the MIPS
cross-toolchain. During building of toolchain I got the following error 
 
In file included from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:
./libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/sysdep-cancel.h:2
0:20: error: sysdep.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS]
Error 1
make[1]: Leaving directory
`/home/rbansal/tarballs/buildroot-2009.02/toolchain_build_mips/uClibc-0.
9.30'
make: ***
[/home/rbansal/tarballs/buildroot-2009.02/toolchain_build_mips/uClibc-0.
9.30/lib/libc.a] Error 2
 
Which I could fix by commenting the inclusion of "sysdep.h" in
./toolchain_build_mips/uClibc-0.9.30/libpthread/linuxthreads/sysdeps/uni
x/sysv/linux/mips/sysdep-cancel.h, after that compilation proceeded and
build the complete toolchain under the following path
"build_mips/staging_dir/usr". 
 
I used the same toolchain to compile my linux kernel (2.6.15), which has
been patched for my board, but it is giving the following compilation
error:
 CHK     include/linux/version.h
 SPLIT   include/linux/autoconf.h -> include/config/*
 CC      arch/mips/kernel/asm-offsets.s
arch/mips/kernel/asm-offsets.c: In function 'output_mm_defines':
arch/mips/kernel/asm-offsets.c:227: error: invalid 'asm': invalid use of
'%x'
arch/mips/kernel/asm-offsets.c:228: error: invalid 'asm': invalid use of
'%x'
arch/mips/kernel/asm-offsets.c:229: error: invalid 'asm': invalid use of
'%x'
make[2]: *** [arch/mips/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
 
 
And when I am trying to cross compile busybox-1.10.0 using the same
toolchain, it is throwing the following error:
 
 CC      networking/tcpudp.o
In file included from
/home/rbansal/tarballs/buildroot-2009.02/build_mips/staging_dir/usr/incl
ude/linux/netfilter_ipv4.h:9,
                 from networking/tcpudp.c:34:
/home/rbansal/tarballs/buildroot-2009.02/build_mips/staging_dir/usr/incl
ude/linux/netfilter.h:55: error: field 'in' has incomplete type
/home/rbansal/tarballs/buildroot-2009.02/build_mips/staging_dir/usr/incl
ude/linux/netfilter.h:56: error: field 'in6' has incomplete type
make[1]: *** [networking/tcpudp.o] Error 1
make: *** [networking] Error 2

 
I am attaching my .config file for buildroot.  
 
Kindly help me why these errors are coming.
 
Thanks
Rajeev Bansal.
 
 
 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090221/a4ab4c92/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 18113 bytes
Desc: config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090221/a4ab4c92/attachment-0001.obj>
