From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Apr 2010 04:28:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] New: Build fail caused by ccache in
	module-init-tools
Message-ID: <bug-1651-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651

           Summary: Build fail caused by ccache in module-init-tools
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P4
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjd-busybox.net at afork.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am having problems with the latest buildroot.  If I take a stock buildroot
checkout from git, run make menuconfig, then save and make, it compiles.  If I
then run make menuconfig, choose Kernel -> Kernel type -> linux (same version
as Linux headers), then do a make, the build fails.

The build fails when it tries to compile module-init-tools.  The makefiles call
/usr/lib/ccache/gcc, which fails saying "/usr/bin/ld: cannot find -lc".  Please
see attached build log.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
