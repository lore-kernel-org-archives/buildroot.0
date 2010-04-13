From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Apr 2010 16:30:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1537] New: dev entries not created anymore
Message-ID: <bug-1537-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1537

              Host: Linux i686
            Target: Linux ARM and i686
             Build: Linux i686
           Summary: dev entries not created anymore
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luca.ceresoli at tiscali.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1501)
 --> (https://bugs.busybox.net/attachment.cgi?id=1501)
default i686 non-cross config to reproduce the bug

After a regular `git pull` I found buildroot is not generating device entries
in output/target/dev/ anymore. The resulting images are then obviously broken.

The visible effect is that fs/common.mk finds TARGET_DEVICE_TABLE empty,
thus is does not call makedevs.

This seems to be happening since commit:
0585241 Move all filesystem generation code to fs/

Verified with Linux-i686 as a development host, two targets:
 - Linux ARM, custom config,
 - Linux i686, default config (make menuconfig, exit, save; it's attached
anyway),
   on git commit 9554403ad0b81f29dd4ee1404de755aa5b72cac5.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
