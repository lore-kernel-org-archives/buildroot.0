From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 07:24:15 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-YG9WnNGSuZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #3 from Marie Maurer <marie.maurer@mmeacs.de> ---
I added second suggested line and called "make" again.
Now I get the following output:

>>>   Generating filesystem image rootfs.ext2
mkdir -p /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images
rm -rf
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2
mkdir -p
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2
rsync -auH --exclude=/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/target/
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target
echo '#!/bin/sh' >
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
echo "set -e" >>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
echo "chown -h -R 0:0
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target"
>>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
PATH="/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin:/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program
Files/WindowsApps/CanonicalGroupLimited.UbuntuonWindows_2004.2020.424.0_x64__79rhkp1fndgsc:/mnt/c/Program
Files (x86)/Common
Files/Oracle/Java/javapath:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program
Files/TortoiseGit/bin:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/Nordic
Semiconductor/nrf-command-line-tools/bin/:/mnt/c/Program Files
(x86)/STMicroelectronics/STM32 ST-LINK Utility/ST-LINK
Utility:/mnt/c/Users/marie.maurer/AppData/Local/Microsoft/WindowsApps:/mnt/c/util:/mnt/c/users/marie.maurer/appdata/local/programs/python/python38/Scripts:/snap/bin"
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/support/scripts/mkusers
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/full_users_table.txt
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target
>>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
echo
"/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin/makedevs
-d
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/full_devices_table.txt
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target"
>>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
printf '   \n' >>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
printf '        rm -f
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rootfs.ext2\n
     
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/sbin/mkfs.ext4
-d
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target
-r 1 -N 0 -m 5 -L "rootfs" -O ^64bit
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rootfs.ext2
"120M" || { ret=$?; echo "*** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; exit $ret; }\n' >>
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
chmod a+x
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
PATH="/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin:/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program
Files/WindowsApps/CanonicalGroupLimited.UbuntuonWindows_2004.2020.424.0_x64__79rhkp1fndgsc:/mnt/c/Program
Files (x86)/Common
Files/Oracle/Java/javapath:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program
Files/TortoiseGit/bin:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/Nordic
Semiconductor/nrf-command-line-tools/bin/:/mnt/c/Program Files
(x86)/STMicroelectronics/STM32 ST-LINK Utility/ST-LINK
Utility:/mnt/c/Users/marie.maurer/AppData/Local/Microsoft/WindowsApps:/mnt/c/util:/mnt/c/users/marie.maurer/appdata/local/programs/python/python38/Scripts:/snap/bin"
FAKEROOTDONTTRYCHOWN=1
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin/fakeroot
--
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/fakeroot
rootdir=/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/ext2/target
table='/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/buildroot-fs/full_devices_table.txt'
mke2fs 1.45.6 (20-Mar-2020)
Creating regular file
/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/images/rootfs.ext2
64-bit filesystem support is not enabled.  The larger fields afforded by this
feature enable full-strength checksumming.  Pass -O 64bit to rectify.
Creating filesystem with 122880 1k blocks and 30720 inodes
Filesystem UUID: c81809b4-af64-4851-83b9-838060850343
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
