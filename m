From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 31 Jul 2014 00:37:16 +0200
Subject: [Buildroot] Build failed for package avahi
Message-ID: <53D9739C.7040301@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building avahi with latest git master branch fails for package avahi 
while configuring.

I attached the .config file and this is the log for make clean all:

 >>> avahi 0.6.31 Configuring
(cd /home/joerg/Freescale/buildroot/output/build/avahi-0.6.31/ && rm -rf 
config.cache && 
PATH="/home/joerg/Freescale/buildroot/output/host/bin:/home/joerg/Freescale/buildroot/output/host/sbin:/home/joerg/Freescale/buildroot/output/host/usr/bin:/home/joerg/Freescale/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl" 
AR="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar" 
AS="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as" 
LD="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" 
NM="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm" 
CC="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" 
GCC="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" 
CPP="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp" 
CXX="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++" 
FC="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran" 
RANLIB="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib" 
READELF="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf" 
STRIP="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip" 
OBJCOPY="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy" 
OBJDUMP="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" 
CPPFLAGS_FOR_BUILD="-I/home/joerg/Freescale/buildroot/output/host/usr/include" 
CFLAGS_FOR_BUILD="-O2 
-I/home/joerg/Freescale/buildroot/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-O2 
-I/home/joerg/Freescale/buildroot/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/home/joerg/Freescale/buildroot/output/host/lib 
-L/home/joerg/Freescale/buildroot/output/host/usr/lib 
-Wl,-rpath,/home/joerg/Freescale/buildroot/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
DEFAULT_ASSEMBLER="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as" 
DEFAULT_LINKER="/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" 
CPPFLAGS="" CFLAGS="  -pipe -Os " CXXFLAGS="  -pipe -Os " LDFLAGS="" 
FCFLAGS="" 
PKG_CONFIG="/home/joerg/Freescale/buildroot/output/host/usr/bin/pkg-config" 
STAGING_DIR="/home/joerg/Freescale/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" 
CXX=false ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes 
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes 
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes 
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes 
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no 
ac_cv_func_strtod=yes ac_fsusage_space=yes 
fu_cv_sys_stat_statfs2_bsize=yes ac_cv_func_closedir_void=no 
ac_cv_func_getloadavg=no ac_cv_lib_util_getloadavg=no 
ac_cv_lib_getloadavg_getloadavg=no ac_cv_func_getgroups=yes 
ac_cv_func_getgroups_works=yes ac_cv_func_chown_works=yes 
ac_cv_have_decl_euidaccess=no ac_cv_func_euidaccess=no 
ac_cv_have_decl_strnlen=yes ac_cv_func_strnlen_working=yes 
ac_cv_func_lstat_dereferences_slashed_symlink=yes 
ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no 
vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes 
jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes 
ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes 
ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes 
ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes 
ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no 
utils_cv_func_mkdir_trailing_slash_bug=no 
jm_cv_func_gettimeofday_clobber=no am_cv_func_working_getline=yes 
gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no 
utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no 
gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes 
gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes 
am_getline_needs_run_time_check=no am_cv_func_working_getline=yes 
gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no 
ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes 
ac_use_included_regex=no avahi_cv_sys_cxx_works=yes DATADIRNAME=share 
./configure --target=arm-buildroot-linux-uclibcgnueabi 
--host=arm-buildroot-linux-uclibcgnueabi 
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr 
--sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc 
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no 
--disable-nls --disable-largefile --disable-ipv6 --enable-static 
--enable-shared --localstatedir=/var --disable-qt3 --disable-qt4 
--disable-gdbm --disable-python-dbus --disable-pygtk --disable-gtk3 
--disable-mono --disable-monodoc --disable-stack-protector 
--with-distro=none --disable-manpages --enable-autoipd 
--with-avahi-user=avahi --with-avahi-group=avahi 
--with-autoipd-user=avahi --with-autoipd-group=avahi --with-xml=none 
--disable-dbus --disable-glib --disable-gobject --disable-gtk 
--disable-python )
configure: WARNING: unrecognized options: --disable-gtk-doc, 
--disable-doc, --disable-docs, --disable-documentation, --with-xmlto, 
--with-fop, --disable-largefile, --disable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-buildroot-linux-uclibcgnueabi-strip... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking how to create a pax tar archive... gnutar
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabi
checking whether make supports nested variables... (cached) yes
checking for stow... no
checking for arm-buildroot-linux-uclibcgnueabi-gcc... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
accepts -g... yes
checking for 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc... 
gcc3
checking for 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
option to accept ISO C99... unsupported
checking whether we are using the GNU C++ compiler... no
checking whether false accepts -g... no
checking dependency style of false... none
checking whether 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
and cc understand -c and -o together... yes
checking how to run the C preprocessor... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking how to run the C preprocessor... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp
checking whether ln -s works... yes
checking whether make sets $(MAKE)... (cached) yes
checking whether 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
needs -traditional... no
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld
checking if the linker 
(/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld) 
is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm
checking the name lister 
(/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm) 
interface... BSD nm
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to 
arm-buildroot-linux-uclibcgnueabi format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain 
format... func_convert_file_noop
checking for 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld 
option to reload object files... -r
checking for arm-buildroot-linux-uclibcgnueabi-objdump... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-buildroot-linux-uclibcgnueabi-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-buildroot-linux-uclibcgnueabi-ar... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar
checking for archiver @FILE support... @
checking for arm-buildroot-linux-uclibcgnueabi-strip... (cached) 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip
checking for arm-buildroot-linux-uclibcgnueabi-ranlib... 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib
checking command to parse 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm 
output from 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
object... ok
checking for sysroot... no
checking for arm-buildroot-linux-uclibcgnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
supports -fno-rtti -fno-exceptions... no
checking for 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
option to produce PIC... -fPIC -DPIC
checking if 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
PIC flag -fPIC -DPIC works... yes
checking if 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
static flag -static works... yes
checking if 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
supports -c -o file.o... yes
checking if 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
supports -c -o file.o... (cached) yes
checking whether the 
/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
linker 
(/home/joerg/Freescale/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld) 
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking how to run the C++ preprocessor... /lib/cpp
configure: error: in 
`/home/joerg/Freescale/buildroot/output/build/avahi-0.6.31':
configure: error: C++ preprocessor "/lib/cpp" fails sanity check
See `config.log' for more details
package/pkg-generic.mk:167: recipe for target 
'/home/joerg/Freescale/buildroot/output/build/avahi-0.6.31/.stamp_configured' 
failed
make: *** 
[/home/joerg/Freescale/buildroot/output/build/avahi-0.6.31/.stamp_configured] 
Error 1

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140731/cc8d93b1/attachment.html>
-------------- next part --------------
#
# Automatically generated file; DO NOT EDIT.
# Buildroot 2014.08-git-01041-g82cf4f0-dirty Configuration
#
BR2_HAVE_DOT_CONFIG=y

