From: Lucian Lazarescu <l.lazarescu-linux@microc.ro>
Date: Mon, 24 Mar 2008 23:12:41 +0200
Subject: [Buildroot] build problems
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E60ACA76FC@mtsexchange.dc.multitech.prv>
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA76FC@mtsexchange.dc.multitech.prv>
Message-ID: <1206393161.5903.8.camel@lucian-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Same problem here. I run ubuntu feisty.
My output:

lucian at lucian-laptop:~/buildroot$ sudo make
target/linux/Makefile.in.advanced:395: warning: overriding commands for
target `/tftpboot/"vmlinux"'
target/linux/Makefile.in.advanced:391: warning: ignoring old commands
for target `/tftpboot/"vmlinux"'

Checking build system dependencies:
Overriding $(DL_DIR) in '.config'.              Ok
External download directory:                    Ok
(/home/lucian/arm/install/downloads)
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
C compiler version '4.2.3':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.3':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm
-rf /home/lucian/buildroot/project_build_arm/at91sam9260dfc/buildroot-config
mkdir -p /home/lucian/buildroot/project_build_arm/at91sam9260dfc
cp -dpRf
package/config/buildroot-config /home/lucian/buildroot/project_build_arm/at91sam9260dfc/buildroot-config
mkdir
-p /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc
echo ""
> /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc/issue
echo ""
>> /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc/issue
echo "Welcome to the Erik's uClibc development environment running on
the AT91SAM9260EK"
>> /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc/issue
mkdir
-p /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc
echo "at91sam9260dfc"
> /home/lucian/buildroot/project_build_arm/at91sam9260dfc/root/etc/hostname
PATH="/home/lucian/buildroot/toolchain_build_arm/bin:/home/lucian/buildroot/build_arm/staging_dir/bin:/home/lucian/buildroot/build_arm/staging_dir/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin" /usr/bin/make -j2 -C /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial install-gcc
make[1]: Entering directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial'
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr /home/lucian/buildroot/build_arm/staging_dir/usr
make[2]: Entering directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/fixincludes'
rm
-rf /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/fixincludes/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools 
mkdir -p
-- /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/fixincludes/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/fixincludes/README-fixinc \
          /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include/README
/usr/bin/install -c
fixinc.sh /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/fixinc.sh
/usr/bin/install -c fixincl \
          /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/fixincl
/usr/bin/install -c
mkheaders /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders
make[2]: Leaving directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/fixincludes'
make[2]: Entering directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/gcc'
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/bin
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/include
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/info
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7
for file in cc1  gnat1 cc1plus f951 jc1 jvgenmain cc1obj cc1objplus
tree1; do \
          if [ -f $file ] ; then \
            rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/$file; \
            /usr/bin/install -c
$file /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/$file; \
          else true; \
          fi; \
        done
rm
-rf /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include
mkdir /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include
chmod a
+rx /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include
/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools
/usr/bin/make \
          CFLAGS="-g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -pedantic -Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings -Wold-style-definition
-Wmissing-format-attribute  " \
          CONFIG_H="tconfig.h
auto-host.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../include/ansidecl.h" \
          MAKEOVERRIDES= \

mkinstalldirs='/bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs' \
          -f libgcc.mk install
make[3]: Entering directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/gcc'
/usr/bin/install -c -m
644 ./libgcc.a /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/
chmod
644 /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a
/home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a
/usr/bin/install -c -m
644 ./libgcov.a /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/
chmod
644 /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcov.a
/home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcov.a
make[3]: Leaving directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/gcc'
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-cpp
/usr/bin/install -c -m 755
cpp /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-cpp
if [ x != x ]; then \
          rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr//arm-linux-uclibc-cpp; \
          /usr/bin/install -c -m 755
