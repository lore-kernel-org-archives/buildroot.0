From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Mar 2010 20:25:47 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] New: Buildroot fails to account for "nof"
 subdirectory (no floating point)
Message-ID: <bug-1225-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225

           Summary: Buildroot fails to account for "nof" subdirectory (no
                    floating point)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gnemesure at avtec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am using buildroot-2010.2 to target a 440GP processor with no hardware
floating point.

When software floating point is enabled (BR2_SOFT_FLOAT), the gcc build puts
libgcc_s.so, libstdc++.so, etc. in an "nof" subdirectory that buildroot is not
accommodating. These are deposited in

   $(STAGING_DIR)/usr/powerpc-linux-uclibc/lib/nof

but the toolchain/gcc/gcc-uclibc-4.x.mk makefile tries to copy these files from

   $(STAGING_DIR)/usr/powerpc-linux-uclibc/lib

which results in failure to copy the libraries to the target filesystem.

This is with GCC 4.3.4. I'm not sure if this applies to other versions as well.

As a workaround, I think I can enable floating point in the kernel, and then
enable hardware floating point in the toolchain.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
