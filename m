From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Aug 2015 17:16:15 +0000 (UTC)
Subject: [Buildroot] [Bug 8301] New: ldconfig parameter in Makefile
Message-ID: <bug-8301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8301

           Summary: ldconfig parameter in Makefile
           Product: buildroot
           Version: 2015.05
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ncfernan at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The ldconfig invocation on the top Makefile seems to be wrong.
At line 586 the parameter "-r" first set the new root and then the command
tries to open the new config file, but at the wrong place:

/sbin/ldconfig -r $(TARGET_DIR) \
               -f $(TARGET_DIR)/etc/ld.so.conf;

The above command will always report a file not found, so it must be fixed to:

/sbin/ldconfig -r $(TARGET_DIR) \
               -f /etc/ld.so.conf;

The same applies to line 583.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
