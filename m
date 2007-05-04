From: Magda Abdelbasit <magdaabdelbasit_55@hotmail.com>
Date: Fri, 04 May 2007 10:26:11 +0000
Subject: [Buildroot] error with buildroot
Message-ID: <BAY137-F4D1E34C805361D99E128AFD400@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
   I am trying to build a toolchain and root file system using buildroot. 
The build did not complete and gave an error. I am new to Linux so I am no 
good at finding out what the errors mean and I googled for an explanation 
and found nothing.
Here is the output of the build:


Checking build system dependencies:
sed works:                          Ok
GNU make version '3.81':            Ok
gcc version '4.1.1':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

/sbin/ldconfig -r /home/magda/buildroot/build_arm_nofpu/root 2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
touch /home/magda/buildroot/build_arm_nofpu/staging_dir/.fakeroot.00000
cat /home/magda/buildroot/build_arm_nofpu/staging_dir/.fakeroot* > 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
echo "chown -R root:root /home/magda/buildroot/build_arm_nofpu/root" >> 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
# Use fakeroot to pretend to create all needed device nodes
echo "/home/magda/buildroot/build_arm_nofpu/staging_dir/bin/makedevs -d 
target/generic/device_table.txt /home/magda/buildroot/build_arm_nofpu/root" 
\
                >> 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LANG=C du -l -s -c -k 
/home/magda/buildroot/build_arm_nofpu/root | grep total | sed -e 
"s/total//"`; \
        GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ] ; then 
echo 16384; else echo 2400; fi`; \
        GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
        GENEXT2_ADDTOINODESIZE=`find 
/home/magda/buildroot/build_arm_nofpu/root | wc -l`; \
        GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
        set -x; \
        echo "/home/magda/buildroot/build_arm_nofpu/genext2fs-1.3/genext2fs 
-b $GENEXT2_SIZE " \
                "-i $GENEXT2_INODES -d 
/home/magda/buildroot/build_arm_nofpu/root " \
                " -U /home/magda/buildroot/rootfs.arm_nofpu.ext2" >> 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
+ echo '/home/magda/buildroot/build_arm_nofpu/genext2fs-1.3/genext2fs -b 
4776 ' '-i 745 -d /home/magda/buildroot/build_arm_nofpu/root ' ' -U 
/home/magda/buildroot/rootfs.arm_nofpu.ext2'
chmod a+x 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
/home/magda/buildroot/build_arm_nofpu/staging_dir/usr/bin/fakeroot -- 
/home/magda/buildroot/build_arm_nofpu/staging_dir/_fakeroot.rootfs.arm_nofpu.ext2
fakeroot: preload library not found, aborting.
make: *** [/home/magda/buildroot/rootfs.arm_nofpu.ext2] Error 1

  I would appreciate any advice you could give me.
Thanks in anticipation,
   Magda

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
