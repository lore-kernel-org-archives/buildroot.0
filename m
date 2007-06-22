From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Fri, 22 Jun 2007 16:52:31 -0400
Subject: [Buildroot] Buildroot failed arm linux eabi gcc 4.1.2
Message-ID: <200706221652.31953.stuart.wood@labxtechnologies.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All, 

Any thoughts on how to fix this would be appreciated!

Thanks 

Stuart

My configuration is:

#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm920t=y
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="/opt/buildroot_eabi"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=4
BR2_TOOLCHAIN_BUILDROOT=y

#
# Toolchain Options
#

#
# Kernel Header Options
#
BR2_KERNEL_HEADERS_2_6_20=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4"

#
# uClibc Options
#
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_PTHREADS_OLD=y

#
# Binutils Options
#
BR2_BINUTILS_VERSION_2_17=y
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# Gcc Options
#
BR2_GCC_VERSION_4_1_2=y
BR2_GCC_VERSION="4.1.2"
BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""


#
# Common Toolchain Options
#
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"

Make Output is:

$make
if 
[ ! -e "/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/bin/sed" ] ; 
then \
                
mkdir -p "/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/bin"; \
                
rm -f "/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/bin/sed"; \
                
ln -sf "/bin/sed" "/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/bin/sed"; 
\
        fi

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

make 
MAKE="make -j1" -C /home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/uClibc 
\
                PREFIX=/opt/buildroot_eabi \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/ \
                install_runtime install_dev
make[1]: Entering directory 
`/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/uClibc'
install -d /opt/buildroot_eabi/lib
install -m 644 lib/lib*-0.9.29.so \
                /opt/buildroot_eabi/lib
install: cannot stat `lib/lib*-0.9.29.so': No such file or directory
make[1]: *** [install_runtime] Error 1
make[1]: Leaving directory 
`/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/opt/buildroot_eabi/usr/lib/libc.a] Error 2
