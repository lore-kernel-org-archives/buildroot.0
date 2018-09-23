From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Sep 2018 20:33:25 +0000
Subject: [Buildroot] [Bug 11366] New: [2018.08] SysV IPC not available for
 fakeroot on WSL
Message-ID: <bug-11366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

            Bug ID: 11366
           Summary: [2018.08] SysV IPC not available for fakeroot on WSL
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Windows
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jfdoyon at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When using Ubuntu on Windows Susbsystem for Linux (WSL) as your host build
environment, the process fails on the execution of "fakeroot", with an error
message to the effect that "fakeroot has failed due to SysV IPC not being
available".

This is indeed correct, as the WSL system doesn't have the functionality.

A WSL bug has been filed: https://github.com/Microsoft/WSL/issues/2465

The workaround is to copy/link the host /usr/bin/fakeroot-tcp into the builroot
host output, and re-run, it then succeeds no problem.

Suggestion: detect availability of SysV IPC and/or TCP, and build/use the
appropriate fakeroot. If the host doesn't have either facility available, warn
early (instead of finding out at the very end of a possibly long compilation
run).

Thanks,
J.F.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
