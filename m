From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Aug 2019 07:37:46 +0000
Subject: [Buildroot] [Bug 12156] New: buildroot-2019.08-rc3 does not build
 for Pi Zero W
Message-ID: <bug-12156-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12156

            Bug ID: 12156
           Summary: buildroot-2019.08-rc3 does not build for Pi Zero W
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When trying to build a Pi Zero W image with the latest release candidate, build
stops when trying to install the DTB file for the Pi Zero:

>>>   Executing post-image script board/raspberrypi0w/post-image.sh
INFO: cmd: "mkdir -p
"/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp"" (stderr):
INFO: cmd: "rm -rf
"/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp"/*" (stderr):
INFO: cmd: "mkdir -p
"/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp"" (stderr):
INFO: cmd: "cp -a "/home/matuschd/buildroot-2019.08-rc3/output/target"
"/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp/root""
(stderr):
INFO: cmd: "find
'/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp/root' -depth
-type d -printf '%P\0' | xargs -0 -I {} touch -r
'/home/matuschd/buildroot-2019.08-rc3/output/target/{}'
'/home/matuschd/buildroot-2019.08-rc3/output/build/genimage.tmp/root/{}'"
(stderr):
ERROR: file(bcm2708-rpi-zero-w.dtb):
stat(/home/matuschd/buildroot-2019.08-rc3/output/images/bcm2708-rpi-zero-w.dtb)
failed: No such file or directory
ERROR: vfat(boot.vfat): could not setup bcm2708-rpi-zero-w.dtb
Makefile:812: recipe for target 'target-post-image' failed
make[1]: *** [target-post-image] Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Seems to me that the filename should be bcm2708-rpi-0-w.dtb instead of
bcm2708-rpi-zero-w.dtb

Commands to reproduce the error:

make raspberrypi0w_defconfig
make

-- 
You are receiving this mail because:
You are on the CC list for the bug.
