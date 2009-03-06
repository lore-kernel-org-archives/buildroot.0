From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Mar 2009 13:14:27 +0000 (UTC)
Subject: [Buildroot] [Bug 153] New: not able to build buildroot
Message-ID: <bug-153-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=153

           Summary: not able to build buildroot
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ruben at puettmann.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=113)
 --> (https://bugs.busybox.net/attachment.cgi?id=113)
Config for Buildroot

hy,

I have tried building my buildroot and I got only this compile error:

  STRIP -x -R .note -R .comment lib/libutil.a
  LD libutil-0.9.30.so
  CC libpthread/linuxthreads/sysdeps/x86_64/pspinlock.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/fork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/register-atfork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/unregister-atfork.oS
  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS
In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:
./libpthread/linuxthreads/sysdeps/unix/sysv/linux/x86_64/sysdep-cancel.h:20:20:
error: sysdep.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS] Error 1
make[1]: Leaving directory
`/root/buildroot-2009.02/toolchain_build_x86_64/uClibc-0.9.30'
make: ***
[/root/buildroot-2009.02/toolchain_build_x86_64/uClibc-0.9.30/lib/libc.a] Error
2


System: 
 Linux app0 2.6.27.8 #1 SMP Tue Dec 9 19:27:54 CET 2008 x86_64 GNU/Linux
 Debian Testing

Also: 
root at app0:[~/buildroot-2009.02] > find . -name 'sysdep.h'
./toolchain_build_x86_64/uClibc-0.9.30/libc/string/ia64/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/string/mips/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/sysdeps/linux/cris/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/sysdeps/linux/xtensa/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/sysdeps/linux/ia64/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/sysdeps/linux/bfin/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libc/sysdeps/linux/powerpc/bits/sysdep.h
./toolchain_build_x86_64/uClibc-0.9.30/libpthread/linuxthreads/sysdeps/arm/sysdep.h
./toolchain_build_x86_64/binutils-2.19/opcodes/sysdep.h
./toolchain_build_x86_64/binutils-2.19/ld/sysdep.h
./toolchain_build_x86_64/binutils-2.19/bfd/sysdep.h
./toolchain_build_x86_64/binutils-2.19/binutils/sysdep.h
root at app0:[~/buildroot-2009.02] > 



I have attached teh .config.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
