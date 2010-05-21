From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 13:20:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1801] New: Avahi-autoipd doesn't create
	TARGET_DIR/var/lib
Message-ID: <bug-1801-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1801

           Summary: Avahi-autoipd doesn't create TARGET_DIR/var/lib
           Product: buildroot
           Version: 2010.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nick at leverton.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1759
  --> https://bugs.busybox.net/attachment.cgi?id=1759
Patch to avahi.mk to create TARGET_DIR/var/lib

Depending what other packages are selected, avahi-autoipd may fail to install
as it doesn't create $(TARGET_DIR)/var/lib before using it.  Since avahi is
quite early in the build the odds are that it will be the first package to need
this directory.

The attached patch should fix this issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
