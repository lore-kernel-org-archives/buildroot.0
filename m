From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Aug 2011 17:06:44 +0000 (UTC)
Subject: [Buildroot] [Bug 4039] New: libssp.so missing from target
Message-ID: <bug-4039-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4039

           Summary: libssp.so missing from target
           Product: buildroot
           Version: unspecified
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


ext-tool.mk isn't copying libssp.so from the toolchain to the target.

When I build a system using an external crostool-ng/uClibc toolchain, ssh won't
work because libssp.so is missing from the target:

 # ssh
 ssh: can't load library 'libssp.so.0'

In the past, to get a working system, I've had to tweak ext-tool.mk to copy
some additional libraries (including libssp) from the toolchain to the target. 
It's probably time to actually try to get ext-tool.mk fixed instead of
continuing to tweak it locally. :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
