From: Robin Theunis <robint91@gmail.com>
Date: Sat, 29 Oct 2011 13:25:44 +0200
Subject: [Buildroot] UDEV-172 problems, buildroot 2011.08, linux 2.6.33
Message-ID: <CAMeaXtxK=Hf3MMSbJK+nHp8UZnFgkAEkef2n5CkwgaitNxvVYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey all,

I have a small problem with udev-172. It fails to build with
buildroot. The target is a custom AT91RM9200 board, the kernel is
2.6.33. Everything has OABI support.
Has someone an idea what is happening?


>>> udev 172 Configuring
(cd /home/robin/buildroot/buildroot-2011.08/output/build/udev-172/ &&
rm -rf config.cache &&
PATH="/home/robin/buildroot/buildroot-2011.08/output/host/bin:/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin:/home/robin/buildroot/buildroot-2011.08/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
AR="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ar"
AS="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-as"
LD="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld"
NM="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-nm"
CC="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc"
GCC="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc"
CPP="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-cpp"
CXX="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-g++"
FC="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gfortran"
RANLIB="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ranlib"
STRIP="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-strip"
OBJCOPY="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-objcopy"
OBJDUMP="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2
-I/home/robin/buildroot/buildroot-2011.08/output/host/include
-I/home/robin/buildroot/buildroot-2011.08/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/robin/buildroot/buildroot-2011.08/output/host/include
-I/home/robin/buildroot/buildroot-2011.08/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/robin/buildroot/buildroot-2011.08/output/host/lib
-L/home/robin/buildroot/buildroot-2011.08/output/host/usr/lib
-Wl,-rpath,/home/robin/buildroot/buildroot-2011.08/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-as"
DEFAULT_LINKER="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld"
CFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CXXFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/pkg-config"
PERLLIB="/home/robin/buildroot/buildroot-2011.08/output/host/usr/lib/perl"
STAGING_DIR="/home/robin/buildroot/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibc/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure
--target=arm-linux --host=arm-linux --build=x86_64-unknown-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --disable-gtk-doc
--disable-nls   --enable-static --enable-shared  --sbindir=/sbin
--with-rootlibdir=/lib --libexecdir=/lib/udev --disable-introspection
--with-pci-ids-path=/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/pci.ids
--with-usb-ids-path=/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/usb.ids
 )
