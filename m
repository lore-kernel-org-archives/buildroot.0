From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Dec 2007 12:16:36 -0800
Subject: [Buildroot] [buildroot 0001639]: buildroot fails on avr32 compiling
	libs for target
Message-ID: <ec3aad7e325b3d663a72b1652e4643ed@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1639 
====================================================================== 
Reported By:                dl9pf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1639
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-06-2007 12:16 PST
Last Modified:              12-06-2007 12:16 PST
====================================================================== 
Summary:                    buildroot fails on avr32 compiling libs for target
Description: 
Compilation fails on avr32. A wrong CFLAG "-mfloat-abi=soft" is used when
compiling gcc for the target:
make V=99

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
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.1':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.1':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/buildroot-config
mkdir -p
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100
cp -dpRf package/config/buildroot-config
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/buildroot-config
cp -dpf
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/lib/libgmp.so*
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/lib/
test -d
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/include
|| mkdir -p
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/include
cp -dpf
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include/gmp.h
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/include/
cp -dpf
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/lib/libmpfr.so*
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/lib/
cp -dpf
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include/mpfr.h
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include/mpf2mpfr.h
\
               
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/root/usr/include/
mkdir -p
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/gcc-4.1.2-target
touch
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/gcc-4.1.2-target/.prepared
(cd
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/gcc-4.1.2-target;
rm -rf config.cache; \
               
PATH="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/toolchain_build_avr32/bin:/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/bin:/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin:/opt/kde3/bin:/home/dl9pf/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/usr/lib/mit/bin:/usr/lib/mit/sbin:/usr/NX/bin:/usr/lib/qt3/bin"
AR="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar"
AS="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
LD="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld
-L/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/lib
-L/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/lib"
NM="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
CC="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float"
GCC="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float"
CPP="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-cpp
-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float"
CXX="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-g++
-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float"
FC="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gfortran
"
RANLIB="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib"
STRIP="true -Not_stripping"
OBJCOPY="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar"
AS_FOR_TARGET="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
CC_FOR_TARGET="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc"
LD_FOR_TARGET="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld"
NM_FOR_TARGET="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
DEFAULT_LINKER="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld"
PKG_CONFIG_SYSROOT="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir"
PKG_CONFIG="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/lib/pkgconfig:"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
STAGING_DIR="/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir"
CXX="" \
                CFLAGS_FOR_BUILD="-g -O2 " \
                CFLAGS_FOR_TARGET="-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float -mfloat-abi=soft" CXXFLAGS_FOR_TARGET="-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float -mfloat-abi=soft" CFLAGS="-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float -mfloat-abi=soft" BOOT_CFLAGS="-Os -pipe 
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/include
-I/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/include
-msoft-float -mfloat-abi=soft" \
               
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/toolchain_build_avr32/gcc-4.1.2-avr32-2.0/configure
\
                --prefix=/usr \
                --build=x86_64-pc-linux-gnu \
                --host=avr32-linux-uclibc \
                --target=avr32-linux-uclibc \
                --enable-languages=c \
                --with-gxx-include-dir=/usr/include/c++ \
                --disable-__cxa_atexit \
                --with-gnu-ld \
                --with-gnu-as \
                --disable-shared \
                 \
                 \
                --disable-nls \
                --enable-threads \
                --disable-multilib \
                 \
                   \
                 \
                 \
                 --disable-libmudflap --disable-libssp
--with-build-time-tools=/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir//bin
 \
                 --disable-libmudflap --disable-libssp
--with-build-time-tools=/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir//bin
EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=as  \
        )
configure: warning: EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=as: invalid
host type
creating cache ./config.cache
configure: error: can only configure for one host and one target at a
time


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 12:16  dl9pf          New Issue                                    
12-06-07 12:16  dl9pf          Status                   new => assigned     
12-06-07 12:16  dl9pf          Assigned To               => buildroot       
12-06-07 12:16  dl9pf          File Added: config_buildroot                    
======================================================================
