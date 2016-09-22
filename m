From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Sep 2016 20:06:29 +0000
Subject: [Buildroot] [Bug 9296] New: Buildroot Fails on applying patches
Message-ID: <bug-9296-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9296

            Bug ID: 9296
           Summary: Buildroot Fails on applying patches
           Product: buildroot
           Version: 2016.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: godtec at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6726
  --> https://bugs.busybox.net/attachment.cgi?id=6726&action=edit
.config file for buildroot

When I compile buildroot for ARM Altera SOC I get the following error.


5 min of debugging INFO ........... then....


Applying 0001-uclinux.patch using patch: 
patching file configure.ac
>>> libmnl 1.0.3 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/build/libmnl-1.0.3
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> libmnl 1.0.3 Configuring
>>> libmnl 1.0.3 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
Unescaped left brace in regex is deprecated, passed through in regex; marked by
<-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/ at
/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/automake
line 3936.
configure.ac:13: installing 'build-aux/compile'
configure.ac:8: installing 'build-aux/missing'
examples/genl/Makefile.am: installing 'build-aux/depcomp'
>>> libmnl 1.0.3 Patching libtool

Applying buildroot-libtool-v2.2.patch using patch: 
patching file ltmain.sh
Hunk #1 succeeded at 1048 (offset -166 lines).
Hunk #2 succeeded at 2018 (offset -221 lines).
Hunk #3 succeeded at 4117 (offset -315 lines).
Hunk #4 succeeded at 4127 (offset -315 lines).
Hunk #5 succeeded at 4404 (offset -320 lines).
Hunk #6 succeeded at 4669 (offset -325 lines).
Hunk #7 succeeded at 5414 (offset -324 lines).
Hunk #8 succeeded at 5572 (offset -324 lines).
Hunk #9 succeeded at 8064 (offset -314 lines).

Applying buildroot-libtool-v2.4.4.patch using patch: 
patching file ltmain.sh
Hunk #1 succeeded at 2694 (offset 7 lines).
Hunk #2 succeeded at 4284 (offset 7 lines).
Hunk #3 succeeded at 6579 (offset 25 lines).
Hunk #4 succeeded at 6589 (offset 25 lines).
Hunk #5 succeeded at 6882 (offset 25 lines).
Hunk #6 succeeded at 7174 (offset 25 lines).
Hunk #7 succeeded at 8140 (offset 28 lines).
Hunk #8 succeeded at 10769 (offset 59 lines).
(cd
/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/build/libmnl-1.0.3/
&& rm -rf config.cache &&
PATH="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/bin:/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/sbin:/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin:/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/sbin:/home/mikek/altera_lite/15.1/embedded/host_tools/mentor/gnu/arm/baremetal/bin:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/preloadergen:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/mkimage:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/mkpimage:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/device_tree:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/diskutils:/home/mikek/altera_lite/15.1/embedded/host_tools/altera/secureboot:/home/mikek/altera_lite/15.1/embedded/host_tools/gnu/dtc:/home/mikek/altera_lite/15.1/embedded/ds-5/sw/gcc/bin:/home/mikek/altera_lite/15.1/embedded/ds-5/sw/ARMCompiler5.05u2/bin:/home/mikek/altera_lite/15.1/embedded/ds-5/bin:/home/mikek/altera_lite/15.1/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin:/home/mikek/altera_lite/15.1/nios2eds/sdk2/bin:/home/mikek/altera_lite/15.1/nios2eds/bin:/home/mikek/altera_lite/15.1/quartus/bin:/home/mikek/altera_lite/15.1/quartus/sopc_builder/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
AR="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-ar"
AS="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-as"
LD="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-ld"
NM="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-nm"
CC="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc"
GCC="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc"
CPP="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-cpp"
CXX="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-g++"
FC="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gfortran"
RANLIB="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-ranlib"
READELF="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-readelf"
STRIP="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-strip"
OBJCOPY="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-objcopy"
OBJDUMP="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/lib
-L/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/lib
-Wl,-rpath,/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-as"
DEFAULT_LINKER="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/arm-linux-gnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/ARM-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes
ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no   CONFIG_SITE=/dev/null ./configure
--target=ARM-buildroot-linux-gnueabihf --host=ARM-buildroot-linux-gnueabihf
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --localstatedir=/var --program-prefix="" --disable-gtk-doc
--disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation
--with-xmlto=no --with-fop=no --disable-dependency-tracking --enable-ipv6 
--disable-static --enable-shared   )
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-ipv6
checking build system type... x86_64-unknown-linux-gnu
checking host system type... Invalid configuration
`ARM-buildroot-linux-gnueabihf': machine `ARM-buildroot' not recognized
configure: error: /bin/bash build-aux/config.sub ARM-buildroot-linux-gnueabihf
failed
make[1]: ***
[/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/build/libmnl-1.0.3/.stamp_configured]
Error 1
make: *** [_all] Error 2
make: Leaving directory
`/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot'
mikek at mike-M6700:~/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software$ 





Then After running the make command again:

 make -C buildroot/ BR2_TOOLCHAIN_EXTERNAL_PATH=$(pwd)/toolchain ARCH=ARM all
make: Entering directory
`/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot'
>>> libmnl 1.0.3 Configuring
>>> libmnl 1.0.3 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
Unescaped left brace in regex is deprecated, passed through in regex; marked by
<-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/ at
/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/host/usr/bin/automake
line 3936.
configure.ac:13: installing 'build-aux/compile'
configure.ac:8: installing 'build-aux/missing'
examples/genl/Makefile.am: installing 'build-aux/depcomp'
>>> libmnl 1.0.3 Patching libtool

Applying buildroot-libtool-v2.4.4.patch using patch: 
patching file ltmain.sh
Hunk #1 succeeded at 2694 (offset 7 lines).
Hunk #2 succeeded at 4284 (offset 7 lines).
Hunk #3 succeeded at 6579 (offset 25 lines).
Hunk #4 succeeded at 6589 (offset 25 lines).
Hunk #5 succeeded at 6882 (offset 25 lines).
Hunk #6 succeeded at 7174 (offset 25 lines).
Hunk #7 succeeded at 8140 (offset 28 lines).
Hunk #8 succeeded at 10769 (offset 59 lines).

Applying buildroot-libtool-v2.2.patch using patch: 
patching file ltmain.sh
Reversed (or previously applied) patch detected!  Skipping patch.
9 out of 9 hunks ignored -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool-v2.2.patch!
make[1]: ***
[/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot/output/build/libmnl-1.0.3/.stamp_configured]
Error 1
make: *** [_all] Error 2
make: Leaving directory
`/home/mikek/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software/buildroot'
mikek at mike-M6700:~/Documents/ATLAS_Cyclone_5_Soc_NEW/atlas_linux_ghrd/software$ 


But Patch was applied in reverse order before it failed.

.config file attached.
Thanks.

MikeK

-- 
You are receiving this mail because:
You are on the CC list for the bug.
