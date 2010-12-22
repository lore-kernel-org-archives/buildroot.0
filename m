From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Dec 2010 23:20:23 +0000 (UTC)
Subject: [Buildroot] [Bug 3007] New: kexec doesn't build: Missing regdef.h
	file
Message-ID: <bug-3007-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3007

           Summary: kexec doesn't build:  Missing regdef.h file
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andy.kennedy at adtran.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Target is mips-32r2

kexec/arch/mips/mips-setup-simple.S:17:20: fatal error: regdef.h: No such file
or directory
compilation terminated.


Simple fix is to copy the file from
output/toolchain/uClibc-0.9.31/libc/sysdeps/linux/mips/sys/regdef.h

to:
output/build/kexec-2.0.1/kexec/arch/mips/include

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
