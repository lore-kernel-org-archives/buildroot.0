From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Mar 2014 10:30:04 +0100
Subject: [Buildroot] Builtroot toolchain with gcc snapshot version
 4.9-20140309 compile failure
Message-ID: <trinity-75f996d8-d171-4abd-9868-076266c3faed-1395307804240@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

failed to compile buildroot toolchain with gcc 4.9-20140309 snapshot.

buildroot config:
BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_SNAP=y
BR2_GCC_SNAP_DATE="4.9-20140309"
BR2_TOOLCHAIN_BUILDROOT_CXX=y

build log:
...
/usr/bin/g++   -O2 -I/home/seiderer/Work/Microscope_Platform/Hardware/FS_QBlissA9/tmp/build_fsqblissa9_gcc_4_9/host/usr/include -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -fno-common  -DHAVE_CONFIG_H -DGENERATOR_FILE -static-libstdc++ -static-libgcc -L/home/seiderer/Work/Microscope_Platform/Hardware/FS_QBlissA9/tmp/build_fsqblissa9_gcc_4_9/host/lib -L/home/seiderer/Work/Microscope_Platform/Hardware/FS_QBlissA9/tmp/build_fsqblissa9_gcc_4_9/host/usr/lib -Wl,-rpath,/home/seiderer/Work/Microscope_Platform/Hardware/FS_QBlissA9/tmp/build_fsqblissa9_gcc_4_9/host/usr/lib -o build/gengtype \
    build/gengtype.o build/errors.o build/gengtype-lex.o build/gengtype-parse.o build/gengtype-state.o build/version.o ../build-x86_64-unknown-linux-gnu/libiberty/libiberty.a
build/gengtype.o: In function `adjust_field_type(type*, options*)':
gengtype.c:(.text+0x2170): undefined reference to `lexer_line'
gengtype.c:(.text+0x218e): undefined reference to `lexer_line'
gengtype.c:(.text+0x21e3): undefined reference to `lexer_line'
gengtype.c:(.text+0x2253): undefined reference to `lexer_line'
gengtype.c:(.text+0x226f): undefined reference to `lexer_line'
build/gengtype.o:gengtype.c:(.text+0x22fd): more undefined references to `lexer_line' follow
build/gengtype-parse.o: In function `require(int)':
gengtype-parse.c:(.text+0x19d): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `require2(int, int)':
gengtype-parse.c:(.text+0x21d): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `string_seq()':
gengtype-parse.c:(.text+0x309): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `consume_balanced(int, int)':
gengtype-parse.c:(.text+0x3b0): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x466): undefined reference to `yylex(char const**)'
build/gengtype-parse.o:gengtype-parse.c:(.text+0x48e): more undefined references to `yylex(char const**)' follow
build/gengtype-parse.o: In function `type(options**, bool)':
gengtype-parse.c:(.text+0x87e): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x896): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x8ed): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x90c): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x924): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x9ba): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x9d8): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0xa44): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xa79): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xa91): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xad2): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xb55): undefined reference to `yylex(char const**)'
build/gengtype-parse.o:gengtype-parse.c:(.text+0xbd7): more undefined references to `yylex(char const**)' follow
build/gengtype-parse.o: In function `type(options**, bool)':
gengtype-parse.c:(.text+0xd05): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0xd97): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0xea6): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xed2): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xf05): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xf78): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0xf9e): undefined reference to `yylex(char const**)'
build/gengtype-parse.o:gengtype-parse.c:(.text+0x1084): more undefined references to `yylex(char const**)' follow
build/gengtype-parse.o: In function `type(options**, bool)':
gengtype-parse.c:(.text+0x10f0): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x1160): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `absdecl()':
gengtype-parse.c:(.text+0x1223): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `option(options*)':
gengtype-parse.c:(.text+0x1282): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x12c4): undefined reference to `yylex(char const**)'
build/gengtype-parse.o: In function `gtymarker()':
gengtype-parse.c:(.text+0x1494): undefined reference to `yylex(char const**)'
build/gengtype-parse.o:gengtype-parse.c:(.text+0x14e7): more undefined references to `yylex(char const**)' follow
build/gengtype-parse.o: In function `parse_file(char const*)':
gengtype-parse.c:(.text+0x1819): undefined reference to `yybegin(char const*)'
gengtype-parse.c:(.text+0x18dd): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x18f9): undefined reference to `lexer_toplevel_done'
gengtype-parse.c:(.text+0x190d): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x1975): undefined reference to `yyend()'
gengtype-parse.c:(.text+0x1a1f): undefined reference to `lexer_line'
gengtype-parse.c:(.text+0x1a4e): undefined reference to `yylex(char const**)'
gengtype-parse.c:(.text+0x1a86): undefined reference to `yylex(char const**)'
collect2: error: ld returned 1 exit status
make[3]: *** [build/gengtype] Error 1
rm gcov.pod cpp.pod gfdl.pod fsf-funding.pod gcc.pod
make[2]: *** [all-gcc] Error 2
make[1]: *** [/home/seiderer/Work/Microscope_Platform/Hardware/FS_QBlissA9/tmp/build_fsqblissa9_gcc_4_9/build/host-gcc-initial-4.9-20140309/.stamp_built] Error 2
make: *** [_all] Error 2

The following (draft) patch fixes the compile for me:

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 236297d..c1da387 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -151,9 +151,7 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
-ifeq ($(BR2_arc),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
-endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)

Any chance to add these dependency for gcc snapshot version >= 4.9 (any hint
how to do this)?

Peter
