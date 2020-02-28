From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Fri, 28 Feb 2020 14:03:45 +0200
Subject: [Buildroot] buildroot 2019.11.1 rpi-0-w error
Message-ID: <CAPm8-H6q+gk=-rVR44L8zwL-RngM3a8YNHwxeS+Ddumi6K29FA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

  I am facing the following error in buildroot 2019.11.1
when configuring buildroot for rpi-0-w
with this settings:

make menuconfig
Kernel
    Defconfig name (bcm2835)
    In-tree Device Tree Source file names (bcm2835-rpi-zero-w)

make
>>>   Executing post-image script board/raspberrypi0w/post-image.sh
INFO: cmd: "mkdir -p
"/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf
"/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p
"/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a "/tmp/tmp.iaBv2bX7fQ"
"/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root""
(stderr):
INFO: cmd: "find
'/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.iaBv2bX7fQ/{}'
'/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root/{}'"
(stderr):
ERROR: file(bcm2708-rpi-zero-w.dtb):
stat(/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/images/bcm2708-rpi-zero-w.dtb)
failed: No such file or directory
ERROR: vfat(boot.vfat): could not setup bcm2708-rpi-zero-w.dtb

  If I rename bcm2835-rpi-zero-w.dtb to bcm2708-rpi-zero-w.dtb in output/images,
the build succeeds but linux does not boot.

  Any ideas?

Thanks
