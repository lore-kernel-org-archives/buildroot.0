From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Dec 2012 17:52:22 +0000 (UTC)
Subject: [Buildroot] [Bug 5810] New: Buildroot 2012.11: Additional GCC
 option "-msoft-float" breaks the build
Message-ID: <bug-5810-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5810

           Summary: Buildroot 2012.11: Additional GCC option
                    "-msoft-float" breaks the build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tbolsh at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I need to build an embedded Linux for 486 without coprocessor.
2012.08 works for that reason, 2012.11 breaks.
Here is the error (meanwhile - why it applies arm related patches to x86?):
_____________________________________________________
Applying 810-arm-softfloat-libgcc.patch using patch:
patching file gcc/config/arm/linux-elf.h
patching file libgcc/config/arm/t-linux

Applying 830-arm_unbreak_armv4t.patch using patch:
patching file gcc/config/arm/linux-eabi.h
touch /root/buildroot-2012.11/output/toolchain/gcc-4.7.2/.patched
mkdir -p /root/buildroot-2012.11/output/toolchain/gcc-4.7.2-initial
(cd /root/buildroot-2012.11/output/toolchain/gcc-4.7.2-initial; rm -rf
config.cache; \
               
PATH=/root/buildroot-2012.11/output/host/bin:/root/buildroot-2012.11/output/host/usr/bin:/usr/lib/git-core:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/root/buildroot-2012.11/output/host/usr/bin/ccache /usr/bin/gcc"
GCC="/root/buildroot-2012.11/output/host/usr/bin/ccache /usr/bin/gcc"
CXX="/root/buildroot-2012.11/output/host/usr/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp" CPPFLAGS="-I/root/buildroot-2012.11/output/host/usr/include"
CFLAGS="-O2 -I/root/buildroot-2012.11/output/host/usr/include" CXXFLAGS="-O2
-I/root/buildroot-2012.11/output/host/usr/include"
LDFLAGS="-L/root/buildroot-2012.11/output/host/lib
-L/root/buildroot-2012.11/output/host/usr/lib
-Wl,-rpath,/root/buildroot-2012.11/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/root/buildroot-2012.11/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/root/buildroot-2012.11/output/host/usr/lib/pkgconfig:/root/buildroot-2012.11/output/host/usr/share/pkgconfig"
PERLLIB="/root/buildroot-2012.11/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/root/buildroot-2012.11/output/host/usr/lib:" \
                /root/buildroot-2012.11/output/toolchain/gcc-4.7.2/configure  \
                --prefix=/root/buildroot-2012.11/output/host/usr \
                --build=i686-pc-linux-gnu \
                --host=i686-pc-linux-gnu \
                --target=i486-buildroot-linux-uclibc \
                --enable-languages=c \
               
--with-sysroot=/root/buildroot-2012.11/output/toolchain/uClibc_dev/ \
                --disable-__cxa_atexit \
                --enable-target-optspace \
                 \
                --enable-libgomp \
                --with-gnu-ld \
                --disable-shared \
                --disable-libssp \
                --without-headers \
                --with-newlib \
                --disable-multilib \
                --enable-tls \
                --with-gmp=/root/buildroot-2012.11/output/host/usr \
                --with-mpfr=/root/buildroot-2012.11/output/host/usr \
                --with-mpc=/root/buildroot-2012.11/output/host/usr \
                --disable-nls \
                --enable-threads \
                --disable-decimal-float \
                 \
                 --with-arch="i486" --with-tune="i486"  \
                --with-pkgversion="Buildroot 2012.11"
--with-bugurl="http://bugs.buildroot.net/" -msoft-float \
        )
configure: error: unrecognized option: `-msoft-float'
Try `/root/buildroot-2012.11/output/toolchain/gcc-4.7.2/configure --help' for
more information.
make: ***
[/root/buildroot-2012.11/output/toolchain/gcc-4.7.2-initial/.configured] Error
1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
