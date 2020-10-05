From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Oct 2020 10:35:00 +0000
Subject: [Buildroot] [Bug 13236] New: Can't compile linux 5.4.8 (with gcc 10
 on host)
Message-ID: <bug-13236-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13236

            Bug ID: 13236
           Summary: Can't compile linux 5.4.8 (with gcc 10 on host)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: cedric.chepied at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm trying to build an image for olimex olinuxino maxi board.

Linux 5.4.8 build fails with this error:

/usr/bin/ld?: scripts/dtc/dtc-parser.tab.o:(.bss+0x20)?: multiple definitions
of ??yylloc??;

It looks very similar to this problem which seems to be solved for dtc package:

https://git.busybox.net/buildroot/commit/?id=198db470a73c14191915f8374362bc2a8b08c2bf

I solved it by applying this modification in linux build directory:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e

I don't know if this is a Linux bug or if it is fixed and you just have to pick
a new version.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
