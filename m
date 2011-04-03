From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  3 Apr 2011 23:19:57 +0000 (UTC)
Subject: [Buildroot] [Bug 3541] New: Quotes in the top Makefile:217 break
 buildroot/kernel config build under cygwin
Message-ID: <bug-3541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3541

           Summary: Quotes in the top Makefile:217 break buildroot/kernel
                    config build under cygwin
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: os-bugs-qztrsta-uclibc at os-propo.info
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Quotes in the top Makefile:217 break buildroot/kernel config build under
cygwin:

HOST_LOADLIBES="-lcurses -lintl"

This results, for instance, in the following command line:

/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
-DKBUILD_NO_NLS
 -I/cygdrive/c/Work/buildroot/buildroot-2011.02/output/build/buildroot-config

/cygdrive/c/Work/buildroot/buildroot-2011.02/output/build/buildroot-config/conf.o

/cygdrive/c/Work/buildroot/buildroot-2011.02/output/build/buildroot-config/zconf.tab.o
 "-lcurses -lintl"
 -o
/cygdrive/c/Work/buildroot/buildroot-2011.02/output/build/buildroot-config/conf

And "-lcurses -lintl not found" error.

Fix: remove quotes:

HOST_LOADLIBES=-lcurses -lintl

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
