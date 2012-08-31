From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 00:02:32 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] New: libglib2 build fails on qsort r test
Message-ID: <bug-5486-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

           Summary: libglib2 build fails on qsort r test
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: seetwobob at live.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Using CS TC (current or otherwise), 32 bit system. Builroot latest via GIT

libglib2-2.30.2

As a general overview:
CFLAGS="-fno-stack-protector -O2 -ffast-math -march=armv6j -mtune=arm1136jf-s
-mfpu=vfp -pipe -$fomit-frame-pointer"
CXXFLAGS="-fno-stack-protector" CPPFLAGS="-U_FORTIFY_SOURCE" 
HOST=i686-pc-linux
BUILD=arm-unknown-linux-gnueabi

Whilst:
>>> libglib2 2.30.2 Building
Fails with
  CC     gtester.o
  CCLD   libglib-2.0.la
  CCLD   gtester
./.libs/libglib-2.0.so: undefined reference to `qsort_r'
collect2: ld returned 1 exit status

There was some reference (related? maybe?) to an embedded patch for libglib2 re
another system here: http://patches.openembedded.org/patch/14169/ 
Perhaps it is relevant.

This is my first bug report apologies for any elided required info.
Will be glad to forward any extra required.

Regards.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
