From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 11:19:32 +0000 (UTC)
Subject: [Buildroot] [Bug 7184] New: supervisord depends on libxml2
	implicitly
Message-ID: <bug-7184-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7184

           Summary: supervisord depends on libxml2 implicitly
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sebastian at himberger.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When using supervisord without libxml2 it complains because it can not use the
python xml module. apparently python needs libxml2 present to build the xml
module but happily builds without it and also works (as long as you dont use
the module). I would suggest either adding libxml2 to python or the supervisord
package as a dependency since supervisord fails to start without xml support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
