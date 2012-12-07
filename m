From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Dec 2012 11:11:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5780] New: spurious build failure because it
 cannot remove ubinize.cfg
Message-ID: <bug-5780-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5780

           Summary: spurious build failure because it cannot remove
                    ubinize.cfg
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arved at arved.at
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4694
  --> https://bugs.busybox.net/attachment.cgi?id=4694
patch to create ubinize.cfg in BUILD_DIR

Our jenkins sometimes (especially after cleaning the workspace) because it
fails to remove the file ubinize.cfg

The code in fs/ubifs/ubi.mk generates a ubinize.cfg in "." and removes it
later.

I think it is better to generate the ubinize.cfg in an absolute path like
BUILD_DIR and not remove it at all as it gets regenerated with every
regenerated image anyway.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
