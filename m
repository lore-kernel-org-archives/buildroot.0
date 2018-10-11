From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Oct 2018 21:35:41 +0000
Subject: [Buildroot] [Bug 11396] New: uboot environment image checksum
 invalid if target is big endian
Message-ID: <bug-11396-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11396

            Bug ID: 11396
           Summary: uboot environment image checksum invalid if target is
                    big endian
           Product: buildroot
           Version: 2018.05.2
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jwittrock at faultrecorder.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7811
  --> https://bugs.busybox.net/attachment.cgi?id=7811&action=edit
patch to fix

If the target architecture is Big endian, building a u-boot environment image
is creating an image with an invalid checksum.

The problem is caused by buildroot/boot/uboot/uboot.mk testing $(BR2_ENDIAN)
for a value of BIG instead of quoted "BIG".

patch to fix is attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
