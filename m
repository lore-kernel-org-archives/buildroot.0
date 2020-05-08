From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 May 2020 19:12:15 +0000
Subject: [Buildroot] [Bug 12866] New: should we be disabling bash executable
 path caching?
Message-ID: <bug-12866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12866

            Bug ID: 12866
           Summary: should we be disabling bash executable path caching?
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm not sure if there is a use case (yet), maybe with parallel builds if the
host folder contents ends up with per package staging?

https://unix.stackexchange.com/questions/5609/how-do-i-clear-bashs-cache-of-paths-to-executables/218681#218681

We ran into it when we were testing the internal toolchain of buildroot to be
relocatable and the "mv" executable was used to rename the host folder.  Then
we used "mv" again to rename the host folder back. For the first "mv" it used
the Buildroot host/bin/mv and then for the second "mv", bash tried to again use
the same instead of continuing to traverse to /bin/mv which was in the path and
the output of "which mv" at that point in the script.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
