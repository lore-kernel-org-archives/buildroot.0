From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 Feb 2007 01:08:26 -0800
Subject: [Buildroot] [buildroot 0001236]: unable to compile buildroot with
	software floating point option enabled
Message-ID: <bc8c27d1676fed321cb32c696cd7a6de@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1236 
====================================================================== 
Reported By:                aysha
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1236
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-22-2007 01:08 PST
Last Modified:              02-22-2007 01:08 PST
====================================================================== 
Summary:                    unable to compile buildroot with software floating
point option enabled
Description: 
I am trying to compile buildroot with software floating point option enabed
using GCC 4.1.1. The target architecture is arm920t with EABI set. In
toolchain options, use software floating point by default is selected. I
get the following error:

 CC libc/inet/rpc/rpc_thread.os
  CC libc/stdlib/atexit.os
  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o
  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function
`difftime':difftime.c:(.text+0x8): undefined reference to `__floatsidf'
:difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function
`_fpmaxtostr':_fpmaxtostr.c:(.text+0xd4): undefined reference to
`__nedf2'
:_fpmaxtostr.c:(.text+0xf8): undefined reference to `__eqdf2'
:_fpmaxtostr.c:(.text+0x114): undefined reference to `__divdf3'
:_fpmaxtostr.c:(.text+0x120): undefined reference to `__ltdf2'
:_fpmaxtostr.c:(.text+0x1c4): undefined reference to `__muldf3'
:_fpmaxtostr.c:(.text+0x388): undefined reference to `__gedf2'
:_fpmaxtostr.c:(.text+0x430): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function
`__psfs_do_numeric':__psfs_do_numeric.c:(.text+0x51c): undefined reference
to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':strtof.c:(.text+0x1c):
undefined reference to `__extendsfdf2'
/usr/local/arm/build2202/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':libgcc2.c:(.text+0x34): undefined reference to
`__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2

Please resolve this issue.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-22-07 01:08  aysha          New Issue                                    
02-22-07 01:08  aysha          Status                   new => assigned     
02-22-07 01:08  aysha          Assigned To               => buildroot       
======================================================================