#
# Target options
#
BR2_SOFT_FLOAT=y
# BR2_arcle is not set
# BR2_arceb is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_aarch64 is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_mips64 is not set
# BR2_mips64el is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_powerpc64 is not set
# BR2_powerpc64le is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="arm926ej-s"
BR2_GCC_TARGET_FLOAT_ABI="soft"
BR2_GCC_TARGET_MODE="arm"
BR2_ARM_CPU_MAYBE_HAS_VFPV2=y
BR2_ARM_CPU_HAS_THUMB=y
# BR2_arm920t is not set
# BR2_arm922t is not set
BR2_arm926t=y
# BR2_arm10t is not set
# BR2_arm1136jf_s_r0 is not set
# BR2_arm1136jf_s_r1 is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_cortex_a5 is not set
# BR2_cortex_a7 is not set
# BR2_cortex_a8 is not set
# BR2_cortex_a9 is not set
# BR2_cortex_a12 is not set
# BR2_cortex_a15 is not set
# BR2_fa526 is not set
# BR2_pj4 is not set
# BR2_strongarm is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
# BR2_arm1136jf_s is not set
BR2_ARM_EABI=y
# BR2_ARM_EABIHF is not set
BR2_ARM_SOFT_FLOAT=y
# BR2_ARM_FPU_VFPV2 is not set
BR2_ARM_INSTRUCTIONS_ARM_CHOICE=y
# BR2_ARM_INSTRUCTIONS_THUMB is not set
BR2_ARM_INSTRUCTIONS_ARM=y

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_CVS="cvs"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net"
BR2_KERNEL_MIRROR="https://www.kernel.org/pub"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_LUAROCKS_MIRROR="http://rocks.moonscript.org"
BR2_CPAN_MIRROR="http://cpan.metacpan.org"
BR2_JLEVEL=0
# BR2_CCACHE is not set
# BR2_DEPRECATED is not set
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_none is not set
BR2_STRIP_EXCLUDE_FILES=""
BR2_STRIP_EXCLUDE_DIRS=""
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y

#
# enabling Stack Smashing Protection requires support in the toolchain
#
# BR2_PREFER_STATIC_LIB is not set
BR2_PACKAGE_OVERRIDE_FILE="$(CONFIG_DIR)/local.mk"
BR2_GLOBAL_PATCH_DIR=""

#
# Toolchain
#
BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
BR2_TOOLCHAIN_BUILDROOT_VENDOR="buildroot"

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_3_0 is not set
# BR2_KERNEL_HEADERS_3_2 is not set
# BR2_KERNEL_HEADERS_3_4 is not set
# BR2_KERNEL_HEADERS_3_10 is not set
# BR2_KERNEL_HEADERS_3_11 is not set
# BR2_KERNEL_HEADERS_3_12 is not set
# BR2_KERNEL_HEADERS_3_13 is not set
# BR2_KERNEL_HEADERS_3_14 is not set
BR2_KERNEL_HEADERS_3_15=y
# BR2_KERNEL_HEADERS_VERSION is not set
BR2_DEFAULT_KERNEL_HEADERS="3.15.7"
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
# BR2_TOOLCHAIN_BUILDROOT_EGLIBC is not set
# BR2_TOOLCHAIN_BUILDROOT_GLIBC is not set
# BR2_TOOLCHAIN_BUILDROOT_MUSL is not set
BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
BR2_PACKAGE_UCLIBC=y

#
# uClibc Options
#
BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.33.2"
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-0.9.33.config"
# BR2_TOOLCHAIN_BUILDROOT_LARGEFILE is not set
# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
# BR2_TOOLCHAIN_BUILDROOT_WCHAR is not set
# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
BR2_PTHREADS_NATIVE=y
# BR2_PTHREAD_DEBUG is not set
# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
BR2_UCLIBC_INSTALL_UTILS=y
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
BR2_UCLIBC_TARGET_ARCH="arm"
BR2_UCLIBC_ARM_BX=y

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_22 is not set
# BR2_BINUTILS_VERSION_2_23_2 is not set
BR2_BINUTILS_VERSION_2_24=y
BR2_BINUTILS_VERSION="2.24"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
BR2_GCC_NEEDS_MPC=y
BR2_GCC_SUPPORTS_GRAPHITE=y
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_4_5_X is not set
# BR2_GCC_VERSION_4_7_X is not set
# BR2_GCC_VERSION_4_8_X is not set
BR2_GCC_VERSION_4_9_X=y
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.9.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
BR2_GCC_ENABLE_TLS=y
# BR2_GCC_ENABLE_OPENMP is not set
# BR2_GCC_ENABLE_GRAPHITE is not set
# BR2_PACKAGE_HOST_GDB is not set
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_GENERATE_LOCALE=""
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
# BR2_ECLIPSE_REGISTER is not set
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.15"

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
# BR2_TARGET_GENERIC_PASSWD_DES is not set
BR2_TARGET_GENERIC_PASSWD_MD5=y
# BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
# BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
BR2_INIT_BUSYBOX=y
# BR2_INIT_SYSV is not set

#
# systemd needs an (e)glibc toolchain, headers >= 3.10
#
# BR2_INIT_NONE is not set
# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set

#
# eudev needs a toolchain w/ largefile, wchar, dynamic library
#
BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_ROOT_PASSWD=""
BR2_TARGET_GENERIC_GETTY=y

#
# getty options
#
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_GETTY_TERM="vt100"
BR2_TARGET_GENERIC_GETTY_OPTIONS=""
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
# BR2_TARGET_TZ_INFO is not set
BR2_ROOTFS_USERS_TABLES=""
BR2_ROOTFS_OVERLAY=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_POST_IMAGE_SCRIPT=""

#
# Kernel
#
# BR2_LINUX_KERNEL is not set

#
# Target packages
#
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set

#
# Audio and video applications
#

#
# alsa-utils needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_AUMIX is not set

#
# bellagio needs a toolchain w/ C++, threads, dynamic library
#
# BR2_PACKAGE_FAAD2 is not set

#
# ffmpeg needs a toolchain w/ largefile, IPv6
#

#
# flac needs a toolchain w/ wchar
#

#
# flite needs a toolchain w/ wchar
#

#
# gstreamer 0.10 needs a toolchain w/ wchar, threads
#

