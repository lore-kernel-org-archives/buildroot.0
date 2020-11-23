From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Nov 2020 16:37:01 +0000
Subject: [Buildroot] [Bug 13336] New: thermald-1.9.1 compilation failure
 with musl 1.2.1
Message-ID: <bug-13336-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13336

            Bug ID: 13336
           Summary: thermald-1.9.1 compilation failure with musl 1.2.1
           Product: buildroot
           Version: 2020.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mscdex at mscdex.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8681
  --> https://bugs.busybox.net/attachment.cgi?id=8681&action=edit
Fix for musl 1.2.x

Host machine: Ubuntu 18.04
Buildroot version: 2020.08.2
Target: i586-buildroot-linux-musl-gcc (GCC 10.2.0)

Trying to build thermald 1.9.1 fails when compiling with musl 1.2.0+. The
reason for this appears to be that musl now uses a 64-bit time_t on all
architectures.

I've attached a patch I found from Yocto that fixes this issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
