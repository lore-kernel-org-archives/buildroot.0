From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2009 10:58:06 +0000 (UTC)
Subject: [Buildroot] [Bug 299] New: add shared-mime-info package
Message-ID: <bug-299-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=299

           Summary: add shared-mime-info package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P4
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The shared-mime-info package contains the core database of common types and the
update-mime-database command used to extend it.

The attached files and patches add the shared-mime-info package to buildroot.
The only thing that is actually needed in the target is the file mime.cache. In
order to generate that file, shared-mime-info is installed into the
staging-dir. The idea is that other packages might add more mime-info files and
these should be collected in staging-dir. From there the mime.cache file is
created using tools installed in host-dir and copied to target.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
