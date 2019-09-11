From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Sep 2019 09:50:13 +0000
Subject: [Buildroot] [Bug 12211] New: host-nodejs 10.15.3 package fail to
 build
Message-ID: <bug-12211-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12211

            Bug ID: 12211
           Summary: host-nodejs 10.15.3 package fail to build
           Product: buildroot
           Version: 2019.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mirko.guenther at herrmannultraschall.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I try to upgrade from 2019.02 to current 2019.08

While rebuild our image I get following error:

make: Leaving directory
'/home/herrmann/mguenther/git/ultrax_som/source/buildroot'
/usr/bin/make -j1 O=/home/herrmann/mguenther/git/ultrax_som/workspace
HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" syncconfig
  GEN     /home/herrmann/mguenther/git/ultrax_som/workspace/Makefile
>>> host-nodejs 10.15.3 Building
PATH="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
PKG_CONFIG="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib/pkgconfig:/home/herrmann/mguenther/git/ultrax_som/workspace/host/share/pkgconfig"
PYTHON=/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/python2
/usr/bin/make -j5 -C
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3
PATH="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
PKG_CONFIG="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib/pkgconfig:/home/herrmann/mguenther/git/ultrax_som/workspace/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/gcc"
GCC="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/gcc"
CXX="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy"
RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
CFLAGS="-O2 -I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
CXXFLAGS="-O2 -I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
LDFLAGS="-L/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib
-Wl,-rpath,/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib"
INTLTOOL_PERL=/usr/bin/perl NO_LOAD=cctest.target.mk
PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/bin:"/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
/usr/bin/make -C out BUILDTYPE=Release V=1
  touch 9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate
  touch 5ef57257ae4a186daf4f3f537e43a9099b624e72.intermediate
 
LD_LIBRARY_PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.host:/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../deps/v8/gypfiles; mkdir -p
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/torque-generated;
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/torque"
../src/builtins/base.tq ../src/builtins/array.tq ../src/builtins/typed-array.tq
-o
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/torque-generated"
 
LD_LIBRARY_PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.host:/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../deps/v8/gypfiles; mkdir -p
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/src/inspector/protocol
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/include/inspector;
python ../third_party/inspector_protocol/CodeGenerator.py --jinja_dir
../third_party --output_base
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/src/inspector"
--config ../src/inspector/inspector_protocol_config.json
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/torque:
error while loading shared libraries: libcrypto.so.1.1: cannot open shared
object file: No such file or directory
make[3]: *** [deps/v8/gypfiles/v8_torque.host.mk:17:
9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate] Error 127
make[3]: *** Waiting for unfinished jobs....
rm 5ef57257ae4a186daf4f3f537e43a9099b624e72.intermediate
9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate
make[2]: *** [Makefile:99: node] Error 2
make[1]: *** [package/pkg-generic.mk:241:
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2
make: Leaving directory
'/home/herrmann/mguenther/git/ultrax_som/source/buildroot'
/usr/bin/make -j1 O=/home/herrmann/mguenther/git/ultrax_som/workspace
HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" syncconfig
  GEN     /home/herrmann/mguenther/git/ultrax_som/workspace/Makefile
>>> host-nodejs 10.15.3 Building
PATH="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
PKG_CONFIG="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib/pkgconfig:/home/herrmann/mguenther/git/ultrax_som/workspace/host/share/pkgconfig"
PYTHON=/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/python2
/usr/bin/make -j5 -C
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3
PATH="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
PKG_CONFIG="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib/pkgconfig:/home/herrmann/mguenther/git/ultrax_som/workspace/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/gcc"
GCC="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/gcc"
CXX="/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin/ccache
/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy"
RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
CFLAGS="-O2 -I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
CXXFLAGS="-O2 -I/home/herrmann/mguenther/git/ultrax_som/workspace/host/include"
LDFLAGS="-L/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib
-Wl,-rpath,/home/herrmann/mguenther/git/ultrax_som/workspace/host/lib"
INTLTOOL_PERL=/usr/bin/perl NO_LOAD=cctest.target.mk
PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/bin:"/home/herrmann/mguenther/git/ultrax_som/workspace/host/bin:/home/herrmann/mguenther/git/ultrax_som/workspace/host/sbin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/home/herrmann/mguenther/bin/hug-imx7_toolchain_current/bin"
/usr/bin/make -C out BUILDTYPE=Release V=1
  touch 9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate
  touch 5ef57257ae4a186daf4f3f537e43a9099b624e72.intermediate
 
LD_LIBRARY_PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.host:/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../deps/v8/gypfiles; mkdir -p
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/torque-generated;
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/torque"
../src/builtins/base.tq ../src/builtins/array.tq ../src/builtins/typed-array.tq
-o
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/torque-generated"
 
LD_LIBRARY_PATH=/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.host:/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../deps/v8/gypfiles; mkdir -p
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/src/inspector/protocol
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/include/inspector;
python ../third_party/inspector_protocol/CodeGenerator.py --jinja_dir
../third_party --output_base
"/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/obj/gen/src/inspector"
--config ../src/inspector/inspector_protocol_config.json
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/out/Release/torque:
error while loading shared libraries: libcrypto.so.1.1: cannot open shared
object file: No such file or directory
make[3]: *** [deps/v8/gypfiles/v8_torque.host.mk:17:
9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate] Error 127
make[3]: *** Waiting for unfinished jobs....
rm 5ef57257ae4a186daf4f3f537e43a9099b624e72.intermediate
9b91b8399d0425b0abf357d4e70a91e21353f367.intermediate
make[2]: *** [Makefile:99: node] Error 2
make[1]: *** [package/pkg-generic.mk:241:
/home/herrmann/mguenther/git/ultrax_som/workspace/build/host-nodejs-10.15.3/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2

check for the mentioned shared library shows it's already in place:

find -iname "libcrypto.so*"
./workspace/target/usr/lib/libcrypto.so
./workspace/target/usr/lib/libcrypto.so.1.1
./workspace/host/arm-hug-linux-gnueabihf/sysroot/usr/lib/libcrypto.so
./workspace/host/arm-hug-linux-gnueabihf/sysroot/usr/lib/libcrypto.so.1.1
./workspace/host/lib/libcrypto.so
./workspace/host/lib/libcrypto.so.1.1
./workspace/build/host-libopenssl-1.1.1c/libcrypto.so
./workspace/build/host-libopenssl-1.1.1c/libcrypto.so.1.1
./workspace/build/libopenssl-1.1.1c/libcrypto.so
./workspace/build/libopenssl-1.1.1c/libcrypto.so.1.1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
