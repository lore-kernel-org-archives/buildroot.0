From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 May 2019 07:41:34 +0000
Subject: [Buildroot] [Bug 11861] New: Syslinux EFI binaries are broken on
 2019.05-rc1 (binutils >= 2.31)
Message-ID: <bug-11861-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11861

            Bug ID: 11861
           Summary: Syslinux EFI binaries are broken on 2019.05-rc1
                    (binutils >= 2.31)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sam at gpsm.co.uk
                CC: buildroot at uclibc.org
  Target Milestone: ---

Binutils >= 2.31 writes two PT_LOAD segements by default. This
is not supported by the wrapper.c script used to convert the shared
object into an elf binary.

Refs:

https://wiki.syslinux.org/wiki/index.php?title=Building
https://www.syslinux.org/archives/2018-August/026167.html
https://salsa.debian.org/images-team/syslinux/commit/012e1dd312eb8c1f9a52239966e0be0169d7af98

-- 
You are receiving this mail because:
You are on the CC list for the bug.
