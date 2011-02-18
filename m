From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 03:08:06 +0000 (UTC)
Subject: [Buildroot] [Bug 3271] New: netperf-2.4.5 fails to compile
Message-ID: <bug-3271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3271

           Summary: netperf-2.4.5 fails to compile
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


if
/home/kelvin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/kelvin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
-DHAVE_CONFIG_H -I. -I. -I..     -pipe -Os  -mtune=arm926ej-s -march=armv5te
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -MT netslot_linux.o -MD -MP -MF
".deps/netslot_linux.Tpo" \
          -c -o netslot_linux.o `test -f 'netslot_linux.c' || echo
'./'`netslot_linux.c; \
        then mv -f ".deps/netslot_linux.Tpo" ".deps/netslot_linux.Po"; \
        else rm -f ".deps/netslot_linux.Tpo"; exit 1; \
        fi
netslot_linux.c:2:17: error: ftw.h: No such file or directory
netslot_linux.c:13: warning: 'struct FTW' declared inside parameter list
netslot_linux.c:13: warning: its scope is only this definition or declaration,
which is probably not what you want
netslot_linux.c:13: warning: 'struct stat' declared inside parameter list
netslot_linux.c: In function 'find_slot':
netslot_linux.c:24: error: dereferencing pointer to incomplete type
netslot_linux.c: At top level:
netslot_linux.c:68: warning: 'struct FTW' declared inside parameter list
netslot_linux.c:68: warning: 'struct stat' declared inside parameter list
netslot_linux.c: In function 'find_interface':
netslot_linux.c:73: error: dereferencing pointer to incomplete type
netslot_linux.c: In function 'find_interface_slot':
netslot_linux.c:100: error: 'FTW_PHYS' undeclared (first use in this function)
netslot_linux.c:100: error: (Each undeclared identifier is reported only once
netslot_linux.c:100: error: for each function it appears in.)
make[4]: *** [netslot_linux.o] ?? 1
make[4]: *** ??????????....
make[4]:?????? `/home/kelvin/buildroot/output/build/netperf-2.4.5/src'
make[3]: *** [all-recursive] ?? 1
make[3]:?????? `/home/kelvin/buildroot/output/build/netperf-2.4.5/src'
make[2]: *** [all-recursive] ?? 1
make[2]:?????? `/home/kelvin/buildroot/output/build/netperf-2.4.5'
make[1]: *** [all] ?? 2
make[1]:?????? `/home/kelvin/buildroot/output/build/netperf-2.4.5'
make: *** [/home/kelvin/buildroot/output/build/netperf-2.4.5/.stamp_built] ?? 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
