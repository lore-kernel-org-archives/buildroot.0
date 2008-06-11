From: Tim Barr <tbarr@multitech.com>
Date: Wed, 11 Jun 2008 16:56:43 -0500
Subject: [Buildroot] Can't get Buildrooot to finish
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60C55664B@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting the following errors when buildroot tried to create a NAND
Flash RFS Jfss2 file:
 
table='target/device/Atmel/root/device_table.txt'

makedevs: line 42: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/e
tc/shadow' does not exist: No such file or directory

makedevs: line 43: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/e
tc/passwd' does not exist: No such file or directory

makedevs: line 48: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/u
sr/share/udhcpc/default.script' does not exist: No such file or
directory

-rw-r--r-- 1 falingtrea admin 5406720 2008-06-11 16:15
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-20080
611.ext2

test -x
/home/falingtrea/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
c-ldconfig &&
/home/falingtrea/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
c-ldconfig -r
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root
2>/dev/null

# Use fakeroot to pretend all target binaries are owned by root

rm -f
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

touch
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/.fakero
ot.00000

cat
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/.fakero
ot* >
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

echo "chown -R 0:0
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root"
>>
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

# Use fakeroot to pretend to create all needed device nodes

echo "/home/falingtrea/buildroot/build_arm/staging_dir/bin/makedevs -d
target/device/Atmel/root/device_table.txt
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root" \

>>
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

# Use fakeroot so mkfs.jffs2 believes the previous fakery

echo "/home/falingtrea/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2
-e 0x2100 -l -s 0x420 -n -D target/device/Atmel/root/device_table.txt -d
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root -o
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-20080
611.jffs2" \

>>
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

chmod a+x
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

/home/falingtrea/buildroot/build_arm/staging_dir/usr/bin/fakeroot --
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/_fakero
ot.rootfs.arm-20080611.jffs2

rootdir=/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1
/root

table='target/device/Atmel/root/device_table.txt'

makedevs: line 42: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/e
tc/shadow' does not exist: No such file or directory

makedevs: line 43: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/e
tc/passwd' does not exist: No such file or directory

makedevs: line 48: regular file
'/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/u
sr/share/udhcpc/default.script' does not exist: No such file or
directory

mkfs.jffs2:
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/root/et
c/shadow: does not exist!

make: ***
[/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-2008
0611.jffs2] Error 1

 
What can I do to correct this???
 
Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com


 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080611/65419a47/attachment.htm 
