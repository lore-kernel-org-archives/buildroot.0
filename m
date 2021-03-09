From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Mar 2021 15:31:29 +0000
Subject: [Buildroot] [Bug 13601] New: Gen image :Iappropriate ioctl error
Message-ID: <bug-13601-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13601

            Bug ID: 13601
           Summary: Gen image :Iappropriate ioctl error
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: neerajkrishnat at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Raspberrypi 4 gen image fails just after selecting make <board_defconfig> 

make menuconfig 

make some adjustments to libraries and packages 

and just make -j4:

This is the error i get not just for raspberry pi but for any board with
genimage option 



ln -sf rootfs.ext2 /home/nirajtummala/buildroot/output/images/rootfs.ext4
>>> Executing post-image script board/raspberrypi4/post-image.sh
board/raspberrypi4/genimage-raspberrypi4.cfg:30: no sub-section title/index for
'config'
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf "/home/nirajtummala/buildroot/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a "/tmp/tmp.3rJcfQQAN8"
"/home/nirajtummala/buildroot/output/build/genimage.tmp/root"" (stderr):
INFO: cmd: "find '/home/nirajtummala/buildroot/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.3rJcfQQAN8/{}'
'/home/nirajtummala/buildroot/output/build/genimage.tmp/root/{}'" (stderr):
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/images"" (stderr):
INFO: vfat(boot.vfat): cmd: "dd if=/dev/zero
of="/home/nirajtummala/buildroot/output/images/boot.vfat" seek=67108864 count=0
bs=1 2>/dev/null" (stderr):
INFO: vfat(boot.vfat): cmd: "mkdosfs
'/home/nirajtummala/buildroot/output/images/boot.vfat'" (stderr):
INFO: vfat(boot.vfat): adding file 'zImage' as 'zImage' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/zImage' '::'" (stderr):
INFO: vfat(boot.vfat): adding file 'bcm2711-rpi-4-b.dtb' as
'bcm2711-rpi-4-b.dtb' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/bcm2711-rpi-4-b.dtb' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/cmdline.txt' as
'rpi-firmware/cmdline.txt' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/rpi-firmware/cmdline.txt' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/config.txt' as
'rpi-firmware/config.txt' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/rpi-firmware/config.txt' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/fixup.dat' as
'rpi-firmware/fixup.dat' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/rpi-firmware/fixup.dat' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/start.elf' as
'rpi-firmware/start.elf' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/rpi-firmware/start.elf' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/overlays' as
'rpi-firmware/overlays' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/nirajtummala/buildroot/output/images/boot.vfat'
'/home/nirajtummala/buildroot/output/images/rpi-firmware/overlays' '::'"
(stderr):
INFO: hdimage(sdcard.img): adding partition 'boot' (in MBR) from 'boot.vfat'
...
ERROR: hdimage(sdcard.img): fiemap
/home/nirajtummala/buildroot/output/images/boot.vfat: 25 Inappropriate ioctl
for device
ERROR: hdimage(sdcard.img): failed to write image partition 'boot'
INFO: hdimage(sdcard.img): cmd: "rm -f
"/home/nirajtummala/buildroot/output/images/sdcard.img"" (stderr):
ERROR: hdimage(sdcard.img): failed to generate sdcard.img
make: *** [Makefile:835: target-post-image] Error 1
root at NirajTummala:/home/nirajtummala/buildroot#

-- 
You are receiving this mail because:
You are on the CC list for the bug.
