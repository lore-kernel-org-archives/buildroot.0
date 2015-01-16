From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jan 2015 15:11:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7802] New: host-python build hangs compiling
	getbuildinfo.o
Message-ID: <bug-7802-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7802

           Summary: host-python build hangs compiling getbuildinfo.o
           Product: buildroot
           Version: 2014.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: codehero at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5810
  --> https://bugs.busybox.net/attachment.cgi?id=5810
kos_tom's patch to disable hg and svn build info tags

When building the host python, hg or svn is invoked to create build info tags.
This can result in a socket hang, blocking compilation from completion.

The solution, as determined by kos_tom on #buildroot (THANK YOU), was to
disable hg and svn from python's automake.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
