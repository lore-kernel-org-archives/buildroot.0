From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Mar 2015 19:08:20 +0000 (UTC)
Subject: [Buildroot] [Bug 7941] New: glibc-2.20 fails to build for
 sparc-buildroot-linux-gnu
Message-ID: <bug-7941-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7941

              Host: x86_64
            Target: sparc-buildroot-linux-gnu
           Summary: glibc-2.20 fails to build for
                    sparc-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5926
  --> https://bugs.busybox.net/attachment.cgi?id=5926
build log

I've tried to build glibc for in git HEAD as of today.

Here's the first error message, full log as attachment.

../sysdeps/sparc/sparc32/sem_trywait.c: In function '__new_sem_trywait':
../sysdeps/sparc/sparc32/sem_trywait.c:35:11: error: dereferencing pointer to
incomplete type
   if (isem->value > 0)
           ^
In file included from ../include/list.h:45:0,
                 from ../sysdeps/sparc/nptl/tls.h:28,
                 from ../include/errno.h:27,
                 from ../sysdeps/sparc/sparc32/sem_trywait.c:20:
../sysdeps/sparc/sparc32/sem_trywait.c:38:43: error: dereferencing pointer to
incomplete type
  val = atomic_decrement_if_positive (&isem->value);
                                           ^

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
