From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Nov 2020 16:27:20 +0000
Subject: [Buildroot] [Bug 13331] New: openrc-0.42.1 compilation failure on
 gcc-10
Message-ID: <bug-13331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13331

            Bug ID: 13331
           Summary: openrc-0.42.1 compilation failure on gcc-10
           Product: buildroot
           Version: 2020.08.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mscdex at mscdex.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8676
  --> https://bugs.busybox.net/attachment.cgi?id=8676&action=edit
Fix for GCC 10

Host machine: Ubuntu 18.04
Buildroot version: 2020.08.2
Target: i586-buildroot-linux-musl-gcc (GCC 10.2.0)

Trying to build OpenRC 0.42.1 fails when compiling with GCC 10.x. It evidently
will also fail with prior major versions when the '-fno-common' flag is
explicitly used (this flag seems to be the default now on GCC 10.x, hence the
failure).

I've attached a patch I found from Gentoo that fixes this issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
