From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 13:51:10 +0000
Subject: [Buildroot] [Bug 9671] New: stunnel build error
Message-ID: <bug-9671-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9671

            Bug ID: 9671
           Summary: stunnel build error
           Product: buildroot
           Version: 2016.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: busybox-jay at wezel.name
                CC: buildroot at uclibc.org
  Target Milestone: ---

>>> stunnel 5.36 Building
PATH="/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/bin:/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/sbin:/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/bin:/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/sbin:/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.9.4"
 /usr/bin/make -j21  -C
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/
make[1]: Entering directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36'
Making all in src
make[2]: Entering directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/src'
/usr/bin/make  all-am
make[3]: Entering directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/src'
  CCLD     stunnel
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x59): undefined reference to `inflate'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `zlib_stateful_compress_block':
c_zlib.c:(.text+0xea): undefined reference to `deflate'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `bio_zlib_free':
c_zlib.c:(.text+0x13e): undefined reference to `inflateEnd'
c_zlib.c:(.text+0x15d): undefined reference to `deflateEnd'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `zlib_stateful_finish':
c_zlib.c:(.text+0x1d0): undefined reference to `inflateEnd'
c_zlib.c:(.text+0x1d9): undefined reference to `deflateEnd'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `zlib_stateful_init':
c_zlib.c:(.text+0x268): undefined reference to `inflateInit_'
c_zlib.c:(.text+0x2d9): undefined reference to `deflateInit_'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `bio_zlib_ctrl':
c_zlib.c:(.text+0x544): undefined reference to `deflate'
c_zlib.c:(.text+0x61a): undefined reference to `zError'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `bio_zlib_write':
c_zlib.c:(.text+0x839): undefined reference to `deflate'
c_zlib.c:(.text+0x8fa): undefined reference to `zError'
c_zlib.c:(.text+0x95d): undefined reference to `deflateInit_'
/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib64/libcrypto.a(c_zlib.o):
In function `bio_zlib_read':
c_zlib.c:(.text+0xa2f): undefined reference to `inflate'
c_zlib.c:(.text+0xa9a): undefined reference to `zError'
c_zlib.c:(.text+0xb0d): undefined reference to `inflateInit_'
collect2: error: ld returned 1 exit status
Makefile:531: recipe for target 'stunnel' failed
make[3]: *** [stunnel] Error 1
make[3]: Leaving directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/src'
Makefile:393: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/src'
Makefile:445: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36'
package/pkg-generic.mk:216: recipe for target
'/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/.stamp_built'
failed
make: ***
[/root/Personal/Projects/minimal-linux/buildroot-2016.11.2/output/build/stunnel-5.36/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
