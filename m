From: Dave Bender <codehero@gmail.com>
Date: Sun, 30 Jul 2017 16:18:43 -0400
Subject: [Buildroot] host-icu: ERROR: package host-icu installs executables
	without proper RPATH:
Message-ID: <CAETHaKrDURWTeFqnFYeXU0X+rxqV0Vb_uB1nVJ+_gX4xGZUJ_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

(Note full build output for host-icu attached).

host-icu build is breaking on detecting executables without proper RPATH.
What corrective action should I take?

cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/..; \
    rm -f current && ln -s 58.2 current; \
    rm -f Makefile.inc && ln -s current/Makefile.inc Makefile.inc; \
    rm -f pkgdata.inc && ln -s current/pkgdata.inc pkgdata.inc
make[2]: Leaving directory
'/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
make[1]: Leaving directory
'/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
***
*** ERROR: package host-icu installs executables without proper RPATH:
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/openssl
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xzdec
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tabs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/getfattr
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/python2.7
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/setfattr
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tput
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmainfo
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/infocmp
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xmlwf
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmadec
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/mksquashfs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/genimage
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/clear
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tset
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/toe
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xz
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/unsquashfs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tic
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/attr
make: *** [package/pkg-generic.mk:231:
/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/.stamp_host_installed]
Error 1


