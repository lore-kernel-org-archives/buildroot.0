From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Apr 2010 14:56:23 +0000 (UTC)
Subject: [Buildroot] [Bug 1531] New: libxcb 1.5 build fails,
 due to missing xcbgen Python module
Message-ID: <bug-1531-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1531

           Summary: libxcb 1.5 build fails, due to missing xcbgen Python
                    module
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building of libxcb 1.5 fails, because Python does not find the xcbgen Python
package. We should probably build it for the host, install it to $(HOST_DIR)
and adjust the PYTHONPATH to include $(HOST_DIR)/usr/lib/python. Of course, I
don't have the python-xcbgen package installed on my Ubuntu, otherwise the
build would probably work.

See the build log below :

>>> libxcb 1.5 Extracting
>>> libxcb 1.5 Patching package/x11r7/libxcb
for file in config.guess config.sub; do for i in $(find
/home/thomas/local/buildroot/output/build/libxcb-1.5 -name $file); do cp
package/gnuconfig/$file $i; done; done
>>> libxcb 1.5 Configuring
(cd /home/thomas/local/buildroot/output/build/libxcb-1.5/ && rm -rf
config.cache &&
PATH="/home/thomas/local/buildroot/output/host/bin:/home/thomas/local/buildroot/output/host/usr/bin:/home/thomas/local/buildroot/output/host/usr/sbin/:/home/thomas/local/buildroot/output/toolchain/bin:/home/thomas/x-tools/arm-2009q1/bin:/home/thomas/sys/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ar"
AS="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-as"
LD="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld"
NM="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-nm"
CC="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe
-Os  --sysroot /home/thomas/local/buildroot/output/staging/"
GCC="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe
-Os  --sysroot /home/thomas/local/buildroot/output/staging/"
CPP="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-cpp -Os -pipe
-Os  --sysroot /home/thomas/local/buildroot/output/staging/"
CXX="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-g++ -Os -pipe
-Os  --sysroot /home/thomas/local/buildroot/output/staging/"
FC="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gfortran "
RANLIB="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ranlib"
STRIP="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-strip"
OBJCOPY="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/thomas/local/buildroot/output/host/include
-I/home/thomas/local/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/thomas/local/buildroot/output/host/include
-I/home/thomas/local/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/thomas/local/buildroot/output/host/lib
-L/home/thomas/local/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ar"
AS_FOR_TARGET="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-as"
CC_FOR_TARGET="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc"
LD_FOR_TARGET="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld"
NM_FOR_TARGET="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-nm"
DEFAULT_ASSEMBLER="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-as"
DEFAULT_LINKER="/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld"
PKG_CONFIG_SYSROOT_DIR="/home/thomas/local/buildroot/output/staging"
PKG_CONFIG="/home/thomas/local/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/thomas/local/buildroot/output/staging/usr/lib/pkgconfig:"
PERLLIB="/home/thomas/local/buildroot/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/thomas/local/buildroot/output/host/usr/lib"
STAGING_DIR="/home/thomas/local/buildroot/output/staging"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
ac_cv_c_bigendian=no CFLAGS="-Os -pipe -Os  --sysroot
/home/thomas/local/buildroot/output/staging/" CXXFLAGS="-Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/" LDFLAGS="--sysroot
/home/thomas/local/buildroot/output/staging/" FCFLAGS="" 
STAGING_DIR="/home/thomas/local/buildroot/output/staging" ./configure 
--target=arm-none-linux-gnueabi --host=arm-none-linux-gnueabi
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --disable-gtk-doc      )
configure: WARNING: unrecognized options: --disable-gtk-doc
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-none-linux-gnueabi-strip...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for a Python interpreter with version >= 2.5... python
checking for python... /usr/bin/python
checking for python version... /usr/bin/python:
/home/thomas/local/buildroot/output/host/usr/lib/libz.so.1: no version
information available (required by /usr/bin/python)
2.6
checking for python platform... /usr/bin/python:
/home/thomas/local/buildroot/output/host/usr/lib/libz.so.1: no version
information available (required by /usr/bin/python)
linux2
checking for python script directory... ${prefix}/lib/python2.6/dist-packages
checking for python extension module directory...
${exec_prefix}/lib/python2.6/dist-packages
checking pkg-config is at least version 0.9.0... yes
checking for CHECK... no
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-none-linux-gnueabi
checking for style of include used by make... GNU
checking for arm-none-linux-gnueabi-gcc...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc
-Os -pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ accepts
-g... yes
checking for /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ option to
accept ISO C89... none needed
checking dependency style of
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/... gcc3
checking for a sed that does not truncate output...
/home/thomas/local/buildroot/output/toolchain/bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld
checking if the linker
(/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld) is GNU ld...
yes
checking for BSD- or MS-compatible name lister (nm)...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-nm
checking the name lister
(/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-nm) interface...
BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 3458764513820540925
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld
option to reload object files... -r
checking for arm-none-linux-gnueabi-objdump... arm-none-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-none-linux-gnueabi-ar...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ar
checking for arm-none-linux-gnueabi-strip... (cached)
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-strip
checking for arm-none-linux-gnueabi-ranlib...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ranlib
checking command to parse
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-nm output from
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/ object... ok
checking how to run the C preprocessor...
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-cpp -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/
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
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ supports
-fno-rtti -fno-exceptions... no
checking for /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ option to
produce PIC... -fPIC -DPIC
checking if /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ PIC flag
-fPIC -DPIC works... yes
checking if /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ static flag
-static works... yes
checking if /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ supports -c
-o file.o... yes
checking if /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ supports -c
-o file.o... (cached) yes
checking whether the
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/ linker
(/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-ld) supports shared
libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for arm-none-linux-gnueabi-gcc... (cached)
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/
checking whether we are using the GNU C compiler... (cached) yes
checking whether /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc
-Os -pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ accepts
-g... (cached) yes
checking for /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os
-pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ option to
accept ISO C89... (cached) none needed
checking dependency style of
/home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os 
--sysroot /home/thomas/local/buildroot/output/staging/... (cached) gcc3
checking for xsltproc...
/home/thomas/local/buildroot/output/host/usr/bin/xsltproc
checking for XCBPROTO... yes
checking for NEEDED... yes
checking for XDMCP... yes
checking for XdmcpWrap in -lXdmcp... yes
checking XCBPROTO_XCBINCLUDEDIR... /usr/share/xcb
checking XCBPROTO_XCBPYTHONDIR... /usr/lib/python2.6/dist-packages
checking for ANSI C header files... (cached) yes
checking for library containing getaddrinfo... none required
checking for library containing connect... none required
checking for struct sockaddr_un.sun_len... no
checking whether /home/thomas/x-tools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc
-Os -pipe -Os  --sysroot /home/thomas/local/buildroot/output/staging/ supports
symbol visibility... yes
checking for doxygen... no
WARNING:
The doxygen program was not found in your execute
You may have doxygen installed somewhere not covered by your path.

