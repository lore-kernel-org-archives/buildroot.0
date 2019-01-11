From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Jan 2019 07:39:28 +0000
Subject: [Buildroot] [Bug 11616] New: 2018.02.09 fails to build libzlib with
 full RELRO protection
Message-ID: <bug-11616-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

            Bug ID: 11616
           Summary: 2018.02.09 fails to build libzlib with full RELRO
                    protection
           Product: buildroot
           Version: 2018.02.9
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail at kkrach.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7911
  --> https://bugs.busybox.net/attachment.cgi?id=7911&action=edit
defconfig which fails

Compiling libzlib the given defconfig (powerpc, GCC 7.3, BR2_RELRO_FULL=y)
fails with

     sysroot/usr/lib/Scrt1.o: In function `_start':
(.text+0x42): undefined reference to `main'
     collect2: error: ld returned 1 exit status


Switching RELRO off or to partial, compiles successfully.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
