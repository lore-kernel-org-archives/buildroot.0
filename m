From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 07:26:51 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-Lfef7Qayhl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #4 from Marie Maurer <marie.maurer@mmeacs.de> ---
(In reply to Marie Maurer from comment #3)

Wrong log output in previous comment, sorry!

Here is the right one:

>>>   Executing post-image script board/raspberrypi3/post-image.sh
board/raspberrypi3/genimage-raspberrypi3.cfg:34: no sub-section title/index for
'config'
INFO: cmd: "mkdir -p
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a "/tmp/tmp.gpxMoEOrt8"
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp/root""
(stderr):
INFO: cmd: "find
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.gpxMoEOrt8/{}'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp/root/{}'"
(stderr):
INFO: cmd: "mkdir -p
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images""
(stderr):
INFO: vfat(boot.vfat): cmd: "dd if=/dev/zero
of="/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat"
seek=33554432 count=0 bs=1 2>/dev/null" (stderr):
INFO: vfat(boot.vfat): cmd: "mkdosfs  
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'"
(stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-3-b.dtb' as
'bcm2710-rpi-3-b.dtb' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/bcm2710-rpi-3-b.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-3-b-plus.dtb' as
'bcm2710-rpi-3-b-plus.dtb' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/bcm2710-rpi-3-b-plus.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-cm3.dtb' as
'bcm2710-rpi-cm3.dtb' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/bcm2710-rpi-cm3.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/bootcode.bin' as
'rpi-firmware/bootcode.bin' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/bootcode.bin'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/cmdline.txt' as
'rpi-firmware/cmdline.txt' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/cmdline.txt'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/config.txt' as
'rpi-firmware/config.txt' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/config.txt'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/fixup.dat' as
'rpi-firmware/fixup.dat' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/fixup.dat'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/start.elf' as
'rpi-firmware/start.elf' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/start.elf'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/overlays' as
'rpi-firmware/overlays' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rpi-firmware/overlays'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'zImage' as 'zImage' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat'
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/zImage'
'::'" (stderr):
INFO: hdimage(sdcard.img): adding partition 'boot' (in MBR) from 'boot.vfat'
...
ERROR: hdimage(sdcard.img): fiemap
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/boot.vfat:
25 Inappropriate ioctl for device
ERROR: hdimage(sdcard.img): failed to write image partition 'boot'
INFO: hdimage(sdcard.img): cmd: "rm -f
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/sdcard.img""
(stderr):
ERROR: hdimage(sdcard.img): failed to generate sdcard.img
make: *** [Makefile:835: target-post-image] Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
