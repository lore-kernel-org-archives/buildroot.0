From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Dec 2009 08:00:56 +0000 (UTC)
Subject: [Buildroot] [Bug 755] New: Add Boost libraries as a package
Message-ID: <bug-755-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=755

           Summary: Add Boost libraries as a package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jpihl at nevion.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=787)
 --> (https://bugs.busybox.net/attachment.cgi?id=787)
Boost 1.35 package for buildroot

The attached package builds Boost 1.35, which is getting rather old. Boost uses
a rather tricky build system for the compiled libraries (most are headers only,
i.e. no problem), so updating the package to a later version may not be
straight ahead.

Known issues: atomic_add32() and atomic_cas32() are set to abort if called on
ARM, we have never seen them be called.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
