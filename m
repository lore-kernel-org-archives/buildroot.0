From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Mar 2012 12:15:54 +0000 (UTC)
Subject: [Buildroot] [Bug 4970] New: udev 181 fails to build if kernel
 version 3.3 is selected
Message-ID: <bug-4970-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4970

           Summary: udev 181 fails to build if kernel version 3.3 is
                    selected
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: graeme.russ at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Currently at git commit b5fd0f2709cab72f48da12a5804dd8670fffbf6e

.config attached

Error is:

src/src_udevd-sd-daemon.o: In function `sd_is_mq':
sd-daemon.c:(.text+0x6a5): undefined reference to `mq_getattr'
collect2: ld returned 1 exit status
make[3]: *** [src/udevd] Error 1
make[3]: *** Waiting for unfinished jobs....
  CCLD   src/extras/ata_id/ata_id
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/graeme/Source/buildroot/output/build/udev-181'
make: *** [/home/graeme/Source/buildroot/output/build/udev-181/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
