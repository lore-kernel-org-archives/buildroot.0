From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Feb 2018 20:01:08 +0000
Subject: [Buildroot] [Bug 10786] New: Linux fails to build unless make
 linux-menuconfig is run first
Message-ID: <bug-10786-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10786

            Bug ID: 10786
           Summary: Linux fails to build unless make linux-menuconfig is
                    run first
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

Created attachment 7476
  --> https://bugs.busybox.net/attachment.cgi?id=7476&action=edit
defconfig

When selecting BR2_TARGET_ROOTFS_ISO9660 and BR2_TARGET_SYSLINUX_ISOLINUX,
Linux fails to build until "make linux-menuconfig" is run. It would seem that
the kernel is expecting output/images/rootfs.cpio to exist, but it does not
unless linux-menuconfig is run.

Once linux-menuconfig has been run once, the problem disappears until I rm -rf
everything in output/images. Then running linux-menuconfig again solves the
issue. 

Obviously the workaround is to run linux-menuconfig, but trying to build in a
freshly checked out copy of our repo always fails.


A branch of our repo that is identical except it does not have
BR2_TARGET_ROOTFS_ISO9660 and BR2_TARGET_SYSLINUX_ISOLINUX set does not see
this issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
