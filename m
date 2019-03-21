From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 21 Mar 2019 21:08:42 +0100
Subject: [Buildroot] make log messages with buildroot 2019.02
Message-ID: <CALtfCQZXsSWLFNSxii9JF0Bixt0tcu_iRScVRRzfLsiEmHUf9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,


I am checking buildroot-2019.2 with raspberrypi3_defconfig and I've
noticed something a little bit weirdo after the execution of the
script: post-imagesh:

--->
...
Writing superblocks and filesystem accounting information: done

ln -sf rootfs.ext2
/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rootfs.ext4
>>>   Executing post-image script board/raspberrypi3/post-image.sh
INFO: cmd: "mkdir -p
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images""
(stderr):
INFO: cmd: "mkdir -p
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/target"
"/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/build/genimage.tmp/root""
(stderr):
INFO: vfat(boot.vfat): cmd: "dd if=/dev/zero
of="/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat"
seek=33554432 count=0 bs=1 2>/dev/null" (stderr):
INFO: vfat(boot.vfat): cmd: "mkdosfs
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'"
(stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-3-b.dtb' as
'bcm2710-rpi-3-b.dtb' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/bcm2710-rpi-3-b.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-3-b-plus.dtb' as
'bcm2710-rpi-3-b-plus.dtb' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/bcm2710-rpi-3-b-plus.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'bcm2710-rpi-cm3.dtb' as
'bcm2710-rpi-cm3.dtb' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/bcm2710-rpi-cm3.dtb'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/bootcode.bin' as
'rpi-firmware/bootcode.bin' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/bootcode.bin'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/cmdline.txt' as
'rpi-firmware/cmdline.txt' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/cmdline.txt'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/config.txt' as
'rpi-firmware/config.txt' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/config.txt'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/fixup.dat' as
'rpi-firmware/fixup.dat' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/fixup.dat'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/start.elf' as
'rpi-firmware/start.elf' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/start.elf'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/overlays' as
'rpi-firmware/overlays' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rpi-firmware/overlays'
'::'" (stderr):
INFO: vfat(boot.vfat): adding file 'zImage' as 'zImage' ...
INFO: vfat(boot.vfat): cmd: "mcopy -bsp -i
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/boot.vfat'
'/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/zImage'
'::'" (stderr):
INFO: hdimage(sdcard.img): adding partition 'boot' (in MBR) from 'boot.vfat' ...
INFO: hdimage(sdcard.img): adding partition 'rootfs' (in MBR) from
'rootfs.ext4' ...
INFO: hdimage(sdcard.img): writing MBR
--->

It seems to be that appear this text: "  (stderr):"  that in my
personal view it seems a bit confusing, What do you think?

In the buildroot-2018-02.5 the log was like that, much more clear:

--->
...
Writing superblocks and filesystem accounting information: done

ln -sf rootfs.ext2
/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/images/rootfs.ext4
>>>   Executing post-image script board/raspberrypi3/post-image.sh
vfat(boot.vfat): adding file 'bcm2710-rpi-3-b.dtb' as 'bcm2710-rpi-3-b.dtb' ...
vfat(boot.vfat): adding file 'bcm2710-rpi-3-b-plus.dtb' as
'bcm2710-rpi-3-b-plus.dtb' ...
vfat(boot.vfat): adding file 'bcm2710-rpi-cm3.dtb' as 'bcm2710-rpi-cm3.dtb' ...
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
vfat(boot.vfat): adding file 'rpi-firmware/overlays' as
'rpi-firmware/overlays' ...
vfat(boot.vfat): adding file 'zImage' as 'zImage' ...
hdimage(sdcard.img): adding partition 'boot' (in MBR) from 'boot.vfat' ...
hdimage(sdcard.img): adding partition 'rootfs' (in MBR) from 'rootfs.ext4' ...
hdimage(sdcard.img): writing MBR
--->


Best regards.


?scar G?mez Fuente.
TST