#
# gstreamer 1.x needs a toolchain w/ wchar, threads
#

#
# jack2 needs a toolchain w/ largefile, threads, C++
#
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_LIBVPX is not set
# BR2_PACKAGE_MADPLAY is not set

#
# mpd needs a toolchain w/ C++, threads, wchar
#
# BR2_PACKAGE_MPG123 is not set

#
# mplayer needs a toolchain w/ largefile
#
# BR2_PACKAGE_MUSEPACK is not set

#
# ncmpc needs a toolchain w/ wchar, threads
#

#
# on2-8170-libs needs an (e)glibc toolchain and a Linux kernel to be built
#
# BR2_PACKAGE_OPUS_TOOLS is not set

#
# pulseaudio needs a toolchain w/ wchar, largefile, threads
#
# BR2_PACKAGE_SHAIRPORT is not set
# BR2_PACKAGE_SOX is not set

#
# tstools needs a toolchain w/ largefile
#

#
# twolame needs a toolchain w/ largefile
#

#
# upmpdcli needs a toolchain w/ C++, largefile, threads
#

#
# vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, largefile, wchar, threads
#
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set
BR2_PACKAGE_XBMC_ARCH_SUPPORTS=y

#
# xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar
#

#
# xbmc requires an OpenGL ES and EGL backend
#
# BR2_PACKAGE_YAVTA is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_INFOZIP is not set

#
# lz4 needs a toolchain w/ largefile
#

#
# lzip needs a toolchain w/ C++, largefile
#
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#

#
# bonnie++ needs a toolchain w/ C++
#
# BR2_PACKAGE_CACHE_CALIBRATOR is not set
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_DROPWATCH is not set

#
# dstat needs a toolchain w/ wchar
#

#
# duma needs a toolchain w/ C++, threads
#

#
# fio needs a toolchain w/ largefile, threads
#

#
# gdb/gdbserver needs a toolchain w/ threads, threads debug
#
BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y

#
# google-breakpad requires an (e)glibc toolchain w/ C++ enabled
#
# BR2_PACKAGE_IOZONE is not set
# BR2_PACKAGE_KEXEC is not set

#
# ktap needs a Linux kernel to be built
#

#
# latencytop needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LMBENCH is not set

#
# ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads
#
# BR2_PACKAGE_LTRACE is not set

#
# lttng-modules needs a Linux kernel to be built
#

#
# lttng-tools needs a toolchain w/ largefile, threads, wchar
#
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set

#
# oprofile needs a toolchain w/ C++
#

#
# pax-utils needs a toolchain w/ largefile
#

#
# perf needs a toolchain w/ largefile and a Linux kernel to be built
#
# BR2_PACKAGE_PV is not set
# BR2_PACKAGE_RAMSMP is not set
# BR2_PACKAGE_RAMSPEED is not set
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STRESS is not set
# BR2_PACKAGE_TINYMEMBENCH is not set

#
# trace-cmd needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_WHETSTONE is not set

#
# Development tools
#
# BR2_PACKAGE_BINUTILS is not set
# BR2_PACKAGE_BSDIFF is not set

#
# cvs needs a toolchain w/ wchar
#
# BR2_PACKAGE_FLEX is not set

#
# gettext needs a toolchain w/ wchar
#

#
# git needs a toolchain w/ largefile
#

#
# gperf needs a toolchain w/ C++
#
# BR2_PACKAGE_JQ is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PKGCONF is not set
# BR2_PACKAGE_SSTRIP is not set
# BR2_PACKAGE_SUBVERSION is not set

#
# tree needs a toolchain w/ wchar
#

#
# Filesystem and flash utilities
#

#
# btrfs-progs needs a toolchain w/ largefile, wchar, threads
#
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CRAMFS is not set

#
# curlftpfs needs a toolchain w/ largefile, wchar, threads, dynamic library
#

#
# dosfstools needs a toolchain w/ largefile, wchar
#

#
# e2fsprogs needs a toolchain w/ largefile, wchar
#

#
# ecryptfs-utils needs a toolchain w/ largefile, threads
#

#
# exfat needs a toolchain w/ largefile, wchar, threads, dynamic library
#

#
# exfat-utils needs a toolchain w/ largefile, wchar
#

#
# f2fs-tools needs a toolchain w/ largefile, wchar
#

#
# flashbench needs a toolchain w/ largefile
#

#
# genext2fs needs a toolchain w/ largefile
#
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_KOBS_NG is not set
# BR2_PACKAGE_MAKEDEVS is not set

#
# mmc-utils needs a toolchain w/ largefile, headers >= 3.0
#
# BR2_PACKAGE_MTD is not set

#
# mtools needs a toolchain w/ wchar
#

#
# nfs-utils needs a toolchain w/ largefile, threads
#

#
# ntfs-3g needs a toolchain w/ largefile, wchar, threads
#

#
# simicsfs needs a Linux kernel to be built
#

#
# squashfs needs a toolchain w/ largefile, threads
#

#
# sshfs needs a toolchain w/ largefile, wchar, threads, dynamic library
#
# BR2_PACKAGE_SUNXI_TOOLS is not set

#
# unionfs needs a toolchain w/ largefile, threads, dynamic library
#

#
# xfsprogs needs a toolchain w/ largefile, wchar
#

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_LBREAKOUT2 is not set
# BR2_PACKAGE_LTRIS is not set
# BR2_PACKAGE_OPENTYRIAN is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# Graphic applications
#
# BR2_PACKAGE_FSWEBCAM is not set
# BR2_PACKAGE_GNUPLOT is not set

#
# jhead needs a toolchain w/ wchar
#

#
# rrdtool needs a toolchain w/ wchar
#

#
# Graphic libraries
#

#
# cegui06 needs a toolchain w/ C++, threads, dynamic library
#

#
# directfb needs a toolchain w/ C++, threads
#
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FB_TEST_APP is not set

#
# fbterm needs a toolchain w/ C++, wchar, locale
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set

#
# linux-fusion needs a Linux kernel to be built
#

#
# mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL
#

#
# ocrad needs a toolchain w/ C++
#

#
# psplash needs a toolchain w/ wchar
#
# BR2_PACKAGE_SDL is not set

#
# Other GUIs
#

#
# EFL needs a toolchain w/ wchar
#

#
# qt needs a toolchain w/ C++, threads
#
BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y

#
# Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++
#

#
# weston needs udev and a toolchain w/ threads, headers >= 3.0
#

#
# X.org needs a toolchain w/ wchar, threads, dynamic library
#

#
# X applications
#

#
# midori needs libgtk2 and a toolchain w/ C++, wchar, threads
#

