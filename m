From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Feb 2009 09:24:08 +0000 (UTC)
Subject: [Buildroot] [Bug 133] New: Modify ncurses5-config to get correct
	include path
Message-ID: <bug-133-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=133

              Host: PC SuSe 11.1
            Target: ARM
           Summary: Modify ncurses5-config to get correct include path
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: henry.margies at gmx.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=77)
 --> (https://bugs.busybox.net/attachment.cgi?id=77)
Patch for ncurses

Some tools (e.g. alsamixer) are using ncurses5-config --cflags --libs to get
the include and library path needed for ncurses. With ncurses6 installed on
your host system, ncurses5-config --cflags returns -I/usr/include/ncurses which
will break your build.

This patch will modify the prefix setting to point to the staging dir.

Let me know what you think.

Best regards,

Henry


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