configure: WARNING: unrecognized options: --disable-nls
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-linux-strip...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking how to create a pax tar archive... gnutar
checking for style of include used by make... GNU
checking for arm-linux-gcc...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
accepts -g... yes
checking for /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
option to accept ISO C89... none needed
checking dependency style of
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc...
gcc3
checking how to run the C preprocessor...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-cpp
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
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld
checking if the linker
(/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld)
is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-nm
checking the name lister
(/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-nm)
interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 3458764513820540925
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... no
checking how to convert x86_64-unknown-linux-gnu file names to
arm-unknown-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to
toolchain format... func_convert_file_noop
checking for /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld
option to reload object files... -r
checking for arm-linux-objdump...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-linux-ar...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ar
checking for archiver @FILE support... @
checking for arm-linux-strip... (cached)
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-strip
checking for arm-linux-ranlib...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ranlib
checking command to parse
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-nm
output from /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
object... ok
checking for sysroot... no
checking for arm-linux-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
supports -fno-rtti -fno-exceptions... no
checking for /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
option to produce PIC... -fPIC -DPIC
checking if /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
PIC flag -fPIC -DPIC works... yes
checking if /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
static flag -static works... yes
checking if /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
supports -c -o file.o... yes
checking if /home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
supports -c -o file.o... (cached) yes
checking whether the
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
linker (/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for gawk... (cached) mawk
checking pkg-config is at least version 0.9.0... yes
checking for gtkdoc-check... no
checking for gtkdoc-rebase... no
checking for gtkdoc-mkpdf... no
checking whether to build gtk-doc documentation... no
checking for xsltproc... /usr/bin/xsltproc
checking for library containing clock_gettime... none required
checking for USB database location...
/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/usb.ids
checking for PCI database location...
/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/pci.ids
checking for acl_init in -lacl... yes
checking acl/libacl.h usability... yes
checking acl/libacl.h presence... yes
checking for acl/libacl.h... yes
checking for GLIB... yes
checking for GLIB... yes
checking for gperf...
/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/gperf
checking linux/input.h usability... yes
checking linux/input.h presence... yes
checking for linux/input.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating udev/udev.pc
config.status: creating init/udev.service
config.status: creating init/udev-trigger.service
config.status: creating init/udev-settle.service
config.status: creating libudev/libudev.pc
config.status: creating libudev/docs/Makefile
config.status: creating libudev/docs/version.xml
config.status: creating extras/gudev/gudev-1.0.pc
config.status: creating extras/gudev/docs/Makefile
config.status: creating extras/gudev/docs/version.xml
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-nls

	udev 172
	========

	prefix:			/usr
	sysconfdir:		/etc
	sbindir:		/sbin
	libdir:			${exec_prefix}/lib
	rootlibdir:		/lib
	libexecdir:		/lib/udev

	datarootdir:		${prefix}/share
	mandir:			${datarootdir}/man
	includedir:		${prefix}/include

	include_prefix:		/home/robin/buildroot/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibc/sysroot/usr/include

	systemdsystemunitdir:	

	logging:		yes
	debug:			no
	selinux:		no

	compiler:		/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
	cflags:			-pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
	ldflags:		

	rule_generator:		yes
	hwdb:			yes
	udev_acl:		yes
	gudev:			yes
	gintrospection:		no
	keymap:			yes
	floppy:			no
	edd:			no

	usb.ids:		/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/usb.ids
	pci.ids:		/home/robin/buildroot/buildroot-2011.08/output/target/usr/share/hwdata/pci.ids
	firmware path:		\"/lib/firmware/updates/\", \"/lib/firmware/\"

	xsltproc:		/usr/bin/xsltproc
	gperf:			/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin/gperf

>>> udev 172 Building
PATH="/home/robin/buildroot/buildroot-2011.08/output/host/bin:/home/robin/buildroot/buildroot-2011.08/output/host/usr/bin:/home/robin/buildroot/buildroot-2011.08/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
PERLLIB="/home/robin/buildroot/buildroot-2011.08/output/host/usr/lib/perl"
 /usr/bin/make -j2  -C
/home/robin/buildroot/buildroot-2011.08/output/build/udev-172/
make[1]: Map '/home/robin/buildroot/buildroot-2011.08/output/build/udev-172'
wordt binnengegaan
  GEN    extras/keymap/keys.txt
  GEN    extras/keymap/keys-from-name.gperf
  GEN    extras/keymap/keys-to-name.h
  GEN    extras/keymap/keys-from-name.h
/usr/bin/make --no-print-directory all-recursive
Making all in .
  CC     libudev/libudev-util-private.lo
  CC     libudev/libudev-device-private.lo
  CC     libudev/libudev-queue-private.lo
  CC     libudev/libudev.lo
  CC     libudev/libudev-list.lo
  CC     libudev/libudev-util.lo
  CC     libudev/libudev-device.lo
  CC     libudev/libudev-enumerate.lo
  CC     libudev/libudev-monitor.lo
  CC     libudev/libudev-queue.lo
  CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevclient.lo
  CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevdevice.lo
  CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevenumerator.lo
  CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevmarshal.lo
  CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevenumtypes.lo
  CCLD   libudev/libudev-private.la
  CC     extras/firmware/extras_firmware_firmware-firmware.o
  CC     extras/ata_id/ata_id.o
In file included from extras/ata_id/ata_id.c:32:
/home/robin/buildroot/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibc/sysroot/usr/include/scsi/scsi.h:152:
error: expected specifier-qualifier-list before 'u8'
/home/robin/buildroot/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibc/sysroot/usr/include/scsi/scsi.h:
In function 'scsi_varlen_cdb_length':
/home/robin/buildroot/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibc/sysroot/usr/include/scsi/scsi.h:163:
error: 'struct scsi_varlen_cdb_hdr' has no member named
'additional_cdb_length'
make[3]: *** [extras/ata_id/ata_id.o] Fout 1
make[3]: *** Wachten op onvoltooide taken...
make[2]: *** [all-recursive] Fout 1
make[1]: *** [all] Fout 2
make[1]: Map '/home/robin/buildroot/buildroot-2011.08/output/build/udev-172'
wordt verlaten
make: *** [/home/robin/buildroot/buildroot-2011.08/output/build/udev-172/.stamp_built]
Fout 2