cpp /home/lucian/buildroot/build_arm/staging_dir/usr//arm-linux-uclibc-cpp; \
        else true; fi
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcc.1
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/gcc.1 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcc.1
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcc.1
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-cpp.1
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/cpp.1 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-cpp.1
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-cpp.1
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcov.1
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/gcov.1 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcov.1
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man1/arm-linux-uclibc-gcov.1
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/fsf-funding.7
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/fsf-funding.7 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/fsf-funding.7
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/fsf-funding.7
rm -f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gfdl.7
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/gfdl.7 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gfdl.7
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gfdl.7
rm -f /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gpl.7
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/doc/gpl.7 /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gpl.7
chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/man/man7/gpl.7
rm -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/cpp.info
if [ -f doc/cpp.info ]; then \
          for f in doc/cpp.info*; do \
            realfile=`echo $f | sed -e 's|.*/\([^/]*\)$|\1|'`; \
            /usr/bin/install -c -m 644
$f /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
          done; \
        else true; fi
if /bin/bash -c 'install-info --version' >/dev/null 2>&1; then \
          if
[ -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/cpp.info ];
then \
            install-info
--dir-file=/home/lucian/buildroot/build_arm/staging_dir/usr/info/dir /home/lucian/buildroot/build_arm/staging_dir/usr/info/cpp.info; \
          else true; fi; \
        else true; fi;
for file in   collect2 ..; do \
          if [ x"$file" != x.. ]; then \
            rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/$file; \
            /usr/bin/install -c
$file /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/$file; \
          else true; fi; \
        done
for file in crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o ..; do
\
          if [ x"$file" != x.. ]; then \
            rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/$file; \
            /usr/bin/install -c -m 644
$file /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/$file; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/$file; \
          else true; fi; \
        done
* Cpp: (cpp). The GNU C preprocessor.
install-info(/home/lucian/buildroot/build_arm/staging_dir/usr/info/cpp.info): replacing existing dir entry for `cpp'
rm -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gcc.info
if [ -f doc/gcc.info ]; then \
          for f in doc/gcc.info*; do \
            realfile=`echo $f | sed -e 's|.*/\([^/]*\)$|\1|'`; \
            /usr/bin/install -c -m 644
$f /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
          done; \
        else true; fi
if /bin/bash -c 'install-info --version' >/dev/null 2>&1; then \
          if
[ -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gcc.info ];
then \
            install-info
--dir-file=/home/lucian/buildroot/build_arm/staging_dir/usr/info/dir /home/lucian/buildroot/build_arm/staging_dir/usr/info/gcc.info; \
          else true; fi; \
        else true; fi;
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/specs
if [ -f protoize ]; then \
          rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-protoize; \
          /usr/bin/install -c
protoize /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-protoize; \
          rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-unprotoize; \
          /usr/bin/install -c
unprotoize /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-unprotoize; \
          rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/SYSCALLS.c.X; \
          /usr/bin/install -c -m 644
SYSCALLS.c.X /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/SYSCALLS.c.X; \
          chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/SYSCALLS.c.X; \
        fi
if [ -f gcov ]; \
        then \
            rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcov; \
            /usr/bin/install -c
gcov /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcov; \
        fi
* gcc: (gcc). The GNU Compiler Collection.
install-info(/home/lucian/buildroot/build_arm/staging_dir/usr/info/gcc.info): replacing existing dir entry for `gcc'
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/info/cppinternals.info
if [ -f doc/cppinternals.info ]; then \
          for f in doc/cppinternals.info*; do \
            realfile=`echo $f | sed -e 's|.*/\([^/]*\)$|\1|'`; \
            /usr/bin/install -c -m 644
$f /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
          done; \
        else true; fi
if /bin/bash -c 'install-info --version' >/dev/null 2>&1; then \
          if
[ -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/cppinternals.info ]; then \
            install-info
--dir-file=/home/lucian/buildroot/build_arm/staging_dir/usr/info/dir /home/lucian/buildroot/build_arm/staging_dir/usr/info/cppinternals.info; \
          else true; fi; \
        else true; fi;
