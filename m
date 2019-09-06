From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Sep 2019 08:31:59 +0000
Subject: [Buildroot] [Bug 12196] New: duma package
Message-ID: <bug-12196-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

            Bug ID: 12196
           Summary: duma package
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ioctl at ya.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Duma package build is incorrect. Following original GNUmakefile, it should be
build with -O0, but buildroot make it with -O2, that leads to the "Illegal
instruction" problem with my program for ARM cpu. This can be fixed by adding
"CFLAGS+=-O0 \" into the DUMA_BUILD_CMDS definition in duma.mk.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
