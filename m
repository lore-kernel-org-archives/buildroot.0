From: Christopher Pfindel <c.pfindel@gmail.com>
Date: Wed, 11 Nov 2009 14:51:37 +0100
Subject: [Buildroot] missing iconv.h
Message-ID: <4AFAC169.4020505@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I'm trying to compile buildroot with toolchain on target.
While compiling gcc for the target I think, I get the following error:

.../rtai_build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc -Os -pipe
-Os  -I.../rtai_build_i686/staging_dir/usr/include
-I.../rtai_build_i686/staging_dir/include
--sysroot=.../rtai_build_i686/staging_dir/ -isysroot
.../rtai_build_i686/staging_dir -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
-pipe -Os  -I.../rtai_build_i686/staging_dir/usr/include
-I.../rtai_build_i686/staging_dir/include
--sysroot=.../rtai_build_i686/staging_dir/ -isysroot
.../rtai_build_i686/staging_dir -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute
-pedantic -Wno-long-long -Wno-variadic-macros 			
-Wno-overlength-strings    -DHAVE_CONFIG_H -I. -I.
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/.
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../include
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/include
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libdecnumber
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libdecnumber/dpd
-I../libdecnumber    \
	  -DGCC_INCLUDE_DIR=\"/usr/lib/gcc/i686-linux-uclibc/4.3.3/include\"
-DFIXED_INCLUDE_DIR=\"/usr/lib/gcc/i686-linux-uclibc/4.3.3/include-fixed\"
-DGPLUSPLUS_INCLUDE_DIR=\"/usr/include/c++\"
-DGPLUSPLUS_TOOL_INCLUDE_DIR=\"/usr/include/c++/i686-linux-uclibc\"
-DGPLUSPLUS_BACKWARD_INCLUDE_DIR=\"/usr/include/c++/backward\"
-DLOCAL_INCLUDE_DIR=\"/usr/local/include\"
-DCROSS_INCLUDE_DIR=\"/usr/lib/gcc/i686-linux-uclibc/4.3.3/../../../../i686-linux-uclibc/sys-include\" 

-DTOOL_INCLUDE_DIR=\"/usr/lib/gcc/i686-linux-uclibc/4.3.3/../../../../i686-linux-uclibc/include\" 

-DPREFIX=\"/usr/\" -DSTANDARD_EXEC_PREFIX=\"/usr/lib/gcc/\"  \
	  -c .../rtai_toolchain_build_i686/gcc-4.3.3/gcc/cppdefault.c -o
cppdefault.o
.../rtai_build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc -Os -pipe
-Os  -I.../rtai_build_i686/staging_dir/usr/include
-I.../rtai_build_i686/staging_dir/include
--sysroot=.../rtai_build_i686/staging_dir/ -isysroot
.../rtai_build_i686/staging_dir -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c
-Os -pipe -Os  -I.../rtai_build_i686/staging_dir/usr/include
-I.../rtai_build_i686/staging_dir/include
--sysroot=.../rtai_build_i686/staging_dir/ -isysroot
.../rtai_build_i686/staging_dir -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute
-pedantic -Wno-long-long -Wno-variadic-macros 			
-Wno-overlength-strings    -DHAVE_CONFIG_H -I. -I.
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/.
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../include
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/include
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libdecnumber
-I.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libdecnumber/dpd
-I../libdecnumber
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/c-ppoutput.c -o c-ppoutput.o
In file included from
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/c-ppoutput.c:25:
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/internal.h:34:19:
error: iconv.h: No such file or directory
In file included from
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/c-ppoutput.c:25:
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/internal.h:45:
error: expected ')' before 'const'
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/internal.h:49:
error: expected specifier-qualifier-list before 'convert_f'
.../rtai_toolchain_build_i686/gcc-4.3.3/gcc/../libcpp/internal.h:51:
warning: struct has no members
make[3]: *** [c-ppoutput.o] Fehler 1
make[3]: Verlasse Verzeichnis '.../rtai_build_i686/gcc-4.3.3-target/gcc'
make[2]: *** [all-gcc] Fehler 2
make[2]: Verlasse Verzeichnis '.../rtai_build_i686/gcc-4.3.3-target'
make[1]: *** [all] Fehler 2
make[1]: Verlasse Verzeichnis '.../rtai_build_i686/gcc-4.3.3-target'
make: *** [.../rtai_build_i686/gcc-4.3.3-target/.compiled] Fehler 2


So iconv.h seems to be missing.
Searching for iconv.h I found it in

/usr/include/iconv.h
.../rtai_toolchain_build_i686/uClibc-0.9.30.1/include/iconv.h
.../rtai_build_i686/libiconv-1.12/include/iconv.h
Should it appear anywhere else?

How can I get rid of this error?
Thanks for all the help.

Chrissy
