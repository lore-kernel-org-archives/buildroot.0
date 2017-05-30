From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 12:09:44 +0000
Subject: [Buildroot] [Bug 9906] New: genimage: Disk full
Message-ID: <bug-9906-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9906

            Bug ID: 9906
           Summary: genimage: Disk full
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: Alexander.Klauer at itwm.fraunhofer.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

>>>   Executing post-image script board/raspberrypi3-64/post-image.sh
vfat(boot.vfat): adding file 'bcm2710-rpi-3-b.dtb' as 'bcm2710-rpi-3-b.dtb' ...
vfat(boot.vfat): adding file 'bcm2837-rpi-3-b.dtb' as 'bcm2837-rpi-3-b.dtb' ...
vfat(boot.vfat): adding file 'rpi-firmware/bootcode.bin' as
'rpi-firmware/bootcode.bin' ...
vfat(boot.vfat): adding file 'rpi-firmware/cmdline.txt' as
'rpi-firmware/cmdline.txt' ...
vfat(boot.vfat): adding file 'rpi-firmware/config.txt' as
'rpi-firmware/config.txt' ...
vfat(boot.vfat): adding file 'rpi-firmware/fixup.dat' as
'rpi-firmware/fixup.dat' ...
vfat(boot.vfat): adding file 'rpi-firmware/start.elf' as
'rpi-firmware/start.elf' ...
vfat(boot.vfat): adding file 'Image' as 'Image' ...
Disk full
vfat(boot.vfat): failed to generate boot.vfat
make[1]: *** [target-post-image] Error 1
make: *** [_all] Error 2

This little patch helps:

--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
       "Image"
     }
   }
-  size = 32M
+  size = 64M
 }

 image sdcard.img {

-- 
You are receiving this mail because:
You are on the CC list for the bug.
