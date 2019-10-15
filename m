From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Oct 2019 10:38:21 -0700
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <3473270f-4aa0-c40e-9f09-16ebfc3f8dc6@mind.be>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
 <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
 <CAJJ6jxvkTS5=9+v7N0BXQD2AWYvp9zEiRyPxtpNBYmjydL5zBw@mail.gmail.com>
 <d2390d24-80b1-7b88-dec9-08077ed1035d@mind.be>
 <CAJJ6jxuaETPxdROt48WMFMsgujNTRyPjTKEqfcnnrXV1-KE=QA@mail.gmail.com>
 <3473270f-4aa0-c40e-9f09-16ebfc3f8dc6@mind.be>
Message-ID: <CAJJ6jxuOLe1Q+52dDamh7WSV_V6Fb=Sj_7NTWbF8tqCoVhBmow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Still failing in the same way. I am running ubuntu 16.04.6 LTS.

I checked out the same versions as you and built as you said explicitly.

<quote>
built on master of a couple of days ago, using 'make toolchain'
built on 2019.08.x of a couple of days ago, built with `make dbus`.
</quote>

This is very confusing. Maybe something is missing or wrong in my host
environment?

Steve


On Tue, Oct 15, 2019 at 12:56 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 14/10/2019 23:26, Steve Calfee wrote:
> > Hi Arnout,
> >
> > I am still having the build fail in dbus - could you post the two
> > configs you used successfully?
>
>  Hm, I didn't save those configs so I'm not 100% sure that they're correct, but
> here goes:
>
> toolchain defconfig, built on master of a couple of days ago, using 'make toolchain'
>
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
> BR2_TARGET_OPTIMIZATION="-Os -pipe"
> # BR2_TARGET_GENERIC_GETTY is not set
> # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> BR2_GENERATE_LOCALE="en_US.UTF-8"
> BR2_PACKAGE_LIBPTHREAD_STUBS=y
> BR2_PACKAGE_CLAMAV=y
> # BR2_TARGET_ROOTFS_TAR is not set
>

My toolchain defconfig:
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBPTHREAD_STUBS=y

>
> dbus defconfig, built on 2019.08.x of a couple of days ago, built with `make dbus`.
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../buildroot/output/host/usr"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-buildroot-linux-gnueabi"
> BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libpthread.so.0"
> BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
> BR2_TARGET_GENERIC_HOSTNAME="dockstar"
> BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_ENABLE_LOCALE_WHITELIST="C en_US.utf8 C.UTF-8"
> BR2_GENERATE_LOCALE="en_US"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_STRACE=y
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_TREE=y
> BR2_PACKAGE_MTD=y
> BR2_PACKAGE_MTD_MKFSUBIFS=y
> BR2_PACKAGE_NFS_UTILS=y
> BR2_PACKAGE_NFS_UTILS_RPCDEBUG=y
> BR2_PACKAGE_SSHFS=y
> BR2_PACKAGE_UBOOT_TOOLS=y
> BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
> BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE=y
> BR2_PACKAGE_USBMOUNT=y
> BR2_PACKAGE_USBUTILS=y
> BR2_PACKAGE_PHP=y
> BR2_PACKAGE_PHP_SAPI_CGI=y
> BR2_PACKAGE_PHP_SAPI_CLI=y
> BR2_PACKAGE_PHP_EXT_SIMPLEXML=y
> BR2_PACKAGE_PHP_EXT_WDDX=y
> BR2_PACKAGE_PHP_EXT_XML=y
> BR2_PACKAGE_PHP_EXT_XMLREADER=y
> BR2_PACKAGE_PHP_EXT_XMLWRITER=y
> BR2_PACKAGE_PHP_EXT_XSL=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_PYC=y
> BR2_PACKAGE_PYTHON_UCS4=y
> BR2_PACKAGE_PYTHON_PYMYSQL=y
> BR2_PACKAGE_PYTHON_PYRATEMP=y
> BR2_PACKAGE_PYTHON_REQUESTS=y
> BR2_PACKAGE_PYTHON_TORNADO=y
> BR2_PACKAGE_MYSQL=y
> BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_CURL=y
> BR2_PACKAGE_LIBCURL_VERBOSE=y
> BR2_PACKAGE_NSS_MDNS=y
> BR2_PACKAGE_ICU=y
> BR2_PACKAGE_NCURSES_WCHAR=y
> BR2_PACKAGE_AVAHI=y
> BR2_PACKAGE_AVAHI_DAEMON=y
> BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=y
> BR2_PACKAGE_NTP=y
> BR2_PACKAGE_RSYNC=y
> BR2_PACKAGE_STUNNEL=y
> BR2_PACKAGE_TCPDUMP=y
> BR2_PACKAGE_BASH=y
> BR2_PACKAGE_LESS=y
> BR2_PACKAGE_MC=y
> BR2_PACKAGE_NANO=y
> BR2_TARGET_ROOTFS_UBI=y
>
My extremely minimized app defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../toolchain/output/host/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-buildroot-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libpthread.so.0"
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_GENERIC_HOSTNAME="dockstar"
BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US.utf8 C.UTF-8"
BR2_GENERATE_LOCALE="en_US"
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_DBUS_GLIB=y

