From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 28 Jul 2013 14:32:56 +0800
Subject: [Buildroot] Build error for nptl with no-mmu (arm7tdmi)
Message-ID: <1374993176.3762.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi list,

In my config, I have
# ARCH_HAS_MMU is not set.

I got below build error (I got the same error on both buildroot-2013.05 and current git tree):

  AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/clone.os
  AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/vfork.os
  CC libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os
In file included from libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error: 'fork' undeclared here (not in a function)
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error: '__libc_fork' redeclared as different kind of symbol
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note: previous declaration of '__libc_fork' was here
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:228:1: error: 'fork' redeclared as different kind of symbol
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: note: previous declaration of 'fork' was here
libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error: '__EI_fork' aliased to undefined symbol '__GI_fork'
make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os] Error 1
make[1]: Leaving directory `/opt/test/buildroot/buildroot-2013.05/output/toolchain/uClibc-0.9.33.2'
make: *** [/opt/test/buildroot/buildroot-2013.05/output/toolchain/uClibc-0.9.33.2/lib/libc.a] Error 2

Any idea how to fix this?

Regards,
Axel
