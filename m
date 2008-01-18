From: Tim Barr <tbarr@multitech.com>
Date: Fri, 18 Jan 2008 16:03:21 -0600
Subject: [Buildroot] Problem making 2.6.22.1 based arm buildroot
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609BFD335@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW here is what I see when I try to make the kernel/rfs:

falingtrea at falingtrea-linux:~/buildroot$ make
Checking build system dependencies:
Overriding $(DL_DIR) in '.config'. Ok
External download directory: Ok (/usr/local/install/downloads)
CC clean: Ok
CXX clean: Ok
CPP clean: Ok
CFLAGS clean: Ok
INCLUDES clean: Ok
CXXFLAGS clean: Ok
which installed: Ok
sed works: Ok (/bin/sed)
GNU make version '3.81': Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.3': Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.3': Ok
bison installed: Ok
flex installed: Ok
gettext installed: Ok
makeinfo installed: Ok
Build system dependencies: Ok
rm -rf
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/b
uildroot-config
mkdir -p
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1
cp -dpRf package/config/buildroot-config
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/b
uildroot-config
rm -rf
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/lib/modules/2.6.22.1
rm -f
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/sbin/cardmgr
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir"
INSTALL_MOD_PATH=/home/falingtrea/buildroot/project_build_arm_wchar/Supe
rModem-2.6.22.1/root
CROSS_COMPILE=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr
/bin/arm-linux-uclibc-
LDFLAGS="-L/home/falingtrea/buildroot/build_arm_wchar/staging_dir/lib
-L/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/lib
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/"
LZMA="/home/falingtrea/buildroot/toolchain_build_arm_wchar/bin/lzma" -C
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/l
inux-2.6.22.1 modules
make[1]: Entering directory
`/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
linux-2.6.22.1'
CHK include/linux/version.h
make[2]: `include/asm-arm/mach-types.h' is up to date.
CHK include/linux/utsrelease.h
CALL scripts/checksyscalls.sh
<stdin>:91:1: warning: "__IGNORE_sync_file_range" redefined
In file included from <stdin>:2:
include/asm/unistd.h:448:1: warning: this is the location of the
previous definition
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
Building modules, stage 2.
MODPOST 13 modules
make[1]: Leaving directory
`/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
linux-2.6.22.1'
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir"
INSTALL_MOD_PATH=/home/falingtrea/buildroot/project_build_arm_wchar/Supe
rModem-2.6.22.1/root
CROSS_COMPILE=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr
/bin/arm-linux-uclibc-
LDFLAGS="-L/home/falingtrea/buildroot/build_arm_wchar/staging_dir/lib
-L/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/lib
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/"
LZMA="/home/falingtrea/buildroot/toolchain_build_arm_wchar/bin/lzma" -C
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/l
inux-2.6.22.1 \
DEPMOD=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/bin/arm-li
nux-depmod26 \
INSTALL_MOD_PATH=/home/falingtrea/buildroot/project_build_arm_wchar/Supe
rModem-2.6.22.1/root modules_install
make[1]: Entering directory
`/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
linux-2.6.22.1'
INSTALL crypto/des.ko
INSTALL crypto/md4.ko
INSTALL crypto/sha1.ko
INSTALL crypto/sha256.ko
INSTALL drivers/char/alloc_rtsj_mem.ko
INSTALL drivers/char/rmem.ko
INSTALL drivers/scsi/scsi_wait_scan.ko
INSTALL drivers/usb/gadget/g_ether.ko
INSTALL drivers/usb/gadget/g_file_storage.ko
INSTALL drivers/usb/gadget/g_serial.ko
INSTALL drivers/usb/gadget/gadgetfs.ko
INSTALL lib/crc16.ko
INSTALL lib/libcrc32c.ko
if [ -r System.map -a -x
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/bin/arm-linux-dep
mod26 ]; then
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/bin/arm-linux-dep
mod26 -ae -F System.map -b
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot -r 2.6.22.1-rt9; fi
make[1]: Leaving directory
`/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
linux-2.6.22.1'
rm -f
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/lib/modules/2.6.22.1/build
rm -f
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/lib/modules/2.6.22.1/source
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/bin/arm-linux-dep
mod26 -b
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot 2.6.22.1
WARNING: Couldn't open directory
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/lib/modules/2.6.22.1: No such file or directory
FATAL: Could not open
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/lib/modules/2.6.22.1/modules.dep.temp for writing: No such file or
directory
make: ***
[/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
root/lib/modules/2.6.22.1/modules.dep] Error 1

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com
