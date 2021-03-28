From: lucavermei <lucavermei@gmail.com>
Date: Sun, 28 Mar 2021 12:31:58 -0500 (CDT)
Subject: [Buildroot] Buildroot post-image script error
Message-ID: <1616952718209-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I am new to buildroot and I am trying to build a system for my beaglebone
black wireless.
The build exit with an error:

>>>   Executing post-image script support/scripts/genimage.sh
board/beaglebone/genimage.cfg:34: no sub-section title/index for 'config'
INFO: cmd: "mkdir -p "/home/luca/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf "/home/luca/buildroot/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p "/home/luca/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a "/tmp/tmp.PeR17MSHjT"
"/home/luca/buildroot/output/build/genimage.tmp/root"" (stderr):
INFO: cmd: "find '/home/luca/buildroot/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.PeR17MSHjT/{}'
'/home/luca/buildroot/output/build/genimage.tmp/root/{}'" (stderr):
ERROR: file(am335x-evm.dtb):
stat(/home/luca/buildroot/output/images/am335x-evm.dtb) failed: No such file
or directory
ERROR: vfat(boot.vfat): could not setup am335x-evm.dtb
make[1]: *** [Makefile:836: target-post-image] Error 1
make: *** [Makefile:84: _all] Error 2

In my config I set the option build a device tree blob and In-tree device
tree source file names "am335x-boneblack-wireless"
If a do ls in /buildroot/output/images I get:
am335x-boneblack-wireless.dtb  MLO  rootfs.tar  u-boot.img  uEnv.txt  zImage

How can I fix the problem with the post image script?





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
