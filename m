From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 5 Mar 2012 17:28:04 +0100
Subject: [Buildroot] udev buiild error Build complains : tar: invalid option
	-- J
Message-ID: <A04BD841D4954F53ADE963E814453ABA@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

 
Hi

Have a problem building udev: using 2012.02  kernel 2.6.36 uclibc 0.9.33
Build complains : tar: invalid option -- J  
(my host tar version is 1.20)

 

[7m>>> udev 181 Extracting[27m
bzcat /home/johan/dl/udev-181.tar.bz2 | tar --strip-components=1 -C /home/johan/buildroot/output/build/udev-181  -xf -
[7m>>> udev 181 Patching package//udev[27m
[7m>>> udev 181  Updating config.sub and config.guess[27m
for file in config.guess config.sub; do for i in $(find /home/johan/buildroot/output/build/udev-181 -name $file); do cp
support/gnuconfig/$file $i; done; done
[7m>>> udev 181 Patching libtool[27m

Applying buildroot-libtool-v2.4.patch using plaintext: 
patching file ltmain.sh
Hunk #1 succeeded at 1417 (offset 1 line).
Hunk #2 succeeded at 2963 (offset 1 line).
Hunk #3 succeeded at 6700 (offset 14 lines).
Hunk #4 succeeded at 9278 (offset 18 lines).
[7m>>> udev 181 Configuring[27m
(cd /home/johan/buildroot/output/build/udev-181/ && rm -rf config.cache &&
PATH="/home/johan/buildroot/output/host/bin:/home/johan/buildroot/output/host/usr/bin:/home/johan/buildroot/output/host/usr/sbin/:/u
sr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/johan/buildroot/output/build/staging_dir/usr/bin:/home/johan/buildr
oot/output/host/usr/bin" AR="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar"
AS="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
LD="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"
NM="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm"
CC="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
GCC="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
CPP="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp"
CXX="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++"
FC="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran"
RANLIB="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib"
STRIP="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip"
OBJCOPY="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 -I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/johan/buildroot/output/host/lib
-L/home/johan/buildroot/output/host/usr/lib -Wl,-rpath,/home/johan/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld" CFLAGS=" -pipe -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/johan/buildroot/output/host/usr/bin/pkg-config"
PERLLIB="/home/johan/buildroot/output/host/usr/lib/perl"
STAGING_DIR="/home/johan/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot" ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no LIBS=-lrt ./configure --target=arm-linux --host=arm-linux --build=i686-pc-linux-gnu --prefix=/usr
--exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-nls  --disable-ipv6 --enable-static
--enable-shared  --sbindir=/sbin --with-rootlibdir=/lib --libexecdir=/lib --with-usb-ids-path=/usr/share/hwdata/usb.ids
--with-pci-ids-path=/usr/share/hwdata/pci.ids --with-firmware-path=/lib/firmware --disable-introspection --enable-udev_acl )
configure: WARNING: unrecognized options: --disable-nls, --disable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-linux-strip... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking how to create a pax tar archive... gnutar
checking for style of include used by make... GNU
checking for arm-linux-gcc... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc accepts -g... yes
checking for /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc option to accept ISO C89... none needed
checking dependency style of /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc... gcc3
checking how to run the C preprocessor... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
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
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking whether make supports nested variables... (cached) yes
checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc...
/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker (/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
checking the name lister (/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 98304
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert i686-pc-linux-gnu file names to arm-unknown-linux-gnu format... func_convert_file_noop
checking how to convert i686-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld option to reload object files... -r
checking for arm-linux-objdump... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-linux-ar... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
checking for archiver @FILE support... @
checking for arm-linux-strip... (cached) /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for arm-linux-ranlib... /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
checking command to parse /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm output from
/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc object... ok
checking for sysroot... no
checking for arm-linux-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc supports -fno-rtti -fno-exceptions... no
checking for /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc option to produce PIC... -fPIC -DPIC
checking if /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc PIC flag -fPIC -DPIC works... yes
checking if /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc static flag -static works... yes
checking if /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc supports -c -o file.o... yes
checking if /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc supports -c -o file.o... (cached) yes
checking whether the /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc linker
(/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for gawk... (cached) mawk
checking for a sed that does not truncate output... (cached) /bin/sed
checking pkg-config is at least version 0.9.0... yes
checking for gtkdoc-check... no
checking for gtkdoc-rebase... no
checking for gtkdoc-mkpdf... no
checking whether to build gtk-doc documentation... no
checking for xsltproc... /usr/bin/xsltproc
checking for library containing clock_gettime... none required
checking for BLKID... yes
checking for KMOD... yes
checking for USB database location... /usr/share/hwdata/usb.ids
checking for PCI database location... /usr/share/hwdata/pci.ids
checking for GLIB... yes
checking for gperf... /home/johan/buildroot/output/host/usr/bin/gperf
checking linux/input.h usability... yes
checking linux/input.h presence... yes
checking for linux/input.h... yes
checking for acl_init in -lacl... yes
checking acl/libacl.h usability... yes
checking acl/libacl.h presence... yes
checking for acl/libacl.h... yes
checking for GLIB... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/docs/Makefile
config.status: creating src/docs/version.xml
config.status: creating src/extras/gudev/docs/Makefile
config.status: creating src/extras/gudev/docs/version.xml
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-nls, --disable-ipv6

       udev 181
       ========

       prefix:                  /usr
       rootprefix:              /usr
       sysconfdir:              /etc
       bindir:                  ${exec_prefix}/bin
       libdir:                  ${exec_prefix}/lib
       rootlibdir:              /lib
       libexecdir:              /lib
       datarootdir:             ${prefix}/share
       mandir:                  ${datarootdir}/man
       includedir:              ${prefix}/include
       include_prefix:
/home/johan/buildroot-2012.02js/output/host/usr/bin/../arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
       systemdsystemunitdir:    
       firmware path:           \"/lib/firmware/\"
       usb.ids:                 /usr/share/hwdata/usb.ids
       pci.ids:                 /usr/share/hwdata/pci.ids

       compiler:                /home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
       cflags:                   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
       ldflags:                 
       xsltproc:                /usr/bin/xsltproc
       gperf:                   /home/johan/buildroot/output/host/usr/bin/gperf

       logging:                 yes
       debug:                   no
       selinux:                 no

       gudev:                   yes
       gintrospection:          no
       keymap:                  yes
       mtd_probe:               yes
       rule_generator:          no
       udev_acl:                yes
       floppy:                  no
       edd:                     no

[7m>>> udev 181 Building[27m
PATH="/home/johan/buildroot/output/host/bin:/home/johan/buildroot/output/host/usr/bin:/home/johan/buildroot/output/host/usr/sbin/:/u
sr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/johan/buildroot/output/build/staging_dir/usr/bin:/home/johan/buildr
oot/output/host/usr/bin" PERLLIB="/home/johan/buildroot/output/host/usr/lib/perl"  /usr/bin/make -j2  -C
/home/johan/buildroot/output/build/udev-181/
make[1]: Entering directory `/home/johan/buildroot-2012.02js/output/build/udev-181'
  GEN    test/sys/kernel/uevent_seqnum
  GEN    src/extras/gudev/gudevmarshal.h
tar: invalid option -- J
Try `tar --help' or `tar --usage' for more information.
  GEN    src/extras/gudev/gudevmarshal.c
make[1]: *** [test/sys/kernel/uevent_seqnum] Error 64
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/home/johan/buildroot-2012.02js/output/build/udev-181'
make: *** [/home/johan/buildroot/output/build/udev-181/.stamp_built] Error 2



M.v.g .
Sagaert Johan
