From: brm <brm@hyac.in.th>
Date: Sat, 14 Jul 2007 07:23:24 +0700
Subject: [Buildroot] error: redifinition of 'msync'
Message-ID: <a512d1250707131723g62cd3685l4dec17e7934eddd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

        I tried to build toolchain for ARM7TDMI using buildroot, and found
this error message
        "redefinition of 'msync'" twice.

>  CC libc/sysdeps/linux/common/msync.os
> libc/sysdeps/linux/common/msync.c:20: error: redefinition of 'msync'
> ./include/sys/mman.h:97: error: previous definition of 'msync' was here
> make[1]: *** [libc/sysdeps/linux/common/msync.os] Error 1

       I try comment out the definition of msync in mman.h but it surely not
the right solution.
       So, I have to comment out from msync.c and another place at

       libpthread/linuxthreads.old/wrapsyscall.c

       instead. Still, at the moment, I cannot build the toolchain because
other problems.
       But, let solve it one by one, anybody has any suggestion for solving
this problem?
       Please.

-- brm --
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070714/af8233ae/attachment.htm 
