From: Franchitti, Alexandre J (Alex) <alexandre.franchitti@windriver.com>
Date: Sat, 18 Jul 2009 22:54:27 +0200
Subject: [Buildroot] '/u-boot-2009.01/tools/mkimage': No such file or
	directory' error on recompile
Message-ID: <711BBECDEF81BA439A6038E213C1DF1406E164BF@ism-mail03.corp.ad.wrs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi all,
I first successfully cross-complied the different components (tool
chain, uboot, kernel, filesystem) for ARM using the latest buildroot.
Then, having forgotten to turn on an option in the kernel configuration
(support for NFS), I ran the 'make menuconfig ARCH=arm' for the kernel.
Then I went ahead and tried to do a 'make' at the buildroot level, but I
now get an error with mkimage.  I downloaded mkimage from the net and I
can copy it wihere it's needed but it just doesn't feel correct...Any
idea ?
 
thanks
Alex
 
 
mkdir -p
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/root/us
r/lib
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/root/us
r/sbin
touch
/folk/alexf/arm_linux/buildroot-2009.05/toolchain_build_arm/gcc-4.3.3-fi
nal/.installed
# These are in /lib, so...
rm -rf
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/root/us
r/lib/libgcc_s*.so*
cp -dpf
/folk/alexf/arm_linux/buildroot-2009.05/build_arm/staging_dir/usr/arm-li
nux-uclibc/lib/libgcc_s* \
 
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/root/li
b/
/folk/alexf/arm_linux/buildroot-2009.05/build_arm/staging_dir/usr/bin/ar
m-linux-uclibc-strip --remove-section=.comment --remove-section=.note
--strip-unneeded
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/root/li
b/libgcc_s*
mkdir -p
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/autotoo
ls-stamps
touch
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/autotoo
ls-stamps/gcc_libs_target_installed
/usr/bin/install -D
/folk/alexf/arm_linux/buildroot-2009.05/toolchain_build_arm/module-init-
tools-3.2.2/depmod
/folk/alexf/arm_linux/buildroot-2009.05/build_arm/staging_dir/bin/arm-li
nux-depmod26
cp -dpf
/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/u-boot-
2009.01/tools/mkimage
/folk/alexf/arm_linux/buildroot-2009.05/build_arm/staging_dir/usr/bin/
cp: cannot stat
`/folk/alexf/arm_linux/buildroot-2009.05/project_build_arm/uclibc/u-boot
-2009.01/tools/mkimage': No such file or directory
make: ***
[/folk/alexf/arm_linux/buildroot-2009.05/build_arm/staging_dir/usr/bin/m
kimage] Error 1
[van-cc-pb01l] ~/arm_linux/buildroot-2009.05 > 
 
Alexandre Franchitti | Member Of Technical Staff

WIND RIVER | Parc d'Innovation De Bretagne Sud CP32 | 56038 | Vannes
Cedex | France

Direct Line +33 2 97 42 40 12 | Standard +33 2 97 42 68 00 Ext: 305 |
Fax +33 2 97 42 45 50

www.windriver.com <http://www.windriver.com/> 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090718/f65ccaac/attachment.htm>
