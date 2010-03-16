From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 20:32:41 +0000 (UTC)
Subject: [Buildroot] [Bug 1327] New: mtd-utils compile failure due to lack
 of --sysroot in CFLAGS
Message-ID: <bug-1327-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1327

              Host: Gentoo Linux
            Target: Atmel ARM9
             Build: 2010.2
           Summary: mtd-utils compile failure due to lack of --sysroot in
                    CFLAGS
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


After updating from a Decmeber git snapshot to 2010, mtd-utils stopped
building.  Compiles were failing because the compiler couldn't find
include files such as stdint.h.  Examination of the build log revealed
that buildroot's mtd util's make file was passing proper target LDFLAGS
but wasn't passing target CFLAGS.

Thus there was no --sysroot option being passed to gcc, and it couldn't
find its include files.

The attached patch fixes the problem by passing the appropriate CFLAGS
values to make.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
