From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 May 2013 05:11:48 +0000 (UTC)
Subject: [Buildroot] [Bug 6230] New: Cannot compile gcc without threads
Message-ID: <bug-6230-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6230

           Summary: Cannot compile gcc without threads
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: a.nielsen at shikadi.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4874
  --> https://bugs.busybox.net/attachment.cgi?id=4874
buildroot config to generate error

Since uClibc can't be compiled with threads (bug 6224), it must be compiled
without thread support.

However then gcc-final can't be compiled because it cannoy find pthread.h:

In file included from buildroot/toolchain/gcc-4.8.0/libgcc/gthr.h:148:0,
                 from buildroot/toolchain/gcc-4.8.0/libgcc/libgcov.c:31:
./gthr-default.h:35:21: fatal error: pthread.h: No such file or directory
 #include <pthread.h>
                     ^
compilation terminated.
make[3]: *** [_gcov.o] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
