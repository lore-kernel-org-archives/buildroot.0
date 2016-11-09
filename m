From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Nov 2016 17:07:51 +0000
Subject: [Buildroot] [Bug 9411] New: MUSL build with RT Error relocating
 /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not found
Message-ID: <bug-9411-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9411

            Bug ID: 9411
           Summary: MUSL build with RT Error relocating
                    /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not
                    found
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at komadev.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

building minimal buildroot with musl + gcc 6.x compiles completely fine.
in the runtime though, all binaries linked against libgcc_s.so.1 fail with i.e.

gbm: Last dlopen error: Error relocating /lib/libgcc_s.so.1:
__cpu_indicator_init: symbol not found

This error is also referenced incl. a patch here 

https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
