From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Oct 2013 06:20:40 +0000 (UTC)
Subject: [Buildroot] [Bug 6572] New: [PowerPC] Buildroot uses wrong external
 toolchain libraries for non-generic architecture variants
Message-ID: <bug-6572-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6572

           Summary: [PowerPC] Buildroot uses wrong external toolchain
                    libraries for non-generic architecture variants
           Product: buildroot
           Version: 2013.08
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aleek998 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Using Codesoucery external toolchain, and architecture variant 8548 / e500v2,
toolchain libraries are copied from powerpc-linux-gnu/libc/nof but should be
copied from powerpc-linux-gnu/libc/te500v2. 

Library powerpc-linux-gnu/libc/nof/usr/lib/libstdc++.so contains 'lwsync'
instruction which is invalid on e500v2 and causes Invalid Instruction fault for
every c++ based application.

I tested the temporaty workaround (copying te500v2 dir to nof dir) and it
solved the bug.

I suppose that this bug might involve all PowerPC architecture variants.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