#
# X libraries and helper libraries
#
# BR2_PACKAGE_DEJAVU is not set
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_XKEYBOARD_CONFIG is not set

#
# X window managers
#

#
# Hardware handling
#

#
# Firmware
#
# BR2_PACKAGE_AM33X_CM3 is not set
# BR2_PACKAGE_B43_FIRMWARE is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_RPI_FIRMWARE is not set
# BR2_PACKAGE_SUNXI_BOARDS is not set
# BR2_PACKAGE_UX500_FIRMWARE is not set
# BR2_PACKAGE_ZD1211_FIRMWARE is not set

#
# a10disp needs a Linux kernel to be built
#
# BR2_PACKAGE_AVRDUDE is not set

#
# cdrkit needs a toolchain w/ largefile
#

#
# cryptsetup needs a toolchain w/ largefile, wchar, threads, dynamic library
#
# BR2_PACKAGE_DBUS is not set

#
# dmraid needs a toolchain w/ largefile, threads, dynamic library
#

#
# dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3
#

#
# dvbsnoop needs a toolchain w/ largefile
#
# BR2_PACKAGE_DTV_SCAN_TABLES is not set
# BR2_PACKAGE_EEPROG is not set

#
# eudev needs eudev /dev management
#

#
# eudev needs a toolchain w/ largefile, wchar, dynamic library
#
# BR2_PACKAGE_EVEMU is not set
# BR2_PACKAGE_EVTEST is not set
# BR2_PACKAGE_FAN_CTRL is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_FMTOOLS is not set
# BR2_PACKAGE_FREESCALE_IMX is not set
# BR2_PACKAGE_FXLOAD is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GPM is not set
# BR2_PACKAGE_GPSD is not set

#
# gptfdisk needs a toolchain w/ largefile, wchar, C++
#

#
# gvfs needs a toolchain w/ largefile, wchar, threads
#
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LCDPROC is not set
# BR2_PACKAGE_LM_SENSORS is not set

#
# lshw needs a toolchain w/ C++, largefile, wchar
#
# BR2_PACKAGE_LSUIO is not set

#
# lvm2 needs a toolchain w/ largefile, threads, dynamic library
#
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEDIA_CTL is not set

#
# memtester needs a toolchain w/ largefile
#

#
# minicom needs a toolchain w/ wchar
#
# BR2_PACKAGE_NANOCOM is not set

#
# neard needs a toolchain w/ wchar, threads
#

#
# ofono needs a toolchain w/ wchar, threads
#

#
# ola needs a toolchain w/ C++, threads, largefile, wchar
#

#
# on2-8170-modules needs a Linux kernel to be built
#
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set

#
# owl-linux needs a Linux kernel to be built
#

#
# parted needs a toolchain w/ largefile, wchar
#
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set

#
# pifmrds needs a toolchain w/ largefile
#
# BR2_PACKAGE_RNG_TOOLS is not set

#
# rpi-userland needs a toolchain w/ C++, largefile, threads
#
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set

#
# sg3-utils needs a toolchain w/ largefile, threads
#

#
# sispmctl needs a toolchain w/ threads, wchar
#

#
# smartmontools needs a toolchain w/ C++
#

#
# smstools3 needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_SNOWBALL_HDMISERVICE is not set
# BR2_PACKAGE_SREDIRD is not set
# BR2_PACKAGE_STATSERIAL is not set

#
# sunxi-cedarx needs an (e)glibc toolchain
#

#
# sunxi-mali needs an (e)glibc toolchain
#
# BR2_PACKAGE_SYSSTAT is not set

#
# ti-gfx needs an (e)glibc toolchain and a Linux kernel to be built
#
# BR2_PACKAGE_TI_UIM is not set
# BR2_PACKAGE_TI_UTILS is not set
# BR2_PACKAGE_UBOOT_TOOLS is not set

#
# udisks needs udev /dev management
#

#
# udisks needs a toolchain w/ wchar, threads, dynamic library
#
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USB_MODESWITCH_DATA is not set

#
# usbmount requires udev to be enabled
#
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_W_SCAN is not set
# BR2_PACKAGE_WIPE is not set

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_ENSCRIPT is not set
# BR2_PACKAGE_ERLANG is not set
# BR2_PACKAGE_HASERL is not set

#
# jamvm needs a toolchain w/ IPv6
#
# BR2_PACKAGE_JIMTCL is not set
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_LUAJIT is not set

#
# nodejs needs a toolchain w/ C++, IPv6, largefile, threads
#
# BR2_PACKAGE_PERL is not set
# BR2_PACKAGE_PHP is not set

#
# python needs a toolchain w/ wchar
#

#
# python3 needs a toolchain w/ wchar
#

#
# ruby needs a toolchain w/ wchar, threads
#

#
# tcl needs a toolchain w/ ipv6, threads
#

#
# Libraries
#

#
# Audio/Sound
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# audiofile needs a toolchain w/ C++
#
# BR2_PACKAGE_CELT051 is not set

#
# fdk-aac needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBLO is not set
# BR2_PACKAGE_LIBMAD is not set

#
# libmodplug needs a toolchain w/ C++
#

#
# libmpd needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBMPDCLIENT is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set

#
# libsndfile needs a toolchain w/ largefile
#
# BR2_PACKAGE_LIBSOXR is not set
# BR2_PACKAGE_LIBVORBIS is not set

#
# opencore-amr needs a toolchain w/ C++
#
# BR2_PACKAGE_OPUS is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_SPEEX is not set

#
# taglib needs a toolchain w/ C++, wchar
#
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_VO_AACENC is not set

#
# webrtc-audio-processing needs a toolchain w/ C++, threads
#

#
# Compression and decompression
#

#
# libarchive needs a toolchain w/ wchar
#
# BR2_PACKAGE_LZO is not set

#
# snappy needs a toolchain w/ C++
#
# BR2_PACKAGE_ZLIB is not set

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_CA_CERTIFICATES is not set

#
# cryptodev needs a Linux kernel to be built
#

#
# gnutls needs a toolchain w/ wchar
#
# BR2_PACKAGE_LIBASSUAN is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBGPGME is not set
# BR2_PACKAGE_LIBKSBA is not set
# BR2_PACKAGE_LIBMCRYPT is not set
# BR2_PACKAGE_LIBMHASH is not set

#
# libnss needs a toolchain w/ largefile, threads
#

#
# libsecret needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBSHA1 is not set
# BR2_PACKAGE_LIBSSH2 is not set
# BR2_PACKAGE_NETTLE is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_POLARSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_GDBM is not set

