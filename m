From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 14:30:53 +0000 (UTC)
Subject: [Buildroot] [Bug 1705] New: Fix pciutils broken cross compiling
Message-ID: <bug-1705-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1705

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: Fix pciutils broken cross compiling
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1663
  --> https://bugs.busybox.net/attachment.cgi?id=1663
Fix pciutils broken cross compiling

The pciutils migration to gentargets broke cross compiling.
First problem is the internal install always trying to strip stuff, that's
wrong since native install doesn't know how to strip foreign binaries and also
breaks debugging since it's not conditional.
Second problem is the library isn't being cross compiled either (HOST variable
never set so it assumes native).
A third problem is the library never being installed and if the binaries link
against it (which they always do) they fail to work properly (make install-lib
needed).

Also added a comment about pci.ids / pci.ids.gz not being installed this time
around and being needed in the skeleton for a nice verbose lspci output.
This will be addressed post-2010.05 release with new infrastructure to fetch
files.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
