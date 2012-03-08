From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Mar 2012 02:20:58 +0000 (UTC)
Subject: [Buildroot] [Bug 4892] New: build fails on
 ltp-testsuite-20101031/testcases/kernel/fs/ftest/ftest04.c:146: undefined
 reference to `sigset'
Message-ID: <bug-4892-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4892

           Summary: build fails on
                    ltp-testsuite-20101031/testcases/kernel/fs/ftest/ftest
                    04.c:146: undefined reference to `sigset'
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: austinenglish at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4112
  --> https://bugs.busybox.net/attachment.cgi?id=4112
.config used

/home/austin/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
  -L../../../../lib  ftest04.o libftest.o   -lltp -o ftest04
ftest04.o: In function `setup':
/home/austin/buildroot-2012.02/output/build/ltp-testsuite-20101031/testcases/kernel/fs/ftest/ftest04.c:146:
undefined reference to `sigset'

not sure what other info is useful. Running on 32-bit gentoo linux. I've
attached the .config file.

Please let me know what other information would be useful:
austin at aw25 ~/buildroot-2012.02 $ gcc --version
gcc (Gentoo 4.5.3-r1 p1.0, pie-0.4.5) 4.5.3
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

austin at aw25 ~/buildroot-2012.02 $ uname -a
Linux aw25 2.6.37 #1 SMP Thu Apr 21 17:36:51 PDT 2011 i686 Intel(R) Core(TM) i7
CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