#
# MySQL needs a toolchain w/ C++, threads
#

#
# postgresql needs a toolchain w/ glibc
#

#
# redis needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_SQLCIPHER is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#

#
# gamin needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set

#
# libfuse needs a toolchain w/ largefile, threads, dynamic library
#
# BR2_PACKAGE_LIBLOCKFILE is not set

#
# libnfs needs a toolchain w/ RPC and LARGEFILE
#
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKDEV is not set

#
# Graphics
#

#
# atk needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_GD is not set

#
# gdk-pixbuf needs a toolchain w/ wchar, threads
#

#
# harfbuzz needs a toolchain w/ C++
#
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JASPER is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LCMS2 is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBDMTX is not set

#
# libdrm needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set

#
# libglew depends on X.org and needs an OpenGL backend
#

#
# libglu needs an OpenGL backend
#
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBQRENCODE is not set

#
# libraw needs a toolchain w/ C++
#

#
# librsvg needs a toolchain w/ wchar, threads, C++
#
# BR2_PACKAGE_LIBSVG is not set
# BR2_PACKAGE_LIBSVG_CAIRO is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set

#
# libva needs a toolchain w/ largefile, threads, dynamic library
#

#
# opencv needs a toolchain w/ C++, NPTL, wchar
#

#
# pango needs a toolchain w/ wchar, threads, C++
#
# BR2_PACKAGE_PIXMAN is not set

#
# poppler needs a toolchain w/ C++, threads
#
# BR2_PACKAGE_TIFF is not set
# BR2_PACKAGE_WAYLAND is not set
BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS=y

#
# webkit needs libgtk2 and a toolchain w/ C++, wchar, threads
#
# BR2_PACKAGE_WEBP is not set

#
# zxing needs a toolchain w/ C++
#

#
# Hardware handling
#
# BR2_PACKAGE_CCID is not set
# BR2_PACKAGE_DTC is not set

#
# lcdapi needs a toolchain w/ C++, threads
#
# BR2_PACKAGE_LIBAIO is not set

#
# libatasmart requires udev to be enabled
#

#
# libcec needs a toolchain w/ C++, wchar, threads, dynamic library
#
# BR2_PACKAGE_LIBFREEFARE is not set
# BR2_PACKAGE_LIBFTDI is not set
# BR2_PACKAGE_LIBHID is not set

#
# libinput needs udev /dev management
#
# BR2_PACKAGE_LIBIQRF is not set
# BR2_PACKAGE_LIBLLCP is not set

#
# libmbim needs udev /dev management and a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBNFC is not set

#
# libqmi needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBRTLSDR is not set

#
# libserial needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBSOC is not set
# BR2_PACKAGE_LIBUSB is not set

#
# libv4l needs a toolchain w/ largefile, threads and C++
#
# BR2_PACKAGE_LIBXKBCOMMON is not set
# BR2_PACKAGE_MTDEV is not set

#
# ne10 needs a toolchain w/ neon
#

#
# neardal needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_PCSC_LITE is not set
# BR2_PACKAGE_TSLIB is not set

#
# urg needs a toolchain w/ C++
#

#
# Javascript
#
# BR2_PACKAGE_EXPLORERCANVAS is not set
# BR2_PACKAGE_FLOT is not set
# BR2_PACKAGE_JQUERY is not set
# BR2_PACKAGE_JQUERY_KEYBOARD is not set
# BR2_PACKAGE_JQUERY_MOBILE is not set
# BR2_PACKAGE_JQUERY_SPARKLINE is not set
# BR2_PACKAGE_JQUERY_UI is not set
# BR2_PACKAGE_JQUERY_VALIDATION is not set
# BR2_PACKAGE_JSMIN is not set
# BR2_PACKAGE_JSON_JAVASCRIPT is not set

#
# JSON/XML
#
# BR2_PACKAGE_CJSON is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JANSSON is not set
# BR2_PACKAGE_JSON_C is not set

#
# json-glib needs a toolchain w/ wchar, threads
#

#
# libjson needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set

#
# libxml++ needs a toolchain w/ C++, wchar, threads
#
# BR2_PACKAGE_LIBXMLRPC is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set
# BR2_PACKAGE_RAPIDJSON is not set

#
# tinyxml needs a toolchain w/ C++
#

#
# xerces-c++ needs a toolchain w/ C++, wchar
#
# BR2_PACKAGE_YAJL is not set

#
# Logging
#
# BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
# BR2_PACKAGE_LIBLOGGING is not set

#
# log4cplus needs a toolchain w/ C++, wchar, threads
#

#
# log4cxx needs a toolchain w/ C++, threads, dynamic library
#

#
# zlog needs a toolchain w/ threads, largefile, dynamic library
#

#
# Multimedia
#
# BR2_PACKAGE_LIBASS is not set
# BR2_PACKAGE_LIBBLURAY is not set

#
# libdvbsi++ needs a toolchain w/ C++, wchar, threads
#

#
# libdvdnav needs a toolchain w/ dynamic library, largefile, threads
#

#
# libdvdread needs a toolchain w/ dynamic library, largefile
#

#
# libebml needs a toolchain w/ C++
#

#
# libfslcodec needs an (e)glibc toolchain
#
# BR2_PACKAGE_LIBFSLPARSER is not set

#
# libfslvpuwrap needs an imx-specific Linux kernel to be built
#

#
# libmatroska needs a toolchain w/ C++
#

#
# libmms needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set

#
# libplayer needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_LIBTHEORA is not set

#
# live555 needs a toolchain w/ C++
#

#
# mediastreamer needs a toolchain w/ threads, C++, IPv6
#

#
# Networking
#

#
# agent++ needs a toolchain w/ threads, C++, dynamic library
#
# BR2_PACKAGE_C_ARES is not set

#
# cppzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#

#
# czmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#

#
# filemq needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#
# BR2_PACKAGE_FLICKCURL is not set
# BR2_PACKAGE_GEOIP is not set

#
# glib-networking needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBFCGI is not set
# BR2_PACKAGE_LIBGSASL is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBISCSI is not set
# BR2_PACKAGE_LIBMBUS is not set

#
# libmemcached needs a toolchain w/ C++, threads
#
# BR2_PACKAGE_LIBMICROHTTPD is not set

#
# libmnl needs a toolchain w/ largefile
#
# BR2_PACKAGE_LIBMODBUS is not set

#
# libndp needs a toolchain w/ IPv6
#

#
# libnetfilter_acct needs a toolchain w/ largefile
#

#
# libnetfilter_conntrack needs a toolchain w/ largefile
#

#
# libnetfilter_cthelper needs a toolchain w/ largefile
#

