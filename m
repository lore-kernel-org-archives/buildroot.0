From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Mar 2011 16:20:22 +0000 (UTC)
Subject: [Buildroot] [Bug 3475] New: Calling sync on large filesystems when
 not always necessary
Message-ID: <bug-3475-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3475

           Summary: Calling sync on large filesystems when not always
                    necessary
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: orionrobots at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When using build root to cross compile for other devices, especially when doing
many builds (multiple targets), on a CI system with 10s of gigs of ram and many
intermediate targets, then sync is not really desirable here.

The makedevs step makes a call to /bin/sync.

I am suggesting a "--nosync" be introduced so buildroot will not sync the
drives then? While of course preserving existing behaviour for the majority
that don't find any problems.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
