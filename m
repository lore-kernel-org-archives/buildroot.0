From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Apr 2009 16:52:52 +0000 (UTC)
Subject: [Buildroot] [Bug 269] New: iptables fails to compile
Message-ID: <bug-269-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=269

              Host: Linux 2.6.28-ARCH #1 SMP PREEMPT Sun Feb 8 10:13:45 UTC
                    2009 i686 Intel(R) Xeon(R) CPU X3350 @ 2.66GHz
                    GenuineIntel GNU/Linux
            Target: x86_64
             Build: Buildroot snapshot 20090412
           Summary: iptables fails to compile
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building a x86_64 target with iptables and ipv6 fails.

==

/home/max/buildroot/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc
-Os -pipe -Os -I/home/max/buildroot/build_x86_64/staging_dir/usr/include
-I/home/max/buildroot/build_x86_64/staging_dir/include
--sysroot=/home/max/buildroot/build_x86_64/staging_dir/ -isysroot
/home/max/buildroot/build_x86_64/staging_dir -mtune=generic -fPIC -DPIC
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -Wall
-Waggregate-return -Wmissing-declarations -Wmissing-prototypes
-Wredundant-decls -Wshadow -Wstrict-prototypes -Winline -pipe
-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I./include
-I./include -I /home/max/buildroot/toolchain_build_x86_64/linux/include -I
/home/max/buildroot/toolchain_build_x86_64/linux/include -DENABLE_IPV6=1 -Os
-pipe -Os -I/home/max/buildroot/build_x86_64/staging_dir/usr/include
-I/home/max/buildroot/build_x86_64/staging_dir/include
--sysroot=/home/max/buildroot/build_x86_64/staging_dir/ -isysroot
/home/max/buildroot/build_x86_64/staging_dir -mtune=generic -fPIC -DPIC
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic
--sysroot=/home/max/buildroot/build_x86_64/staging_dir/ -o iptables
iptables-standalone.o iptables.o 
-L/home/max/buildroot/build_x86_64/staging_dir/lib
-L/home/max/buildroot/build_x86_64/staging_dir/usr/lib -ldl -lm
libiptc/libiptc.a extensions/libext4.a ./.libs/libxtables.so   -Wl,--rpath
-Wl,/home/max/buildroot/build_x86_64/iptables-1.4.2/.libs
extensions/libext4.a: could not read symbols: Archive has no index; run ranlib
to add one
collect2: ld returned 1 exit status
make[3]: *** [iptables] Error 1
make[3]: Leaving directory `/home/max/buildroot/build_x86_64/iptables-1.4.2'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/max/buildroot/build_x86_64/iptables-1.4.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/max/buildroot/build_x86_64/iptables-1.4.2'
make: *** [/home/max/buildroot/build_x86_64/iptables-1.4.2/.stamp_built] Error
2

==


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