/usr/bin/install -c
gccbug /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gccbug
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccinstall.info
* Cpplib: (cppinternals). Cpplib internals.
if [ -f doc/gccinstall.info ]; then \
          for f in doc/gccinstall.info*; do \
            realfile=`echo $f | sed -e 's|.*/\([^/]*\)$|\1|'`; \
            /usr/bin/install -c -m 644
$f /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
          done; \
        else true; fi
install-info(/home/lucian/buildroot/build_arm/staging_dir/usr/info/cppinternals.info): replacing existing dir entry for `cppinternals'
rm -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccint.info
if /bin/bash -c 'install-info --version' >/dev/null 2>&1; then \
          if
[ -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccinstall.info ]; then \
            install-info
--dir-file=/home/lucian/buildroot/build_arm/staging_dir/usr/info/dir /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccinstall.info; \
          else true; fi; \
        else true; fi;
if [ -f doc/gccint.info ]; then \
          for f in doc/gccint.info*; do \
            realfile=`echo $f | sed -e 's|.*/\([^/]*\)$|\1|'`; \
            /usr/bin/install -c -m 644
$f /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
            chmod
a-x /home/lucian/buildroot/build_arm/staging_dir/usr/info/$realfile; \
          done; \
        else true; fi
* gccinstall: (gccinstall). Installing the GNU Compiler Collection.
install-info(/home/lucian/buildroot/build_arm/staging_dir/usr/info/gccinstall.info): replacing existing dir entry for `gccinstall'
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
/usr/bin/install -c
xgcc /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
if /bin/bash -c 'install-info --version' >/dev/null 2>&1; then \
          if
[ -f /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccint.info ]; then \
            install-info
--dir-file=/home/lucian/buildroot/build_arm/staging_dir/usr/info/dir /home/lucian/buildroot/build_arm/staging_dir/usr/info/gccint.info; \
          else true; fi; \
        else true; fi;
rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc-4.2.1
( cd /home/lucian/buildroot/build_arm/staging_dir/usr/bin && \
           ln arm-linux-uclibc-gcc arm-linux-uclibc-gcc-4.2.1 )
* gccint: (gccint). Internals of the GNU Compiler Collection.
install-info(/home/lucian/buildroot/build_arm/staging_dir/usr/info/gccint.info): replacing existing dir entry for `gccint'
if [ -f gcc-cross ] ; then \
          if
[ -d /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/. ] ; then \
            rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/gcc; \
            /usr/bin/install -c
gcc-cross /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/gcc; \
          else true; fi; \
        else \
          rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc-tmp; \
          ( cd /home/lucian/buildroot/build_arm/staging_dir/usr/bin && \
            ln arm-linux-uclibc-gcc arm-linux-uclibc-gcc-tmp && \
            mv -f arm-linux-uclibc-gcc-tmp
arm-linux-uclibc-arm-linux-uclibc-gcc ); \
        fi
(cd `${PWDCMD-pwd}`/include ; \
         tar -cf - .; exit 0) |
(cd /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include; tar xpf - )
for file
in /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/decfloat.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/float.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/iso646.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/stdarg.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/stdbool.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/stddef.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/ginclude/varargs.h /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/config/arm/mmintrin.h; do \
          realfile=`echo $file | sed -e 's|.*/\([^/]*\)$|\1|'`; \
          /usr/bin/install -c -m 644 $file \
            /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include/$realfile ; \
        done
/usr/bin/install -c -m 644
xlimits.h /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include/limits.h
files=`cd /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include; find . -type l -print 2>/dev/null`; \
        if [ $? -eq 0 ]; then \
          dir=`cd include; ${PWDCMD-pwd}`; \
          for i in $files; do \
            dest=`ls
-ld /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include/$i | sed -n 's/.*-> //p'`; \
            if expr "$dest" : "$dir.*" > /dev/null; then \
              rm
-f /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include/$i; \
              ln -s `echo $i | sed "s|/[^/]*|/..|g" | sed
