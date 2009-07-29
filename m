From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 15:00:40 +0000 (UTC)
Subject: [Buildroot] [Bug 499] New: make O=... busybox-menuconfig crashes
Message-ID: <bug-499-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=499

           Summary: make O=... busybox-menuconfig crashes
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


make busybox-menuconfig crashes when used with the out-of-tree option O=:

#
# using defaults found in .config
#

interrupted(11)
make[3]: *** [menuconfig] Error 1
make[2]: *** [menuconfig] Error 2
make[2]: Leaving directory
`/home/thomas/local/buildroot-basic/project_build_arm/uclibc/busybox-1.14.2'
make[1]: *** [busybox-menuconfig] Error 2
make[1]: Leaving directory `/home/thomas/local/buildroot'

Interestingly, manually doing

make __TARGET_ARCH=arm -C
/path/to/the/build/directory/project_build_arm/uclibc/busybox-1.14.2 menuconfig

works nicely. So it's the fact that it's been run by the Buildroot
infrastructure that makes it crash.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
