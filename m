From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 09:38:14 +0000
Subject: [Buildroot] [Bug 9871] New: fbgrab 1.3 won't build with
	BR2_REPRODUCIBLE set
Message-ID: <bug-9871-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9871

            Bug ID: 9871
           Summary: fbgrab 1.3 won't build with BR2_REPRODUCIBLE set
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: camille at sound4.biz
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7066
  --> https://bugs.busybox.net/attachment.cgi?id=7066&action=edit
Patch to apply to fbgrab 1.3

fbgrab 1.3 won't build with BR2_REPRODUCIBLE set.

This is due to GZIP macro usage in the source Makefile.
gzip itself uses GZIP environment variable as parameters, so it thinks it has
the file gzip to compile.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
