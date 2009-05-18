From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2009 06:51:23 +0000 (UTC)
Subject: [Buildroot] [Bug 335] New: atk looks for the path to the gnome
 library on the host
Message-ID: <bug-335-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=335

              Host: OpenSuse 10.2 32 bit
           Summary: atk looks for the path to the gnome library on the host
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ulf.samuelsson at atmel.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


atk looks for the path to the gnome library on the host.
On opensuse 10.2, this is:

/opt/gnome/glib-2.0/lib
/opt/gnome/glib-2.0/include

instead of the more standard 

/usr/lib
/usr/include/glib-2.0

which means that on opensuse 10.2 the 
gnome library and include files are not found.

For distributions using the same location as buildroot,
the build will complete, even if the host paths
are used, which hides the problem.

Setting DSP_CFLAGS and DEP_LIBS seems to have no effect.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
