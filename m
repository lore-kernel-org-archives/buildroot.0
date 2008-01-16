From: Kumar S <ps2kumar@yahoo.com>
Date: Wed, 16 Jan 2008 09:10:38 -0800 (PST)
Subject: [Buildroot] unable to build rootfs with latest buildroot source
Message-ID: <725647.58333.qm@web55709.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
  I'm trying to build latest buildroot source for ARM9 (EB). Build fails by throwing error: usr/share file not found. After creating this directory manually it fails again with error "shadow file not found, passwd file not found etc". Is there any issue with buildroot source or am I missing something?
   
  Regards
  Kumar
   
  [root at localhost buildroot]# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.80':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.0':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.0':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
 /root/ARM_tools/buildroot/project_build_armeb/uclibc/buildroot-config
mkdir -p /root/ARM_tools/buildroot/project_build_armeb/uclibc
cp -dpRf package/config/buildroot-config
/root/ARM_tools/buildroot/project_build_armeb/uclibc/buildroot-config
rmdir:
 /root/ARM_tools/buildroot/project_build_armeb/uclibc/root/usr/share:
No such file or directory
make: ***
 [/root/ARM_tools/buildroot/binaries/uclibc/rootfs.armeb.jffs2]
Error 1

  ------------------------------------------------------------------------------------------------------------------------------------
   
  rm -rf
 /root/ARM_tools/buildroot/project_build_armeb/uclibc/buildroot-config
mkdir -p /root/ARM_tools/buildroot/project_build_armeb/uclibc
cp -dpRf package/config/buildroot-config
/root/ARM_tools/buildroot/project_build_armeb/uclibc/buildroot-config
test -x
/root/ARM_tools/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibc
-ldconfig &&
/root/ARM_tools/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibc
-ldconfig -r /root/ARM_tools/buildroot/project_build_armeb/uclibc/root
2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
touch
 /root/ARM_tools/buildroot/project_build_armeb/uclibc/.fakeroot.00000
cat /root/ARM_tools/buildroot/project_build_armeb/uclibc/.fakeroot* >
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
echo "chown -R 0:0
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root" >>
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
# Use fakeroot to pretend to create all needed device nodes
echo "/root/ARM_tools/buildroot/build_armeb/staging_dir/bin/makedevs -d
target/generic/device_table.txt
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root" \
        >>
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
# Use fakeroot so mkfs.jffs2 believes the previous fakery
echo
 "/root/ARM_tools/buildroot/toolchain_build_armeb/mtd_orig/mkfs.jffs2 -e
0x20000 -q -l -s 0x1000 -D target/generic/device_table.txt -d
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root -o
/root/ARM_tools/buildroot/binaries/uclibc/rootfs.armeb.jffs2" \
        >>
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
chmod a+x
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
/root/ARM_tools/buildroot/build_armeb/staging_dir/usr/bin/fakeroot --
/root/ARM_tools/buildroot/project_build_armeb/uclibc/_fakeroot.rootfs.armeb.
jffs2
rootdir=/root/ARM_tools/buildroot/project_build_armeb/uclibc/root
table='target/generic/device_table.txt'
makedevs: line 43: regular file
'/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/etc/shadow'
 does
not exist: No such file or directory
makedevs: line 44: regular file
'/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/etc/passwd'
 does
not exist: No such file or directory
makedevs: line 49: regular file
'/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/usr/share/udhcpc/
default.script' does not exist: No such file or directory
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
mkfs.jffs2:
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/etc/shadow:
 does
not exist!
make: ***
 [/root/ARM_tools/buildroot/binaries/uclibc/rootfs.armeb.jffs2]
Error 1
[root at localhost buildroot]#
[root at localhost buildroot]# mkdir
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/usr/
bin/     include/ lib/     sbin/
[root at localhost buildroot]# ls
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/usr/
bin/     include/ lib/     sbin/
[root at localhost buildroot]# ls
/root/ARM_tools/buildroot/project_build_armeb/uclibc/root/usr/


       
---------------------------------
Be a better friend, newshound, and know-it-all with Yahoo! Mobile.  Try it now.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080116/5c9d3cc5/attachment.htm 
