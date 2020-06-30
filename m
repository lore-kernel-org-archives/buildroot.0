From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Jun 2020 08:16:21 +0000
Subject: [Buildroot] [Bug 13046] New: Optimize for fast -Ofast is not
 compliant
Message-ID: <bug-13046-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13046

            Bug ID: 13046
           Summary: Optimize for fast -Ofast is not compliant
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sveyret at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

In buildroot, it is possible to select the gcc optimization flag (Build
options/gcc optimization level).

The flag -Ofast in gcc creates code that is not compliant to standards. This is
written in gcc documentations, and also in the help when you select ?optimize
for fast? in ?gcc optimization level?. But for someone creating an embedded
system where speed is critical, he may select this optimization without reading
the help, which would build non-working packages (I spent about a whole week
searching why NodeJS was not working on my system!)

I suggest to indicate the problem in the label like, for example: ?optimize for
fast (may break packages!)?.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
