From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Aug 2016 14:03:01 +0000
Subject: [Buildroot] [Bug 9166] New: Missing overlays directory in VFAT
 image for raspberry pi 3
Message-ID: <bug-9166-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9166

            Bug ID: 9166
           Summary: Missing overlays directory in VFAT image for raspberry
                    pi 3
           Product: buildroot
           Version: 2016.05
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: diez.roggisch at ableton.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When running a raspberry pi 3 buildroot, dtoverlay-parameters (e.g. 
dtoverlay=pi3-disable-bt) don't work, because the VFAT image doesn't contain
the overlays-subdirectory.

The following patch fixes this.

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg
b/board/raspberrypi/genimage-raspberrypi3.cfg
index 7ba89c5..baab0c4 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
       "kernel-marked/zImage"
     }
   }

-- 
You are receiving this mail because:
You are on the CC list for the bug.
