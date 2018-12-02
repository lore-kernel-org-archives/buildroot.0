From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 02 Dec 2018 14:51:21 +0000
Subject: [Buildroot] [Bug 11536] New: dt-utils building fails with glibc 2.28
Message-ID: <bug-11536-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11536

            Bug ID: 11536
           Summary: dt-utils building fails with glibc 2.28
           Product: buildroot
           Version: 2018.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pvizeli at syshack.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

>>> dt-utils v2018.05.0 Building
PATH="/build/buildroot/output/host/bin:/build/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 /usr/bin/make -j9  -C /build/buildroot/output/build/dt-utils-v2018.05.0/
make[1]: Entering directory '/build/buildroot/output/build/dt-utils-v2018.05.0'
/usr/bin/make --no-print-directory all-am
  GEN      src/libdt-utils.pc
  CC       src/src_libdt_utils_la-crc32.lo
  CC       src/src_libdt_utils_la-libdt.lo
  CC       src/src_libdt_utils_la-fdt.lo
  CC       src/crypto/barebox_state-digest.o
  CC       src/crypto/barebox_state-hmac.o
  CC       src/crypto/barebox_state-sha1.o
  CC       src/crypto/barebox_state-sha2.o
  CC       src/barebox_state-keystore-blob.o
  CC       src/barebox_state-base64.o
In file included from src/crypto/digest.c:24:0:
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/stat.h:56:8:
error: redefinition of 'struct statx_timestamp'
 struct statx_timestamp {
        ^~~~~~~~~~~~~~~
In file included from
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/stat.h:446:0,
                 from ./src/dt/common.h:15,
                 from src/crypto/digest.c:19:
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/statx.h:25:8:
note: originally defined here
 struct statx_timestamp
        ^~~~~~~~~~~~~~~
In file included from src/crypto/digest.c:24:0:
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/stat.h:99:8:
error: redefinition of 'struct statx'
 struct statx {
        ^~~~~
In file included from
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/stat.h:446:0,
                 from ./src/dt/common.h:15,
                 from src/crypto/digest.c:19:
../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/statx.h:36:8:
note: originally defined here
 struct statx
        ^~~~~
Makefile:809: recipe for target 'src/crypto/barebox_state-digest.o' failed
make[2]: *** [src/crypto/barebox_state-digest.o] Error 1
make[2]: *** Waiting for unfinished jobs....
Makefile:511: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/build/buildroot/output/build/dt-utils-v2018.05.0'
package/pkg-generic.mk:229: recipe for target
'/build/buildroot/output/build/dt-utils-v2018.05.0/.stamp_built' failed
make: *** [/build/buildroot/output/build/dt-utils-v2018.05.0/.stamp_built]
Error 2
make: Leaving directory '/build/buildroot'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
