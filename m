From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 03:11:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7352] New: [2014.08-rc3] diffutils-3.3 failed on
	building
Message-ID: <bug-7352-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7352

           Summary: [2014.08-rc3] diffutils-3.3 failed on building
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: joymarquis at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi buildroot maintainer,

According to the error log, I found man/Makefile:Line-1301 might need to be
carefully considered:
>> cmp.1: $S/cmp.c cmp.x

I then did search for 
 * grep -r "[^a-zA-Z]S[ \t]*=" *
 * grep "\-s[^a-zA-Z]" *
to find some clue, but no luck...

Can you help to check if the "S=-s" is expected here?



Error log
=========

make[2]: Entering directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/src'
GEN      paths.h
GEN      version.c
GEN      version.h
/usr/bin/make  all-am
make[3]: Entering directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/src'
CC       version.o
CC       cmp.o
CC       analyze.o
CC       context.o
CC       diff.o
CC       dir.o
CC       ed.o
CC       ifdef.o
CC       io.o
CC       normal.o
CC       side.o
CC       util.o
CC       diff3.o
CC       sdiff.o
AR       libver.a
CCLD     cmp
CCLD     diff
CCLD     sdiff
CCLD     diff3
make[3]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/src'
make[2]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/src'
Making all in tests
make[2]: Entering directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/tests'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/tests'
Making all in doc
make[2]: Entering directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/doc'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/doc'
Making all in man
make[2]: Entering directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/man'
make[2]: *** No rule to make target `-s/cmp.c', needed by `cmp.1'.  Stop.
make[2]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/man'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3'
make: ***
[/top/buildroot/buildroot-2014.08-rc3/output/build/diffutils-3.3/.stamp_built]
Error 2


Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
