From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Nov 2009 23:37:11 +0000 (UTC)
Subject: [Buildroot] [Bug 699] New: Buildroot fails to copy libstdc++ to
 target when using external toolchain
Message-ID: <bug-699-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=699

              Host: x86
            Target: arm926t
           Summary: Buildroot fails to copy libstdc++ to target when using
                    external toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: maksim.rayskiy at conexant.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When buildroot builds arm-linux-uclibcgnueabi toolchain, some libraries get
installed into <sysroot>/lib, others - including libstdc++ - into
<sysroot>/usr/arm-linux-uclibcgnueabi/lib. 
If I use such a toolchain as an external toolchain for another buildroot build,
buildroot does not find libraries in <sysroot>/usr/arm-linux-uclibcgnueabi/lib.
Previous versions of buildroot used -print-file-name option of gcc to locate a
library. Current version only checks in <sysroot>/lib folder.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
