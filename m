From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 May 2019 02:21:38 +0000
Subject: [Buildroot] [Bug 11816] New: Only selected coreutils binaries are
 installed
Message-ID: <bug-11816-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11816

            Bug ID: 11816
           Summary: Only selected coreutils binaries are installed
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmorici at dev295.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Selecting the coreutils package doesn't install all the core utils and there is
no way to select which ones to install.

It looks like only the binaries listed in the variable, COREUTILS_BIN_PROGS are
installed into the target.

This came up because I need the coreutils version of base64 since the busybox
version doesn't have the -w flag and there doesn't appear to be any elegant way
of including that w/o editing the coreutils .mk file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
