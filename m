From: alberteerj <albertrj01@yahoo.com>
Date: Thu, 4 Dec 2008 01:52:15 -0800 (PST)
Subject: [Buildroot] Guys really need help here! :build Buildroot image error
Message-ID: <20830292.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all, 

I'm currently want to compile the pxarc-1.2 inside the Buildroot. But before
that i have to compile my Buildroot first since i don't have one for my
fedora 8. So, i follow the wiki and done the following:

$ svn co http://svn.gumstix.com/gumstix-buildroot/trunk gumstix-buildroot 
$ cd gumstix-buildroot 
$ rm .config 
$ make defconfig 
$ make 

But it seems that at the final stage of compilation and it failed and the
mkimage errors occurred

[alberteerj at localhost gumstix-buildroot]$ make 

Checking build system dependencies: 
sed works:                          Ok 
GNU make version '3.81':            Ok 
gcc version '4.1.2':                Ok 
which installed:                    Ok 
bison installed:                    Ok 
flex installed:                     Ok 
gettext installed:                  Ok 
Build system dependencies:          Ok 

make -j3 BR2_TARGET_GUMSTIX_BASIXCONNEX=y GUMSTIX_400MHZ=y
SVN_REVISION=1637M ARCH=arm
CROSS_COMPILE=/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-
-C /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0 tools 
make[1]: Entering directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0' 
make -C tools all 
make[2]: Entering directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools' 
make[2]: Leaving directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools' 
make[1]: Leaving directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0' 
cp -f /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools/mkimage
/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/mkimage 
cp: cannot stat
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools/mkimage': No
such file or directory 
make: ***
[/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/mkimage] Error 

I have tried downgrade my "make" tools version from make-3.81 to make-3.80
by doing:

rpm -Uvh --oldpackage 

But the same error still occurs. Anyone has encountered this error or has
the solution please guide me please....Thanks
-- 
View this message in context: http://www.nabble.com/Guys-really-need-help-here%21-%3Abuild-Buildroot-image-error-tp20830292p20830292.html
Sent from the BuildRoot mailing list archive at Nabble.com.
