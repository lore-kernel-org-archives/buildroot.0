From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  3 May 2011 07:16:33 +0000 (UTC)
Subject: [Buildroot] [Bug 3685] New: ncurses installation hangs due to old
	version of tic
Message-ID: <bug-3685-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3685

           Summary: ncurses installation hangs due to old version of tic
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: patrickdepinguin+buildroot at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3271
  --> https://bugs.busybox.net/attachment.cgi?id=3271
[PATCH 1 of 2] GENTARGETS: Allow disabling host package installation

During installation of ncurses, the 'tic' program from the host is used. In
some cases, this version of tic is too old for the data to be processed, and
the installation hangs indefinitely (already reported in July 2010 [1] and
later in April 2011 [2]).

Attached to this bug report are two patches that fix the problem (one patch is
just a prerequisite for the other).

[1] http://lists.busybox.net/pipermail/buildroot/2010-July/036100.html
[2] http://lists.busybox.net/pipermail/buildroot/2011-April/042763.html

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
