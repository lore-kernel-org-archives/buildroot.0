From: Paulo Matos <pmatos@igalia.com>
Date: Mon, 20 Jan 2020 15:19:51 +0100
Subject: [Buildroot] Problem generating rootfs for ci20 defconfig
Message-ID: <87muaimcqg.fsf@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While trying to generate an image using the ci20_defconfig (on
git 84d471a0b1) with a few
extra libraries added I am getting the following error:

>>>   Executing post-image script support/scripts/genimage.sh
INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
INFO: cmd: "rm -rf "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"/*" (stderr):
INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
INFO: cmd: "cp -a "/tmp/tmp.ymKkcnSKic" "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root"" (stderr):
INFO: cmd: "find '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root' -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r '/tmp/tmp.ymKkcnSKic/{}' '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root/{}'" (stderr):
ERROR: hdimage(sdcard.img): part rootfs size (62914560) too small for rootfs.ext4 (134217728)
make[1]: *** [Makefile:808: target-post-image] Error 1

Does anybody understand what this part rootfs size refers to? The
rootfs.ext4 size if the 128M I set as BR2_TARGET_ROOTFS_EXT2_SIZE but
unsure what the other number is, or what it means.

Kind regards,

Paulo Matos
