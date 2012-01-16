From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jan 2012 14:04:55 +0000 (UTC)
Subject: [Buildroot] [Bug 4706] New: Removing .stamp_target_installed does
 not trigger reinstall libraries
Message-ID: <bug-4706-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4706

           Summary: Removing .stamp_target_installed does not trigger
                    reinstall libraries
           Product: buildroot
           Version: 2010.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at bluespirit.la
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I've replaced content in the target_skeleton, and thus wanted to rebuild the
rootfs.tar. I did the following:

1) rm -rf target
2) rm -rf build/.root
3) rm -rf `find build -name "\.stamp_target_installed"
4) make

On the device I got a "Kernel panic - not syncing: No init found.". The problem
was that only when removing .stamp_staging_installed and
stamps/ext-toolchain-installed also the libs on the target were installed.

It would be a great help, that removing all ".stamp_target_installed" and
".root" would create a bootable target filesystem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
