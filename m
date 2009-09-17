From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Sep 2009 16:49:54 +0000 (UTC)
Subject: [Buildroot] [Bug 615] New: python: Don't delete .py files unless
	asked.
Message-ID: <bug-615-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=615

           Summary: python: Don't delete .py files unless asked.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=657)
 --> (https://bugs.busybox.net/attachment.cgi?id=657)
Prevent .py files from being deleted aggressively on the target.

Currently if buildroot is configured to install .py files on the target none
are installed because unless BR2_PACKAGE_PYTHON_DEV has been set all .py files
are deleted. This looks like a bug.

This patch lets the appropriate config options take car eof whether or not we
get .py or .pyc files on the target and leaves BR2_PACKAGE_PYTHON_DEV out of
it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
