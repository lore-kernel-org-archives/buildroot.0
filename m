From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Mar 2021 14:19:03 +0000
Subject: [Buildroot] [Bug 13621] New: Buildroot builds for i686 even though
 i486 is selected
Message-ID: <bug-13621-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13621

            Bug ID: 13621
           Summary: Buildroot builds for i686 even though i486 is selected
           Product: buildroot
           Version: 2021.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: moelzerjens at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8801
  --> https://bugs.busybox.net/attachment.cgi?id=8801&action=edit
defconfig

Selecting i486 as target architecture variant results in a kernel that's built
for i686.

Steps to reproduce:

Build a image with the attached minimal defconfig and run `qemu-system-i386
-nographic -cpu 486 -kernel output/images/bzImage` results in `This kernel
requires an i686 CPU, but only detected an i486 CPU.`.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
