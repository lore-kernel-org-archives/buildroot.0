From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Feb 2007 07:10:28 -0800
Subject: [Buildroot] [buildroot 0001173]: initial make error "Unrecognised
	emulation mode: armelf_linux_eabi"
Message-ID: <c3e3bed8c7e089f3c3f1439e9fd9d540@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1173 
====================================================================== 
Reported By:                pferrell
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1173
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     closed
Resolution:                 won't fix
Fixed in Version:           
====================================================================== 
Date Submitted:             01-24-2007 16:46 PST
Last Modified:              02-14-2007 07:10 PST
====================================================================== 
Summary:                    initial make error  "Unrecognised emulation mode:
armelf_linux_eabi"
Description: 
Initial make errors out as follows.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-24-07 18:09  
---------------------------------------------------------------------- 
Please provide at least your .config.
Also i think that this is a duplicate of a nofpu eabi report, so please
check. 

---------------------------------------------------------------------- 
 stephaneC - 01-25-07 00:58  
---------------------------------------------------------------------- 
I have the same problem with gcc-3.4.6 and arm eabi : see bug 1114 

---------------------------------------------------------------------- 
 pferrell - 01-29-07 12:12  
---------------------------------------------------------------------- 
I looked at bug 1114 and it seems to be the opposite.  I make all of
stephaneC's fixes, and the problem is the same.  The make continues to
show "armelf_linux_eabi" as the unregnized emulation, with "armelf_linux"
and "armelf" as the accepted ones.

-------- egrep -v "^(#|$)" .config
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_xscale=y
BR2_ARM_TYPE="ARM_XSCALE"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_WGET="toolchain/getter_script.sh"
BR2_SVN="svn co"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=3
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="20061006"
BR2_PTHREADS_NATIVE=y
BR2_BINUTILS_VERSION_2_16_1=y
BR2_BINUTILS_VERSION="2.16.1"
BR2_GCC_VERSION_4_1_1=y
BR2_GCC_VERSION="4.1.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS="--without-fp"
BR2_CCACHE=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe -Os -march=armv5te -mtune=iwmmxt
-Wa,-mcpu=iwmmxt"
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Gumstix/basix-connex/busybox.config"
BR2_PACKAGE_BLUEZ=y
BR2_PACKAGE_BOA=y
BR2_PACKAGE_BONJOUR=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_URANDOM=y
BR2_PACKAGE_HOTPLUG=y
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_LRZSZ=y
BR2_PACKAGE_MODULE_INIT_TOOLS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_ORIG=y
BR2_PACKAGE_MTD_ORIG_STRING="mtd-utils-1.0.0.tar.gz"
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_PCMCIAUTILS=y
BR2_PACKAGE_PXAREGS=y
BR2_QTE_TMAKE_VERSION="1.13"
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_CF8385=y
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_ZLIB=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_LE=y
BR2_TARGET_ROOTFS_JFFS2_SQUASH=y
BR2_TARGET_ROOTFS_JFFS2_SUMTOOL=y
BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_FWPRINT=y
BR2_TARGET_GUMSTIX_BASIXCONNEX=y
GUMSTIX_400MHZ=y
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_ETC_GUMSTIX_RELEASE=y

