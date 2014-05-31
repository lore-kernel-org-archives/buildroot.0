From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 May 2014 13:03:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7124] New: Use BR toolchain externally results a
 non-bootable root filesystem
Message-ID: <bug-7124-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7124

           Summary: Use BR toolchain externally results a non-bootable
                    root filesystem
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xxiao8 at fosiao.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


To reproduce(I used IMX6 board)
1. set HOST_DIR to wherever you want to relocate the toolchain.
2. make toolchain
3. build a rootfs using the above-built toolchain _externally_.
4. boot it up, you will find error saying "no init is found"

To fix it manually we need add a ld-linux.so.3 symlink under /lib on the rootfs
1. cd output/target/lib
2. ln -s ld-linux-armhf.so.3 ld-linux.so.3
3. boot with the modified rootfs

If we use internal buildroot toolchain directly, the ld-linux.so.3 is there. If
we use external buildroot toolchain, the ld-linux.so.3 was not created somehow.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