#
# libnetfilter_cttimout needs a toolchain w/ largefile
#
# BR2_PACKAGE_LIBNETFILTER_LOG is not set

#
# libnetfilter_queue needs a toolchain w/ largefile, IPv6
#
# BR2_PACKAGE_LIBNFNETLINK is not set

#
# libnftnl needs a toolchain w/ threads, IPv6, largefile
#
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBOAUTH is not set

#
# liboping needs a toolchain w/ IPv6
#
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOCKETCAN is not set

#
# libshairplay needs a toolchain w/ IPv6, threads
#

#
# libsoup needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_LIBSTROPHE is not set
# BR2_PACKAGE_LIBTIRPC is not set

#
# libtorrent needs a toolchain w/ C++, threads
#

#
# libupnp needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_LIBVNCSERVER is not set
# BR2_PACKAGE_LIBWEBSOCKETS is not set
# BR2_PACKAGE_NEON is not set

#
# omniORB needs a toolchain w/ C++, threads
#

#
# openpgm needs a toolchain w/ wchar, threads, IPv6
#
# BR2_PACKAGE_ORTP is not set
# BR2_PACKAGE_QDECODER is not set
# BR2_PACKAGE_RTMPDUMP is not set
# BR2_PACKAGE_SLIRP is not set

#
# snmp++ needs a toolchain w/ threads, C++, dynamic library
#

#
# thrift needs a toolchain w/ C++, largefile, wchar, threads
#
# BR2_PACKAGE_USBREDIR is not set

#
# wvstreams needs a toolchain w/ C++, largefile
#

#
# zeromq needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#

#
# zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#

#
# zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads
#

#
# Other
#
# BR2_PACKAGE_APR is not set
# BR2_PACKAGE_APR_UTIL is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set

#
# armadillo needs a toolchain w/ C++, largefile
#

#
# boost needs a toolchain w/ C++, largefile, threads
#

#
# cblas/clapack needs a toolchain w/ largefile
#

#
# cppcms needs a toolchain w/ C++, NPTL, dynamic library
#

#
# eigen needs a toolchain w/ C++
#

#
# elfutils needs a toolchain w/ largefile, wchar
#
# BR2_PACKAGE_FFTW is not set

#
# flann needs a toolchain w/ C++, dynamic library
#

#
# glibmm needs a toolchain w/ C++, wchar, threads
#
# BR2_PACKAGE_GMP is not set
# BR2_PACKAGE_GSL is not set

#
# gtest needs a toolchain w/ C++, wchar, threads
#
# BR2_PACKAGE_LIBARGTABLE2 is not set
BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS=y
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBCAP_NG is not set

#
# libcgroup needs an (e)glibc toolchain w/ C++
#
# BR2_PACKAGE_LIBCOFI is not set
BR2_PACKAGE_LIBDAEMON=y
# BR2_PACKAGE_LIBEE is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEV is not set
# BR2_PACKAGE_LIBEVDEV is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_LIBGC is not set

#
# libglib2 needs a toolchain w/ wchar, threads
#

#
# libical needs a toolchain w/ wchar
#
BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT=y

#
# libnspr needs a toolchain w/ largefile, threads
#
# BR2_PACKAGE_LIBPFM4 is not set

#
# libplist needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBPTHREAD_STUBS is not set
# BR2_PACKAGE_LIBPTHSEM is not set

#
# libsigc++ needs a toolchain w/ C++
#
# BR2_PACKAGE_LIBSIGSEGV is not set
# BR2_PACKAGE_LIBTASN1 is not set
# BR2_PACKAGE_LIBTPL is not set
# BR2_PACKAGE_LIBUBOX is not set
# BR2_PACKAGE_LIBUCI is not set
# BR2_PACKAGE_LIBURCU is not set

#
# libuv needs a toolchain w/ IPv6, threads
#

#
# linux-pam needs a toolchain w/ wchar, locale
#

#
# lttng-libust needs a toolchain w/ wchar, largefile, threads
#
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPDECIMAL is not set
# BR2_PACKAGE_MPFR is not set

#
# msgpack needs a toolchain w/ C++
#
# BR2_PACKAGE_MTDEV2TUIO is not set
# BR2_PACKAGE_ORC is not set
# BR2_PACKAGE_P11_KIT is not set

#
# poco needs a toolchain w/ wchar, threads, C++
#

#
# protobuf needs a toolchain w/ C++, threads
#

#
# protobuf-c needs a toolchain w/ C++, threads
#

#
# schifra needs a toolchain w/ C++
#

#
# Security
#
# BR2_PACKAGE_LIBSEPOL is not set

#
# Text and terminal handling
#

#
# enchant needs a toolchain w/ C++, threads, wchar
#

#
# icu needs a toolchain w/ C++, wchar, threads
#

#
# libedit needs a toolchain w/ wchar
#
# BR2_PACKAGE_LIBENCA is not set
# BR2_PACKAGE_LIBESTR is not set
# BR2_PACKAGE_LIBFRIBIDI is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LINENOISE is not set
# BR2_PACKAGE_NCURSES is not set

#
# newt needs a toolchain w/ wchar
#
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# tclap needs a toolchain w/ C++
#

#
# Miscellaneous
#
# BR2_PACKAGE_AESPIPE is not set
# BR2_PACKAGE_BC is not set

#
# collectd needs a toolchain w/ IPv6, threads, dynamic library
#
# BR2_PACKAGE_EMPTY is not set
# BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
# BR2_PACKAGE_HAVEGED is not set
# BR2_PACKAGE_MCRYPT is not set
# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set

#
# shared-mime-info needs a toolchain w/ wchar, threads
#

#
# snowball-init needs a toolchain w/ wchar, threads, dynamic library
#
# BR2_PACKAGE_SOUND_THEME_BOREALIS is not set
# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set

#
# Mail
#
# BR2_PACKAGE_EXIM is not set
# BR2_PACKAGE_FETCHMAIL is not set
# BR2_PACKAGE_HEIRLOOM_MAILX is not set
# BR2_PACKAGE_LIBESMTP is not set
# BR2_PACKAGE_MSMTP is not set

#
# mutt needs a toolchain w/ wchar
#

#
# Networking applications
#

#
# aiccu needs a toolchain w/ IPv6, wchar, threads
#

#
# aircrack-ng needs a toolchain w/ largefile, threads
#

#
# argus needs a toolchain w/ threads, IPv6
#
# BR2_PACKAGE_ARPTABLES is not set

#
# atftp needs a toolchain w/ threads, IPv6
#
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_AUTOIPD=y
# BR2_PACKAGE_AVAHI_DAEMON is not set
# BR2_PACKAGE_AXEL is not set

