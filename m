From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2012 20:57:54 +0000 (UTC)
Subject: [Buildroot] [Bug 4796] New: apply-patches.sh reorders patches given
 on the command line
Message-ID: <bug-4796-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4796

           Summary: apply-patches.sh reorders patches given on the command
                    line
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: develop at kristov.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4052
  --> https://bugs.busybox.net/attachment.cgi?id=4052
prevents reordering patches

When support/scripts/apply-patches.sh is given an explicit list of patches
instead of a template, they are sorted by name before being applied. This is
bad as sometimes the order of patches is important, e.g. if one patch depends
on another one. This happens e.g. when applying Debian patches whose order is
explicitly described in the file debian/patches/series.

The culprit is a "ls -d" which has to be changed to "ls -dU" in order to
prevent sorting to take place. I have attached a corresponding patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