If this is the case make sure you have the packages installed, AND
that the doxygen program is in your execute path (see your
shell manual page on setting the $PATH environment variable), OR
alternatively, specify the program to use with --with-doxygen.
configure: WARNING: Warning: no doxygen detected. Documentation will not be
built
checking for dot... no
configure: WARNING: Warning: no dot detected. Documentation will not be built
checking whether documentation is built... no
checking for poll... yes
checking for launchd... no
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating src/Makefile
config.status: creating tests/Makefile
config.status: creating xcb.pc
config.status: creating xcb-composite.pc
config.status: creating xcb-damage.pc
config.status: creating xcb-dpms.pc
config.status: creating xcb-dri2.pc
config.status: creating xcb-glx.pc
config.status: creating xcb-randr.pc
config.status: creating xcb-record.pc
config.status: creating xcb-render.pc
config.status: creating xcb-res.pc
config.status: creating xcb-screensaver.pc
config.status: creating xcb-shape.pc
config.status: creating xcb-shm.pc
config.status: creating xcb-sync.pc
config.status: creating xcb-xevie.pc
config.status: creating xcb-xf86dri.pc
config.status: creating xcb-xfixes.pc
config.status: creating xcb-xinerama.pc
config.status: creating xcb-xinput.pc
config.status: creating xcb-xprint.pc
config.status: creating xcb-xselinux.pc
config.status: creating xcb-xtest.pc
config.status: creating xcb-xv.pc
config.status: creating xcb-xvmc.pc
config.status: creating doc/xcb.doxygen
config.status: creating src/config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-gtk-doc

  Package: libxcb 1.5

  Configuration
    XDM support.........: yes
    Build unit tests....: no
    XCB buffer size.....: 16384

  Used CFLAGS:
    CPPFLAGS............: 
    CFLAGS..............: -Os -pipe -Os  --sysroot
