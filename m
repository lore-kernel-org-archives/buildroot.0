From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 18:18:09 +0000
Subject: [Buildroot] [Bug 13666] New: setlocalversion no longer includes
 BR2_VERSION when svn is used
Message-ID: <bug-13666-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13666

            Bug ID: 13666
           Summary: setlocalversion no longer includes BR2_VERSION when
                    svn is used
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: aamann at mac.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Commit 9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88 modified the output of
'setlocalversion' to directly use its output unless empty for BR2_VERSION_FULL,
/etc/os-release, and 'make print-version'.

However, in the case of svn, the output from 'setlocalversion' is
'-svn<commit>' which results in BR2_VERSION_FULL of '-svn<commit>' rather than
the expected '2021.02-svn<commit>' which used to be the case prior to this
change.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
