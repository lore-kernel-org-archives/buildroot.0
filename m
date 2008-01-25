From: Albert Causing <albertcausing@gmail.com>
Date: Fri, 25 Jan 2008 12:02:16 +0800
Subject: [Buildroot] error on binutils
Message-ID: <afc3bae70801242002j7f336eb2i89c4bff61c2e843d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi guys,

i've been trying to search but with no avail i guess this is my last
option, the mailing list.

----- start paste ----
bt buildroot # make
target/device/Via/epia-mii/linux.mk:75: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/linux/.configured'
target/device/Soekris/net4521/linux.mk:84: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/linux/.configured'
target/device/Via/epia-mii/linux.mk:89: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/buildroot-kernel'
target/device/Soekris/net4521/linux.mk:99: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/buildroot-kernel'
target/device/Via/epia-mii/linux.mk:99: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/staging_dir/usr/include/linux/version.h'
target/device/Soekris/net4521/linux.mk:110: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/staging_dir/usr/include/linux/version.h'
target/device/Via/epia-mii/linux.mk:109: warning: overriding commands
for target `linuxclean'
target/device/Soekris/net4521/linux.mk:120: warning: ignoring old
commands for target `linuxclean'
target/device/Via/epia-mii/linux.mk:113: warning: overriding commands
for target `linux-dirclean'
target/device/Soekris/net4521/linux.mk:124: warning: ignoring old
commands for target `linux-dirclean'

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
C compiler version '3.4.6':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '3.4.6':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /opt/buildroot/buildroot/project_build_i386/uclibc/buildroot-config
mkdir -p /opt/buildroot/buildroot/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config
/opt/buildroot/buildroot/project_build_i386/uclibc/buildroot-config
/usr/bin/make -j1 -C
/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build all
make[1]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[2]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty'
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty/testsuite'
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/intl'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
Making all in doc
make[5]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/doc'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/doc'
Making all in po
make[5]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/po'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/po'
make[5]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
/bin/sh ./libtool --tag=CC --mode=link /usr/bin/gcc  -W -Wall
-Wstrict-prototypes -Wmissing-prototypes -g -O2   -o libbfd.la -rpath
/usr/i386-pc-linux-gnu/i386-linux-uclibc/lib -release `cat
libtool-soversion`  archive.lo archures.lo bfd.lo bfdio.lo bfdwin.lo
cache.lo coffgen.lo corefile.lo format.lo init.lo libbfd.lo opncls.lo
reloc.lo section.lo syms.lo targets.lo hash.lo linker.lo srec.lo
binary.lo tekhex.lo ihex.lo stabs.lo stab-syms.lo merge.lo dwarf2.lo
simple.lo `cat ofiles`
cat: libtool-soversion: No such file or directory
libtool: link: `bfd.lo' is not a valid libtool object
make[5]: *** [libbfd.la] Error 1
make[5]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make: *** [/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/binutils/objdump]
Error 2