/home/thomas/local/buildroot/output/staging/
    Warning CFLAGS......: -Wall -pedantic -Wpointer-arith              
-Wstrict-prototypes -Wmissing-declarations -Wnested-externs

  Installation:
    Prefix..............: /usr

>>> libxcb 1.5 Building
PATH="/home/thomas/local/buildroot/output/host/bin:/home/thomas/local/buildroot/output/host/usr/bin:/home/thomas/local/buildroot/output/host/usr/sbin/:/home/thomas/local/buildroot/output/toolchain/bin:/home/thomas/x-tools/arm-2009q1/bin:/home/thomas/sys/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
LD_LIBRARY_PATH="/home/thomas/local/buildroot/output/host/usr/lib:"
PERLLIB="/home/thomas/local/buildroot/output/host/usr/lib/perl"  /usr/bin/make
-j2
XCBPROTO_XCBINCLUDEDIR=/home/thomas/local/buildroot/output/staging/usr/share/xcb
XCBPROTO_XCBPYTHONDIR=/home/thomas/local/buildroot/output/staging/usr/lib/python2.6/site-packages
-C /home/thomas/local/buildroot/output/build/libxcb-1.5/
make[1]: Entering directory
`/home/thomas/local/buildroot/output/build/libxcb-1.5'
Making all in src
make[2]: Entering directory
`/home/thomas/local/buildroot/output/build/libxcb-1.5/src'
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xproto.xml
xproto.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/bigreq.xml
bigreq.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xc_misc.xml
xc_misc.xml
ln -s -f
/home/thomas/local/buildroot/output/staging/usr/share/xcb/composite.xml
composite.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/damage.xml
damage.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/dpms.xml
dpms.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/dri2.xml
dri2.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/glx.xml
glx.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/randr.xml
randr.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/record.xml
record.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/render.xml
render.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/res.xml
res.xml
ln -s -f
/home/thomas/local/buildroot/output/staging/usr/share/xcb/screensaver.xml
screensaver.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/shape.xml
shape.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/shm.xml
shm.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/sync.xml
sync.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xevie.xml
xevie.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xf86dri.xml
xf86dri.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xfixes.xml
xfixes.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xinerama.xml
xinerama.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xinput.xml
xinput.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xprint.xml
xprint.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xselinux.xml
xselinux.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xtest.xml
xtest.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xv.xml
xv.xml
ln -s -f /home/thomas/local/buildroot/output/staging/usr/share/xcb/xvmc.xml
xvmc.xml
/usr/bin/python ./c_client.py -p
/home/thomas/local/buildroot/output/staging/usr/lib/python2.6/site-packages
/home/thomas/local/buildroot/output/staging/usr/share/xcb/xproto.xml
/usr/bin/python ./c_client.py -p
/home/thomas/local/buildroot/output/staging/usr/lib/python2.6/site-packages
/home/thomas/local/buildroot/output/staging/usr/share/xcb/bigreq.xml
/usr/bin/python: /home/thomas/local/buildroot/output/host/usr/lib/libz.so.1: no
version information available (required by /usr/bin/python)
/usr/bin/python: /home/thomas/local/buildroot/output/host/usr/lib/libz.so.1: no
version information available (required by /usr/bin/python)

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.


Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File "./c_client.py", line 1022, in <module>
    from xcbgen.state import Module
ImportError: No module named xcbgen.state
Traceback (most recent call last):
  File "./c_client.py", line 1022, in <module>
    from xcbgen.state import Module
ImportError: No module named xcbgen.state
make[2]: *** [bigreq.h] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [xproto.h] Error 1
make[2]: Leaving directory
`/home/thomas/local/buildroot/output/build/libxcb-1.5/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/thomas/local/buildroot/output/build/libxcb-1.5'
make: *** [/home/thomas/local/buildroot/output/build/libxcb-1.5/.stamp_built]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
