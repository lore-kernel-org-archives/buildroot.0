From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Jun 2010 14:47:03 +0000 (UTC)
Subject: [Buildroot] [Bug 2149] New: xterm build failure
Message-ID: <bug-2149-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2149

           Summary: xterm build failure
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jsteckli at os.inf.tu-dresden.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2131
  --> https://bugs.busybox.net/attachment.cgi?id=2131
Config that triggers the problem.

Building xterm on git HEAD fails with the following error:

/bin/sh ./plink.sh
/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=core2 -march=core2 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/include
-I/home/julian/src/linux-dev/buildroot-xorg/output/staging/include
--sysroot=/home/julian/src/linux-dev/buildroot-xorg/output/staging/ -isysroot
/home/julian/src/linux-dev/buildroot-xorg/output/staging -Os -pipe -Os 
-mtune=core2 -march=core2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/include
-I/home/julian/src/linux-dev/buildroot-xorg/output/staging/include
--sysroot=/home/julian/src/linux-dev/buildroot-xorg/output/staging/ -isysroot
/home/julian/src/linux-dev/buildroot-xorg/output/staging 
-L/home/julian/src/linux-dev/buildroot-xorg/output/staging/lib
-L/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/lib
--sysroot=/home/julian/src/linux-dev/buildroot-xorg/output/staging/ -o xterm
button.o cachedGCs.o charproc.o charsets.o cursor.o data.o doublechr.o
fontutils.o input.o linedata.o main.o menu.o misc.o print.o ptydata.o
scrollback.o screen.o scrollbar.o tabs.o util.o xstrings.o xtermcap.o
VTPrsTbl.o TekPrsTbl.o Tekproc.o -lXft -lXrender -lfontconfig -lfreetype -lX11
-lXaw7 -lXmu -lXt -lX11 -lSM -lICE -lXt -lX11 -lSM -lICE -lncurses 
testing if -lXmu is needed
testing if -lXft is needed
testing if -lXt is needed
testing if -lX11 is needed
...yes
testing if -lXrender is needed
testing if -lSM is needed
testing if -lICE is needed
...yes
testing if -lfontconfig is needed
testing if -lXt is needed
testing if -lX11 is needed
...yes
testing if -lfreetype is needed
testing if -lSM is needed
testing if -lICE is needed
testing if -lncurses is needed
...yes
testing if -lX11 is needed
...yes
testing if -lXaw7 is needed
...yes
testing if -lXmu is needed
...yes
testing if -lXt is needed
...yes
testing if -lX11 is needed
...yes
testing if -lSM is needed
...yes
testing if -lICE is needed
...yes
testing if -lXt is needed
...yes
testing if -lX11 is needed
...yes
testing if -lSM is needed
...yes
testing if -lICE is needed
...yes
testing if -lncurses is needed
...yes
/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/lib/libICE.so:
warning: gethostbyaddr is obsolescent, use getaddrinfo() instead.
/home/julian/src/linux-dev/buildroot-xorg/output/staging/usr/lib/libXmu.so:
warning: gethostbyname is obsolescent, use getnameinfo() instead.
main.o: In function `get_pty':
main.c:(.text+0xa58): undefined reference to `getpt'
collect2: ld returned 1 exit status
make[1]: *** [xterm] Error 1
make[1]: Leaving directory
`/home/julian/src/linux-dev/buildroot-xorg/output/build/xterm-259'
make: ***
[/home/julian/src/linux-dev/buildroot-xorg/output/build/xterm-259/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
