From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 23:49:59 +0000 (UTC)
Subject: [Buildroot] [Bug 1171] New: Linuxthreads new cannot find sysdep.h
Message-ID: <bug-1171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1171

              Host: i686-pc-linux-gnu
            Target: i686-pc-linux-uclibc
             Build: i686-pc-linux-uclibc
           Summary: Linuxthreads new cannot find sysdep.h
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Making with Linuxthreads new comes up with this error:

/usr/bin/make -j1 -C /home/dan/xenon/buildroot/output/toolchain/uClibc-0.9.30.2
\
                ARCH="i386" \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
make[1]: Entering directory
`/home/dan/xenon/buildroot/output/toolchain/uClibc-0.9.30.2'
  CC ldso/ldso/ldso.oS
In file included from
./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
                 from ./libpthread/linuxthreads/sysdeps/i386/pt-machine.h:24,
                 from ./libpthread/linuxthreads/sysdeps/i386/tls.h:23,
                 from ./include/bits/uClibc_errno.h:35,
                 from ./include/errno.h:62,
                 from ./include/bits/syscalls.h:14,
                 from ./include/sys/syscall.h:34,
                 from ./ldso/ldso/i386/dl-syscalls.h:3,
                 from ./ldso/include/dl-syscall.h:12,
                 from ./ldso/include/ldso.h:37,
                 from ldso/ldso/ldso.c:33:
./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error: sysdep.h:
No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/dan/xenon/buildroot/output/toolchain/uClibc-0.9.30.2'
make: ***
[/home/dan/xenon/buildroot/output/toolchain/uClibc-0.9.30.2/lib/libc.a] Error 2


Replacing sysdep.h with sys/syscall.h seems to work, as per
http://old.nabble.com/-Bug-153--New:-not-able-to-build-buildroot-td22372229.html

This still hasn't been updated in the git tree however, or fixed any other way.
I am still getting this in 02/2010.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