Thanks,
Dave
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170730/19b51299/attachment-0001.html>
-------------- next part --------------
icu4c-58_2-src.tgz: OK (md5: fac212b32b7ec7ab007a12dff1f3aea1)
icu4c-58_2-src.tgz: OK (sha256: 2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c)
[7m>>> host-icu 58.2 Extracting[27m
gzip -d -c /stuff/gsrc/AppImage/buildroot-qt/dl/icu4c-58_2-src.tgz | tar --strip-components=1 -C /stuff/src/AppImage/buildroot-qt/output/build/host-icu-58.2   -xf -
[7m>>> host-icu 58.2 Patching[27m

Applying 0001-dont-build-static-dynamic-twice.patch using patch: 
patching file source/config/mh-linux
Hunk #1 succeeded at 37 (offset 2 lines).

Applying 0002-workaround-toolchain-bugs.patch using patch: 
patching file source/configure
Hunk #1 succeeded at 4351 (offset 28 lines).
Hunk #2 succeeded at 4365 (offset 28 lines).

Applying 0003-detect-compiler-symbol-prefix.patch using patch: 
patching file source/configure
Hunk #1 succeeded at 639 with fuzz 2 (offset 2 lines).
Hunk #2 succeeded at 7486 (offset 71 lines).
patching file source/data/Makefile.in
Hunk #1 succeeded at 186 (offset 4 lines).
Hunk #2 succeeded at 213 (offset 4 lines).
Hunk #3 succeeded at 228 (offset 4 lines).
Hunk #4 succeeded at 236 (offset 4 lines).
patching file source/extra/uconv/Makefile.in
Hunk #1 succeeded at 60 (offset 2 lines).
Hunk #2 succeeded at 155 (offset 2 lines).

Applying 0004-link-icudata-as-data-only.patch using patch: 
patching file source/config/mh-linux
Hunk #1 succeeded at 23 (offset 2 lines).

Applying 0005-fix-static-linking-with-icu-uc.patch using patch: 
patching file source/Makefile.in

Applying 0006-utext-problems-with-handling-of-bad-utf8.patch using patch: 
patching file source/common/utext.cpp
patching file source/test/intltest/utxttest.cpp
patching file source/test/intltest/utxttest.h
[7m>>> host-icu 58.2 Updating config.sub and config.guess[27m
for file in config.guess config.sub; do for i in $(find /stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2 -name $file); do cp support/gnuconfig/$file $i; done; done
[7m>>> host-icu 58.2 Patching libtool[27m
[7m>>> host-icu 58.2 Configuring[27m
(cd /stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source && rm -rf config.cache; PATH="/stuff/src/AppImage/buildroot-qt/output/host/bin:/stuff/src/AppImage/buildroot-qt/output/host/sbin:/stuff/src/AppImage/buildroot-qt/output/host/usr/bin:/stuff/src/AppImage/buildroot-qt/output/host/usr/sbin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.9.4:/usr/x86_64-pc-linux-gnu/arm-linux-gnueabihf/gcc-bin/5.4.0:/usr/x86_64-pc-linux-gnu/armv7a-hardfloat-linux-gnueabi/gcc-bin/5.3.0:/usr/x86_64-pc-linux-gnu/msp430-elf/gcc-bin/5.4.0" PKG_CONFIG="/stuff/src/AppImage/buildroot-qt/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/stuff/src/AppImage/buildroot-qt/output/host/usr/lib/pkgconfig:/stuff/src/AppImage/buildroot-qt/output/host/usr/share/pkgconfig" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/home/bin/gcc" GCC="/home/bin/gcc" CXX="/home/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/stuff/src/AppImage/buildroot-qt/output/host/usr/include" CFLAGS="-O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include" CXXFLAGS="-O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include" LDFLAGS="-L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib" INTLTOOL_PERL=/usr/bin/perl CFLAGS="-O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include" LDFLAGS="-L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib"  CONFIG_SITE=/dev/null ./configure --prefix="/stuff/src/AppImage/buildroot-qt/output/host/usr" --sysconfdir="/stuff/src/AppImage/buildroot-qt/output/host/etc" --localstatedir="/stuff/src/AppImage/buildroot-qt/output/host/var" --enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-dependency-tracking  --disable-samples --disable-tests --disable-extras --disable-icuio --disable-layout --disable-renaming )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking
checking for ICU version numbers... release 58.2, library 58.2, unicode version 9.0
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking whether to build debug libraries... no
checking whether to build release libraries... yes
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/gbin/gcc accepts -g... yes
checking for /home/gbin/gcc option to accept ISO C89... none needed
checking whether we are using the GNU C++ compiler... yes
checking whether /home/gbin/g++ accepts -g... yes
checking pkg-config is at least version 0.20... yes
checking for ICULEHB... no
checking how to run the C preprocessor... /usr/bin/cpp
checking for a BSD-compatible install... /usr/bin/install -c
checking for gmake... /usr/bin/gmake
checking for doxygen... /usr/bin/doxygen
checking checking for executable suffix... 
checking whether strict compiling is on... yes
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
checking size of void *... 8
checking whether runnable 64 bit binaries are built by default... yes
checking which Makefile fragment to use for x86_64-pc-linux-gnu... mh-linux
checking for floor in -lm... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking whether to enable auto cleanup of libraries... no
checking whether to enable draft APIs... yes
checking for ranlib... /usr/bin/ranlib
checking for ar... /usr/bin/ar
checking whether to enable renaming of symbols... no
checking whether to enable function and data tracing... no
checking elf.h usability... yes
checking elf.h presence... yes
checking for elf.h... yes
checking whether to enable dynamic loading of plugins. Ignored if plugins disabled.... yes
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking for library containing dlopen... -ldl
checking for dlopen... yes
checking for gettimeofday... yes
checking if we have a C++ compiler... Good
checking if we have a C++11 compiler... yes
configure: Adding CXXFLAGS option --std=c++0x
checking if #include <string> works... yes
checking if #include <atomic> works... yes
checking for pthread_attr_init in -lpthread... yes
checking for mmap... yes
checking for genccode assembly... -a gcc
checking for inttypes.h... (cached) yes
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking whether byte ordering is bigendian... no
checking for nl_langinfo... yes
checking for nl_langinfo's argument to obtain the codeset... CODESET
checking for namespace support... yes
checking for properly overriding new and delete... yes
checking for placement new and delete... yes
checking for popen... yes
checking for tzset... yes
checking for tzname... yes
checking for timezone... yes
checking for strtod_l... yes
checking for int8_t... yes
checking for uint8_t... yes
checking for int16_t... yes
checking for uint16_t... yes
checking for int32_t... yes
checking for uint32_t... yes
checking for int64_t... yes
checking for uint64_t... yes
checking wchar.h usability... yes
checking wchar.h presence... yes
checking for wchar.h... yes
checking for library containing wcscpy... none required
checking size of wchar_t... 4
checking for UTF-16 string literal support... C++ only
checking for symbol prefix... 

checking for a library suffix to use... none
CPPFLAGS=-I/stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include $(THREADSCPPFLAGS)  -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -DU_HAVE_STRTOD_L=1  -DU_DISABLE_RENAMING=1
CFLAGS=-O2 -I/stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings $(THREADSCFLAGS) 
CXXFLAGS=-O2 -I/stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x $(THREADSCXXFLAGS) 
configure: creating ./config.status
config.status: creating icudefs.mk
config.status: creating Makefile
config.status: creating data/pkgdataMakefile
config.status: creating config/Makefile.inc
config.status: creating config/icu.pc
config.status: creating config/pkgdataMakefile
config.status: creating data/Makefile
config.status: creating stubdata/Makefile
config.status: creating common/Makefile
config.status: creating i18n/Makefile
config.status: creating layoutex/Makefile
config.status: creating io/Makefile
config.status: creating extra/Makefile
config.status: creating extra/uconv/Makefile
config.status: creating extra/uconv/pkgdataMakefile
config.status: creating extra/scrptrun/Makefile
config.status: creating tools/Makefile
config.status: creating tools/ctestfw/Makefile
config.status: creating tools/toolutil/Makefile
config.status: creating tools/makeconv/Makefile
config.status: creating tools/genrb/Makefile
config.status: creating tools/genccode/Makefile
config.status: creating tools/gencmn/Makefile
config.status: creating tools/gencnval/Makefile
config.status: creating tools/gendict/Makefile
config.status: creating tools/gentest/Makefile
config.status: creating tools/gennorm2/Makefile
config.status: creating tools/genbrk/Makefile
config.status: creating tools/gensprep/Makefile
config.status: creating tools/icuinfo/Makefile
config.status: creating tools/icupkg/Makefile
config.status: creating tools/icuswap/Makefile
config.status: creating tools/pkgdata/Makefile
config.status: creating tools/tzcode/Makefile
config.status: creating tools/gencfu/Makefile
config.status: creating test/Makefile
config.status: creating test/compat/Makefile
config.status: creating test/testdata/Makefile
config.status: creating test/testdata/pkgdataMakefile
config.status: creating test/hdrtst/Makefile
config.status: creating test/intltest/Makefile
config.status: creating test/cintltst/Makefile
config.status: creating test/iotest/Makefile
config.status: creating test/letest/Makefile
config.status: creating test/perf/Makefile
config.status: creating test/perf/collationperf/Makefile
config.status: creating test/perf/collperf/Makefile
config.status: creating test/perf/collperf2/Makefile
config.status: creating test/perf/dicttrieperf/Makefile
config.status: creating test/perf/ubrkperf/Makefile
config.status: creating test/perf/charperf/Makefile
config.status: creating test/perf/convperf/Makefile
config.status: creating test/perf/normperf/Makefile
config.status: creating test/perf/DateFmtPerf/Makefile
config.status: creating test/perf/howExpensiveIs/Makefile
config.status: creating test/perf/strsrchperf/Makefile
config.status: creating test/perf/unisetperf/Makefile
config.status: creating test/perf/usetperf/Makefile
config.status: creating test/perf/ustrperf/Makefile
config.status: creating test/perf/utfperf/Makefile
config.status: creating test/perf/utrie2perf/Makefile
config.status: creating test/perf/leperf/Makefile
config.status: creating samples/Makefile
config.status: creating samples/date/Makefile
config.status: creating samples/cal/Makefile
config.status: creating samples/layout/Makefile
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking

ICU for C/C++ 58.2 is ready to be built.
=== Important Notes: ===
Data Packaging: library
 This means: ICU data will be linked with ICU. A shared data library will be built. 
 To locate data: ICU will use the linked data library. If linked with the stub library located in stubdata/, the application can use udata_setCommonData() or set a data path to override.
Building ICU: Use a GNU make such as /usr/bin/gmake to build ICU.
checking the version of "/usr/bin/gmake"... gmake[1]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
4.2.1 (we wanted at least 3.80)
gmake[1]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
ok
*** WARNING: You must set the following flags before code compiled against this ICU will function properly:

    -DU_DISABLE_RENAMING=1

The recommended way to do this is to prepend the following lines to source/common/unicode/uconfig.h or #include them near the top of that file.
Creating the file uconfig.h.prepend

---------------    uconfig.h.prepend

/* ICU customizations: put these lines at the top of uconfig.h */

 /* -DU_DISABLE_RENAMING=1 */
#define U_DISABLE_RENAMING 1

--------------- end  uconfig.h.prepend
C++ apps may want to build with CXXFLAGS =  --std=c++0x
[7m>>> host-icu 58.2 Building[27m
PATH="/stuff/gsrc/AppImage/buildroot-qt/output/host/bin:/stuff/src/AppImage/buildroot-qt/output/host/sbin:/stuff/src/AppImage/buildroot-qt/output/host/usr/bin:/stuff/src/AppImage/buildroot-qt/output/host/usr/sbin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.9.4:/usr/x86_64-pc-linux-gnu/arm-linux-gnueabihf/gcc-bin/5.4.0:/usr/x86_64-pc-linux-gnu/armv7a-hardfloat-linux-gnueabi/gcc-bin/5.3.0:/usr/x86_64-pc-linux-gnu/msp430-elf/gcc-bin/5.4.0" PKG_CONFIG="/stuff/src/AppImage/buildroot-qt/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/stuff/src/AppImage/buildroot-qt/output/host/usr/lib/pkgconfig:/stuff/src/AppImage/buildroot-qt/output/host/usr/share/pkgconfig"  /usr/bin/make -j5  -C /stuff/src/AppImage/buildroot-qt/output/build/host-icu-58.2/source
make[1]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
rebuilding config/icucross.mk
cd ./config; \
	/usr/bin/make -f pkgdataMakefile
rebuilding config/icucross.inc
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/config'
rm -rf pkgdata.inc
rm -rf config/icu-config
/usr/bin/install -c ./config/icu-config-top config/icu-config
chmod u+w config/icu-config
LC_ALL=C sed -f ./config/make2sh.sed < ./config/Makefile.inc | grep -v '#M#' | uniq >> config/icu-config
/bin/sh ./mkinstalldirs lib
LC_ALL=C sed -f ./config/make2sh.sed < ./config/mh-linux | grep -v '#M#' | uniq >> config/icu-config
mkdir lib
/bin/sh ./mkinstalldirs bin
config/icu-uc.pc updated.
cat ./config/icu-config-bottom >> config/icu-config
mkdir bin
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/config'
chmod u-w config/icu-config
config/icu-i18n.pc updated.
/usr/bin/make[1]: Making `all' in `stubdata'
Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/stubdata'
   (deps)	 stubdata.c
   gcc	 ...  stubdata.c
/home/gbin/gcc -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicudata.so.58 -o libicudata.so.58.2 stubdata.o 
rm -f libicudata.so.58 && ln -s libicudata.so.58.2 libicudata.so.58
rm -f libicudata.so && ln -s libicudata.so.58.2 libicudata.so
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/stubdata'
/usr/bin/make[1]: Making `all' in `common'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/common'
   (deps)	 pluralmap.cpp
   (deps)	 ubiditransform.c
   (deps)	 uloc_keytype.cpp
   (deps)	 unifiedcache.cpp
   (deps)	 simpleformatter.cpp
   (deps)	 sharedobject.cpp
   (deps)	 ulistformatter.cpp
   (deps)	 listformatter.cpp
   (deps)	 icuplug.cpp
   (deps)	 icudataver.c
   (deps)	 uloc_tag.c
   (deps)	 propsvec.c
   (deps)	 ulist.c
   (deps)	 ucnvsel.cpp
   (deps)	 dtintrv.cpp
   (deps)	 wintz.c
   (deps)	 cwchar.c
   (deps)	 locbased.cpp
   (deps)	 parsepos.cpp
   (deps)	 util_props.cpp
   (deps)	 util.cpp
   (deps)	 punycode.cpp
   (deps)	 uts46.cpp
   (deps)	 usprep.cpp
   (deps)	 uidna.cpp
   (deps)	 servslkf.cpp
   (deps)	 servrbf.cpp
   (deps)	 servlkf.cpp
   (deps)	 servlk.cpp
   (deps)	 servls.cpp
   (deps)	 servnotf.cpp
   (deps)	 serv.cpp
   (deps)	 rbbitblb.cpp
   (deps)	 rbbistbl.cpp
   (deps)	 rbbisetb.cpp
   (deps)	 rbbiscan.cpp
   (deps)	 rbbirb.cpp
   (deps)	 rbbinode.cpp
   (deps)	 rbbidata.cpp
   (deps)	 rbbi.cpp
   (deps)	 filteredbrk.cpp
   (deps)	 dictbe.cpp
   (deps)	 brkeng.cpp
   (deps)	 ubrk.cpp
   (deps)	 brkiter.cpp
   (deps)	 uarrsort.c
   (deps)	 unifunct.cpp
   (deps)	 unifilt.cpp
   (deps)	 caniter.cpp
   (deps)	 ruleiter.cpp
   (deps)	 usetiter.cpp
   (deps)	 uniset.cpp
   (deps)	 uset.cpp
   (deps)	 uniset_closure.cpp
   (deps)	 uniset_props.cpp
   (deps)	 uset_props.cpp
   (deps)	 unisetspan.cpp
   (deps)	 bmpset.cpp
   (deps)	 utrie2_builder.cpp
   (deps)	 utrie2.cpp
   (deps)	 utrie.cpp
   (deps)	 unames.cpp
   (deps)	 usc_impl.c
   (deps)	 uscript_props.cpp
   (deps)	 uscript.c
   (deps)	 ushape.cpp
   (deps)	 ubidiln.c
   (deps)	 ubidiwrt.c
   (deps)	 ubidi.c
   (deps)	 ubidi_props.c
   (deps)	 propname.cpp
   (deps)	 ucase.cpp
   (deps)	 uprops.cpp
   (deps)	 uchar.c
   (deps)	 patternprops.cpp
   (deps)	 uiter.cpp
   (deps)	 uchriter.cpp
   (deps)	 schriter.cpp
   (deps)	 chariter.cpp
   (deps)	 loadednormalizer2impl.cpp
   (deps)	 unormcmp.cpp
   (deps)	 unorm.cpp
   (deps)	 normlzr.cpp
   (deps)	 filterednormalizer2.cpp
   (deps)	 normalizer2.cpp
   (deps)	 normalizer2impl.cpp
   (deps)	 ustr_titlecase_brkiter.cpp
   (deps)	 unistr_titlecase_brkiter.cpp
   (deps)	 ustrcase_locale.cpp
   (deps)	 unistr_case_locale.cpp
   (deps)	 utext.cpp
   (deps)	 ustr_wcs.cpp
   (deps)	 ustrtrns.cpp
   (deps)	 ustrfmt.c
   (deps)	 cstring.c
   (deps)	 ucasemap_titlecase_brkiter.cpp
   (deps)	 ucasemap.cpp
   (deps)	 ustrcase.cpp
   (deps)	 ustring.cpp
   (deps)	 utf_impl.c
   (deps)	 unistr_props.cpp
   (deps)	 unistr_case.cpp
   (deps)	 unistr.cpp
   (deps)	 unistr_cnv.cpp
   (deps)	 ustr_cnv.cpp
   (deps)	 appendable.cpp
   (deps)	 dictionarydata.cpp
   (deps)	 ucharstrieiterator.cpp
   (deps)	 ucharstriebuilder.cpp
   (deps)	 ucharstrie.cpp
   (deps)	 bytestrieiterator.cpp
   (deps)	 bytestrie.cpp
   (deps)	 bytestriebuilder.cpp
   (deps)	 stringtriebuilder.cpp
   (deps)	 stringpiece.cpp
   (deps)	 bytestream.cpp
   (deps)	 locresdata.cpp
   (deps)	 loclikely.cpp
   (deps)	 locdspnm.cpp
   (deps)	 locdispnames.cpp
   (deps)	 locavailable.cpp
   (deps)	 locutil.cpp
   (deps)	 locid.cpp
   (deps)	 uloc.cpp
   (deps)	 locmap.c
   (deps)	 ucat.c
   (deps)	 messagepattern.cpp
   (deps)	 ucurr.cpp
   (deps)	 resbund_cnv.cpp
   (deps)	 resbund.cpp
   (deps)	 uresdata.cpp
   (deps)	 ures_cnv.c
   (deps)	 uresbund.cpp
   (deps)	 resource.cpp
   (deps)	 ucnv_ct.c
   (deps)	 ucnv_set.c
   (deps)	 ucnvdisp.c
   (deps)	 ucnvisci.c
   (deps)	 ucnv_lmb.c
   (deps)	 ucnvhz.c
   (deps)	 ucnv2022.cpp
   (deps)	 ucnvmbcs.cpp
   (deps)	 ucnv_ext.cpp
   (deps)	 ucnvbocu.cpp
   (deps)	 ucnvscsu.c
   (deps)	 ucnv_u32.c
   (deps)	 ucnv_u16.c
   (deps)	 ucnv_u8.c
   (deps)	 ucnv_u7.c
   (deps)	 ucnvlat1.c
   (deps)	 ucnv_err.c
   (deps)	 ucnv_cb.c
   (deps)	 ucnv_io.cpp
   (deps)	 ucnv_cnv.c
   (deps)	 ucnv_bld.cpp
   (deps)	 ucnv.c
   (deps)	 uvectr64.cpp
   (deps)	 uvectr32.cpp
   (deps)	 ustack.cpp
   (deps)	 uvector.cpp
   (deps)	 ustrenum.cpp
   (deps)	 uenum.c
   (deps)	 uhash_us.cpp
   (deps)	 uhash.c
   (deps)	 utrace.c
   (deps)	 ucol_swp.cpp
   (deps)	 udataswp.c
   (deps)	 umapfile.c
   (deps)	 udatamem.c
   (deps)	 ucmndata.c
   (deps)	 udata.cpp
   (deps)	 cstr.cpp
   (deps)	 charstr.cpp
   (deps)	 cmemory.c
   (deps)	 uobject.cpp
   (deps)	 uinit.cpp
   (deps)	 ucln_cmn.cpp
   (deps)	 umutex.cpp
   (deps)	 uinvchar.c
   (deps)	 utypes.c
   (deps)	 umath.c
   (deps)	 putil.cpp
   (deps)	 errorcode.cpp
generating ../common/svchook.mk
cd .. \
 && CONFIG_FILES=common/Makefile CONFIG_HEADERS= /bin/sh ./config.status
config.status: creating common/Makefile
   g++	 ...  errorcode.cpp
   g++	 ...  putil.cpp
   gcc	 ...  umath.c
   gcc	 ...  utypes.c
   gcc	 ...  uinvchar.c
   g++	 ...  umutex.cpp
   g++	 ...  ucln_cmn.cpp
   g++	 ...  uinit.cpp
   g++	 ...  uobject.cpp
   gcc	 ...  cmemory.c
   g++	 ...  charstr.cpp
   g++	 ...  cstr.cpp
   g++	 ...  udata.cpp
   gcc	 ...  ucmndata.c
   gcc	 ...  udatamem.c
   gcc	 ...  umapfile.c
   gcc	 ...  udataswp.c
   g++	 ...  ucol_swp.cpp
   gcc	 ...  utrace.c
   gcc	 ...  uhash.c
   g++	 ...  uhash_us.cpp
   gcc	 ...  uenum.c
   g++	 ...  ustrenum.cpp
   g++	 ...  uvector.cpp
   g++	 ...  ustack.cpp
   g++	 ...  uvectr32.cpp
   g++	 ...  uvectr64.cpp
   gcc	 ...  ucnv.c
   g++	 ...  ucnv_bld.cpp
   gcc	 ...  ucnv_cnv.c
   g++	 ...  ucnv_io.cpp
   gcc	 ...  ucnv_cb.c
   gcc	 ...  ucnv_err.c
   gcc	 ...  ucnvlat1.c
   gcc	 ...  ucnv_u7.c
   gcc	 ...  ucnv_u8.c
   gcc	 ...  ucnv_u16.c
   gcc	 ...  ucnv_u32.c
   gcc	 ...  ucnvscsu.c
   g++	 ...  ucnvbocu.cpp
   g++	 ...  ucnv_ext.cpp
   g++	 ...  ucnvmbcs.cpp
   g++	 ...  ucnv2022.cpp
   gcc	 ...  ucnvhz.c
   gcc	 ...  ucnv_lmb.c
   gcc	 ...  ucnvisci.c
   gcc	 ...  ucnvdisp.c
   gcc	 ...  ucnv_set.c
   gcc	 ...  ucnv_ct.c
   g++	 ...  resource.cpp
   g++	 ...  uresbund.cpp
   gcc	 ...  ures_cnv.c
   g++	 ...  uresdata.cpp
   g++	 ...  resbund.cpp
   g++	 ...  resbund_cnv.cpp
   g++	 ...  ucurr.cpp
   g++	 ...  messagepattern.cpp
   gcc	 ...  ucat.c
   gcc	 ...  locmap.c
   g++	 ...  uloc.cpp
   g++	 ...  locid.cpp
   g++	 ...  locutil.cpp
   g++	 ...  locavailable.cpp
   g++	 ...  locdispnames.cpp
   g++	 ...  locdspnm.cpp
   g++	 ...  loclikely.cpp
   g++	 ...  locresdata.cpp
   g++	 ...  bytestream.cpp
   g++	 ...  stringpiece.cpp
   g++	 ...  stringtriebuilder.cpp
   g++	 ...  bytestriebuilder.cpp
   g++	 ...  bytestrie.cpp
   g++	 ...  bytestrieiterator.cpp
   g++	 ...  ucharstrie.cpp
   g++	 ...  ucharstriebuilder.cpp
   g++	 ...  ucharstrieiterator.cpp
   g++	 ...  dictionarydata.cpp
   g++	 ...  appendable.cpp
   g++	 ...  ustr_cnv.cpp
   g++	 ...  unistr_cnv.cpp
   g++	 ...  unistr.cpp
   g++	 ...  unistr_case.cpp
   g++	 ...  unistr_props.cpp
   gcc	 ...  utf_impl.c
   g++	 ...  ustring.cpp
   g++	 ...  ustrcase.cpp
   g++	 ...  ucasemap.cpp
   g++	 ...  ucasemap_titlecase_brkiter.cpp
   gcc	 ...  cstring.c
   gcc	 ...  ustrfmt.c
   g++	 ...  ustrtrns.cpp
   g++	 ...  ustr_wcs.cpp
   g++	 ...  utext.cpp
   g++	 ...  unistr_case_locale.cpp
   g++	 ...  ustrcase_locale.cpp
   g++	 ...  unistr_titlecase_brkiter.cpp
   g++	 ...  ustr_titlecase_brkiter.cpp
   g++	 ...  normalizer2impl.cpp
   g++	 ...  normalizer2.cpp
   g++	 ...  filterednormalizer2.cpp
   g++	 ...  normlzr.cpp
   g++	 ...  unorm.cpp
   g++	 ...  unormcmp.cpp
   g++	 ...  loadednormalizer2impl.cpp
   g++	 ...  chariter.cpp
   g++	 ...  schriter.cpp
   g++	 ...  uchriter.cpp
   g++	 ...  uiter.cpp
   g++	 ...  patternprops.cpp
   gcc	 ...  uchar.c
   g++	 ...  uprops.cpp
   g++	 ...  ucase.cpp
   g++	 ...  propname.cpp
   gcc	 ...  ubidi_props.c
   gcc	 ...  ubidi.c
   gcc	 ...  ubidiwrt.c
   gcc	 ...  ubidiln.c
   g++	 ...  ushape.cpp
   gcc	 ...  uscript.c
   g++	 ...  uscript_props.cpp
   g++	 ...  unames.cpp
   gcc	 ...  usc_impl.c
   g++	 ...  utrie.cpp
   g++	 ...  utrie2.cpp
   g++	 ...  utrie2_builder.cpp
   g++	 ...  bmpset.cpp
   g++	 ...  unisetspan.cpp
   g++	 ...  uset_props.cpp
   g++	 ...  uniset_props.cpp
   g++	 ...  uniset_closure.cpp
   g++	 ...  uset.cpp
   g++	 ...  uniset.cpp
   g++	 ...  usetiter.cpp
   g++	 ...  ruleiter.cpp
   g++	 ...  caniter.cpp
   g++	 ...  unifilt.cpp
   g++	 ...  unifunct.cpp
   gcc	 ...  uarrsort.c
   g++	 ...  brkiter.cpp
   g++	 ...  ubrk.cpp
   g++	 ...  brkeng.cpp
   g++	 ...  dictbe.cpp
   g++	 ...  filteredbrk.cpp
   g++	 ...  rbbi.cpp
   g++	 ...  rbbidata.cpp
   g++	 ...  rbbinode.cpp
   g++	 ...  rbbirb.cpp
   g++	 ...  rbbiscan.cpp
   g++	 ...  rbbisetb.cpp
   g++	 ...  rbbistbl.cpp
   g++	 ...  rbbitblb.cpp
   g++	 ...  serv.cpp
   g++	 ...  servnotf.cpp
   g++	 ...  servls.cpp
   g++	 ...  servlk.cpp
   g++	 ...  servlkf.cpp
   g++	 ...  servrbf.cpp
   g++	 ...  servslkf.cpp
   g++	 ...  uidna.cpp
   g++	 ...  usprep.cpp
   g++	 ...  uts46.cpp
   g++	 ...  punycode.cpp
   g++	 ...  util.cpp
   g++	 ...  util_props.cpp
   g++	 ...  parsepos.cpp
   g++	 ...  locbased.cpp
   gcc	 ...  cwchar.c
   gcc	 ...  wintz.c
   g++	 ...  dtintrv.cpp
   g++	 ...  ucnvsel.cpp
   gcc	 ...  propsvec.c
   gcc	 ...  ulist.c
   gcc	 ...  uloc_tag.c
   gcc	 ...  icudataver.c
   g++	 ...  icuplug.cpp
   g++	 ...  listformatter.cpp
   g++	 ...  ulistformatter.cpp
   g++	 ...  sharedobject.cpp
   g++	 ...  simpleformatter.cpp
   g++	 ...  unifiedcache.cpp
   g++	 ...  uloc_keytype.cpp
   gcc	 ...  ubiditransform.c
   g++	 ...  pluralmap.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicuuc.so.58 -o ../lib/libicuuc.so.58.2 errorcode.o putil.o umath.o utypes.o uinvchar.o umutex.o ucln_cmn.o uinit.o uobject.o cmemory.o charstr.o cstr.o udata.o ucmndata.o udatamem.o umapfile.o udataswp.o ucol_swp.o utrace.o uhash.o uhash_us.o uenum.o ustrenum.o uvector.o ustack.o uvectr32.o uvectr64.o ucnv.o ucnv_bld.o ucnv_cnv.o ucnv_io.o ucnv_cb.o ucnv_err.o ucnvlat1.o ucnv_u7.o ucnv_u8.o ucnv_u16.o ucnv_u32.o ucnvscsu.o ucnvbocu.o ucnv_ext.o ucnvmbcs.o ucnv2022.o ucnvhz.o ucnv_lmb.o ucnvisci.o ucnvdisp.o ucnv_set.o ucnv_ct.o resource.o uresbund.o ures_cnv.o uresdata.o resbund.o resbund_cnv.o ucurr.o messagepattern.o ucat.o locmap.o uloc.o locid.o locutil.o locavailable.o locdispnames.o locdspnm.o loclikely.o locresdata.o bytestream.o stringpiece.o stringtriebuilder.o bytestriebuilder.o bytestrie.o bytestrieiterator.o ucharstrie.o ucharstriebuilder.o ucharstrieiterator.o dictionarydata.o appendable.o ustr_cnv.o unistr_cnv.o unistr.o unistr_case.o unistr_props.o utf_impl.o ustring.o ustrcase.o ucasemap.o ucasemap_titlecase_brkiter.o cstring.o ustrfmt.o ustrtrns.o ustr_wcs.o utext.o unistr_case_locale.o ustrcase_locale.o unistr_titlecase_brkiter.o ustr_titlecase_brkiter.o normalizer2impl.o normalizer2.o filterednormalizer2.o normlzr.o unorm.o unormcmp.o loadednormalizer2impl.o chariter.o schriter.o uchriter.o uiter.o patternprops.o uchar.o uprops.o ucase.o propname.o ubidi_props.o ubidi.o ubidiwrt.o ubidiln.o ushape.o uscript.o uscript_props.o usc_impl.o unames.o utrie.o utrie2.o utrie2_builder.o bmpset.o unisetspan.o uset_props.o uniset_props.o uniset_closure.o uset.o uniset.o usetiter.o ruleiter.o caniter.o unifilt.o unifunct.o uarrsort.o brkiter.o ubrk.o brkeng.o dictbe.o filteredbrk.o rbbi.o rbbidata.o rbbinode.o rbbirb.o rbbiscan.o rbbisetb.o rbbistbl.o rbbitblb.o serv.o servnotf.o servls.o servlk.o servlkf.o servrbf.o servslkf.o uidna.o usprep.o uts46.o punycode.o util.o util_props.o parsepos.o locbased.o cwchar.o wintz.o dtintrv.o ucnvsel.o propsvec.o ulist.o uloc_tag.o icudataver.o icuplug.o listformatter.o ulistformatter.o sharedobject.o simpleformatter.o unifiedcache.o uloc_keytype.o ubiditransform.o pluralmap.o -L../lib -L../stubdata -licudata -lpthread -ldl -lm 
rm -f ../lib/libicuuc.so.58 && ln -s libicuuc.so.58.2 ../lib/libicuuc.so.58
rm -f ../lib/libicuuc.so && ln -s libicuuc.so.58.2 ../lib/libicuuc.so
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/common'
/usr/bin/make[1]: Making `all' in `i18n'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/i18n'
   (deps)	 dayperiodrules.cpp
   (deps)	 visibledigits.cpp
   (deps)	 decimfmtimpl.cpp
   (deps)	 smallintformatter.cpp
   (deps)	 affixpatternparser.cpp
   (deps)	 precision.cpp
   (deps)	 pluralaffix.cpp
   (deps)	 valueformatter.cpp
   (deps)	 digitaffixesandpadding.cpp
   (deps)	 digitaffix.cpp
   (deps)	 digitformatter.cpp
   (deps)	 digitinterval.cpp
   (deps)	 digitgrouping.cpp
   (deps)	 scientificnumberformatter.cpp
   (deps)	 sharedbreakiterator.cpp
   (deps)	 measunit.cpp
   (deps)	 quantityformatter.cpp
   (deps)	 reldatefmt.cpp
   (deps)	 uregion.cpp
   (deps)	 scriptset.cpp
   (deps)	 region.cpp
   (deps)	 gender.cpp
   (deps)	 compactdecimalformat.cpp
   (deps)	 tzfmt.cpp
   (deps)	 tzgnames.cpp
   (deps)	 tznames_impl.cpp
   (deps)	 tznames.cpp
   (deps)	 alphaindex.cpp
   (deps)	 decContext.c
   (deps)	 decNumber.c
   (deps)	 ufieldpositer.cpp
   (deps)	 fpositer.cpp
   (deps)	 fphdlimp.cpp
   (deps)	 vzone.cpp
   (deps)	 zrule.cpp
   (deps)	 ztrans.cpp
   (deps)	 smpdtfst.cpp
   (deps)	 decfmtst.cpp
   (deps)	 uspoof_conf.cpp
   (deps)	 uspoof_build.cpp
   (deps)	 uspoof_impl.cpp
   (deps)	 uspoof.cpp
   (deps)	 currpinf.cpp
   (deps)	 tmutfmt.cpp
   (deps)	 tmutamt.cpp
   (deps)	 tmunit.cpp
   (deps)	 udateintervalformat.cpp
   (deps)	 dtitvinf.cpp
   (deps)	 dtitvfmt.cpp
   (deps)	 selfmt.cpp
   (deps)	 plurfmt.cpp
   (deps)	 upluralrules.cpp
   (deps)	 plurrule.cpp
   (deps)	 standardplural.cpp
   (deps)	 zonemeta.cpp
   (deps)	 vtzone.cpp
   (deps)	 tztrans.cpp
   (deps)	 tzrule.cpp
   (deps)	 rbtz.cpp
   (deps)	 dtrule.cpp
   (deps)	 basictz.cpp
   (deps)	 winnmfmt.cpp
   (deps)	 windtfmt.cpp
   (deps)	 wintzimpl.cpp
   (deps)	 inputext.cpp
   (deps)	 csrutf8.cpp
   (deps)	 csrucode.cpp
   (deps)	 csrsbcs.cpp
   (deps)	 csrmbcs.cpp
   (deps)	 csrecog.cpp
   (deps)	 csr2022.cpp
   (deps)	 csmatch.cpp
   (deps)	 csdetect.cpp
   (deps)	 utmscale.c
   (deps)	 measure.cpp
   (deps)	 currunit.cpp
   (deps)	 curramt.cpp
   (deps)	 currfmt.cpp
   (deps)	 measfmt.cpp
   (deps)	 ulocdata.c
   (deps)	 uregexc.cpp
   (deps)	 uregex.cpp
   (deps)	 regeximp.cpp
   (deps)	 regextxt.cpp
   (deps)	 regexst.cpp
   (deps)	 repattrn.cpp
   (deps)	 rematch.cpp
   (deps)	 regexcmp.cpp
   (deps)	 brktrans.cpp
   (deps)	 transreg.cpp
   (deps)	 quant.cpp
   (deps)	 nortrans.cpp
   (deps)	 uni2name.cpp
   (deps)	 name2uni.cpp
   (deps)	 anytrans.cpp
   (deps)	 toupptrn.cpp
   (deps)	 tolowtrn.cpp
   (deps)	 titletrn.cpp
   (deps)	 casetrn.cpp
   (deps)	 remtrans.cpp
   (deps)	 nultrans.cpp
   (deps)	 rbt_set.cpp
   (deps)	 rbt_rule.cpp
   (deps)	 rbt_pars.cpp
   (deps)	 rbt_data.cpp
   (deps)	 rbt.cpp
   (deps)	 cpdtrans.cpp
   (deps)	 tridpars.cpp
   (deps)	 strrepl.cpp
   (deps)	 funcrepl.cpp
   (deps)	 unesctrn.cpp
   (deps)	 esctrn.cpp
   (deps)	 utrans.cpp
   (deps)	 translit.cpp
   (deps)	 stsearch.cpp
   (deps)	 usearch.cpp
   (deps)	 search.cpp
   (deps)	 strmatch.cpp
   (deps)	 collationfastlatinbuilder.cpp
   (deps)	 collationbuilder.cpp
   (deps)	 collationruleparser.cpp
   (deps)	 collationweights.cpp
   (deps)	 collationrootelements.cpp
   (deps)	 collationdatabuilder.cpp
   (deps)	 collationroot.cpp
   (deps)	 rulebasedcollator.cpp
   (deps)	 collationkeys.cpp
   (deps)	 collationfastlatin.cpp
   (deps)	 collationcompare.cpp
   (deps)	 collationsets.cpp
   (deps)	 uitercollationiterator.cpp
   (deps)	 utf8collationiterator.cpp
   (deps)	 utf16collationiterator.cpp
   (deps)	 collationiterator.cpp
   (deps)	 collationfcd.cpp
   (deps)	 collationdatawriter.cpp
   (deps)	 collationdatareader.cpp
   (deps)	 collationtailoring.cpp
   (deps)	 collationdata.cpp
   (deps)	 collationsettings.cpp
   (deps)	 collation.cpp
   (deps)	 ucol_sit.cpp
   (deps)	 ucol_res.cpp
   (deps)	 ucol.cpp
   (deps)	 ucoleitr.cpp
   (deps)	 bocsu.cpp
   (deps)	 sortkey.cpp
   (deps)	 coll.cpp
   (deps)	 coleitr.cpp
   (deps)	 ethpccal.cpp
   (deps)	 dangical.cpp
   (deps)	 coptccal.cpp
   (deps)	 cecal.cpp
   (deps)	 chnsecal.cpp
   (deps)	 indiancal.cpp
   (deps)	 hebrwcal.cpp
   (deps)	 gregoimp.cpp
   (deps)	 japancal.cpp
   (deps)	 islamcal.cpp
   (deps)	 persncal.cpp
   (deps)	 buddhcal.cpp
   (deps)	 taiwncal.cpp
   (deps)	 astro.cpp
   (deps)	 olsontz.cpp
   (deps)	 simpletz.cpp
   (deps)	 timezone.cpp
   (deps)	 gregocal.cpp
   (deps)	 calendar.cpp
   (deps)	 ucal.cpp
   (deps)	 ucsdet.cpp
   (deps)	 unumsys.cpp
   (deps)	 numsys.cpp
   (deps)	 rbnf.cpp
   (deps)	 nfsubs.cpp
   (deps)	 nfrule.cpp
   (deps)	 nfrs.cpp
   (deps)	 udatpg.cpp
   (deps)	 dtptngen.cpp
   (deps)	 udat.cpp
   (deps)	 dtfmtsym.cpp
   (deps)	 reldtfmt.cpp
   (deps)	 smpdtfmt.cpp
   (deps)	 datefmt.cpp
   (deps)	 choicfmt.cpp
   (deps)	 fmtable_cnv.cpp
   (deps)	 digitlst.cpp
   (deps)	 dcfmtsym.cpp
   (deps)	 decimalformatpattern.cpp
   (deps)	 decimfmt.cpp
   (deps)	 unum.cpp
   (deps)	 numfmt.cpp
   (deps)	 umsg.cpp
   (deps)	 msgfmt.cpp
   (deps)	 format.cpp
   (deps)	 fmtable.cpp
   (deps)	 ucln_in.cpp
   g++	 ...  ucln_in.cpp
   g++	 ...  fmtable.cpp
   g++	 ...  format.cpp
   g++	 ...  msgfmt.cpp
   g++	 ...  umsg.cpp
   g++	 ...  numfmt.cpp
   g++	 ...  unum.cpp
   g++	 ...  decimfmt.cpp
   g++	 ...  decimalformatpattern.cpp
   g++	 ...  dcfmtsym.cpp
   g++	 ...  digitlst.cpp
   g++	 ...  fmtable_cnv.cpp
   g++	 ...  choicfmt.cpp
   g++	 ...  datefmt.cpp
   g++	 ...  smpdtfmt.cpp
   g++	 ...  reldtfmt.cpp
   g++	 ...  dtfmtsym.cpp
   g++	 ...  udat.cpp
   g++	 ...  dtptngen.cpp
   g++	 ...  udatpg.cpp
   g++	 ...  nfrs.cpp
   g++	 ...  nfrule.cpp
   g++	 ...  nfsubs.cpp
   g++	 ...  rbnf.cpp
   g++	 ...  numsys.cpp
   g++	 ...  unumsys.cpp
   g++	 ...  ucsdet.cpp
   g++	 ...  ucal.cpp
   g++	 ...  calendar.cpp
   g++	 ...  gregocal.cpp
   g++	 ...  timezone.cpp
   g++	 ...  simpletz.cpp
   g++	 ...  olsontz.cpp
   g++	 ...  astro.cpp
   g++	 ...  taiwncal.cpp
   g++	 ...  buddhcal.cpp
   g++	 ...  persncal.cpp
   g++	 ...  islamcal.cpp
   g++	 ...  japancal.cpp
   g++	 ...  gregoimp.cpp
   g++	 ...  hebrwcal.cpp
   g++	 ...  indiancal.cpp
   g++	 ...  chnsecal.cpp
   g++	 ...  cecal.cpp
   g++	 ...  coptccal.cpp
   g++	 ...  dangical.cpp
   g++	 ...  ethpccal.cpp
   g++	 ...  coleitr.cpp
   g++	 ...  coll.cpp
   g++	 ...  sortkey.cpp
   g++	 ...  bocsu.cpp
   g++	 ...  ucoleitr.cpp
   g++	 ...  ucol.cpp
   g++	 ...  ucol_res.cpp
   g++	 ...  ucol_sit.cpp
   g++	 ...  collation.cpp
   g++	 ...  collationsettings.cpp
   g++	 ...  collationdata.cpp
   g++	 ...  collationtailoring.cpp
   g++	 ...  collationdatareader.cpp
   g++	 ...  collationdatawriter.cpp
   g++	 ...  collationfcd.cpp
   g++	 ...  collationiterator.cpp
   g++	 ...  utf16collationiterator.cpp
   g++	 ...  utf8collationiterator.cpp
   g++	 ...  uitercollationiterator.cpp
   g++	 ...  collationsets.cpp
   g++	 ...  collationcompare.cpp
   g++	 ...  collationfastlatin.cpp
   g++	 ...  collationkeys.cpp
   g++	 ...  rulebasedcollator.cpp
   g++	 ...  collationroot.cpp
   g++	 ...  collationrootelements.cpp
   g++	 ...  collationdatabuilder.cpp
   g++	 ...  collationweights.cpp
   g++	 ...  collationruleparser.cpp
   g++	 ...  collationbuilder.cpp
   g++	 ...  collationfastlatinbuilder.cpp
   g++	 ...  strmatch.cpp
   g++	 ...  usearch.cpp
   g++	 ...  search.cpp
   g++	 ...  stsearch.cpp
   g++	 ...  translit.cpp
   g++	 ...  utrans.cpp
   g++	 ...  esctrn.cpp
   g++	 ...  unesctrn.cpp
   g++	 ...  funcrepl.cpp
   g++	 ...  strrepl.cpp
   g++	 ...  tridpars.cpp
   g++	 ...  cpdtrans.cpp
   g++	 ...  rbt.cpp
   g++	 ...  rbt_data.cpp
   g++	 ...  rbt_pars.cpp
   g++	 ...  rbt_rule.cpp
   g++	 ...  rbt_set.cpp
   g++	 ...  nultrans.cpp
   g++	 ...  remtrans.cpp
   g++	 ...  casetrn.cpp
   g++	 ...  titletrn.cpp
   g++	 ...  tolowtrn.cpp
   g++	 ...  toupptrn.cpp
   g++	 ...  anytrans.cpp
   g++	 ...  name2uni.cpp
   g++	 ...  uni2name.cpp
   g++	 ...  nortrans.cpp
   g++	 ...  quant.cpp
   g++	 ...  transreg.cpp
   g++	 ...  brktrans.cpp
   g++	 ...  regexcmp.cpp
   g++	 ...  rematch.cpp
   g++	 ...  repattrn.cpp
   g++	 ...  regexst.cpp
   g++	 ...  regextxt.cpp
   g++	 ...  regeximp.cpp
   g++	 ...  uregex.cpp
   g++	 ...  uregexc.cpp
   gcc	 ...  ulocdata.c
   g++	 ...  measfmt.cpp
   g++	 ...  currfmt.cpp
   g++	 ...  curramt.cpp
   g++	 ...  currunit.cpp
   g++	 ...  measure.cpp
   gcc	 ...  utmscale.c
   g++	 ...  csdetect.cpp
   g++	 ...  csmatch.cpp
   g++	 ...  csr2022.cpp
   g++	 ...  csrecog.cpp
   g++	 ...  csrmbcs.cpp
   g++	 ...  csrsbcs.cpp
   g++	 ...  csrucode.cpp
   g++	 ...  csrutf8.cpp
   g++	 ...  inputext.cpp
   g++	 ...  wintzimpl.cpp
   g++	 ...  windtfmt.cpp
   g++	 ...  winnmfmt.cpp
   g++	 ...  basictz.cpp
   g++	 ...  rbtz.cpp
   g++	 ...  dtrule.cpp
   g++	 ...  tzrule.cpp
   g++	 ...  tztrans.cpp
   g++	 ...  vtzone.cpp
   g++	 ...  zonemeta.cpp
   g++	 ...  standardplural.cpp
   g++	 ...  upluralrules.cpp
   g++	 ...  plurrule.cpp
   g++	 ...  plurfmt.cpp
   g++	 ...  selfmt.cpp
   g++	 ...  dtitvfmt.cpp
   g++	 ...  dtitvinf.cpp
   g++	 ...  udateintervalformat.cpp
   g++	 ...  tmunit.cpp
   g++	 ...  tmutamt.cpp
   g++	 ...  tmutfmt.cpp
   g++	 ...  currpinf.cpp
   g++	 ...  uspoof.cpp
   g++	 ...  uspoof_impl.cpp
   g++	 ...  uspoof_build.cpp
   g++	 ...  uspoof_conf.cpp
   g++	 ...  decfmtst.cpp
   g++	 ...  smpdtfst.cpp
   g++	 ...  ztrans.cpp
   g++	 ...  zrule.cpp
   g++	 ...  vzone.cpp
   g++	 ...  fphdlimp.cpp
   g++	 ...  fpositer.cpp
   g++	 ...  ufieldpositer.cpp
   gcc	 ...  decNumber.c
   gcc	 ...  decContext.c
   g++	 ...  alphaindex.cpp
   g++	 ...  tznames.cpp
   g++	 ...  tznames_impl.cpp
   g++	 ...  tzgnames.cpp
   g++	 ...  tzfmt.cpp
   g++	 ...  compactdecimalformat.cpp
   g++	 ...  gender.cpp
   g++	 ...  region.cpp
   g++	 ...  scriptset.cpp
   g++	 ...  uregion.cpp
   g++	 ...  reldatefmt.cpp
   g++	 ...  quantityformatter.cpp
   g++	 ...  measunit.cpp
   g++	 ...  sharedbreakiterator.cpp
   g++	 ...  scientificnumberformatter.cpp
   g++	 ...  digitgrouping.cpp
   g++	 ...  digitinterval.cpp
   g++	 ...  digitformatter.cpp
   g++	 ...  digitaffix.cpp
   g++	 ...  valueformatter.cpp
   g++	 ...  digitaffixesandpadding.cpp
   g++	 ...  pluralaffix.cpp
   g++	 ...  precision.cpp
   g++	 ...  affixpatternparser.cpp
   g++	 ...  smallintformatter.cpp
   g++	 ...  decimfmtimpl.cpp
   g++	 ...  visibledigits.cpp
   g++	 ...  dayperiodrules.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicui18n.so.58 -o ../lib/libicui18n.so.58.2 ucln_in.o fmtable.o format.o msgfmt.o umsg.o numfmt.o unum.o decimfmt.o decimalformatpattern.o dcfmtsym.o digitlst.o fmtable_cnv.o choicfmt.o datefmt.o smpdtfmt.o reldtfmt.o dtfmtsym.o udat.o dtptngen.o udatpg.o nfrs.o nfrule.o nfsubs.o rbnf.o numsys.o unumsys.o ucsdet.o ucal.o calendar.o gregocal.o timezone.o simpletz.o olsontz.o astro.o taiwncal.o buddhcal.o persncal.o islamcal.o japancal.o gregoimp.o hebrwcal.o indiancal.o chnsecal.o cecal.o coptccal.o dangical.o ethpccal.o coleitr.o coll.o sortkey.o bocsu.o ucoleitr.o ucol.o ucol_res.o ucol_sit.o collation.o collationsettings.o collationdata.o collationtailoring.o collationdatareader.o collationdatawriter.o collationfcd.o collationiterator.o utf16collationiterator.o utf8collationiterator.o uitercollationiterator.o collationsets.o collationcompare.o collationfastlatin.o collationkeys.o rulebasedcollator.o collationroot.o collationrootelements.o collationdatabuilder.o collationweights.o collationruleparser.o collationbuilder.o collationfastlatinbuilder.o strmatch.o usearch.o search.o stsearch.o translit.o utrans.o esctrn.o unesctrn.o funcrepl.o strrepl.o tridpars.o cpdtrans.o rbt.o rbt_data.o rbt_pars.o rbt_rule.o rbt_set.o nultrans.o remtrans.o casetrn.o titletrn.o tolowtrn.o toupptrn.o anytrans.o name2uni.o uni2name.o nortrans.o quant.o transreg.o brktrans.o regexcmp.o rematch.o repattrn.o regexst.o regextxt.o regeximp.o uregex.o uregexc.o ulocdata.o measfmt.o currfmt.o curramt.o currunit.o measure.o utmscale.o csdetect.o csmatch.o csr2022.o csrecog.o csrmbcs.o csrsbcs.o csrucode.o csrutf8.o inputext.o wintzimpl.o windtfmt.o winnmfmt.o basictz.o dtrule.o rbtz.o tzrule.o tztrans.o vtzone.o zonemeta.o standardplural.o upluralrules.o plurrule.o plurfmt.o selfmt.o dtitvfmt.o dtitvinf.o udateintervalformat.o tmunit.o tmutamt.o tmutfmt.o currpinf.o uspoof.o uspoof_impl.o uspoof_build.o uspoof_conf.o decfmtst.o smpdtfst.o ztrans.o zrule.o vzone.o fphdlimp.o fpositer.o ufieldpositer.o decNumber.o decContext.o alphaindex.o tznames.o tznames_impl.o tzgnames.o tzfmt.o compactdecimalformat.o gender.o region.o scriptset.o uregion.o reldatefmt.o quantityformatter.o measunit.o sharedbreakiterator.o scientificnumberformatter.o digitgrouping.o digitinterval.o digitformatter.o digitaffix.o valueformatter.o digitaffixesandpadding.o pluralaffix.o precision.o affixpatternparser.o smallintformatter.o decimfmtimpl.o visibledigits.o dayperiodrules.o -L../lib -licuuc -L../stubdata -licudata -lpthread -ldl -lm 
rm -f ../lib/libicui18n.so.58 && ln -s libicui18n.so.58.2 ../lib/libicui18n.so.58
rm -f ../lib/libicui18n.so && ln -s libicui18n.so.58.2 ../lib/libicui18n.so
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/i18n'
/usr/bin/make[1]: Making `all' in `tools'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
/usr/bin/make[2]: Making `all' in `toolutil'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/toolutil'
   (deps)	 ucln_tu.cpp
   (deps)	 dbgutil.cpp
   (deps)	 udbgutil.cpp
   (deps)	 filetools.cpp
   (deps)	 flagparser.c
   (deps)	 ppucd.cpp
   (deps)	 pkg_gencmn.c
   (deps)	 pkg_genc.c
   (deps)	 pkg_icu.cpp
   (deps)	 writesrc.c
   (deps)	 xmlparser.cpp
   (deps)	 ucbuf.cpp
   (deps)	 uparse.c
   (deps)	 uoptions.c
   (deps)	 ucmstate.c
   (deps)	 ucm.c
   (deps)	 denseranges.cpp
   (deps)	 collationinfo.cpp
   (deps)	 unewdata.c
   (deps)	 toolutil.cpp
   (deps)	 swapimpl.cpp
   (deps)	 pkgitems.cpp
   (deps)	 package.cpp
   (deps)	 filestrm.c
   gcc	 ...  filestrm.c
   g++	 ...  package.cpp
   g++	 ...  pkgitems.cpp
   g++	 ...  swapimpl.cpp
   g++	 ...  toolutil.cpp
   gcc	 ...  unewdata.c
   g++	 ...  collationinfo.cpp
   g++	 ...  denseranges.cpp
   gcc	 ...  ucm.c
   gcc	 ...  ucmstate.c
   gcc	 ...  uoptions.c
   gcc	 ...  uparse.c
   g++	 ...  ucbuf.cpp
   g++	 ...  xmlparser.cpp
   gcc	 ...  writesrc.c
   g++	 ...  pkg_icu.cpp
   gcc	 ...  pkg_genc.c
   gcc	 ...  pkg_gencmn.c
   g++	 ...  ppucd.cpp
   gcc	 ...  flagparser.c
   g++	 ...  filetools.cpp
   g++	 ...  udbgutil.cpp
   g++	 ...  dbgutil.cpp
   g++	 ...  ucln_tu.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicutu.so.58 -o ../../lib/libicutu.so.58.2 filestrm.o package.o pkgitems.o swapimpl.o toolutil.o unewdata.o collationinfo.o denseranges.o ucm.o ucmstate.o uoptions.o uparse.o ucbuf.o xmlparser.o writesrc.o pkg_icu.o pkg_genc.o pkg_gencmn.o ppucd.o flagparser.o filetools.o udbgutil.o dbgutil.o ucln_tu.o -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm 
rm -f ../../lib/libicutu.so.58 && ln -s libicutu.so.58.2 ../../lib/libicutu.so.58
rm -f ../../lib/libicutu.so && ln -s libicutu.so.58.2 ../../lib/libicutu.so
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/toolutil'
/usr/bin/make[2]: Making `all' in `ctestfw'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/ctestfw'
   (deps)	 ucln_ct.c
   (deps)	 uperf.cpp
   (deps)	 datamap.cpp
   (deps)	 testdata.cpp
   (deps)	 tstdtmod.cpp
   (deps)	 ctest.c
   gcc	 ...  ctest.c
   g++	 ...  tstdtmod.cpp
   g++	 ...  testdata.cpp
   g++	 ...  datamap.cpp
   g++	 ...  uperf.cpp
   gcc	 ...  ucln_ct.c
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicutest.so.58 -o libicutest.so.58.2 ctest.o tstdtmod.o testdata.o datamap.o uperf.o ucln_ct.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm 
rm -f libicutest.so.58 && ln -s libicutest.so.58.2 libicutest.so.58
rm -f libicutest.so && ln -s libicutest.so.58.2 libicutest.so
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/ctestfw'
/usr/bin/make[2]: Making `all' in `makeconv'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/makeconv'
   (deps)	 gencnvex.c
   (deps)	 genmbcs.cpp
   (deps)	 ucnvstat.c
   (deps)	 makeconv.cpp
   g++	 ...  makeconv.cpp
   gcc	 ...  ucnvstat.c
cd ../.. \
 && CONFIG_FILES=tools/makeconv/makeconv.1 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  genmbcs.cpp
   gcc	 ...  gencnvex.c
config.status: creating tools/makeconv/makeconv.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/makeconv makeconv.o ucnvstat.o genmbcs.o gencnvex.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/makeconv'
/usr/bin/make[2]: Making `all' in `genrb'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genrb'
   (deps)	 prscmnts.cpp
   (deps)	 wrtxml.cpp
   (deps)	 rle.c
   (deps)	 wrtjava.cpp
   (deps)	 rbutil.c
   (deps)	 ustr.c
   (deps)	 reslist.cpp
   (deps)	 read.c
   (deps)	 parse.cpp
   (deps)	 genrb.cpp
   (deps)	 errmsg.c
   gcc	 ...  errmsg.c
   g++	 ...  genrb.cpp
   g++	 ...  parse.cpp
   gcc	 ...  read.c
   g++	 ...  reslist.cpp
   gcc	 ...  ustr.c
   gcc	 ...  rbutil.c
   g++	 ...  wrtjava.cpp
   gcc	 ...  rle.c
   g++	 ...  wrtxml.cpp
   g++	 ...  prscmnts.cpp
cd ../.. \
 && CONFIG_FILES=tools/genrb/derb.1 CONFIG_HEADERS= /bin/sh ./config.status
config.status: creating tools/genrb/derb.1
cd ../.. \
 && CONFIG_FILES=tools/genrb/genrb.1 CONFIG_HEADERS= /bin/sh ./config.status
config.status: creating tools/genrb/genrb.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genrb errmsg.o genrb.o parse.o read.o reslist.o ustr.o rbutil.o wrtjava.o rle.o wrtxml.o prscmnts.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genrb'
/usr/bin/make[2]: Making `all' in `genbrk'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genbrk'
   (deps)	 genbrk.cpp
cd ../.. \
 && CONFIG_FILES=tools/genbrk/genbrk.1 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  genbrk.cpp
config.status: creating tools/genbrk/genbrk.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genbrk genbrk.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genbrk'
/usr/bin/make[2]: Making `all' in `gencnval'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencnval'
   (deps)	 gencnval.c
cd ../.. \
 && CONFIG_FILES=tools/gencnval/gencnval.1 CONFIG_HEADERS= /bin/sh ./config.status
   gcc	 ...  gencnval.c
config.status: creating tools/gencnval/gencnval.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencnval gencnval.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencnval'
/usr/bin/make[2]: Making `all' in `gensprep'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gensprep'
   (deps)	 store.c
   (deps)	 gensprep.c
cd ../.. \
 && CONFIG_FILES=tools/gensprep/gensprep.8 CONFIG_HEADERS= /bin/sh ./config.status
   gcc	 ...  gensprep.c
   gcc	 ...  store.c
config.status: creating tools/gensprep/gensprep.8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gensprep gensprep.o store.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gensprep'
/usr/bin/make[2]: Making `all' in `icuinfo'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icuinfo'
   (deps)	 icuinfo.cpp
   g++	 ...  icuinfo.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o icuinfo icuinfo.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icuinfo'
/usr/bin/make[2]: Making `all' in `genccode'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genccode'
   (deps)	 genccode.c
cd ../.. \
 && CONFIG_FILES=tools/genccode/genccode.8 CONFIG_HEADERS= /bin/sh ./config.status
   gcc	 ...  genccode.c
config.status: creating tools/genccode/genccode.8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genccode genccode.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genccode'
/usr/bin/make[2]: Making `all' in `gencmn'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencmn'
   (deps)	 gencmn.c
cd ../.. \
 && CONFIG_FILES=tools/gencmn/gencmn.8 CONFIG_HEADERS= /bin/sh ./config.status
   gcc	 ...  gencmn.c
config.status: creating tools/gencmn/gencmn.8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencmn gencmn.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencmn'
/usr/bin/make[2]: Making `all' in `icupkg'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icupkg'
   (deps)	 icupkg.cpp
cd ../.. \
 && CONFIG_FILES=tools/icupkg/icupkg.8 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  icupkg.cpp
config.status: creating tools/icupkg/icupkg.8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/icupkg icupkg.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icupkg'
/usr/bin/make[2]: Making `all' in `pkgdata'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/pkgdata'
   (deps)	 pkgtypes.c
   (deps)	 pkgdata.cpp
cd ../.. \
 && CONFIG_FILES=tools/pkgdata/pkgdata.1 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  pkgdata.cpp
   gcc	 ...  pkgtypes.c
config.status: creating tools/pkgdata/pkgdata.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/pkgdata pkgdata.o pkgtypes.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/pkgdata'
/usr/bin/make[2]: Making `all' in `gentest'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gentest'
   (deps)	 genres32.c
   (deps)	 gentest.c
   gcc	 ...  gentest.c
   gcc	 ...  genres32.c
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o gentest gentest.o genres32.o -L../../tools/ctestfw -licutest -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gentest'
/usr/bin/make[2]: Making `all' in `gennorm2'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gennorm2'
   (deps)	 n2builder.cpp
   (deps)	 gennorm2.cpp
   g++	 ...  gennorm2.cpp
   g++	 ...  n2builder.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gennorm2 gennorm2.o n2builder.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gennorm2'
/usr/bin/make[2]: Making `all' in `gencfu'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencfu'
   (deps)	 gencfu.cpp
cd ../.. \
 && CONFIG_FILES=tools/gencfu/gencfu.1 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  gencfu.cpp
config.status: creating tools/gencfu/gencfu.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencfu gencfu.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencfu'
/usr/bin/make[2]: Making `all' in `gendict'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gendict'
   (deps)	 gendict.cpp
cd ../.. \
 && CONFIG_FILES=tools/gendict/gendict.1 CONFIG_HEADERS= /bin/sh ./config.status
   g++	 ...  gendict.cpp
config.status: creating tools/gendict/gendict.1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gendict gendict.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gendict'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
make[3]: Nothing to be done for 'all-local'.
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
/usr/bin/make[1]: Making `all' in `data'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
/usr/bin/make -f pkgdataMakefile
echo timestamp > build-dir.tmp
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
rm -rf icupkg.inc
/bin/sh ../mkinstalldirs ./out ./out/build ./out/build/icudt58l ./out/build/icudt58l/curr ./out/build/icudt58l/lang ./out/build/icudt58l/region ./out/build/icudt58l/zone ./out/build/icudt58l/unit ./out/build/icudt58l/brkitr ./out/build/icudt58l/coll ./out/build/icudt58l/rbnf ./out/build/icudt58l/translit ./out/tmp ./out/tmp/curr ./out/tmp/lang ./out/tmp/region ./out/tmp/zone ./out/tmp/unit ./out/tmp/coll ./out/tmp/rbnf ./out/tmp/translit ./out/tmp/brkitr
mkdir ./out
mkdir ./out/build
mkdir ./out/build/icudt58l
mkdir ./out/build/icudt58l/curr
mkdir ./out/build/icudt58l/lang
mkdir ./out/build/icudt58l/region
mkdir ./out/build/icudt58l/zone
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
mkdir ./out/build/icudt58l/unit
mkdir ./out/build/icudt58l/brkitr
mkdir ./out/build/icudt58l/coll
mkdir ./out/build/icudt58l/rbnf
mkdir ./out/build/icudt58l/translit
mkdir ./out/tmp
mkdir ./out/tmp/curr
mkdir ./out/tmp/lang
mkdir ./out/tmp/region
mkdir ./out/tmp/zone
mkdir ./out/tmp/unit
mkdir ./out/tmp/coll
mkdir ./out/tmp/rbnf
mkdir ./out/tmp/translit
mkdir ./out/tmp/brkitr
mv build-dir.tmp build-dir
Unpacking ./in/icudt58l.dat and generating out/tmp/icudata.lst (list of data files)
LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/icupkg -d ./out/build/icudt58l --list -x \* ./in/icudt58l.dat -o out/tmp/icudata.lst
echo timestamp > build-local
LD_LIBRARY_PATH=../stubdata:../tools/ctestfw:../lib:$LD_LIBRARY_PATH  ../bin/pkgdata -O ../data/icupkg.inc -q -c -s /stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data/out/build/icudt58l -d ../lib -e icudt58  -T ./out/tmp -p icudt58l -m dll -r 58.2 -L icudata ./out/tmp/icudata.lst
pkgdata: /home/gbin/gcc -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -D_REENTRANT  -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -DU_HAVE_STRTOD_L=1  -DU_DISABLE_RENAMING=1 -DU_ATTRIBUTE_DEPRECATED= -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -c -I../common -I../common -DPIC -fPIC -o ./out/tmp/icudt58l_dat.o ./out/tmp/icudt58l_dat.S
pkgdata: /home/gbin/gcc -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib  -shared -Wl,-Bsymbolic  -o ../lib/libicudata.so.58.2 ./out/tmp/icudt58l_dat.o -Wl,-soname -Wl,libicudata.so.58  -Wl,-Bsymbolic
pkgdata: cd ../lib/ && rm -f libicudata.so.58 && ln -s libicudata.so.58.2 libicudata.so.58
pkgdata: cd ../lib/ && rm -f libicudata.so && ln -s libicudata.so.58.2 libicudata.so
echo timestamp > packagedata
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
Note: rebuild with "/usr/bin/make VERBOSE=1 all-local" to show all compiler parameters.
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
make[1]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
[7m>>> host-icu 58.2 Installing to host directory[27m
PATH="/stuff/gsrc/AppImage/buildroot-qt/output/host/bin:/stuff/src/AppImage/buildroot-qt/output/host/sbin:/stuff/src/AppImage/buildroot-qt/output/host/usr/bin:/stuff/src/AppImage/buildroot-qt/output/host/usr/sbin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/opt/android-ndk/build/:/opt/android-sdk-update-manager/platform-tools/:/stuff/local/bin:/home/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.9.4:/usr/x86_64-pc-linux-gnu/arm-linux-gnueabihf/gcc-bin/5.4.0:/usr/x86_64-pc-linux-gnu/armv7a-hardfloat-linux-gnueabi/gcc-bin/5.3.0:/usr/x86_64-pc-linux-gnu/msp430-elf/gcc-bin/5.4.0" PKG_CONFIG="/stuff/src/AppImage/buildroot-qt/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/stuff/src/AppImage/buildroot-qt/output/host/usr/lib/pkgconfig:/stuff/src/AppImage/buildroot-qt/output/host/usr/share/pkgconfig"  /usr/bin/make -j5 install -C /stuff/src/AppImage/buildroot-qt/output/build/host-icu-58.2/source
make[1]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
cd . \
 && CONFIG_FILES=./config/icu-config.1 CONFIG_HEADERS= /bin/sh ./config.status
/usr/bin/make[1]: Making `install' in `stubdata'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/stubdata'
/bin/sh ../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c libicudata.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c -m 644 ./config/mh-linux /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/config/mh-linux
/usr/bin/install -c ./mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/mkinstalldirs
/usr/bin/install -c ./install-sh /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/install-sh
/usr/bin/install -c -m 644 ./config/icu-uc.pc ./config/icu-i18n.pc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/pkgconfig/
/usr/bin/install -c -m 644 ./../LICENSE /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/LICENSE
/usr/bin/install -c ./config/icu-config /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/icu-config
/usr/bin/install -c -m 644 ./config/Makefile.inc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/Makefile.inc
/usr/bin/install -c -m 644 ./config/pkgdata.inc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/pkgdata.inc
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/..; \
    rm -f current && ln -s 58.2 current; \
    rm -f Makefile.inc && ln -s current/Makefile.inc Makefile.inc; \
    rm -f pkgdata.inc && ln -s current/pkgdata.inc pkgdata.inc
config.status: creating ./config/icu-config.1
/bin/sh ./mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/usr/bin/install -c -m 644 config/icu-config.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicudata.so && ln -s libicudata.so.58.2 libicudata.so
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicudata.so.58 && ln -s libicudata.so.58.2 libicudata.so.58
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/stubdata'
/usr/bin/make[1]: Making `install' in `common'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/common'
/bin/sh ../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/bin/sh ../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c ../lib/libicuuc.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c -m 644 ./unicode/appendable.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/brkiter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/bytestream.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/bytestriebuilder.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicuuc.so && ln -s libicuuc.so.58.2 libicuuc.so
/usr/bin/install -c -m 644 ./unicode/bytestrie.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/caniter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/chariter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicuuc.so.58 && ln -s libicuuc.so.58.2 libicuuc.so.58
/usr/bin/install -c -m 644 ./unicode/dbbi.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/docmain.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtintrv.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/enumset.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/errorcode.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/filteredbrk.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/icudataver.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/icuplug.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/idna.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/listformatter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/localpointer.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/locdspnm.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/locid.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/messagepattern.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/normalizer2.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/normlzr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/parseerr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/parsepos.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/platform.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ptypes.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/putil.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/rbbi.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/rep.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/resbund.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/schriter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/simpleformatter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/std_string.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/strenum.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/stringpiece.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/stringtriebuilder.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/symtable.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ubidi.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ubiditransform.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ubrk.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucasemap.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucat.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uchar.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucharstriebuilder.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucharstrie.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uchriter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uclean.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucnv_cb.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucnv_err.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucnv.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucnvsel.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uconfig.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucurr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/udata.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/udisplaycontext.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uenum.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uidna.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uiter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uldnames.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ulistformatter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uloc.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/umachine.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/umisc.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unifilt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unifunct.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unimatch.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uniset.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unistr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unorm2.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unorm.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uobject.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/urename.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/urep.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ures.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uscript.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uset.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/usetiter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ushape.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/usprep.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ustring.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ustringtrie.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utext.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utf16.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utf32.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utf8.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utf.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utf_old.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utrace.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utypes.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uvernum.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uversion.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/common'
/usr/bin/make[1]: Making `install' in `i18n'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/i18n'
   (deps)	 dayperiodrules.cpp
   (deps)	 visibledigits.cpp
   (deps)	 decimfmtimpl.cpp
   (deps)	 smallintformatter.cpp
   (deps)	 affixpatternparser.cpp
   (deps)	 precision.cpp
   (deps)	 pluralaffix.cpp
   (deps)	 digitaffixesandpadding.cpp
   (deps)	 valueformatter.cpp
   (deps)	 digitaffix.cpp
   (deps)	 digitformatter.cpp
   (deps)	 digitinterval.cpp
   (deps)	 digitgrouping.cpp
   (deps)	 scientificnumberformatter.cpp
   (deps)	 sharedbreakiterator.cpp
   (deps)	 measunit.cpp
   (deps)	 quantityformatter.cpp
   (deps)	 reldatefmt.cpp
   (deps)	 uregion.cpp
   (deps)	 scriptset.cpp
   (deps)	 region.cpp
   (deps)	 gender.cpp
   (deps)	 compactdecimalformat.cpp
   (deps)	 tzfmt.cpp
   (deps)	 tzgnames.cpp
   (deps)	 tznames_impl.cpp
   (deps)	 tznames.cpp
   (deps)	 alphaindex.cpp
   (deps)	 decContext.c
   (deps)	 decNumber.c
   (deps)	 ufieldpositer.cpp
   (deps)	 fpositer.cpp
   (deps)	 fphdlimp.cpp
   (deps)	 vzone.cpp
   (deps)	 zrule.cpp
   (deps)	 ztrans.cpp
   (deps)	 smpdtfst.cpp
   (deps)	 uspoof_conf.cpp
   (deps)	 decfmtst.cpp
   (deps)	 uspoof_build.cpp
   (deps)	 uspoof_impl.cpp
   (deps)	 uspoof.cpp
   (deps)	 currpinf.cpp
   (deps)	 tmutfmt.cpp
   (deps)	 tmutamt.cpp
   (deps)	 tmunit.cpp
   (deps)	 udateintervalformat.cpp
   (deps)	 dtitvinf.cpp
   (deps)	 dtitvfmt.cpp
   (deps)	 selfmt.cpp
   (deps)	 plurfmt.cpp
   (deps)	 plurrule.cpp
   (deps)	 upluralrules.cpp
   (deps)	 standardplural.cpp
   (deps)	 zonemeta.cpp
   (deps)	 vtzone.cpp
   (deps)	 tztrans.cpp
   (deps)	 tzrule.cpp
   (deps)	 rbtz.cpp
   (deps)	 dtrule.cpp
   (deps)	 basictz.cpp
   (deps)	 winnmfmt.cpp
   (deps)	 windtfmt.cpp
   (deps)	 wintzimpl.cpp
   (deps)	 inputext.cpp
   (deps)	 csrutf8.cpp
   (deps)	 csrucode.cpp
   (deps)	 csrsbcs.cpp
   (deps)	 csrmbcs.cpp
   (deps)	 csrecog.cpp
   (deps)	 csr2022.cpp
   (deps)	 csmatch.cpp
   (deps)	 csdetect.cpp
   (deps)	 measure.cpp
   (deps)	 utmscale.c
   (deps)	 currunit.cpp
   (deps)	 curramt.cpp
   (deps)	 currfmt.cpp
   (deps)	 measfmt.cpp
   (deps)	 ulocdata.c
   (deps)	 uregexc.cpp
   (deps)	 uregex.cpp
   (deps)	 regeximp.cpp
   (deps)	 regextxt.cpp
   (deps)	 regexst.cpp
   (deps)	 repattrn.cpp
   (deps)	 rematch.cpp
   (deps)	 regexcmp.cpp
   (deps)	 brktrans.cpp
   (deps)	 transreg.cpp
   (deps)	 quant.cpp
   (deps)	 nortrans.cpp
   (deps)	 uni2name.cpp
   (deps)	 name2uni.cpp
   (deps)	 anytrans.cpp
   (deps)	 toupptrn.cpp
   (deps)	 tolowtrn.cpp
   (deps)	 titletrn.cpp
   (deps)	 casetrn.cpp
   (deps)	 remtrans.cpp
   (deps)	 nultrans.cpp
   (deps)	 rbt_set.cpp
   (deps)	 rbt_rule.cpp
   (deps)	 rbt_pars.cpp
   (deps)	 rbt_data.cpp
   (deps)	 rbt.cpp
   (deps)	 cpdtrans.cpp
   (deps)	 tridpars.cpp
   (deps)	 strrepl.cpp
   (deps)	 funcrepl.cpp
   (deps)	 unesctrn.cpp
   (deps)	 esctrn.cpp
   (deps)	 utrans.cpp
   (deps)	 translit.cpp
   (deps)	 stsearch.cpp
   (deps)	 search.cpp
   (deps)	 usearch.cpp
   (deps)	 strmatch.cpp
   (deps)	 collationfastlatinbuilder.cpp
   (deps)	 collationbuilder.cpp
   (deps)	 collationruleparser.cpp
   (deps)	 collationweights.cpp
   (deps)	 collationdatabuilder.cpp
   (deps)	 collationrootelements.cpp
   (deps)	 collationroot.cpp
   (deps)	 rulebasedcollator.cpp
   (deps)	 collationkeys.cpp
   (deps)	 collationfastlatin.cpp
   (deps)	 collationcompare.cpp
   (deps)	 collationsets.cpp
   (deps)	 uitercollationiterator.cpp
   (deps)	 utf8collationiterator.cpp
   (deps)	 utf16collationiterator.cpp
   (deps)	 collationiterator.cpp
   (deps)	 collationfcd.cpp
   (deps)	 collationdatawriter.cpp
   (deps)	 collationdatareader.cpp
   (deps)	 collationtailoring.cpp
   (deps)	 collationdata.cpp
   (deps)	 collationsettings.cpp
   (deps)	 collation.cpp
   (deps)	 ucol_sit.cpp
   (deps)	 ucol_res.cpp
   (deps)	 ucol.cpp
   (deps)	 ucoleitr.cpp
   (deps)	 bocsu.cpp
   (deps)	 sortkey.cpp
   (deps)	 coll.cpp
   (deps)	 coleitr.cpp
   (deps)	 ethpccal.cpp
   (deps)	 dangical.cpp
   (deps)	 coptccal.cpp
   (deps)	 cecal.cpp
   (deps)	 chnsecal.cpp
   (deps)	 indiancal.cpp
   (deps)	 hebrwcal.cpp
   (deps)	 gregoimp.cpp
   (deps)	 japancal.cpp
   (deps)	 islamcal.cpp
   (deps)	 persncal.cpp
   (deps)	 buddhcal.cpp
   (deps)	 taiwncal.cpp
   (deps)	 astro.cpp
   (deps)	 olsontz.cpp
   (deps)	 simpletz.cpp
   (deps)	 timezone.cpp
   (deps)	 gregocal.cpp
   (deps)	 calendar.cpp
   (deps)	 ucal.cpp
   (deps)	 ucsdet.cpp
   (deps)	 unumsys.cpp
   (deps)	 numsys.cpp
   (deps)	 rbnf.cpp
   (deps)	 nfsubs.cpp
   (deps)	 nfrule.cpp
   (deps)	 nfrs.cpp
   (deps)	 udatpg.cpp
   (deps)	 dtptngen.cpp
   (deps)	 udat.cpp
   (deps)	 dtfmtsym.cpp
   (deps)	 reldtfmt.cpp
   (deps)	 smpdtfmt.cpp
   (deps)	 datefmt.cpp
   (deps)	 choicfmt.cpp
   (deps)	 fmtable_cnv.cpp
   (deps)	 digitlst.cpp
   (deps)	 dcfmtsym.cpp
   (deps)	 decimalformatpattern.cpp
   (deps)	 decimfmt.cpp
   (deps)	 unum.cpp
   (deps)	 numfmt.cpp
   (deps)	 umsg.cpp
   (deps)	 msgfmt.cpp
   (deps)	 format.cpp
   (deps)	 fmtable.cpp
   (deps)	 ucln_in.cpp
/bin/sh ../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  ucln_in.cpp
   g++	 ...  fmtable.cpp
   g++	 ...  format.cpp
   g++	 ...  msgfmt.cpp
/usr/bin/install -c -m 644 ./unicode/alphaindex.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/basictz.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/calendar.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/choicfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/coleitr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/coll.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/compactdecimalformat.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/curramt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/currpinf.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/currunit.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  umsg.cpp
/usr/bin/install -c -m 644 ./unicode/datefmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dcfmtsym.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/decimfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtfmtsym.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtitvfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtitvinf.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtptngen.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/dtrule.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/fieldpos.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/fmtable.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/format.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/fpositer.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/gender.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/gregocal.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/measfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/measunit.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/measure.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/msgfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/numfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  numfmt.cpp
/usr/bin/install -c -m 644 ./unicode/numsys.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/plurfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/plurrule.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/rbnf.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/rbtz.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/regex.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/region.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/reldatefmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/scientificnumberformatter.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/search.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/selfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/simpletz.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/smpdtfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/sortkey.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/stsearch.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tblcoll.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/timezone.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tmunit.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  unum.cpp
/usr/bin/install -c -m 644 ./unicode/tmutamt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tmutfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/translit.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tzfmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tznames.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tzrule.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/tztrans.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucal.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucoleitr.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucol.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ucsdet.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  decimfmt.cpp
/usr/bin/install -c -m 644 ./unicode/udateintervalformat.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/udat.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/udatpg.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ufieldpositer.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uformattable.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ugender.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ulocdata.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/umsg.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unirepl.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unum.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/unumsys.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/upluralrules.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uregex.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uregion.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/ureldatefmt.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/usearch.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/uspoof.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utmscale.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/utrans.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
/usr/bin/install -c -m 644 ./unicode/vtzone.h /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/include/unicode
   g++	 ...  decimalformatpattern.cpp
   g++	 ...  dcfmtsym.cpp
   g++	 ...  digitlst.cpp
   g++	 ...  fmtable_cnv.cpp
   g++	 ...  choicfmt.cpp
   g++	 ...  datefmt.cpp
   g++	 ...  smpdtfmt.cpp
   g++	 ...  reldtfmt.cpp
   g++	 ...  dtfmtsym.cpp
   g++	 ...  udat.cpp
   g++	 ...  dtptngen.cpp
   g++	 ...  udatpg.cpp
   g++	 ...  nfrs.cpp
   g++	 ...  nfrule.cpp
   g++	 ...  nfsubs.cpp
   g++	 ...  rbnf.cpp
   g++	 ...  numsys.cpp
   g++	 ...  unumsys.cpp
   g++	 ...  ucsdet.cpp
   g++	 ...  ucal.cpp
   g++	 ...  calendar.cpp
   g++	 ...  gregocal.cpp
   g++	 ...  timezone.cpp
   g++	 ...  simpletz.cpp
   g++	 ...  olsontz.cpp
   g++	 ...  astro.cpp
   g++	 ...  taiwncal.cpp
   g++	 ...  buddhcal.cpp
   g++	 ...  persncal.cpp
   g++	 ...  islamcal.cpp
   g++	 ...  japancal.cpp
   g++	 ...  gregoimp.cpp
   g++	 ...  hebrwcal.cpp
   g++	 ...  indiancal.cpp
   g++	 ...  chnsecal.cpp
   g++	 ...  cecal.cpp
   g++	 ...  coptccal.cpp
   g++	 ...  dangical.cpp
   g++	 ...  ethpccal.cpp
   g++	 ...  coleitr.cpp
   g++	 ...  coll.cpp
   g++	 ...  sortkey.cpp
   g++	 ...  bocsu.cpp
   g++	 ...  ucoleitr.cpp
   g++	 ...  ucol.cpp
   g++	 ...  ucol_res.cpp
   g++	 ...  ucol_sit.cpp
   g++	 ...  collation.cpp
   g++	 ...  collationsettings.cpp
   g++	 ...  collationdata.cpp
   g++	 ...  collationtailoring.cpp
   g++	 ...  collationdatareader.cpp
   g++	 ...  collationdatawriter.cpp
   g++	 ...  collationfcd.cpp
   g++	 ...  collationiterator.cpp
   g++	 ...  utf16collationiterator.cpp
   g++	 ...  utf8collationiterator.cpp
   g++	 ...  uitercollationiterator.cpp
   g++	 ...  collationsets.cpp
   g++	 ...  collationcompare.cpp
   g++	 ...  collationfastlatin.cpp
   g++	 ...  collationkeys.cpp
   g++	 ...  rulebasedcollator.cpp
   g++	 ...  collationroot.cpp
   g++	 ...  collationrootelements.cpp
   g++	 ...  collationdatabuilder.cpp
   g++	 ...  collationweights.cpp
   g++	 ...  collationruleparser.cpp
   g++	 ...  collationbuilder.cpp
   g++	 ...  collationfastlatinbuilder.cpp
   g++	 ...  strmatch.cpp
   g++	 ...  usearch.cpp
   g++	 ...  search.cpp
   g++	 ...  stsearch.cpp
   g++	 ...  translit.cpp
   g++	 ...  utrans.cpp
   g++	 ...  esctrn.cpp
   g++	 ...  unesctrn.cpp
   g++	 ...  funcrepl.cpp
   g++	 ...  strrepl.cpp
   g++	 ...  tridpars.cpp
   g++	 ...  cpdtrans.cpp
   g++	 ...  rbt.cpp
   g++	 ...  rbt_data.cpp
   g++	 ...  rbt_pars.cpp
   g++	 ...  rbt_rule.cpp
   g++	 ...  rbt_set.cpp
   g++	 ...  nultrans.cpp
   g++	 ...  remtrans.cpp
   g++	 ...  casetrn.cpp
   g++	 ...  titletrn.cpp
   g++	 ...  tolowtrn.cpp
   g++	 ...  toupptrn.cpp
   g++	 ...  anytrans.cpp
   g++	 ...  name2uni.cpp
   g++	 ...  uni2name.cpp
   g++	 ...  nortrans.cpp
   g++	 ...  quant.cpp
   g++	 ...  transreg.cpp
   g++	 ...  brktrans.cpp
   g++	 ...  regexcmp.cpp
   g++	 ...  rematch.cpp
   g++	 ...  repattrn.cpp
   g++	 ...  regexst.cpp
   g++	 ...  regextxt.cpp
   g++	 ...  regeximp.cpp
   g++	 ...  uregex.cpp
   g++	 ...  uregexc.cpp
   gcc	 ...  ulocdata.c
   g++	 ...  measfmt.cpp
   g++	 ...  currfmt.cpp
   g++	 ...  curramt.cpp
   g++	 ...  currunit.cpp
   g++	 ...  measure.cpp
   gcc	 ...  utmscale.c
   g++	 ...  csdetect.cpp
   g++	 ...  csmatch.cpp
   g++	 ...  csr2022.cpp
   g++	 ...  csrecog.cpp
   g++	 ...  csrmbcs.cpp
   g++	 ...  csrsbcs.cpp
   g++	 ...  csrucode.cpp
   g++	 ...  csrutf8.cpp
   g++	 ...  inputext.cpp
   g++	 ...  wintzimpl.cpp
   g++	 ...  windtfmt.cpp
   g++	 ...  winnmfmt.cpp
   g++	 ...  basictz.cpp
   g++	 ...  dtrule.cpp
   g++	 ...  rbtz.cpp
   g++	 ...  tzrule.cpp
   g++	 ...  tztrans.cpp
   g++	 ...  vtzone.cpp
   g++	 ...  zonemeta.cpp
   g++	 ...  standardplural.cpp
   g++	 ...  upluralrules.cpp
   g++	 ...  plurrule.cpp
   g++	 ...  plurfmt.cpp
   g++	 ...  selfmt.cpp
   g++	 ...  dtitvfmt.cpp
   g++	 ...  dtitvinf.cpp
   g++	 ...  udateintervalformat.cpp
   g++	 ...  tmunit.cpp
   g++	 ...  tmutamt.cpp
   g++	 ...  tmutfmt.cpp
   g++	 ...  currpinf.cpp
   g++	 ...  uspoof.cpp
   g++	 ...  uspoof_impl.cpp
   g++	 ...  uspoof_build.cpp
   g++	 ...  uspoof_conf.cpp
   g++	 ...  decfmtst.cpp
   g++	 ...  smpdtfst.cpp
   g++	 ...  ztrans.cpp
   g++	 ...  zrule.cpp
   g++	 ...  vzone.cpp
   g++	 ...  fphdlimp.cpp
   g++	 ...  fpositer.cpp
   g++	 ...  ufieldpositer.cpp
   gcc	 ...  decNumber.c
   gcc	 ...  decContext.c
   g++	 ...  alphaindex.cpp
   g++	 ...  tznames.cpp
   g++	 ...  tznames_impl.cpp
   g++	 ...  tzgnames.cpp
   g++	 ...  tzfmt.cpp
   g++	 ...  compactdecimalformat.cpp
   g++	 ...  gender.cpp
   g++	 ...  region.cpp
   g++	 ...  scriptset.cpp
   g++	 ...  uregion.cpp
   g++	 ...  reldatefmt.cpp
   g++	 ...  quantityformatter.cpp
   g++	 ...  measunit.cpp
   g++	 ...  sharedbreakiterator.cpp
   g++	 ...  scientificnumberformatter.cpp
   g++	 ...  digitgrouping.cpp
   g++	 ...  digitinterval.cpp
   g++	 ...  digitformatter.cpp
   g++	 ...  digitaffix.cpp
   g++	 ...  valueformatter.cpp
   g++	 ...  digitaffixesandpadding.cpp
   g++	 ...  pluralaffix.cpp
   g++	 ...  precision.cpp
   g++	 ...  affixpatternparser.cpp
   g++	 ...  smallintformatter.cpp
   g++	 ...  decimfmtimpl.cpp
   g++	 ...  visibledigits.cpp
   g++	 ...  dayperiodrules.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicui18n.so.58 -o ../lib/libicui18n.so.58.2 ucln_in.o fmtable.o format.o msgfmt.o umsg.o numfmt.o unum.o decimfmt.o decimalformatpattern.o dcfmtsym.o digitlst.o fmtable_cnv.o choicfmt.o datefmt.o smpdtfmt.o reldtfmt.o dtfmtsym.o udat.o dtptngen.o udatpg.o nfrs.o nfrule.o nfsubs.o rbnf.o numsys.o unumsys.o ucsdet.o ucal.o calendar.o gregocal.o timezone.o simpletz.o olsontz.o astro.o taiwncal.o buddhcal.o persncal.o islamcal.o japancal.o gregoimp.o hebrwcal.o indiancal.o chnsecal.o cecal.o coptccal.o dangical.o ethpccal.o coleitr.o coll.o sortkey.o bocsu.o ucoleitr.o ucol.o ucol_res.o ucol_sit.o collation.o collationsettings.o collationdata.o collationtailoring.o collationdatareader.o collationdatawriter.o collationfcd.o collationiterator.o utf16collationiterator.o utf8collationiterator.o uitercollationiterator.o collationsets.o collationcompare.o collationfastlatin.o collationkeys.o rulebasedcollator.o collationroot.o collationrootelements.o collationdatabuilder.o collationweights.o collationruleparser.o collationbuilder.o collationfastlatinbuilder.o strmatch.o usearch.o search.o stsearch.o translit.o utrans.o esctrn.o unesctrn.o funcrepl.o strrepl.o tridpars.o cpdtrans.o rbt.o rbt_data.o rbt_pars.o rbt_rule.o rbt_set.o nultrans.o remtrans.o casetrn.o titletrn.o tolowtrn.o toupptrn.o anytrans.o name2uni.o uni2name.o nortrans.o quant.o transreg.o brktrans.o regexcmp.o rematch.o repattrn.o regexst.o regextxt.o regeximp.o uregex.o uregexc.o ulocdata.o measfmt.o currfmt.o curramt.o currunit.o measure.o utmscale.o csdetect.o csmatch.o csr2022.o csrecog.o csrmbcs.o csrsbcs.o csrucode.o csrutf8.o inputext.o wintzimpl.o windtfmt.o winnmfmt.o basictz.o dtrule.o rbtz.o tzrule.o tztrans.o vtzone.o zonemeta.o standardplural.o upluralrules.o plurrule.o plurfmt.o selfmt.o dtitvfmt.o dtitvinf.o udateintervalformat.o tmunit.o tmutamt.o tmutfmt.o currpinf.o uspoof.o uspoof_impl.o uspoof_build.o uspoof_conf.o decfmtst.o smpdtfst.o ztrans.o zrule.o vzone.o fphdlimp.o fpositer.o ufieldpositer.o decNumber.o decContext.o alphaindex.o tznames.o tznames_impl.o tzgnames.o tzfmt.o compactdecimalformat.o gender.o region.o scriptset.o uregion.o reldatefmt.o quantityformatter.o measunit.o sharedbreakiterator.o scientificnumberformatter.o digitgrouping.o digitinterval.o digitformatter.o digitaffix.o valueformatter.o digitaffixesandpadding.o pluralaffix.o precision.o affixpatternparser.o smallintformatter.o decimfmtimpl.o visibledigits.o dayperiodrules.o -L../lib -licuuc -L../stubdata -licudata -lpthread -ldl -lm 
rm -f ../lib/libicui18n.so.58 && ln -s libicui18n.so.58.2 ../lib/libicui18n.so.58
rm -f ../lib/libicui18n.so && ln -s libicui18n.so.58.2 ../lib/libicui18n.so
/bin/sh ../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c ../lib/libicui18n.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicui18n.so && ln -s libicui18n.so.58.2 libicui18n.so
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicui18n.so.58 && ln -s libicui18n.so.58.2 libicui18n.so.58
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/i18n'
/usr/bin/make[1]: Making `install' in `tools'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
/usr/bin/make[2]: Making `install' in `toolutil'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/toolutil'
   (deps)	 ucln_tu.cpp
   (deps)	 dbgutil.cpp
   (deps)	 udbgutil.cpp
   (deps)	 filetools.cpp
   (deps)	 flagparser.c
   (deps)	 ppucd.cpp
   (deps)	 pkg_gencmn.c
   (deps)	 pkg_genc.c
   (deps)	 pkg_icu.cpp
   (deps)	 writesrc.c
   (deps)	 xmlparser.cpp
   (deps)	 ucbuf.cpp
   (deps)	 uparse.c
   (deps)	 uoptions.c
   (deps)	 ucmstate.c
   (deps)	 ucm.c
   (deps)	 denseranges.cpp
   (deps)	 collationinfo.cpp
   (deps)	 unewdata.c
   (deps)	 toolutil.cpp
   (deps)	 swapimpl.cpp
   (deps)	 pkgitems.cpp
   (deps)	 package.cpp
   (deps)	 filestrm.c
   gcc	 ...  filestrm.c
   g++	 ...  package.cpp
   g++	 ...  pkgitems.cpp
   g++	 ...  swapimpl.cpp
   g++	 ...  toolutil.cpp
   g++	 ...  collationinfo.cpp
   g++	 ...  denseranges.cpp
   gcc	 ...  unewdata.c
   gcc	 ...  ucm.c
   gcc	 ...  ucmstate.c
   gcc	 ...  uoptions.c
   gcc	 ...  uparse.c
   g++	 ...  ucbuf.cpp
   g++	 ...  xmlparser.cpp
   gcc	 ...  writesrc.c
   g++	 ...  pkg_icu.cpp
   gcc	 ...  pkg_genc.c
   gcc	 ...  pkg_gencmn.c
   g++	 ...  ppucd.cpp
   gcc	 ...  flagparser.c
   g++	 ...  filetools.cpp
   g++	 ...  udbgutil.cpp
   g++	 ...  dbgutil.cpp
   g++	 ...  ucln_tu.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicutu.so.58 -o ../../lib/libicutu.so.58.2 filestrm.o package.o pkgitems.o swapimpl.o toolutil.o unewdata.o collationinfo.o denseranges.o ucm.o ucmstate.o uoptions.o uparse.o ucbuf.o xmlparser.o writesrc.o pkg_icu.o pkg_genc.o pkg_gencmn.o ppucd.o flagparser.o filetools.o udbgutil.o dbgutil.o ucln_tu.o -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm 
rm -f ../../lib/libicutu.so.58 && ln -s libicutu.so.58.2 ../../lib/libicutu.so.58
rm -f ../../lib/libicutu.so && ln -s libicutu.so.58.2 ../../lib/libicutu.so
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c ../../lib/libicutu.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicutu.so && ln -s libicutu.so.58.2 libicutu.so
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicutu.so.58 && ln -s libicutu.so.58.2 libicutu.so.58
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/toolutil'
/usr/bin/make[2]: Making `install' in `ctestfw'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/ctestfw'
   (deps)	 ucln_ct.c
   (deps)	 uperf.cpp
   (deps)	 datamap.cpp
   (deps)	 testdata.cpp
   (deps)	 tstdtmod.cpp
   (deps)	 ctest.c
   gcc	 ...  ctest.c
   g++	 ...  tstdtmod.cpp
   g++	 ...  testdata.cpp
   g++	 ...  datamap.cpp
   g++	 ...  uperf.cpp
   gcc	 ...  ucln_ct.c
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x    -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -shared -Wl,-Bsymbolic -Wl,-soname -Wl,libicutest.so.58 -o libicutest.so.58.2 ctest.o tstdtmod.o testdata.o datamap.o uperf.o ucln_ct.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm 
rm -f libicutest.so.58 && ln -s libicutest.so.58.2 libicutest.so.58
rm -f libicutest.so && ln -s libicutest.so.58.2 libicutest.so
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
/usr/bin/install -c libicutest.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicutest.so && ln -s libicutest.so.58.2 libicutest.so
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicutest.so.58 && ln -s libicutest.so.58.2 libicutest.so.58
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/ctestfw'
/usr/bin/make[2]: Making `install' in `makeconv'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/makeconv'
   (deps)	 gencnvex.c
   (deps)	 genmbcs.cpp
   (deps)	 ucnvstat.c
   (deps)	 makeconv.cpp
   g++	 ...  makeconv.cpp
   gcc	 ...  ucnvstat.c
   g++	 ...  genmbcs.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   gcc	 ...  gencnvex.c
/usr/bin/install -c -m 644 makeconv.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/makeconv makeconv.o ucnvstat.o genmbcs.o gencnvex.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/makeconv /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/makeconv'
/usr/bin/make[2]: Making `install' in `genrb'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genrb'
   (deps)	 prscmnts.cpp
   (deps)	 wrtxml.cpp
   (deps)	 rle.c
   (deps)	 wrtjava.cpp
   (deps)	 rbutil.c
   (deps)	 ustr.c
   (deps)	 reslist.cpp
   (deps)	 read.c
   (deps)	 parse.cpp
   (deps)	 genrb.cpp
   (deps)	 errmsg.c
   gcc	 ...  errmsg.c
   g++	 ...  genrb.cpp
   g++	 ...  parse.cpp
   gcc	 ...  read.c
   g++	 ...  reslist.cpp
   gcc	 ...  ustr.c
   gcc	 ...  rbutil.c
   g++	 ...  wrtjava.cpp
   gcc	 ...  rle.c
   g++	 ...  wrtxml.cpp
   g++	 ...  prscmnts.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/usr/bin/install -c -m 644 genrb.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genrb errmsg.o genrb.o parse.o read.o reslist.o ustr.o rbutil.o wrtjava.o rle.o wrtxml.o prscmnts.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/genrb /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genrb'
/usr/bin/make[2]: Making `install' in `genbrk'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genbrk'
   (deps)	 genbrk.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   g++	 ...  genbrk.cpp
/usr/bin/install -c -m 644 genbrk.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genbrk genbrk.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/genbrk /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genbrk'
/usr/bin/make[2]: Making `install' in `gencnval'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencnval'
   (deps)	 gencnval.c
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   gcc	 ...  gencnval.c
/usr/bin/install -c -m 644 gencnval.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencnval gencnval.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/gencnval /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencnval'
/usr/bin/make[2]: Making `install' in `gensprep'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gensprep'
   (deps)	 store.c
   (deps)	 gensprep.c
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
   gcc	 ...  gensprep.c
   gcc	 ...  store.c
/usr/bin/install -c -m 644 gensprep.8 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gensprep gensprep.o store.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
/usr/bin/install -c ../../bin/gensprep /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gensprep'
/usr/bin/make[2]: Making `install' in `icuinfo'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icuinfo'
   (deps)	 icuinfo.cpp
   g++	 ...  icuinfo.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o icuinfo icuinfo.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c icuinfo /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icuinfo'
/usr/bin/make[2]: Making `install' in `genccode'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genccode'
   (deps)	 genccode.c
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
   gcc	 ...  genccode.c
/usr/bin/install -c -m 644 genccode.8 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/genccode genccode.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
/usr/bin/install -c ../../bin/genccode /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/genccode'
/usr/bin/make[2]: Making `install' in `gencmn'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencmn'
   (deps)	 gencmn.c
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
   gcc	 ...  gencmn.c
/usr/bin/install -c -m 644 gencmn.8 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencmn gencmn.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
/usr/bin/install -c ../../bin/gencmn /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencmn'
/usr/bin/make[2]: Making `install' in `icupkg'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icupkg'
   (deps)	 icupkg.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
   g++	 ...  icupkg.cpp
/usr/bin/install -c -m 644 icupkg.8 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man8
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/icupkg icupkg.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
/usr/bin/install -c ../../bin/icupkg /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/icupkg'
/usr/bin/make[2]: Making `install' in `pkgdata'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/pkgdata'
   (deps)	 pkgtypes.c
   (deps)	 pkgdata.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   g++	 ...  pkgdata.cpp
   gcc	 ...  pkgtypes.c
/usr/bin/install -c -m 644 pkgdata.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/pkgdata pkgdata.o pkgtypes.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/pkgdata /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/pkgdata'
/usr/bin/make[2]: Making `install' in `gentest'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gentest'
   (deps)	 genres32.c
   (deps)	 gentest.c
   gcc	 ...  gentest.c
   gcc	 ...  genres32.c
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o gentest gentest.o genres32.o -L../../tools/ctestfw -licutest -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm   
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gentest'
/usr/bin/make[2]: Making `install' in `gennorm2'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gennorm2'
   (deps)	 n2builder.cpp
   (deps)	 gennorm2.cpp
   g++	 ...  gennorm2.cpp
   g++	 ...  n2builder.cpp
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gennorm2 gennorm2.o n2builder.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
/usr/bin/install -c ../../bin/gennorm2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/sbin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gennorm2'
/usr/bin/make[2]: Making `install' in `gencfu'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencfu'
   (deps)	 gencfu.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   g++	 ...  gencfu.cpp
/usr/bin/install -c -m 644 gencfu.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gencfu gencfu.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/gencfu /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gencfu'
/usr/bin/make[2]: Making `install' in `gendict'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gendict'
   (deps)	 gendict.cpp
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
   g++	 ...  gendict.cpp
/usr/bin/install -c -m 644 gendict.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/home/gbin/g++ -O2 -I/stuff/src/AppImage/buildroot-qt/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long --std=c++0x   -L/stuff/src/AppImage/buildroot-qt/output/host/lib -L/stuff/src/AppImage/buildroot-qt/output/host/usr/lib -Wl,-rpath,/stuff/src/AppImage/buildroot-qt/output/host/usr/lib   -o ../../bin/gendict gendict.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm  
/bin/sh ../../mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
/usr/bin/install -c ../../bin/gendict /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools/gendict'
make[3]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
make[3]: Nothing to be done for 'install-local'.
make[3]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/tools'
/usr/bin/make[1]: Making `install' in `data'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
/bin/sh ../mkinstalldirs  /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib
LD_LIBRARY_PATH=../stubdata:../tools/ctestfw:../lib:$LD_LIBRARY_PATH  ../bin/pkgdata -O ../data/icupkg.inc -q -c -s /stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data/out/build/icudt58l -d ../lib -m dll -r 58.2 -e icudt58  -T ./out/tmp -s ./out/build/icudt58l -p icudt58l -L icudata ./out/tmp/icudata.lst -I /stuff/src/AppImage/buildroot-qt/output/host/usr/lib
pkgdata: cd ../lib/ && /usr/bin/install -c libicudata.so.58.2 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/libicudata.so.58.2
pkgdata: cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicudata.so.58 && ln -s libicudata.so.58.2 libicudata.so.58
pkgdata: cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib && rm -f libicudata.so && ln -s libicudata.so.58.2 libicudata.so
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source/data'
make[2]: Entering directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
/bin/sh ./mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/usr/bin/install -c -m 644 config/icu-config.1 /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/man/man1
/usr/bin/install -c -m 644 ./config/mh-linux /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/config/mh-linux
/usr/bin/install -c ./mkinstalldirs /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/mkinstalldirs
/usr/bin/install -c ./install-sh /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/install-sh
/usr/bin/install -c -m 644 ./config/icu-uc.pc ./config/icu-i18n.pc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/pkgconfig/
/usr/bin/install -c -m 644 ./../LICENSE /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/share/icu/58.2/LICENSE
/usr/bin/install -c ./config/icu-config /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/icu-config
/usr/bin/install -c -m 644 ./config/Makefile.inc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/Makefile.inc
/usr/bin/install -c -m 644 ./config/pkgdata.inc /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/pkgdata.inc
cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/..; \
    rm -f current && ln -s 58.2 current; \
    rm -f Makefile.inc && ln -s current/Makefile.inc Makefile.inc; \
    rm -f pkgdata.inc && ln -s current/pkgdata.inc pkgdata.inc
make[2]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
make[1]: Leaving directory '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
***
*** ERROR: package host-icu installs executables without proper RPATH:
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/openssl
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xzdec
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tabs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/getfattr
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/python2.7
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/setfattr
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tput
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmainfo
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/infocmp
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xmlwf
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmadec
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/mksquashfs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/genimage
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/clear
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tset
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/toe
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xz
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/unsquashfs
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tic
***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/attr
make: *** [package/pkg-generic.mk:231: /stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/.stamp_host_installed] Error 1
