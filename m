From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 14:25:20 +0000 (UTC)
Subject: [Buildroot] [Bug 8121] New: php opcache extension doesn't get
	installed
Message-ID: <bug-8121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8121

           Summary: php opcache extension doesn't get installed
           Product: buildroot
           Version: 2015.02
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pud at nerdpunx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


this happens because there's a "rm -rf $(TARGET_DIR)/usr/lib/php" on line 298
in php.mk

maybe it was rather meant to delete /usr/lib/php/build or sth?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
