From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Feb 2013 15:28:51 +0000 (UTC)
Subject: [Buildroot] [Bug 5966] New: bison unnecessarily required as build
	dependency
Message-ID: <bug-5966-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5966

           Summary: bison unnecessarily required as build dependency
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


support/dependencies.sh requires that bison is installed on the host system.

This is unnecessary for packages that use bison, because buildroot supports to
depend on a host-bison.

The only other usage is in the kconfig build, but kconfig builds successfully
without bison before dependencies.sh is run. 

Suggested solution:
Remove bison from support/dependencies.sh

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
