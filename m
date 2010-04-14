From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Apr 2010 14:20:58 +0000 (UTC)
Subject: [Buildroot] [Bug 1555] New: Fix default uclibc-0.9.31 configuration
Message-ID: <bug-1555-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1555

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: Fix default uclibc-0.9.31 configuration
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1519)
 --> (https://bugs.busybox.net/attachment.cgi?id=1519)
Enable libresolv/libnsl stubs by default for uclibc 0.9.31

Uclibc-0.9.31 has the (new) option to disable libresolv & libnsl stubs.
However some packages try to link explicitly to them (example: pppoatm plugin
from pppd).
Since the 4.3BSD standard states to explicitly link to libresolv for res_*
functions it'll be difficult to fix packages upstream with respect to this.
The best solution would be to enable the stubs, expert users can disable them
in their custom uclibc config to shave a few bytes from their target system if
they don't need them.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
