From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2020 19:08:47 +0000
Subject: [Buildroot] [Bug 13146] New: raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
Message-ID: <bug-13146-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

            Bug ID: 13146
           Summary: raspberrypi3_defconfig: "Inappropriate ioctl for
                    device" almost at end when sdcard.img is created
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: marie.maurer at mmeacs.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot 2020-08-rc1 (make raspberrypi3_defconfig)
All default settings, on Ubuntu 20.04 LTS

?

Creating regular file
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rootfs.ext2

64-bit filesystem support is not enabled.  The larger fields afforded by this
feature enable full-strength checksumming.  Pass -O 64bit to rectify.

Creating filesystem with 122880 1k blocks and 30720 inodes

Filesystem UUID: c2097238-7b0a-451c-b38f-efe1a3cb7ebc

Superblock backups stored on blocks:

        8193, 24577, 40961, 57345, 73729



Allocating group tables: done

Writing inode tables: done

Creating journal (4096 blocks): done

Copying files into the device: done

Writing superblocks and filesystem accounting information: done



ln -sf rootfs.ext2
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rootfs.ext4

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

INFO: cmd: "cp -a "/tmp/tmp.gaxNr8y31f"
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp/root""
(stderr):

INFO: cmd: "find
'/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.gaxNr8y31f/{}'
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
