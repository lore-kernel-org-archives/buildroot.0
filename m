From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Oct 2014 00:40:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] New: Invalid filesystem in Pandaboard
	defconfig
Message-ID: <bug-7580-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

           Summary: Invalid filesystem in Pandaboard defconfig
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: spam+busybox at phyks.me
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I tried to build a disk image using the provided Pandaboard defconfig, but I
could not get the system to boot, due to a kernel panic.

Here is the line I got at boot :

Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(179,2)

After the kernel saying that it tried only ext3 to mount the root filesystem.

However, the default root filesystem using the pandaboard defconfig is ext2.


I manually used tune2fs to get an ext3 partition for my root filesystem, and
everything boot up fine.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
