From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2020 10:18:14 +0000
Subject: [Buildroot] [Bug 12826] New: nodejs-12.16.1: error: 'uv_sleep' was
 not declared in this scope
Message-ID: <bug-12826-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

            Bug ID: 12826
           Summary: nodejs-12.16.1: error: 'uv_sleep' was not declared in
                    this scope
           Product: buildroot
           Version: 2020.02.1
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

Unable to build nodejs-12.16.1 package due to a compilation error.

For arm target, config is following:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_NODEJS=y

And the error message is:

 
/home/oleksandr/buildroot-git/output/nodejs-arm/host/bin/arm-buildroot-linux-gnueabihf-g++
-o
/home/oleksandr/buildroot-git/output/nodejs-arm/build/nodejs-12.16.1/out/Release/obj.target/libnode/src/node_util.o
../src/node_util.cc '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DNODE_ARCH="arm"'
'-DNODE_PLATFORM="linux"' '-DNODE_WANT_INTERNALS=1'
'-DV8_DEPRECATION_WARNINGS=1' '-DNODE_OPENSSL_SYSTEM_CERT_PATH=""'
'-DHAVE_INSPECTOR=0' '-DNODE_REPORT' '-D__POSIX__' '-DNODE_USE_V8_PLATFORM=1'
'-DHAVE_OPENSSL=0' '-DHTTP_PARSER_STRICT=0' -I../src
-I/home/oleksandr/buildroot-git/output/nodejs-arm/build/nodejs-12.16.1/out/Release/obj/gen
-I../deps/histogram/src -I../deps/uvwasi/include -I../deps/v8/include
-I../deps/http_parser -I../deps/llhttp/include -I../deps/brotli/c/include 
-Wall -Wextra -Wno-unused-parameter -pthread -Wall -Wextra
-Wno-unused-parameter -O3 -fno-omit-frame-pointer -fno-rtti -fno-exceptions
-std=gnu++1y -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-arm/build/nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-arm/build/nodejs-12.16.1/out/Release/obj.target/libnode/src/node_util.o.d.raw
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c
../src/node_util.cc: In function 'void node::util::Sleep(const
v8::FunctionCallbackInfo<v8::Value>&)':
../src/node_util.cc:176:3: error: 'uv_sleep' was not declared in this scope
   uv_sleep(msec);

Same happens if x86_64 target arch is set:

BR2_x86_64=y
BR2_x86_steamroller=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_NODEJS=y

Compilation fails with:

 
/home/oleksandr/buildroot-git/output/nodejs-failure/host/bin/x86_64-buildroot-linux-gnu-g++
-o
/home/oleksandr/buildroot-git/output/nodejs-failure/build/nodejs-12.16.1/out/Release/obj.target/libnode/src/node_util.o
../src/node_util.cc '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DNODE_ARCH="x64"'
'-DNODE_PLATFORM="linux"' '-DNODE_WANT_INTERNALS=1'
'-DV8_DEPRECATION_WARNINGS=1' '-DNODE_OPENSSL_SYSTEM_CERT_PATH=""'
'-DHAVE_INSPECTOR=0' '-DNODE_REPORT' '-D__POSIX__' '-DNODE_USE_V8_PLATFORM=1'
'-DHAVE_OPENSSL=0' '-DHTTP_PARSER_STRICT=0'
-I/home/oleksandr/buildroot-git/output/nodejs-failure/host/x86_64-buildroot-linux-gnu/sysroot/home/oleksandr/buildroot-git/output/nodejs-failure/host/include
-I../src
-I/home/oleksandr/buildroot-git/output/nodejs-failure/build/nodejs-12.16.1/out/Release/obj/gen
-I../deps/histogram/src -I../deps/uvwasi/include -I../deps/v8/include
-I../deps/http_parser -I../deps/llhttp/include -I../deps/brotli/c/include 
-Wall -Wextra -Wno-unused-parameter -pthread -Wall -Wextra
-Wno-unused-parameter -m64 -O3 -fno-omit-frame-pointer -fno-rtti
-fno-exceptions -std=gnu++1y -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-failure/build/nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-failure/build/nodejs-12.16.1/out/Release/obj.target/libnode/src/node_util.o.d.raw
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c
../src/node_util.cc: In function 'void node::util::Sleep(const
v8::FunctionCallbackInfo<v8::Value>&)':
../src/node_util.cc:176:3: error: 'uv_sleep' was not declared in this scope
   uv_sleep(msec);

-- 
You are receiving this mail because:
You are on the CC list for the bug.
