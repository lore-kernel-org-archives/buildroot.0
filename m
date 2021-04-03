From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Apr 2021 20:54:04 +0000
Subject: [Buildroot] [Bug 13721] New: c-stack.c:55:26: error: missing binary
 operator before token "("
Message-ID: <bug-13721-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13721

            Bug ID: 13721
           Summary: c-stack.c:55:26: error: missing binary operator before
                    token "("
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stsp2 at yandex.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Tried to compile buildroot from git:
$ make pc_x86_64_efi_defconfig
$ make -j 9

>>> host-m4 1.4.18 Building
PATH="/home/stas/src/fdpp/buildroot/output/host/bin:/home/stas/src/fdpp/buildroot/output/host/sbin:/home/stas/.local/bin:/home/stas/.local/bin:/home/stas/.local/bin:/usr/lib64/qt-3.3/bin:/usr/share/Modules/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/stas/bin"
PKG_CONFIG="/home/stas/src/fdpp/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/stas/src/fdpp/buildroot/output/host/lib/pkgconfig:/home/stas/src/fdpp/buildroot/output/host/share/pkgconfig"
 /usr/bin/make -j9  -C
/home/stas/src/fdpp/buildroot/output/build/host-m4-1.4.18/
/usr/bin/make  all-recursive
Making all in .
make[4]: Nothing to be done for 'all-am'.
Making all in examples
make[4]: Nothing to be done for 'all'.
Making all in lib
/usr/bin/make  all-am
  CC       c-stack.o
  CC       execute.o
  CC       fd-safer-flag.o
  CC       fatal-signal.o
  CC       exitfail.o
  CC       fd-hook.o
  CC       filenamecat.o
  CC       stripslash.o
  CC       dup-safer-flag.o
  CC       filenamecat-lgpl.o
In file included from /usr/include/signal.h:315,
                 from ./signal.h:52,
                 from c-stack.c:49:
c-stack.c:55:26: error: missing binary operator before token "("
   55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
      |                          ^~~~~~~~
c-stack.c:134:8: error: variably modified 'buffer'@file scope
  134 |   char buffer[SIGSTKSZ];

-- 
You are receiving this mail because:
You are on the CC list for the bug.