#
# bcusdk needs a toolchain w/ C++
#

#
# bind needs a toolchain w/ largefile, IPv6
#

#
# bluez-utils needs a toolchain w/ wchar, threads, dynamic library
#
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CAN_UTILS is not set
# BR2_PACKAGE_CHRONY is not set
# BR2_PACKAGE_CIVETWEB is not set

#
# connman needs a toolchain w/ IPv6, wchar, threads, resolver
#

#
# conntrack-tools needs a toolchain w/ IPv6, largefile, threads
#
# BR2_PACKAGE_CRDA is not set

#
# ctorrent needs a toolchain w/ C++
#
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCPCD is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set

#
# ebtables needs a toolchain w/ IPv6
#
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_FAIFA is not set
# BR2_PACKAGE_FPING is not set

#
# gesftpserver needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_HIAWATHA is not set
# BR2_PACKAGE_HOSTAPD is not set

#
# httping needs a toolchain w/ wchar
#

#
# iftop needs a toolchain w/ IPv6, threads
#

#
# igh-ethercat needs a Linux kernel to be built
#

#
# igmpproxy needs a toolchain w/ wchar
#
# BR2_PACKAGE_INADYN is not set

#
# iperf needs a toolchain w/ C++
#
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set

#
# ipset needs a toolchain w/ largefile
#
# BR2_PACKAGE_IPTABLES is not set

#
# iptraf-ng needs a toolchain w/ IPv6
#
# BR2_PACKAGE_IPUTILS is not set
# BR2_PACKAGE_IW is not set

#
# kismet needs a toolchain w/ threads, C++
#
# BR2_PACKAGE_KNOCK is not set

#
# lftp requires a toolchain w/ C++, wchar
#
# BR2_PACKAGE_LIGHTTPD is not set

#
# linknx needs a toolchain w/ C++
#
# BR2_PACKAGE_LINKS is not set

#
# linphone needs a toolchain w/ threads, C++, IPv6
#
# BR2_PACKAGE_LINUX_ZIGBEE is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MACCHANGER is not set
# BR2_PACKAGE_MEMCACHED is not set
# BR2_PACKAGE_MII_DIAG is not set

#
# minidlna needs a toolchain w/ largefile, IPv6, threads, wchar
#

#
# modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6
#

#
# mongoose needs a toolchain w/ threads, largefile
#

#
# mongrel2 needs a toolchain w/ C++, IPv6, threads, largefile, wchar
#
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MTR is not set

#
# nbd needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_NCFTP is not set

#
# ndisc6 needs a toolchain w/ IPv6
#
# BR2_PACKAGE_NETATALK is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads, headers >= 3.7
#

#
# nfacct needs a toolchain w/ largefile
#

#
# nftables needs a toolchain w/ IPv6, largefile, threads, wchar, headers >= 3.4
#
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set

#
# nmap needs a toolchain w/ C++, IPv6, threads
#
# BR2_PACKAGE_NOIP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set

#
# olsr needs a toolchain w/ IPv6, threads
#
# BR2_PACKAGE_OPENNTPD is not set

#
# openobex needs a toolchain w/ IPv6
#
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSWAN is not set

#
# openvpn needs a toolchain w/ IPv6
#
# BR2_PACKAGE_P910ND is not set

#
# portmap needs a toolchain w/ RPC
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_PROXYCHAINS_NG is not set
# BR2_PACKAGE_PTPD is not set
# BR2_PACKAGE_PTPD2 is not set
# BR2_PACKAGE_QUAGGA is not set

#
# radvd needs a toolchain w/ IPv6
#
# BR2_PACKAGE_RPCBIND is not set
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set

#
# rtorrent needs a toolchain w/ C++, threads, wchar
#
# BR2_PACKAGE_RTPTOOLS is not set
# BR2_PACKAGE_SAMBA is not set

#
# samba4 needs a toolchain w/ IPv6, wchar, largfile, threads
#

#
# sconeserver needs a toolchain w/ C++, NPTL
#

#
# ser2net needs a toolchain w/ IPv6
#

#
# smcroute needs a toolchain w/ IPv6
#
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SOCKETCAND is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# spice server needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_SPICE_PROTOCOL is not set

#
# squid needs a toolchain w/ C++, IPv6
#
# BR2_PACKAGE_SSHPASS is not set
# BR2_PACKAGE_STRONGSWAN is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPING is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set

#
# transmission needs a toolchain w/ IPv6, threads
#

#
# tvheadend needs a toolchain w/ largefile, IPv6, NPTL, headers >= 3.2
#

#
# udpcast needs a toolchain w/ largefile, threads
#

#
# ulogd needs a toolchain w/ IPv6, largefile, dynamic library
#

#
# ushare needs a toolchain w/ largefile, threads
#

#
# ussp-push needs a toolchain w/ wchar, IPv6, threads, dynamic library
#
# BR2_PACKAGE_VDE2 is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WIRELESS_REGDB is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set

#
# wireshark needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# wvdial needs a toolchain w/ C++, largefile
#
# BR2_PACKAGE_XINETD is not set
# BR2_PACKAGE_XL2TP is not set

#
# znc needs a toolchain w/ C++
#

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_OPKG is not set

#
# Real-Time
#
# BR2_PACKAGE_XENOMAI is not set

#
# Shell and utilities
#

#
# Shells
#

#
# Utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_CCRYPT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_DTACH is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GNUPG is not set
# BR2_PACKAGE_GNUPG2 is not set

#
# inotify-tools needs a toolchain w/ largefile
#
# BR2_PACKAGE_LOCKFILE_PROGS is not set

#
# logrotate needs a toolchain w/ wchar
#
# BR2_PACKAGE_LOGSURFER is not set
# BR2_PACKAGE_PINENTRY is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_TMUX is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#

#
# acl needs a toolchain w/ largefile
#

#
# attr needs a toolchain w/ largefile
#
# BR2_PACKAGE_CPULOAD is not set

#
# ftop needs a toolchain w/ largefile
#
# BR2_PACKAGE_HTOP is not set
# BR2_PACKAGE_IPRUTILS is not set
# BR2_PACKAGE_KEYUTILS is not set
# BR2_PACKAGE_KMOD is not set

#
# lxc needs a toolchain w/ IPv6, threads, largefile
#
# BR2_PACKAGE_MONIT is not set
# BR2_PACKAGE_NCDU is not set

#
# nut needs a toolchain w/ C++
#

#
# polkit needs a toolchain w/ wchar, threads
#
# BR2_PACKAGE_PWGEN is not set

