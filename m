From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 14:35:51 +0000
Subject: [Buildroot] [Bug 11426] New: pps-tools bash dependency
Message-ID: <bug-11426-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11426

            Bug ID: 11426
           Summary: pps-tools bash dependency
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jan.dohl at airrays.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When installing the pps-tools package without installing Bash, the ppsfind
script in the package will not work. For example:

# uname -a
Linux xla 4.14.0-xla #4 SMP PREEMPT Fri Oct 19 17:56:30 CEST 2018 aarch64
GNU/Linux

# ppsfind
-sh: ppsfind: not found

# which ppsfind
/usr/bin/ppsfind

# cat /usr/bin/ppsfind | head -n 1
#!/bin/bash

Not sure what the best course of action is here, though. I think making Bash a
dependency for pps-tools is not a good idea. The ppsfind script works fine by
just replacing the shebang with /bin/sh instead. The latter is probably also a
good suggestion for the upstream repository.

Would a patch for the time being while also reporting this to the upstream be a
good idea?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
