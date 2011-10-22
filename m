From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 04:04:08 +0000 (UTC)
Subject: [Buildroot] [Bug 4375] New: prevent unused-but-set warning on "ret"
 in makedevs.c
Message-ID: <bug-4375-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4375

           Summary: prevent unused-but-set warning on "ret" in makedevs.c
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3673
  --> https://bugs.busybox.net/attachment.cgi?id=3673
patch file

The makedevs program assigns "ret", but never reads from it.  (It always
returns 0.)  While using gcc 4.6.0 for an OMAP target, I got an unused-but-set
warning on "ret", which coupled with a -Werror that was set somewhere, bringing
the buildroot compile to a halt.  So I have attached a patch that tests "ret",
and prints out a warning if there were any failures.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
