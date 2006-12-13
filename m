From: Alex Song <songqf9@yahoo.ca>
Date: Wed, 13 Dec 2006 11:16:52 -0500 (EST)
Subject: [Buildroot]  support for SuperH
Message-ID: <98746.66357.qm@web50012.mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Looks like buildroot supports SuperH, but I got
several errors when trying to use it.

1. When I select sh3, it tries to install the kernel
headers by "make ARCH=sh3 ...". But kernel only has
arch sh. I changed top level Config.in and made this
pass. 

2. Then duing building, it complains

make[1]: Entering directory
`/root/lab/buildroot-sh/buildroot/toolchain_build_sh/uClibc'
  CC libc/sysdeps/linux/sh/syscall.os
libc/sysdeps/linux/sh/syscall.c:11: error: conflicting
types for 'syscall'
./include/unistd.h:1014: error: previous declaration
of 'syscall' was here
make[2]: *** [libc/sysdeps/linux/sh/syscall.os] Error
1

   The syscall.c has 
long syscall(long sysnum,
             long arg1, long arg2, long arg3,
             long arg4, long arg5, long arg6)

   while unistd.h has 

extern long int syscall (long int __sysno, ...)
__THROW;

  Is there a fix? What is the correct way to build a
toolchain for sh?

Thanks a lot,

Alex




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
