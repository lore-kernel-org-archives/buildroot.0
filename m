From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Jun 2010 09:06:46 +0000 (UTC)
Subject: [Buildroot] [Bug 2059] New: busybox fails to link with gcc 4.4.x
Message-ID: <bug-2059-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2059

           Summary: busybox fails to link with gcc 4.4.x
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nnazarenko at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2017
  --> https://bugs.busybox.net/attachment.cgi?id=2017
busybox config file

gcc 4.4.x
uClibc 0.9.31
busybox 1.16.2

usleep support activated

--- end of build log ---

  LINK    busybox_unstripped
Trying libraries: crypt m
Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
/home/savant/devel/irz/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes
-Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections
-fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc
-falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os -Os
-pipe -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/savant/devel/irz/buildroot/output/staging/usr/include
-I/home/savant/devel/irz/buildroot/output/staging/include
--sysroot=/home/savant/devel/irz/buildroot/output/staging/ -isysroot
/home/savant/devel/irz/buildroot/output/staging
-I/home/savant/devel/irz/buildroot/output/toolchain/linux/include
-L/home/savant/devel/irz/buildroot/output/staging/lib
-L/home/savant/devel/irz/buildroot/output/staging/usr/lib
--sysroot=/home/savant/devel/irz/buildroot/output/staging/ -o
busybox_unstripped -Wl,--sort-common -Wl,--sort-section,alignment
-Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a
archival/libunarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a editors/lib.a
findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a loginutils/lib.a
mailutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a
networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a
procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sysklogd/lib.a
util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o
archival/libunarchive/built-in.o console-tools/built-in.o coreutils/built-in.o
coreutils/libcoreutils/built-in.o debianutils/built-in.o e2fsprogs/built-in.o
editors/built-in.o findutils/built-in.o init/built-in.o libbb/built-in.o
libpwdgrp/built-in.o loginutils/built-in.o mailutils/built-in.o
miscutils/built-in.o modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
printutils/built-in.o procps/built-in.o runit/built-in.o selinux/built-in.o
shell/built-in.o sysklogd/built-in.o util-linux/built-in.o
util-linux/volume_id/built-in.o -Wl,--end-group -Wl,--start-group -lcrypt -lm
-Wl,--end-group
==========
libbb/lib.a(inet_common.o): In function `INET_rresolve':
inet_common.c:(.text.INET_rresolve+0xd8): warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
libbb/lib.a(inet_common.o): In function `INET_resolve':
inet_common.c:(.text.INET_resolve+0x60): warning: gethostbyname is obsolescent,
use getnameinfo() instead.
miscutils/lib.a(chat.o): In function `chat_main':
chat.c:(.text.chat_main+0x3f4): undefined reference to `usleep'
miscutils/lib.a(watchdog.o): In function `watchdog_main':
watchdog.c:(.text.watchdog_main+0xf8): undefined reference to `usleep'
modutils/lib.a(modprobe-small.o): In function `find_alias':
modprobe-small.c:(.text.find_alias+0xe8): undefined reference to `usleep'
networking/lib.a(ifupdown.o): In function `dhcp_down':
ifupdown.c:(.text.dhcp_down+0x24): undefined reference to `usleep'
networking/lib.a(traceroute.o): In function `common_traceroute_main':
traceroute.c:(.text.common_traceroute_main+0x5fc): undefined reference to
`usleep'
procps/lib.a(top.o):top.c:(.text.top_main+0x16c): more undefined references to
`usleep' follow
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/home/savant/devel/irz/buildroot/output/build/busybox-1.16.2'
make: ***
[/home/savant/devel/irz/buildroot/output/build/busybox-1.16.2/busybox] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
