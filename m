From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 May 2010 10:49:13 +0000 (UTC)
Subject: [Buildroot] [Bug 1819] New: pciutils small bugs
Message-ID: <bug-1819-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1819

           Summary: pciutils small bugs
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul at pauljones.id.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


lspci command doesn't display human readable output using pci.ids.gz
00:16.1 Class 0604: 15ad:07a0
02:03.0 Class 0c03: 15ad:0770
etc...

update-pciids fails to run with:
"/usr/share/misc/pci.ids.gz is read-only, exiting."
because pci.ids.gz is actually in /usr/share

moving pci.ids.gz to /usr/share/misc and trying again fails with:
"wget: unrecognized option '--no-timestamping'"
and lspci still does not display human readable output.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
