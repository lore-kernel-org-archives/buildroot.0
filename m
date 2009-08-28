From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Aug 2009 08:59:50 +0000 (UTC)
Subject: [Buildroot] [Bug 583] New: build fails with external x86_64
	toolchain
Message-ID: <bug-583-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=583

           Summary: build fails with external x86_64 toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: is at eseco.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


buildroot 2009.08-rc3

./toolchain/external-toolchain/ext-tool.mk

checks if 'lib/ld-linux.so.*' is present in the toolchain's sysroot. This is
fine for x86 system, but this check fails for x86_64 systems and crosstool-ng
toolchains.

Here you have 'lib/ld-linux-x86-64.so.2 -> ld-2.9.so'.

The check could/should be modified to 'lib/ld-linux*.so.*'


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
