From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:37 -0200
Subject: [Buildroot] [PATCH 09/14] genrandconfig: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-10-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E201 whitespace after '['
E202 whitespace before ']'

Ignore these warnings:
E501 line too long (138 > 132 characters)
 -> flake8 has options to ignore all warnings in a single file, to
 ignore a given warning for all files, and to ignore a given warning for
 a line. Unfortunately it does not have an option to ignore a given
 warning for a single file, so add the magic comments to all lines with
 the warning. It makes the lines even longer, but keeps the check for
 the rest of the file and stops generating warning for them.
 Alternative solutions would be to isolate the common part of the
 strings as a variable and concatenate on the fly the strings (using a
 bit more processing):
   ...="' + COMMON_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in ...
 , or to break the strings in two (the interpreter would join them):
   ...="http://autobuild.buildroot.org/toolchains/tarballs/' \
   'armv5-ctng-linux-gnueabi.tar.xz"\n' in ...
 Also, don't try to align all comments because a new toolchain exception
 added to the script in the future can easily break this alignment.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 utils/genrandconfig | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8833225..021d0f9 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -127,7 +127,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
 
     with open(toolchains_csv) as r:
         # filter empty lines and comments
-        lines = [ t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#' ]
+        lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
         toolchains = decode_byte_list(lines)
     configs = []
 
@@ -221,36 +221,36 @@ def fixup_config(configfile):
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
     if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
        'BR2_OPTIMIZE_S=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The ctng toolchain is affected by PR60155
     if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The ctng toolchain is affected by PR60155
     if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
     if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:  # noqa E501
         return False
     # libffi not available on sh2a and ARMv7-M, but propagating libffi
     # arch dependencies in Buildroot is really too much work, so we
@@ -266,37 +266,37 @@ def fixup_config(configfile):
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
     # This MIPS uClibc toolchain fails to build the gdb package
     if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS uClibc toolchain fails to build the rt-tests package
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS uClibc toolchain fails to build the civetweb package
     if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS ctng toolchain fails to build the python3 package
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS uClibc toolchain fails to build the strace package
     if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS uClibc toolchain fails to build the cdrkit package
     if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
        'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # uClibc vfork static linking issue
     if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
        'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i486-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # This MIPS uClibc toolchain fails to build the weston package
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:  # noqa E501
         return False
     # The cs nios2 2017.02 toolchain is affected by binutils PR19405
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-- 
2.7.4
