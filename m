From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 10:40:28 +0000 (UTC)
Subject: [Buildroot] [Bug 177] New: xdriver_xf86-input-keyboard does not
	build
Message-ID: <bug-177-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=177

              Host: Ubuntu 8.10 (64bit)
            Target: i586
             Build: buildroot-2009.02
           Summary: xdriver_xf86-input-keyboard does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mathis_w at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=135)
 --> (https://bugs.busybox.net/attachment.cgi?id=135)
Configuration file for buildroot.

While building it breaks with this error:
buildroot-2009.02/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc ...
-I/home/mathis/buildroot-2009.02/build_i586/staging_dir/home/mathis/buildroot-2009.02/build_i586/staging_dir/usr/include/pixman-1
...
buildroot-2009.02/build_i586/staging_dir/usr/include/xorg/miscstruct.h:54:20:
error: pixman.h: No such file or directory
As one can see, the include path is malformed. Found out that the package uses
a malformed CFLAGS and CXXFLAGS.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
