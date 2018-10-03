From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 03 Oct 2018 18:54:36 +0000
Subject: [Buildroot] [Bug 11376] New: mdmon binary missing
Message-ID: <bug-11376-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11376

            Bug ID: 11376
           Summary: mdmon binary missing
           Product: buildroot
           Version: 2018.05.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sebaroth at gmx.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

mdmon is not being compiled and installed and there does not seem to be an
option to enable it in through config. Turns out that in some cases we can't
properly assemble raid1 arrays because of mdmon missing.

A simple quickfix would be to add 'mdmon' (line 14) and 'install-mdmon' (line
17) in https://git.buildroot.net/buildroot/tree/package/mdadm/mdadm.mk

-- 
You are receiving this mail because:
You are on the CC list for the bug.
