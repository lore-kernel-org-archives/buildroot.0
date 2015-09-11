From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Sep 2015 10:16:39 +0000 (UTC)
Subject: [Buildroot] [Bug 8336] New: Default systemd configuration fails to
 boot correctly in 2015-08
Message-ID: <bug-8336-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8336

           Summary: Default systemd configuration fails to boot correctly
                    in 2015-08
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


There are two issues causing the default configuration of 2015-08 not to boot
correctly, both can be fixed by adding symbolic links in the root file system.

Firstly systemd fails to mount a number of file systems as it is trying to use
/usr/bin/mount to mount the file systems, which does not exit.

This causes a number of service to fail preventing access to the system as
/usr/sbin/sulogin cannot be found.

To fix the problems the following two symbolic links were created.


/usr/bin/mount -> ../../bin/mount
/usr/sbin/sulogin -> ../../sbin/sulogin

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