-------egrep -v "^(#|$)" ./toolchain_build_arm_nofpu/uClibc/.config
TARGET_arm=y
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_EABI=y
USE_BX=y
CONFIG_ARM_XSCALE=y
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
ARCH_WANTS_LITTLE_ENDIAN=y
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_SOFT_FLOAT=y
DO_C99_MATH=y
KERNEL_SOURCE="/root/gumstix-buildroot/build_arm_nofpu/linux-2.6.18gum"
HAVE_DOT_CONFIG=y
DOPIC=y
HAVE_SHARED=y
FORCE_SHAREABLE_TEXT_SEGMENTS=y
LDSO_LDD_SUPPORT=y
LDSO_CACHE_SUPPORT=y
LDSO_BASE_FILENAME="ld.so"
UCLIBC_CTOR_DTOR=y
UCLIBC_HAS_THREADS=y
PTHREADS_DEBUG_SUPPORT=y
LINUXTHREADS_OLD=y
UCLIBC_HAS_LFS=y
MALLOC=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS___PROGNAME=y
UNIX98PTY_ONLY=y
ASSUME_DEVPTS=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_USE_NETLINK=y
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
UCLIBC_HAS_CTYPE_CHECKED=y
UCLIBC_HAS_WCHAR=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_ERRNO_MESSAGES=y
UCLIBC_HAS_SIGNUM_MESSAGES=y
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y
UCLIBC_HAS_REGEX=y
UCLIBC_HAS_REGEX_OLD=y
UCLIBC_HAS_FNMATCH=y
UCLIBC_HAS_FNMATCH_OLD=y
UCLIBC_HAS_WORDEXP=y
UCLIBC_HAS_GLOB=y
SHARED_LIB_LOADER_PREFIX="/lib"
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
UCLIBC_HAS_SSP=y
PROPOLICE_BLOCK_SEGV=y
UCLIBC_BUILD_SSP=y
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y
CROSS_COMPILER_PREFIX="/root/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-"
DOSTRIP=y
WARNINGS="-Wall" 

---------------------------------------------------------------------- 
 bernhardf - 01-29-07 14:16  
---------------------------------------------------------------------- 
Did any of you read the fine helptext of BR2_GNU_TARGET_SUFFIX ? 

---------------------------------------------------------------------- 
 stephaneC - 01-30-07 06:41  
---------------------------------------------------------------------- 
pferrell : 
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
[snip]/arm-linux-uclibcgnueabi-ld: unrecognised emulation mode:
armelf_linux_eabi
Supported emulations: armelf_linux armelf

me :
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
[snip]/arm-linux-uclibcgnueabi/bin/ld: unrecognised emulation mode:
armelf_linux
Supported emulations: armelf_linux_eabi armelfb_linux_eabi

I'm a little bit confuse about that !

If I understand the solution is : 
for pferrell :
add "gnueabi" or "eabi" to BR2_GNU_TARGET_SUFFIX
=> BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"

for me : 
remove "gnueabi" from BR2_GNU_TARGET_SUFFIX
=> BR2_GNU_TARGET_SUFFIX="linux-uclibc"

correct ?

