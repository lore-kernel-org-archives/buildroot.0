From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Mar 2014 19:36:47 +0000 (UTC)
Subject: [Buildroot] [Bug 6986] New: Make legal-info fails on uboot versions
 before 2014.01
Message-ID: <bug-6986-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6986

           Summary: Make legal-info fails on uboot versions before 2014.01
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mstarr at hedonline.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In buildroot 2014.02, selecting U-Boot version as custom and then entering a
version before 2014.01 results in 'make legal-info' failing with the following
message:

build/uboot-2013.07/Licenses/gpl-2.0.txt: No such file or directory

This appears to be a change made in the following commit:
http://git.buildroot.net/buildroot/commit/boot/uboot/uboot.mk?id=eb9b1f50281b4e0c3363923d461d57a165e8be15

Can this be changed to look for the COPYING file at the root of the uboot
directory for versions before 2014.01 and use the new Licenses/gpl-2.0.txt for
version 2014.01 and after?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