From my app buildroot dir, I verify libpthread exists - I guess
installed from the toolchain buildroot:

calfee at trillium:~/edi-workspace/buildroot$ find output/ | grep
libpthread | xargs ls -l
-rwxr-xr-x 1 calfee calfee 148180 Oct 15 09:54
output/host/arm-buildroot-linux-gnueabi/sysroot/lib/libpthread-2.30.so
lrwxrwxrwx 1 calfee calfee     18 Oct 15 09:54
output/host/arm-buildroot-linux-gnueabi/sysroot/lib/libpthread.so.0 ->
libpthread-2.30.so
-rw-r--r-- 1 calfee calfee 347762 Oct 15 09:54
output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libpthread.a
lrwxrwxrwx 1 calfee calfee     25 Oct 15 09:54
output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libpthread.so
-> ../../lib/libpthread.so.0
-rwxr-xr-x 1 calfee calfee 148180 Oct 15 10:18
output/target/lib/libpthread-2.30.so
lrwxrwxrwx 1 calfee calfee     18 Oct 15 10:18
output/target/lib/libpthread.so.0 -> libpthread-2.30.so

From the 1019.8.x branch I did make clean; make dbus. Here is the failure:

  CCLD     dbus-update-activation-environment
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_init at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_destroy at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_condattr_setclock at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_settype at GLIBC_2.4'
collect2: error: ld returned 1 exit status
Makefile:727: recipe for target 'dbus-launch' failed
make[4]: *** [dbus-launch] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_init at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_destroy at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_condattr_setclock at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_settype at GLIBC_2.4'
collect2: error: ld returned 1 exit status
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_init at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined referenceMakefile:731: recipe
for target 'dbus-monitor' failed
 tomake[4]: *** [dbus-monitor] Error 1
 `pthread_mutexattr_destroy at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_condattr_setclock at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_settype at GLIBC_2.4'
collect2: error: ld returned 1 exit status
Makefile:739: recipe for target 'dbus-send' failed
make[4]: *** [dbus-send] Error 1
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_init at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_destroy at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_condattr_setclock at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_settype at GLIBC_2.4'
collect2: error: ld returned 1 exit status
Makefile:743: recipe for target 'dbus-test-tool' failed
make[4]: *** [dbus-test-tool] Error 1
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_init at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_destroy at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_condattr_setclock at GLIBC_2.4'
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
../dbus/.libs/libdbus-1.so: undefined reference to
`pthread_mutexattr_settype at GLIBC_2.4'
collect2: error: ld returned 1 exit status
Makefile:747: recipe for target 'dbus-update-activation-environment' failed
make[4]: *** [dbus-update-activation-environment] Error 1
Makefile:706: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:573: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:238: recipe for target
'/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/.stamp_built'
failed
make[1]: *** [/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2