(now I work with latest gcc 4.2 and it's ok) 

---------------------------------------------------------------------- 
 pferrell - 01-30-07 08:42  
---------------------------------------------------------------------- 
bernhardf,
I read the fine help text, changed my BR2_GNU_TARGET_SUFFIX, and re-ran
with the same error.  I then deleted my entire buildroot directory, re-did
it from stratch and still get the same result.  Nothing I change seems to
have any effect on the "Supported Emulations".  The only other notes I can
raise are that I am using a VMWare emulator, and have tried fedora core 5
and 6.  

/root/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-
ld: unrecognised emulation mode: armelf_linux_eabi
Supported emulations: armelf_linux armelf
collect2: ld returned 1 exit status
make[4]: *** [libgcc_s.so] Error 1
make[4]: Leaving directory
`/root/gumstix-buildroot/toolchain_build_arm_nofpu/gc c-4.1.1-final/gcc'
make[3]: *** [stmp-multilib] Error 2
make[3]: Leaving directory
`/root/gumstix-buildroot/toolchain_build_arm_nofpu/gc c-4.1.1-final/gcc'
make[2]: *** [all-gcc] Error 2
make[2]: Leaving directory
`/root/gumstix-buildroot/toolchain_build_arm_nofpu/gc c-4.1.1-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/root/gumstix-buildroot/toolchain_build_arm_nofpu/gc c-4.1.1-final'
make: ***
[/root/gumstix-buildroot/toolchain_build_arm_nofpu/gcc-4.1.1-final/.co
mpiled] Error 2
[root at localhost gumstix-buildroot]# egrep -v "^(#|$)" .config
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_xscale=y
BR2_ARM_TYPE="ARM_XSCALE"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_WGET="toolchain/getter_script.sh"
BR2_SVN="svn co"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=3
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="20061006"
BR2_PTHREADS_NATIVE=y
BR2_BINUTILS_VERSION_2_16_1=y
BR2_BINUTILS_VERSION="2.16.1"
BR2_GCC_VERSION_4_1_1=y
BR2_GCC_VERSION="4.1.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS="--without-fp"
BR2_CCACHE=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe -Os -march=armv5te -mtune=iwmmxt
-Wa,-mcpu=iwmmxt"
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Gumstix/basix-connex/busybox.config"
BR2_PACKAGE_BLUEZ=y
BR2_PACKAGE_BOA=y
BR2_PACKAGE_BONJOUR=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_URANDOM=y
BR2_PACKAGE_HOTPLUG=y
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_LRZSZ=y
BR2_PACKAGE_MODULE_INIT_TOOLS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_ORIG=y
BR2_PACKAGE_MTD_ORIG_STRING="mtd-utils-1.0.0.tar.gz"
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_PCMCIAUTILS=y
BR2_PACKAGE_PXAREGS=y
BR2_QTE_TMAKE_VERSION="1.13"
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_CF8385=y
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_ZLIB=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_LE=y
BR2_TARGET_ROOTFS_JFFS2_SQUASH=y
BR2_TARGET_ROOTFS_JFFS2_SUMTOOL=y
BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_FWPRINT=y
BR2_TARGET_GUMSTIX_BASIXCONNEX=y
GUMSTIX_400MHZ=y
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_ETC_GUMSTIX_RELEASE=y

 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:47  
---------------------------------------------------------------------- 
During the last week, i changed quite a bit in that area. arm for an
integrator with EABI now builds for me flawlessly.
An XScale EABI with a default for big-endian builds too, fwiw.

Please svn up and rebuild and let me know if that's better now. 

---------------------------------------------------------------------- 
 pferrell - 02-12-07 08:57  
---------------------------------------------------------------------- 
I have now gone through every combination of gcc and binutils (big and
little endian) and none of them successfully complete buildroot.  The
unknown emulation error is limited to the combination of gcc 4.1.1 and
binutils 2.16.1.  There was no change after the latest updates, it spits
out the same error.  I'm starting to wonder if this is purely an error
with the VMware emulation, so I'm trying to get a friend running a full
Linux box to try it.  With any other combination of gcc and binutils the
only errors listed before it stops running are "makeinfo is missing on
your system" and "nothing to be done"

 

---------------------------------------------------------------------- 
 bernhardf - 02-14-07 05:45  
---------------------------------------------------------------------- 
Just trying the config pasted above..
I'm using binutils-2_17_50_0_10 since the 2.16.1 is not even the current
stable one, fwiw.

Of course i'm using linuxthreads since there simply is no NPTL support for
arm yet, just linuxthreads or linuxthreads.old 

---------------------------------------------------------------------- 
 vapier - 02-14-07 07:10  
---------------------------------------------------------------------- 
if you want to use EABI, then use linux-2.6 headers 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-24-07 16:46  pferrell       New Issue                                    
01-24-07 16:46  pferrell       Status                   new => assigned     
01-24-07 16:46  pferrell       Assigned To               => uClibc          
01-24-07 16:46  pferrell       File Added: emulator error txt                   

01-24-07 18:09  bernhardf      Note Added: 0002042                          
01-25-07 00:58  stephaneC      Note Added: 0002044                          
01-29-07 12:12  pferrell       Note Added: 0002067                          
01-29-07 14:16  bernhardf      Note Added: 0002069                          
01-30-07 06:41  stephaneC      Note Added: 0002072                          
01-30-07 08:27  pferrell       Note Added: 0002074                          
01-30-07 08:29  pferrell       Note Edited: 0002074                         
01-30-07 08:42  pferrell       Note Edited: 0002074                         
02-04-07 08:47  bernhardf      Note Added: 0002100                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
02-12-07 08:57  pferrell       Note Added: 0002154                          
02-12-07 08:57  pferrell       Note Edited: 0002154                         
02-14-07 05:45  bernhardf      Note Added: 0002160                          
02-14-07 07:10  vapier         Note Added: 0002161                          
02-14-07 07:10  vapier         Status                   assigned => closed  
02-14-07 07:10  vapier         Resolution               open => won't fix   
======================================================================
