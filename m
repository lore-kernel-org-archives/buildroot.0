From: Maxim Grigoriev <maxim@tensilica.com>
Date: Tue, 20 Jan 2009 18:10:13 -0800
Subject: [Buildroot] Need some help with uClibc build
Message-ID: <49768405.20909@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can somebody, please, help me.

I seem to be missing something trivial like the fact that
gcc-4.3.1+ would not work with uClibc-0.9.29, or something like this.

I'm trying to build buildroot with

    binutils-2.19
    uClibc-0.9.29
    gcc-4.3.1

I managed to configure and build everything including the compiler.
But then, uClibc build did not go through :

  CC libc/sysdeps/linux/common/chdir.os
In file included from ./include/sys/param.h:22,
                 from libc/sysdeps/linux/common/chdir.c:13:
./include/limits.h:124:26: error: limits.h: No such file or directory
make[2]: *** [libc/sysdeps/linux/common/chdir.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2

I figured that using extra GCC flag "-D_GCC_LIMITS_H_" would help.
It did. But then, another problem raised up :

  CC libc/sysdeps/linux/common/nice.os
libc/sysdeps/linux/common/nice.c: In function 'int_add_no_wrap':
libc/sysdeps/linux/common/nice.c:33: error: 'INT_MIN' undeclared (first 
use in this function)
libc/sysdeps/linux/common/nice.c:33: error: (Each undeclared identifier 
is reported only once
libc/sysdeps/linux/common/nice.c:33: error: for each function it appears 
in.)
libc/sysdeps/linux/common/nice.c:35: error: 'INT_MAX' undeclared (first 
use in this function)
make[2]: *** [libc/sysdeps/linux/common/nice.os] Error 1

I guess I might be missing some trivial knowledge about how things work 
with each other.
If you can share with me this knowledge I would really appreciate it.

Thanks in advance for any of your help,

-- Maxim Grigoriev
   Tensilica Inc.
   408-566-1770

P.S. Some background on my project. Xtensa GNU/Linux is successfully 
building with
     
      binutils-2.18
      uClibc-0.9.29
      gcc-4.2.1

     with relatively recent buildroot update.

I'm trying to upgrade the compiler, which is important for our projects.
