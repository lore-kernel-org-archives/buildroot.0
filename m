From: Vince <hsienwen@gmail.com>
Date: Wed, 25 Feb 2009 11:28:35 +0800
Subject: [Buildroot] libpthread compile error
Message-ID: <b8bde6ca0902241928w5ca0e73dl4abc290ff7a7cfb0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I try to enable NPTL (uClibc 0.9.30) on my MIPS target but can not build
successfully.

Here is the log:
  STRIP -x -R .note -R .comment lib/libutil.a
  LD libutil-0.9.30.so
  CC libpthread/linuxthreads/sysdeps/mips/pspinlock.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/fork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/register-atfork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/unregister-atfork.oS
  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS
In file included from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:
./libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/sysdep-cancel.h:20:20:
error: sysdep.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS] Error 1
make[1]: Leaving directory
`/opt/project/develop/buildroot/toolchain_build_mips/uClibc-0.9.30'
make: ***
[/opt/project/develop/buildroot/toolchain_build_mips/uClibc-0.9.30/lib/libc.a]
Error 2

It seems the compiler can't find sysdep.h. Any one has ideas about this
error?

Thanks!
Vince
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090225/69a2e79c/attachment.htm>
