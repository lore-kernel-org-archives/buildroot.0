From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Apr 2010 12:52:35 +0000 (UTC)
Subject: [Buildroot] [Bug 1573] New: Alsa-utils alsactl/init/* not installed
	to target
Message-ID: <bug-1573-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1573

           Summary: Alsa-utils alsactl/init/* not installed to target
           Product: buildroot
           Version: 2010.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nick at leverton.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building alsa-utils 1.0.22 on BR 2010.02, the contents of ./alsactl/init
are copied to the staging dir, but not to the target.  This means that alsactl
on the target may not run correctly.  The following error message will be seen
on the device console during boot:

Restoring mixer state: /usr/sbin/alsactl: parse:1655: Unable to open file
'/usr/share/alsa/init/00main': No such file or directory

I think the target might be where these run-time scripts should go anyway,
rather than the staging dir ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
