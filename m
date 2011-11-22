From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Nov 2011 09:23:14 +0000 (UTC)
Subject: [Buildroot] [Bug 4508] New: /dev/console and /dev/null have to be
 created on udev based systems also
Message-ID: <bug-4508-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4508

           Summary: /dev/console and /dev/null have to be created on udev
                    based systems also
           Product: buildroot
           Version: 2011.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fenixk19 at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Now buildroot have two device tables - device_table.txt used in static and
dynamic /dev variants, and device_table_dev.txt, that is used only in static.

But devices /dev/console and /dev/null have to be static created for both types
of /dev filesystem.
So, probably, it would be good to move /dev/null and /dev/console definition
from device_table_dev.txt to device_table.txt?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
