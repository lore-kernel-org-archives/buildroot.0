From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Mar 2010 15:38:43 +0000 (UTC)
Subject: [Buildroot] [Bug 1339] New: Busybox needs -fno-stric-aliasing to
	compile cleanly
Message-ID: <bug-1339-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1339

              Host: Gentoo Linux
            Target: Atmel ARM9
             Build: 2010.2
           Summary: Busybox needs -fno-stric-aliasing to compile cleanly
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1315)
 --> (https://bugs.busybox.net/attachment.cgi?id=1315)
Fix strick-aliasing compiler warnings

When busybox is compiled (with gcc 4.4.3), there are thousands of
compiler warnings about code that is breaking the strict aliasing
rules that must be followed if -O2 or greater optimization level is to
be used.

Adding -fno-strict-aliasing to CFLAGS fixes this problem.

Patch is attached.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