#
# quota needs a toolchain w/ largefile, wchar, threads
#
# BR2_PACKAGE_SMACK is not set

#
# supervisor needs the python interpreter
#
BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y

#
# util-linux needs a toolchain w/ largefile, wchar
#

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_JOE is not set

#
# nano needs a toolchain w/ wchar
#
# BR2_PACKAGE_UEMACS is not set

#
# Filesystem images
#
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_EXT2 is not set

#
# initramfs needs a Linux kernel to be built
#
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_ROMFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
# BR2_TARGET_ROOTFS_TAR_LZO is not set
# BR2_TARGET_ROOTFS_TAR_XZ is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_YAFFS2 is not set

#
# Bootloaders
#
# BR2_TARGET_AT91BOOTSTRAP is not set
# BR2_TARGET_AT91BOOTSTRAP3 is not set
# BR2_TARGET_AT91DATAFLASHBOOT is not set
# BR2_TARGET_BAREBOX is not set

#
# gummiboot needs a toolchain w/ largefile, wchar
#
# BR2_TARGET_LPC32XXCDL is not set
# BR2_TARGET_MXS_BOOTLETS is not set
# BR2_TARGET_UBOOT is not set

#
# Host utilities
#
# BR2_PACKAGE_HOST_DFU_UTIL is not set
# BR2_PACKAGE_HOST_DOSFSTOOLS is not set
# BR2_PACKAGE_HOST_E2FSPROGS is not set
# BR2_PACKAGE_HOST_E2TOOLS is not set
# BR2_PACKAGE_HOST_GENEXT2FS is not set
# BR2_PACKAGE_HOST_GENIMAGE is not set
# BR2_PACKAGE_HOST_GENPART is not set
# BR2_PACKAGE_HOST_LPC3250LOADER is not set
# BR2_PACKAGE_HOST_MTD is not set
# BR2_PACKAGE_HOST_MTOOLS is not set
# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set
# BR2_PACKAGE_HOST_OPENOCD is not set
# BR2_PACKAGE_HOST_PARTED is not set
# BR2_PACKAGE_HOST_PWGEN is not set
# BR2_PACKAGE_HOST_SAM_BA is not set
# BR2_PACKAGE_HOST_SQUASHFS is not set
# BR2_PACKAGE_HOST_SUNXI_TOOLS is not set
# BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
# BR2_PACKAGE_HOST_UTIL_LINUX is not set

#
# Legacy config options
#

#
# Legacy options removed in 2014.08
#
# BR2_KERNEL_HEADERS_3_8 is not set
# BR2_PACKAGE_GETTEXT_TOOLS is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
# BR2_BINUTILS_VERSION_2_21 is not set
# BR2_BINUTILS_VERSION_2_23_1 is not set
# BR2_UCLIBC_VERSION_0_9_32 is not set
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_6_X is not set
# BR2_GDB_VERSION_7_4 is not set
# BR2_GDB_VERSION_7_5 is not set
# BR2_BUSYBOX_VERSION_1_19_X is not set
# BR2_BUSYBOX_VERSION_1_20_X is not set
# BR2_BUSYBOX_VERSION_1_21_X is not set
# BR2_PACKAGE_LIBV4L_DECODE_TM6000 is not set
# BR2_PACKAGE_LIBV4L_IR_KEYTABLE is not set
# BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE is not set
# BR2_PACKAGE_LIBV4L_V4L2_CTL is not set
# BR2_PACKAGE_LIBV4L_V4L2_DBG is not set

#
# Legacy options removed in 2014.05
#
# BR2_PACKAGE_EVTEST_CAPTURE is not set
# BR2_KERNEL_HEADERS_3_6 is not set
# BR2_KERNEL_HEADERS_3_7 is not set
# BR2_PACKAGE_VALA is not set
BR2_PACKAGE_TZDATA_ZONELIST=""
# BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE is not set
# BR2_PACKAGE_LUA_INTERPRETER_READLINE is not set
# BR2_PACKAGE_LUA_INTERPRETER_LINENOISE is not set
# BR2_PACKAGE_DVB_APPS_UTILS is not set
# BR2_KERNEL_HEADERS_SNAP is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_UDEV_RULES_GEN is not set
# BR2_PACKAGE_UDEV_ALL_EXTRAS is not set

#
# Legacy options removed in 2014.02
#
# BR2_sh2 is not set
# BR2_sh3 is not set
# BR2_sh3eb is not set
# BR2_KERNEL_HEADERS_3_1 is not set
# BR2_KERNEL_HEADERS_3_3 is not set
# BR2_KERNEL_HEADERS_3_5 is not set
# BR2_GDB_VERSION_7_2 is not set
# BR2_GDB_VERSION_7_3 is not set
# BR2_PACKAGE_CCACHE is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_XSTROKE is not set
# BR2_PACKAGE_LZMA is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_LIBNFC_LLCP is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQUASHFS3 is not set
# BR2_TARGET_ROOTFS_SQUASHFS3 is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_LUASQL is not set
# BR2_PACKAGE_LUACJSON is not set

#
# Legacy options removed in 2013.11
#
# BR2_PACKAGE_LVM2_DMSETUP_ONLY is not set
# BR2_PACKAGE_QT_JAVASCRIPTCORE is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL=""
BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION=""
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL=""
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION=""

#
# Legacy options removed in 2013.08
#
# BR2_ARM_OABI is not set
# BR2_PACKAGE_DOSFSTOOLS_DOSFSCK is not set
# BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL is not set
# BR2_PACKAGE_DOSFSTOOLS_MKDOSFS is not set
# BR2_ELF2FLT is not set
# BR2_VFP_FLOAT is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_HAVE_DEVFILES is not set

#
# Legacy options removed in 2013.05
#
# BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192 is not set
# BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712 is not set

#
# Legacy options removed in 2013.02
#
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_PACKAGE_GDISK is not set
# BR2_PACKAGE_GDISK_GDISK is not set
# BR2_PACKAGE_GDISK_SGDISK is not set
# BR2_PACKAGE_GDB_HOST is not set
# BR2_PACKAGE_DIRECTB_DITHER_RGB16 is not set
# BR2_PACKAGE_DIRECTB_TESTS is not set

#
# Legacy options removed in 2012.11
#
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set
# BR2_PACKAGE_PTHREAD_STUBS is not set

#
# Legacy options removed in 2012.08
#
# BR2_PACKAGE_GETTEXT_STATIC is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_INPUT_TOOLS_EVTEST is not set
# BR2_BFIN_FDPIC is not set
# BR2_BFIN_FLAT is not set
