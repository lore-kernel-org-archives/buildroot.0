From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Mar 2018 17:11:46 +0000
Subject: [Buildroot] [Bug 10846] error in compiling gnutls
In-Reply-To: <bug-10846-163@https.bugs.busybox.net/>
References: <bug-10846-163@https.bugs.busybox.net/>
Message-ID: <bug-10846-163-c9dO91xyHA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10846

--- Comment #5 from tinotom at gmail.com ---
Hi Peter, thank you for looking into this.
I tried to install buildroot on another machine, but the error is the same.

Perhaps a better spot can be:

[...]
configure:49488: result: cpp
configure:49508: cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/storage/santo/buildroot/buildroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
 conftest.cpp
In file included from
/storage/santo/buildroot/buildroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:447:0,
                 from
/storage/santo/buildroot/buildroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/libc-header-start.h:33,
                 from
/storage/santo/buildroot/buildroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/limits.h:26,
                 from conftest.cpp:683:
/storage/santo/buildroot/buildroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gnu/stubs.h:7:11:
fatal error: gnu/stubs-soft.h: No such file or directory
 # include <gnu/stubs-soft.h>
           ^~~~~~~~~~~~~~~~~~
compilation terminated.
configure:49508: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "GnuTLS"
| #define PACKAGE_TARNAME "gnutls"
[...]

. Anyway I've attached the buildroot .config, the linux kernel .config and the
config.log.

Thank you,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
