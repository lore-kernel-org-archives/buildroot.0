From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 27 Aug 2017 19:57:48 +0800
Subject: [Buildroot] minnowboard_max_defconfig, changes to build for 32-bit,
 fails in the end when installing grub
Message-ID: <CAEUhbmW6BXHrudGz5LB4=xQYf3-3noyoUzDuryFv39_VUoP_cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I wanted to build a 32-bit rootfs for minnowboard max, so I started by:

$ make minnowboard_max_defconfig
$ make menuconfig
change "Target options" -> "Target Architecture" to i386, save and exit
$ make

It fails in the end.

mkdir -p /buildroot/output/images/
/buildroot/output/host/bin/grub-mkimage -d
/buildroot/output/host/lib/grub/i386-pc -O i386-pc -o
/buildroot/output/images/grub.img -p "(hd0,msdos1)/boot/grub"  boot
linux ext2 fat squash4 part_msdos part_gpt normal efi_gop
/buildroot/output/host/bin/grub-mkimage: error: cannot open
`/buildroot/output/host/lib/grub/i386-pc/efi_gop.mod': No such file or
directory.
package/pkg-generic.mk:308: recipe for target
'/buildroot/output/build/grub2-2.02/.stamp_target_installed' failed
make: *** [/buildroot/output/build/grub2-2.02/.stamp_target_installed] Error 1

Am I missing anything?

Regards,
Bin
