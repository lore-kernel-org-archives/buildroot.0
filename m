From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Feb 2018 21:23:28 +0000
Subject: [Buildroot] [Bug 10796] New: Cannot generate cpio image without
 selecting CONFIG_BLK_DEV_INITRD
Message-ID: <bug-10796-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10796

            Bug ID: 10796
           Summary: Cannot generate cpio image without selecting
                    CONFIG_BLK_DEV_INITRD
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: adyke at harris.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

If BR2_TARGET_ROOTFS_CPIO is selected, the next time linux-menuconfig is run
CONFIG_BLK_DEV_INITRD becomes selected. If CONFIG_BLK_DEV_INITRD is unselected,
it is silently reselected when linux-menuconfig exits.

Therefore, it is not possible to generate rootfs.cpio without building it into
the kernel image.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
