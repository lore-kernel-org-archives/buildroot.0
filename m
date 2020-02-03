From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Feb 2020 12:12:01 +0000
Subject: [Buildroot] [Bug 12526] New: host-nodejs 12.14.1: configure fail:
 AttributeError: 'module' object has no attribute 'sha1'
Message-ID: <bug-12526-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12526

            Bug ID: 12526
           Summary: host-nodejs 12.14.1: configure fail: AttributeError:
                    'module' object has no attribute 'sha1'
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello dear Bug reviewer,

My HEAD is on "4c5e9f8253 (HEAD -> master, origin/master, origin/HEAD)
package/libpjsip: add ffmpeg support" and I can't build nodejs for the x86_64
target.

How to reproduce:

$ make menuconfig
 Target options  --->
  Target Architecture (x86_64)  ---> 

 Target packages  --->
  Interpreter languages and scripting  --->
   [*] nodejs

$ make clean all
node-v12.14.1.tar.xz: OK (sha256:
877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb)
>>> host-nodejs 12.14.1 Extracting
xzcat /home/oleksandr/buildroot-git/dl/nodejs/node-v12.14.1.tar.xz | tar
--strip-components=1 -C
/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1  
-xf -
>>> host-nodejs 12.14.1 Patching

Applying 0001-check-if-uclibc-has-backtrace-support.patch using patch: 
patching file deps/v8/src/base/debug/stack_trace_posix.cc
>>> host-nodejs 12.14.1 Configuring
# The build system directly calls python. Work around this by forcing python2
# into PATH. See https://github.com/nodejs/node/issues/2735
mkdir -p
/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/bin
ln -sf /home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin/python2
/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/bin/python
(cd
/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1;
PATH="/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin:/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/sbin:/home/oleksandr/bin:/home/oleksandr/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/pkgconfig:/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/include"
CFLAGS="-O2 -I/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/include"
CXXFLAGS="-O2
-I/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/include"
LDFLAGS="-L/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib
-Wl,-rpath,/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib"
INTLTOOL_PERL=/usr/bin/perl
PATH=/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/bin:"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin:/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/sbin:/home/oleksandr/bin:/home/oleksandr/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PYTHON=/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin/python2
/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/bin/python2 ./configure
--prefix=/home/oleksandr/buildroot-git/output/x86_64-nodejs/host
--without-snapshot --without-dtrace --without-etw --shared-openssl
--shared-openssl-includes=/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/include/openssl
--shared-openssl-libpath=/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib
--shared-zlib --no-cross-compiling --with-intl=small-icu )
ERROR:root:code for hash md5 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type md5
ERROR:root:code for hash sha1 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type sha1
ERROR:root:code for hash sha224 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type sha224
ERROR:root:code for hash sha256 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type sha256
ERROR:root:code for hash sha384 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type sha384
ERROR:root:code for hash sha512 was not found.
Traceback (most recent call last):
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 147, in <module>
    globals()[__func_name] = __get_hash(__func_name)
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/host/lib/python2.7/hashlib.py",
line 97, in __get_builtin_constructor
    raise ValueError('unsupported hash type ' + name)
ValueError: unsupported hash type sha512
INFO: Using floating patch "tools/icu/patches/64/source/common/putil.cpp" from
"tools/icu"
INFO: Using floating patch "tools/icu/patches/64/source/i18n/dtptngen.cpp" from
"tools/icu"
Traceback (most recent call last):
  File "./configure", line 28, in <module>
    import configure
  File
"/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/configure.py",
line 1720, in <module>
    run_gyp(gyp_args)
  File "tools/gyp_node.py", line 54, in run_gyp
    rc = gyp.main(args)
  File "tools/gyp/pylib/gyp/__init__.py", line 547, in main
    return gyp_main(args)
  File "tools/gyp/pylib/gyp/__init__.py", line 532, in gyp_main
    generator.GenerateOutput(flat_list, targets, data, params)
  File "tools/gyp/pylib/gyp/generator/make.py", line 2181, in GenerateOutput
    part_of_all=qualified_target in needed_targets)
  File "tools/gyp/pylib/gyp/generator/make.py", line 773, in Write
    extra_mac_bundle_resources, part_of_all)
  File "tools/gyp/pylib/gyp/generator/make.py", line 957, in WriteActions
    part_of_all=part_of_all, command=name)
  File "tools/gyp/pylib/gyp/generator/make.py", line 1703, in WriteDoCmd
    force = True)
  File "tools/gyp/pylib/gyp/generator/make.py", line 1758, in WriteMakeRule
    cmddigest = hashlib.sha1((command or
self.target).encode("utf-8")).hexdigest()
AttributeError: 'module' object has no attribute 'sha1'
package/pkg-generic.mk:245: recipe for target
'/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/.stamp_configured'
failed
make[1]: ***
[/home/oleksandr/buildroot-git/output/x86_64-nodejs/build/host-nodejs-12.14.1/.stamp_configured]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
