From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Jun 2020 10:04:37 +0000
Subject: [Buildroot] [Bug 13026] New: rpi-firmware: must not rename start
 files
Message-ID: <bug-13026-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13026

            Bug ID: 13026
           Summary: rpi-firmware: must not rename start files
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sveyret at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When booting, a Raspberry Pi will load the appropriate start files, depending
on the provided configuration. For example, if the config.txt file contains:
gpu_mem=16
the board will automatically load the cut-down startup files (start_cd.elf and
fixup_cd.dat on non-Rpi4). Unfortunately, even when the appropriate version is
selected in the configuration menu (in this example,
BR2_PACKAGE_RPI_FIRMWARE_BOOT="_cd") if the rpi-firmware makefile takes the
good files, it renames them to non-qualified, i.e. start.elf and fixup.dat. But
as these are not the files searched by the Raspberry Pi, the board will not
start.
I will provide a patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
