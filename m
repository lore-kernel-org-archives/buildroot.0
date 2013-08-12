From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2013 02:27:08 +0000 (UTC)
Subject: [Buildroot] [Bug 6434] New: apply-patches.sh does not work
	recursively
Message-ID: <bug-6434-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6434

           Summary: apply-patches.sh does not work recursively
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel at exxm.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5018
  --> https://bugs.busybox.net/attachment.cgi?id=5018
Patch

scan_patchdir is meant to work recursively. As it stands today, it doesn't
quite work because it defines the variable "path" as global instead of local.
Recursive invocations overwrite the value of the previous invocation.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
