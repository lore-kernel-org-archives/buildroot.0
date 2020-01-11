From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Jan 2020 10:38:51 +0000
Subject: [Buildroot] [Bug 12451] New: tvheadend: not working with musl libc
Message-ID: <bug-12451-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12451

            Bug ID: 12451
           Summary: tvheadend: not working with musl libc
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: daggs at gmx.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

tvheadend requires greater iconv support than musl provides.
the program compiles well but upon run, log shows this error:
main: iconv() routine is not working properly ((null)), aborting

according to https://tvheadend.org/issues/5073 in this case, a standalone
libiconv should be used.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
