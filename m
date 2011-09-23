From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 14:52:19 +0000 (UTC)
Subject: [Buildroot] [Bug 4249] New: uClibc and libpthread
Message-ID: <bug-4249-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4249

           Summary: uClibc and libpthread
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bachmann at tofwerk.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I compiled a new rootfs for my SAM9-L9260-Board from Olimex.
I used the buildroot-2011.08, with uClibc-0.9.32.

The compiling worked just fine, but when i try to compile my own program on the
Target it failes.

Here the situation which lead to the bug:
My compile command:

g++ -g /TPSController.cpp -llua -ldl -lpthread -o /TPSController

My compile output:

/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libc.a(sigprocmask.os):
In function `sigprocmask':
sigprocmask.c:(.text+0x0): multiple definition of `sigprocmask'
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libpthread.a(pt-sigprocmask.os):pt-sigprocmask.c:(.text+0x0):
first defined here
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libc.a(sigaction.os):
In function `__libc_sigaction':
sigaction.c:(.text+0x0): multiple definition of `__libc_sigaction'
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libpthread.a(pt-sigaction.os):pt-sigaction.c:(.text+0x0):
first defined here
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libc.a(sigaction.os):
In function `sigaction':
sigaction.c:(.text+0x84): multiple definition of `__sigaction'
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../libpthread.a(pt-sigaction.os):pt-sigaction.c:(.text+0x84):
first defined here
collect2: ld returned 1 exit status


I've got the same fault even if i try the different thread implementation that
uClibc has. I thought that the NPTL should be fixed in the uClibc-0.9.32

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
