From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 14:21:40 +0000 (UTC)
Subject: [Buildroot] [Bug 1699] New: Fix usbutils dependencies and bump
Message-ID: <bug-1699-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1699

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: Fix usbutils dependencies and bump
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1657
  --> https://bugs.busybox.net/attachment.cgi?id=1657
Fix usbutils dependencies and bump

usbutils needs libusb-compat but just select libusb.
Since kconfig doesn't recurse dependencies this could cause it to fail to
build.
While we're at it bump to version 0.87
And remove libusb-config from target when we don't want devfiles.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
