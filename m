From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 09:30:30 +0000
Subject: [Buildroot] [Bug 11331] New: Internal application no longer builds
 with latest GIT master
Message-ID: <bug-11331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11331

            Bug ID: 11331
           Summary: Internal application no longer builds with latest GIT
                    master
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tpearson at raptorengineering.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Up until the recent updates (after 2018.08) an internal application using the
old setkey()/encrypt() functions was able to compile.  With latest master,
compilation fails:

/home/buildroot/project/output/host/bin/powerpc64le-buildroot-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os 
-fstack-protector-all -Wl,-z,relro -D_FORTIFY_SOURCE=2 -fPIC proprietary.o -o
proprietary -lcrypt -lcurl
/home/buildroot/project/output/host/lib/gcc/powerpc64le-buildroot-linux-gnu/8.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld:
proprietary.o: in function `legacy_handler':
proprietary.c:(.text+0x1cc30): undefined reference to `setkey'
/home/buildroot/project/output/host/lib/gcc/powerpc64le-buildroot-linux-gnu/8.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld:
proprietary.c:(.text+0x1cce4): undefined reference to `encrypt'
collect2: error: ld returned 1 exit status
Makefile:62: recipe for target 'proprietary' failed
make[1]: *** [proprietary] Error 1
make[1]: Leaving directory
'/home/buildroot/project/output/build/proprietary-origin_master/proprietary'
package/pkg-generic.mk:229: recipe for target
'/home/buildroot/project/output/build/proprietary-origin_master/.stamp_built'
failed
make: ***
[/home/buildroot/project/output/build/proprietary-origin_master/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
