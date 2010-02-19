From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Feb 2010 09:50:40 +0000 (UTC)
Subject: [Buildroot] [Bug 1135] New: Package customize. Wrong copying
Message-ID: <bug-1135-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1135

           Summary: Package customize. Wrong copying
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: serj.kalichev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The package "customize" copies custom files in wrong way. It create "series"
file contain names of files and directories in the user's custom directory.
Then it copies them to the target dir with its names. The result is target tree
like this:

/etc/etc/inittab
/usr/usr/bin/foo

custom tree:
/etc/inittab
/usr/bin/foo


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
