From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Aug 2019 10:29:37 +0000
Subject: [Buildroot] [Bug 12106] New: daq: build fails if libdumbnet-dev is
 installed in the host
Message-ID: <bug-12106-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12106

            Bug ID: 12106
           Summary: daq: build fails if libdumbnet-dev is installed in the
                    host
           Product: buildroot
           Version: 2018.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ggarcia at marvell.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Same as what happened with https://bugs.busybox.net/show_bug.cgi?id=12096

When compiling daq package, the build fails if the user has libdumbnet-dev
installed in the host system. It tries to add the host's /usr/include

see log bellow:


/bin/bash ../libtool  --tag=CC   --mode=compile
/home/gorkag/project/host/bin/aarch64-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2  
-fvisibility=hidden -Wall -Wwrite-strings -Wsign-compare -Wcast-align -Wextra
-Wformat -Wformat-security -Wno-unused-parameter -fno-strict-aliasing
-fdiagnostics-show-option -pedantic -std=c99 -D_GNU_SOURCE -c -o daq_base.lo
daq_base.c
libtool: compile:  /home/gorkag/project/host/bin/aarch64-linux-gnu-gcc
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -O2 -fvisibility=hidden -Wall -Wwrite-strings
-Wsign-compare -Wcast-align -Wextra -Wformat -Wformat-security
-Wno-unused-parameter -fno-strict-aliasing -fdiagnostics-show-option -pedantic
-std=c99 -D_GNU_SOURCE -c daq_base.c  -fPIC -DPIC -o .libs/daq_base.o
aarch64-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:453: daq_base.lo] Error 1
make[3]: *** [Makefile:406: all-recursive] Error 1
make[2]: *** [Makefile:338: all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
