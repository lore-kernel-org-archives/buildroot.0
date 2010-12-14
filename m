From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Dec 2010 22:48:12 +0000 (UTC)
Subject: [Buildroot] [Bug 2965] New: Broken linkage to xkbcomp (blocking X
 server startup)
Message-ID: <bug-2965-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2965

           Summary: Broken linkage to xkbcomp (blocking X server startup)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: adm at mpscompany.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

Buildroot generates rootfs image with xkbcomp file is a sym link to host
xkbcomp binary.

[dynia at entropia images]$ tar tvf rootfs.tar | grep /usr/share/X11/xkb/xkbcomp
lrwxrwxrwx root/root         0 2010-12-14 20:24 ./usr/share/X11/xkb/xkbcomp ->
/mnt/b/Arm/buildroot-2010.11/output/host/usr/bin/xkbcomp

So in my case I got ARM rootfs link to non-existing and wrong (since x86)
binary.

Additionally I guest the xkbcomp is placed in a wrong dir since X server is
searching it in /usr/bin and the broken link is located in /usr/share/X11/xkb -
but this is rather a minor issue.

This have been tested on buildroot-2010.11 and daily snapshot at 15th Dec 2010.

Regards

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
