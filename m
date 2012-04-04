From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Apr 2012 09:15:08 +0000 (UTC)
Subject: [Buildroot] [Bug 5024] New: grub fails to build for x86_64 target
	architecture
Message-ID: <bug-5024-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5024

           Summary: grub fails to build for x86_64 target architecture
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: zkdigisec at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4232
  --> https://bugs.busybox.net/attachment.cgi?id=4232
grub autoconf log file

When buildroot is configured for x86_64 as the target architecture, grub
configuration fails with the following error message:

checking for x86_64-linux-gcc... (cached)
/home/user/Downloads/buildroot-2012.02/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc
checking for C compiler default output file name... configure: error: C
compiler cannot create executables
See `config.log' for more details.
make: ***
[/home/user/Downloads/buildroot-2012.02/output/build/grub-0.97/.stamp_configured]
Error 77

The problem seems to be that the 32-bit libraries are not available (or used)
in the 64-bit cross-compiler toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
