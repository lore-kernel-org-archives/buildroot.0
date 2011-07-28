From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jul 2011 08:37:32 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] New: uClibc: undefined reference to
 `__GI___errno_location'
Message-ID: <bug-4021-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

              Host: x86
            Target: sparc
           Summary: uClibc: undefined reference to `__GI___errno_location'
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: link-failure
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: belousov.oleg at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3517
  --> https://bugs.busybox.net/attachment.cgi?id=3517
.config

Buildroot version 2011.05:

  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/uclibc_nonshared.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  STRIP -x -R .note -R .comment libc/libc_so.a
  LD libuClibc-0.9.31.1.so
libc/libc_so.a(fork.os): In function `__GI_fork':
(.text+0x14): undefined reference to `__GI___errno_location'
collect2: ld returned 1 exit status

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