's|/..$||'``echo "$dest" | sed "s|
$dir||"` /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/include/$i; \
            fi; \
          done; \
        fi
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/unwind-generic.h /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/include/unwind.h
/usr/bin/install -c -m
644 /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/gsyslimits.h \
          /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/gsyslimits.h
/usr/bin/install -c -m 644
macro_list /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/macro_list
if [ x != x ] ; then \
          /usr/bin/install
-c /bin/bash /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../mkinstalldirs \
                /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/mkinstalldirs ; \
          /usr/bin/install
-c /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/fixproto /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/fixproto ; \
          /usr/bin/install -c build/fix-header \
                /home/lucian/buildroot/build_arm/staging_dir/usr/libexec/gcc/arm-linux-uclibc/4.2.1/install-tools/fix-header ; \
        else :; fi
echo
'SYSTEM_HEADER_DIR="'"`echo /home/lucian/buildroot/toolchain_build_arm/uClibc_dev//usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`"'"' \

> /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders.conf
echo 'OTHER_FIXINCLUDES_DIRS=""' \

>> /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders.conf
echo 'FIXPROTO_DEFINES=""' \

>> /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders.conf
echo 'STMP_FIXPROTO=""' \

>> /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders.conf
echo 'STMP_FIXINC="stmp-fixinc"' \

>> /home/lucian/buildroot/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/install-tools/mkheaders.conf
make[2]: Leaving directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/gcc'
make[1]: Leaving directory
`/home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial'
touch /home/lucian/buildroot/toolchain_build_arm/gcc-4.2.1-initial/.installed
/usr/bin/make MAKE="/usr/bin/make -j1"
-C /home/lucian/buildroot/toolchain_build_arm/uClibc-0.9.29 \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
make[1]: Entering directory
`/home/lucian/buildroot/toolchain_build_arm/uClibc-0.9.29'
make[2]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
cc1: error: unrecognized command line option "-mfdpic"
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/lucian/buildroot/toolchain_build_arm/uClibc-0.9.29'
make: ***
[/home/lucian/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
Error 2
lucian at lucian-laptop:~/buildroot$ 

Best regards,
Lucian.


On Mon, 2008-03-24 at 07:45 -0500, Tim Barr wrote:
> I have had a similar problem, Steve. I wonder if any of the maintainers
> has tried running buildroot after a dirclean recently? Or cleared out
> the download directory to see if any package download interfaces have
> changed? I have been trying to get a successful buildroot process (for
> an AT91SAM9260EK) to complete for over 3 months now with no luck
> whatsoever. I ended up having to buy a Timesys linuxlink license in
> order to move forward.
> 
> Timothy Barr
> Hardware Development Engineer
> for Multi-Tech Systems, Inc.
> tbarr at multitech.com
> 
> 
> 
> > -----Original Message-----
> > From: buildroot-bounces at uclibc.org 
> > [mailto:buildroot-bounces at uclibc.org] On Behalf Of Steve Calfee
> > Sent: Sunday, March 23, 2008 10:51 AM
> > To: buildroot at uclibc.org
> > Subject: Re: [Buildroot] build problems
> > 
> > 
> > Hi All,
> > 
> > I used buildroot a couple of years ago successfully with a 
> > samsung 2410 soc.
> > 
> > I am now trying to use it for a new project. My problem is I 
> > cannot get any build to work.
> >  
> > Has anyone done a svn update and select a default config and 
> > have it build? I want to build an arm system, but first I 
> > would like some default config to build. I am using ubuntu 
> > feisty and think I have installed all the required tools. The 
> > mailing list seems to be quite active, but things seem to be 
> > in chaos. Can anyone tell me a starting place that is known to work?
> > 
> > Thanks, Steve
> > 
> > 
> > 
> >       
> > ______________________________________________________________
> > ______________________
> > Be a better friend, newshound, and 
> > know-it-all with Yahoo! Mobile.  Try it now.  
> > http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
