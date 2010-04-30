From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2010 14:49:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1669] New: Busybox failed to compile when using an
 external toolchain
Message-ID: <bug-1669-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1669

            Target: ARM926EJ-S
             Build: 20100415 snapshot
           Summary: Busybox failed to compile when using an external
                    toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: anthony.groyer at airliquide.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I used buildroot-20100415 and when using an external toolchain, busybox fails
to compile and complains that mtd/mtd-user.h and mtd/mtd-abi.h are missing.

I solve this issue by compiling manually:
make zlib
make lzo
make mtd
then copying the files mtd-user.h and mtd-abi.h:
mkdir staging/usr/include/mtd/
cp build/mtd-1.3.1/include/mtd/mtd-user.h staging/usr/include/mtd/
cp build/mtd-1.3.1/include/mtd/mtd-abi.h staging/usr/include/mtd/


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
