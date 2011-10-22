From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 03:47:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4369] New: Fix permissions on untared lsof archive
Message-ID: <bug-4369-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4369

           Summary: Fix permissions on untared lsof archive
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3667
  --> https://bugs.busybox.net/attachment.cgi?id=3667
patch file

When buildroot untars a package, it opens permissions on the untarred results, 
(The comment is "some packages have messed up permissions inside".)  However,
in the case of lsof, the tar.bz2 contains another .tar, which contains the
source code.  It needs to have the same treatment as buildroot's normal untar
process, because lsof has read-only files in the inner tarball.

A patch file is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
