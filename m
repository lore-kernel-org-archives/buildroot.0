From: Steffen Kaufmann <Steffen.Kaufmann@garz-fricke.com>
Date: Fri, 14 Mar 2008 11:11:24 +0100
Subject: [Buildroot] Problems - building rsync-2.6.9
Message-ID: <D99582E5322435468A77E74BB0039E7B1DDB03A3@SRV02.hamburg.garz-fricke.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to build the head revision from svn for avr32, but I ran into trouble. I get the following output:


---------------------

steffen at debianVM:~/buildroot/buildroot-svn$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
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
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/steffen/buildroot/buildroot-svn/project_build_avr32/atstk1002/buildroot-config
mkdir -p /home/steffen/buildroot/buildroot-svn/project_build_avr32/atstk1002
cp -dpRf package/config/buildroot-config /home/steffen/buildroot/buildroot-svn/project_build_avr32/atstk1002/buildroot-config
/usr/bin/make -j1 PATH="/home/steffen/buildroot/buildroot-svn/toolchain_build_avr32/bin:/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/bin:/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games" AR="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar" AS="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as" LD="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld -L/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/lib -L/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/lib" NM="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm" CC="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -O0  -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/include -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/include -msoft-float" GCC="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -O0  -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/include -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/include -msoft-float" CPP="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-cpp -O0  -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/include -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/include -msoft-float" CXX="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-g++ -O0  -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/include -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/include -msoft-float" FC="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gfortran " RANLIB="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib" STRIP="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-strip" OBJCOPY="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-objcopy" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD="" LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD="" AR_FOR_TARGET="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar" AS_FOR_TARGET="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as" CC_FOR_TARGET="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc" LD_FOR_TARGET="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld" NM_FOR_TARGET="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm" DEFAULT_ASSEMBLER="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as" DEFAULT_LINKER="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld" PKG_CONFIG_SYSROOT="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir" PKG_CONFIG="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/pkg-config" PKG_CONFIG_PATH="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/lib/pkgconfig:" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 STAGING_DIR="/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir" -C /home/steffen/buildroot/buildroot-svn/build_avr32/rsync-2.6.9
make[1]: Entering directory `/home/steffen/buildroot/buildroot-svn/build_avr32/rsync-2.6.9'
/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -O0  -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/usr/include -I/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/include -msoft-float -I. -I. -g -O2 -DHAVE_CONFIG_H -Wall -W -I./popt  -c rsync.c -o rsync.o
In file included from rsync.c:23:
rsync.h:367:3: error: #error Could not find a 32-bit integer variable
In file included from rsync.c:23:
rsync.h:501: error: expected specifier-qualifier-list before 'int32'
rsync.h:571: error: expected specifier-qualifier-list before 'int32'
rsync.h:581: error: expected specifier-qualifier-list before 'int32'
rsync.h:592: error: expected specifier-qualifier-list before 'int32'
rsync.h:626: error: expected ':', ',', ';', '}' or '__attribute__' before 'match_flags'
In file included from rsync.h:657,
                 from rsync.c:23:
lib/mdfour.h:24: error: expected ':', ',', ';', '}' or '__attribute__' before 'A'
lib/mdfour.h:30: error: expected ';', ',' or ')' before 'n'
In file included from rsync.h:660,
                 from rsync.c:23:
lib/addrinfo.h:111: error: redefinition of 'struct sockaddr_storage'
In file included from rsync.h:672,
                 from rsync.c:23:
proto.h:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'get_checksum1'
proto.h:14: error: expected declaration specifiers or '...' before 'int32'
proto.h:17: error: expected declaration specifiers or '...' before 'int32'
proto.h:55: error: expected ';', ',' or ')' before 'mflags'
proto.h:57: error: expected ';', ',' or ')' before 'mflags'
proto.h:65: error: expected declaration specifiers or '...' before 'int32'
proto.h:66: error: expected declaration specifiers or '...' before 'int32'
proto.h:67: error: expected declaration specifiers or '...' before 'int32'
proto.h:88: error: expected declaration specifiers or '...' before 'int32'
proto.h:118: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'read_int'
proto.h:128: error: expected declaration specifiers or '...' before 'int32'
proto.h:205: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'remember_children'
proto.h:229: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'sig_int'
proto.h:265: warning: 'struct direct' declared inside parameter list
proto.h:265: warning: its scope is only this definition or declaration, which is probably not what you want
proto.h:267: error: expected declaration specifiers or '...' before 'int32'
proto.h:268: error: expected declaration specifiers or '...' before 'int32'
proto.h:268: error: expected declaration specifiers or '...' before 'int32'
proto.h:269: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'recv_token'
proto.h:270: error: expected declaration specifiers or '...' before 'int32'
proto.h:317: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fuzzy_distance'
In file included from rsync.c:23:
rsync.h:881: error: conflicting types for 'inet_ntop'
/home/steffen/buildroot/buildroot-svn/build_avr32/staging_dir/lib/gcc/avr32-linux-uclibc/4.2.1/../../../../avr32-linux-uclibc/sys-include/arpa/inet.h:67: error: previous declaration of 'inet_ntop' was here
rsync.c: In function 'free_sums':
rsync.c:97: warning: implicit declaration of function 'free'
rsync.c: At top level:
rsync.c:233: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'sig_int'
make[1]: *** [rsync.o] Fehler 1
make[1]: Leaving directory `/home/steffen/buildroot/buildroot-svn/build_avr32/rsync-2.6.9'
make: *** [/home/steffen/buildroot/buildroot-svn/build_avr32/rsync-2.6.9/rsync] Fehler 2

---------------------

Can anybody help me?

Thanks!
Steffen
