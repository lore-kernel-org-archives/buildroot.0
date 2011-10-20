From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Oct 2011 02:53:20 +0000 (UTC)
Subject: [Buildroot] [Bug 4339] New: Allow override of DL_DIR in extract step
Message-ID: <bug-4339-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4339

           Summary: Allow override of DL_DIR in extract step
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3649
  --> https://bugs.busybox.net/attachment.cgi?id=3649
patch file

I am updating from an older version of buildroot to the latest.  I find it
useful to override the value of DL_DIR for certain packages, to sequester the
downloaded package in a different area than all the other third party packages.
 However, I found that the [relatively] recent introduction of
"$(2)_EXTRACT_CMDS" in package/Makefile.package.in broke this, because the
definition is using $(DL_DIR) instead of $$(DL_DIR) like in other templates in
the file.  So I would like to add the extra $.  Don't think that should be too
controversial.

Patch file is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
