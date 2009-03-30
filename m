From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Mar 2009 19:53:03 +0000 (UTC)
Subject: [Buildroot] [Bug 241] New: device mapper + lvm2: build together
Message-ID: <bug-241-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=241

              Host: i686-linux
            Target: i686-linux
             Build: i386-pc-linux-gnu
           Summary: device mapper + lvm2: build together
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://lists.busybox.net/pipermail/buildroot/2009-
                    March/026345.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: razzor at kopf-tisch.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=207)
 --> (https://bugs.busybox.net/attachment.cgi?id=207)
[PATCH] device mapper + lvm2: build together

Both packages are merged upstream and are now build from one source tree.
- bump lvm2 version to 2.02.44 (contains device-mapper 1.02.30)
- fix bogous linking of ncurses when no readline support is found
- add uninstall target
- copy default config to /etc/lvm
- always build whole package but split install into two parts (device mapper
and lvm2 suite)
- let all packages that selected "dm" now select "lvm2"
- remove package dm


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
